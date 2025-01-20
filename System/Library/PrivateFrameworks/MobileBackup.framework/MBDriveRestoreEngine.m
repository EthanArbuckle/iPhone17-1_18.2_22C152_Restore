@interface MBDriveRestoreEngine
+ (MBDriveRestoreEngine)restoreEngineWithSettingsContext:(id)a3 debugContext:(id)a4;
- (BOOL)_shouldRestoreContentWithFile:(id)a3 quiet:(BOOL)a4;
- (BOOL)encrypted;
- (BOOL)hasManifest;
- (BOOL)isIPod;
- (BOOL)isRestoringToSameDevice;
- (BOOL)shouldVerifyDigests;
- (MBDriveRestoreEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4;
- (MBDriveSettingsContext)settingsContext;
- (MBKeyBag)keybag;
- (MBManifest)manifest;
- (MBProgress)progress;
- (id)_annotate;
- (id)_checkCompatibility;
- (id)_cleanup;
- (id)_moveRestoreDirs;
- (id)_postconditions;
- (id)_preconditions;
- (id)_prepare;
- (id)_prepareCopyBackup;
- (id)_prepareEncryption;
- (id)_prepareFreeSpace;
- (id)_prepareProgress;
- (id)_restore;
- (id)_restoreContent;
- (id)_restoreDirectoryModificationTimes;
- (id)_restoreRegularFiles:(id)a3 size:(unint64_t)a4;
- (id)_resume;
- (id)_resumeAfterFailureMoving;
- (id)_resumeAfterFailureRemoving;
- (id)_resumeAfterFailureUploading;
- (id)_resumeAfterSuccess;
- (id)_setUp;
- (id)_temporaryPathForFile:(id)a3;
- (id)domainForName:(id)a3 containerID:(id)a4 domainManager:(id)a5;
- (id)endWithError:(id)a3;
- (id)fileForTemporaryPath:(id)a3;
- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (id)properties;
- (id)restore;
- (int)engineMode;
- (int)engineType;
- (int)restoreType;
- (void)digestDidNotMatchForFile:(id)a3;
@end

@implementation MBDriveRestoreEngine

+ (MBDriveRestoreEngine)restoreEngineWithSettingsContext:(id)a3 debugContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MBDriveRestoreEngine alloc] initWithSettingsContext:v6 debugContext:v5];

  return v7;
}

- (MBDriveRestoreEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4
{
  id v6 = a3;
  id v38 = 0;
  id v7 = a4;
  v8 = +[MBPersona personalPersonaWithError:&v38];
  id v9 = v38;
  if (!v8)
  {
    v35 = +[NSAssertionHandler currentHandler];
    v36 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MBDriveRestoreEngine initWithSettingsContext:debugContext:]");
    [v35 handleFailureInFunction:v36, @"MBDriveRestoreEngine.m", 81, @"Unable to obtain personal persona for restore engine: %@", v9 file lineNumber description];
  }
  id v10 = [objc_alloc((Class)MBDomainManager) initWithPersona:v8];
  v37.receiver = self;
  v37.super_class = (Class)MBDriveRestoreEngine;
  v11 = [(MBEngine *)&v37 initWithSettingsContext:v6 debugContext:v7 domainManager:v10];

  if (v11)
  {
    v12 = [(MBDriveRestoreEngine *)v11 settingsContext];
    if ([v12 isDeviceTransfer]) {
      int v13 = 4;
    }
    else {
      int v13 = 1;
    }
    v11->_engineType = v13;

    v14 = objc_alloc_init(MBProgress);
    progress = v11->_progress;
    v11->_progress = v14;

    v16 = [[MBDriveScript alloc] initWithProgress:v11->_progress];
    script = v11->_script;
    v11->_script = v16;

    v18 = [MBProgressDrive alloc];
    v19 = v11->_script;
    v20 = [(MBDriveRestoreEngine *)v11 settingsContext];
    v21 = [v20 drive];
    v22 = [(MBProgressDrive *)v18 initWithScript:v19 delegate:v21];
    drive = v11->_drive;
    v11->_drive = &v22->super;

    v24 = [[MBBackupHelper alloc] initWithSettingsContext:v6 domainManager:v11->super._domainManager];
    backupHelper = v11->_backupHelper;
    v11->_backupHelper = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    regularFileIDsByInodeNumber = v11->_regularFileIDsByInodeNumber;
    v11->_regularFileIDsByInodeNumber = v26;

    v28 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    restoredAppBundleIDs = v11->_restoredAppBundleIDs;
    v11->_restoredAppBundleIDs = v28;

    v30 = +[MBEngine stringForEngineType:[(MBDriveRestoreEngine *)v11 engineType]];
    v31 = +[MBEngine stringForEngineMode:[(MBDriveRestoreEngine *)v11 engineMode]];
    v32 = +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.MobileBackup", v30, v31];

    v33 = [[MBAnalyticsEvent alloc] initWithEventName:v32];
    [(MBEngine *)v11 setAnalyticsEvent:v33];

    [v10 setDelegate:v11];
  }

  return v11;
}

- (int)engineMode
{
  return 2;
}

- (int)restoreType
{
  return 1;
}

- (id)properties
{
  return [(MBManifestLike *)self->_manifest properties];
}

- (MBDriveSettingsContext)settingsContext
{
  return (MBDriveSettingsContext *)self->super._settingsContext;
}

- (BOOL)isIPod
{
  v2 = [(MBDriveRestoreEngine *)self settingsContext];
  v3 = [v2 targetDeviceClass];
  unsigned __int8 v4 = [v3 isEqualToString:@"iPod"];

  return v4;
}

- (BOOL)isRestoringToSameDevice
{
  if (![(MBEngine *)self isRestoreEngine])
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MBDriveRestoreEngine.m" lineNumber:127 description:@"Not a restore engine"];
  }
  unsigned __int8 v4 = [(MBDriveRestoreEngine *)self properties];

  if (!v4)
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MBDriveRestoreEngine.m" lineNumber:128 description:@"Properties not set"];
  }
  id v5 = [(MBDriveRestoreEngine *)self properties];
  id v6 = [v5 deviceID];
  id v7 = MBDeviceUDID_Legacy();
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  return v8;
}

- (BOOL)encrypted
{
  manifest = self->_manifest;
  if (!manifest)
  {
    unsigned __int8 v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MBDriveRestoreEngine.m" lineNumber:133 description:@"Manifest not loaded yet"];

    manifest = self->_manifest;
  }
  unsigned __int8 v4 = [(MBManifestLike *)manifest properties];
  unsigned __int8 v5 = [v4 encrypted];

  return v5;
}

- (BOOL)shouldVerifyDigests
{
  v2 = [(MBDebugContext *)self->super._debugContext valueForName:@"VerifyDigests"];
  v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (MBManifest)manifest
{
  manifest = self->_manifest;
  if (!manifest)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MBDriveRestoreEngine.m" lineNumber:143 description:@"No manifest yet"];

    manifest = self->_manifest;
  }
  return (MBManifest *)manifest;
}

- (BOOL)hasManifest
{
  return self->_manifest != 0;
}

- (MBKeyBag)keybag
{
  unsigned __int8 v4 = [(MBDriveRestoreEngine *)self settingsContext];
  unsigned __int8 v5 = [v4 keybag];

  if (!v5)
  {
    id v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MBDriveRestoreEngine.m" lineNumber:152 description:@"No keybag yet"];
  }
  id v6 = [(MBDriveRestoreEngine *)self settingsContext];
  id v7 = [v6 keybag];

  return (MBKeyBag *)v7;
}

- (id)restore
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v5 = v4;
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(MBDriveRestoreEngine *)self settingsContext];
    double v8 = [v7 sourceIdentifier];
    *(_DWORD *)buf = 138412290;
    double v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting restore from %@", buf, 0xCu);

    id v9 = [(MBDriveRestoreEngine *)self settingsContext];
    v29 = [v9 sourceIdentifier];
    _MBLog();
  }
  id v10 = [(MBDriveRestoreEngine *)self settingsContext];
  unsigned __int8 v11 = [v10 shouldRestoreSystemFiles];

  if ((v11 & 1) == 0)
  {
    v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not restoring system files", buf, 2u);
      _MBLog();
    }
  }
  MBLogDeviceProperties();
  int v13 = [(MBDriveRestoreEngine *)self settingsContext];
  [v13 log];

  v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    debugContext = self->super._debugContext;
    *(_DWORD *)buf = 138412290;
    double v33 = *(double *)&debugContext;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "DebugContext: %@", buf, 0xCu);
    _MBLog();
  }

  v16 = [(MBDriveRestoreEngine *)self _restore];
  v17 = MBGetDefaultLog();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      double v19 = +[MBError loggableDescriptionForError:v16];
      v20 = +[MBError descriptionForError:v16];
      *(_DWORD *)buf = 138543618;
      double v33 = v19;
      __int16 v34 = 2112;
      v35 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Restore error - %{public}@, %@", buf, 0x16u);

      v21 = +[MBError loggableDescriptionForError:v16];
      v30 = +[MBError descriptionForError:v16];
      _MBLog();
    }
    id v22 = [(MBDriveRestoreEngine *)self _cleanup];
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      +[NSDate timeIntervalSinceReferenceDate];
      *(_DWORD *)buf = 134217984;
      double v33 = v23 - v5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Finished restore in %0.3f s", buf, 0xCu);
      +[NSDate timeIntervalSinceReferenceDate];
      _MBLog();
    }

    v16 = [(MBDriveRestoreEngine *)self _cleanup];
    if (v16)
    {
      v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        double v25 = +[MBError loggableDescriptionForError:v16];
        v26 = +[MBError descriptionForError:v16];
        *(_DWORD *)buf = 138543618;
        double v33 = v25;
        __int16 v34 = 2112;
        v35 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Restore error - %{public}@, %@", buf, 0x16u);

        v27 = +[MBError loggableDescriptionForError:v16];
        v31 = +[MBError descriptionForError:v16];
        _MBLog();
      }
    }
  }
  return v16;
}

- (id)_restore
{
  v3 = [(MBDriveRestoreEngine *)self _preconditions];
  if (!v3)
  {
    v3 = [(MBDriveRestoreEngine *)self _setUp];
    if (!v3)
    {
      v3 = [(MBRestorePolicy *)self->_restorePolicy notifyPluginsStartingRestoreWithEngine:self];
      if (!v3)
      {
        v3 = [(MBDriveRestoreEngine *)self _resume];
        if (!v3)
        {
          v3 = [(MBDriveRestoreEngine *)self _prepare];
          if (!v3)
          {
            v3 = [(MBDriveRestoreEngine *)self _restoreContent];
            if (!v3)
            {
              v3 = [(MBDriveRestoreEngine *)self _annotate];
              if (!v3)
              {
                v3 = [(MBDriveRestoreEngine *)self _restoreDirectoryModificationTimes];
                if (!v3)
                {
                  v3 = [(MBRestorePolicy *)self->_restorePolicy notifyPluginsEndingRestoreWithEngine:self];
                  if (!v3)
                  {
                    v3 = [(MBDriveRestoreEngine *)self _moveRestoreDirs];
                    if (!v3)
                    {
                      v3 = [(MBDriveRestoreEngine *)self _postconditions];
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v3;
}

- (id)_setUp
{
  if ([(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateCrash"]) {
    abort();
  }
  if (MBAcquireRestoreLock())
  {
    v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Initializing app manager", buf, 2u);
      _MBLog();
    }

    double v4 = [MBAppManager alloc];
    double v5 = [(MBDriveRestoreEngine *)self settingsContext];
    id v6 = [v5 mobileInstallation];
    id v7 = [(MBAppManager *)v4 initWithMobileInstallation:v6];
    appManager = self->super._appManager;
    self->super._appManager = v7;

    id v9 = self->super._appManager;
    id v10 = [(MBEngine *)self persona];
    id v33 = 0;
    LOBYTE(v9) = [(MBAppManager *)v9 loadAppsWithPersona:v10 safeHarbors:1 error:&v33];
    id v11 = v33;

    if (v9)
    {
      v12 = [(MBEngine *)self persona];
      id v32 = v11;
      unsigned __int8 v13 = [v12 createRestoreDirectoriesWithError:&v32];
      id v14 = v32;

      if (v13)
      {
        v15 = +[MBTemporaryDirectory sharedTemporaryDirectoryIdentifiedBy:@"drive-restore-engine"];
        sharedTemporaryDirectory = self->_sharedTemporaryDirectory;
        self->_sharedTemporaryDirectory = v15;

        v17 = +[MBTemporaryDirectory userTemporaryDirectoryForPersona:v12 identifiedBy:@"drive-restore-engine"];
        userTemporaryDirectory = self->_userTemporaryDirectory;
        self->_userTemporaryDirectory = v17;

        double v19 = [MBRestorePolicy alloc];
        v31 = self->super._appManager;
        v20 = [(MBDriveRestoreEngine *)self settingsContext];
        v21 = [v20 plugins];
        id v22 = [(MBDriveRestoreEngine *)self properties];
        double v23 = [v22 buildVersion];
        v24 = [(MBDriveRestoreEngine *)self settingsContext];
        unsigned __int8 v25 = [v24 shouldRestoreSystemFiles];
        BYTE2(v30) = 0;
        BYTE1(v30) = [(MBEngine *)self restoresPrimaryAccount];
        LOBYTE(v30) = v25;
        v26 = -[MBRestorePolicy initWithPersona:enginePolicyProvider:appManager:plugins:serviceRestoreMode:osBuildVersionOfBackup:shouldRestoreSystemFiles:isRestoringPrimaryAccount:shouldCreateMissingIntermediateDirectories:](v19, "initWithPersona:enginePolicyProvider:appManager:plugins:serviceRestoreMode:osBuildVersionOfBackup:shouldRestoreSystemFiles:isRestoringPrimaryAccount:shouldCreateMissingIntermediateDirectories:", v12, self, v31, v21, 0, v23, v30);
        restorePolicy = self->_restorePolicy;
        self->_restorePolicy = v26;

        id v28 = 0;
      }
      else
      {
        id v28 = v14;
      }
    }
    else
    {
      id v28 = +[MBError errorWithCode:1 error:v11 format:@"Error initializing app manager"];
    }
  }
  else
  {
    id v28 = +[MBError errorWithCode:1 format:@"Acquiring restore lock failed"];
  }
  return v28;
}

- (id)_cleanup
{
  manifest = self->_manifest;
  if (manifest) {
    [(MBManifestLike *)manifest closeWithError:0];
  }
  [(MBTemporaryDirectory *)self->_sharedTemporaryDirectory dispose];
  sharedTemporaryDirectory = self->_sharedTemporaryDirectory;
  self->_sharedTemporaryDirectory = 0;

  [(MBTemporaryDirectory *)self->_userTemporaryDirectory dispose];
  userTemporaryDirectory = self->_userTemporaryDirectory;
  self->_userTemporaryDirectory = 0;

  MBReleaseRestoreLock();
  return 0;
}

- (id)_temporaryPathForFile:(id)a3
{
  id v4 = a3;
  double v5 = [v4 domain];
  unsigned int v6 = [v5 shouldRestoreToSharedVolume];
  uint64_t v7 = 10;
  if (v6) {
    uint64_t v7 = 9;
  }
  id v8 = *(id *)((char *)&self->super.super.isa + OBJC_IVAR___MBDriveRestoreEngine__engineType[v7]);

  id v9 = [v8 path];

  id v10 = [v4 fileID];

  id v11 = [v10 description];
  v12 = [v9 stringByAppendingPathComponent:v11];

  return v12;
}

- (id)endWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MBRestorePolicy *)self->_restorePolicy notifyPluginsEndedRestoreWithEngine:self error:v4];
  unsigned int v6 = (void *)v5;
  if (!v4 && v5)
  {
    uint64_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = +[MBError descriptionForError:v6];
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Restore error - %@", buf, 0xCu);

      v12 = +[MBError descriptionForError:v6];
      _MBLog();
    }
    id v4 = v6;
  }
  id v9 = [(MBEngine *)self analyticsEvent];
  [v9 setMetric:@"peakMemoryUsage" value:MBPeakProcessMemoryUsage()];

  id v10 = [(MBEngine *)self analyticsEvent];
  [v10 submit];

  return v4;
}

- (id)_preconditions
{
  id v4 = [(MBDriveRestoreEngine *)self settingsContext];
  uint64_t v5 = [v4 sourceIdentifier];

  if (!v5)
  {
    v29 = +[NSAssertionHandler currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"MBDriveRestoreEngine.m" lineNumber:340 description:@"Source identifier missing for restore"];
  }
  unsigned int v6 = [(MBDriveRestoreEngine *)self settingsContext];
  uint64_t v7 = [v6 targetIdentifier];
  id v8 = MBDeviceUDID_Legacy();
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v30 = +[NSAssertionHandler currentHandler];
    v31 = [(MBDriveRestoreEngine *)self settingsContext];
    id v32 = [v31 targetIdentifier];
    id v33 = MBDeviceUDID_Legacy();
    [v30 handleFailureInMethod:a2, self, @"MBDriveRestoreEngine.m", 341, @"Restore target device ID %@ doesn't match actual device ID %@", v32, v33 object file lineNumber description];
  }
  id v10 = +[MCProfileConnection sharedConnection];
  unsigned int v11 = [v10 isEphemeralMultiUser];

  if (v11)
  {
    v12 = +[MBError errorWithCode:22 format:@"Backup disabled for this device"];
    goto LABEL_26;
  }
  unsigned __int8 v13 = [(MBDriveRestoreEngine *)self settingsContext];
  id v14 = [v13 manager];
  v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = objc_alloc_init((Class)MBManager);
  }
  v17 = v16;

  id v35 = 0;
  v18 = [v17 restoreStateWithError:&v35];
  id v19 = v35;
  if (v18)
  {
    id v20 = [v18 state];
    id v21 = v20;
    if (v20 >= 7 || ((0x71u >> (char)v20) & 1) == 0)
    {
      id v22 = MBGetDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v37) = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Restore from iTunes Backup is unavailable while an iCloud Restore is in progress (%d)", buf, 8u);
        id v34 = v21;
        _MBLog();
      }

      CFStringRef v23 = @"Restore from iTunes Backup is unavailable while an iCloud Restore is in progress";
      uint64_t v24 = 25;
LABEL_24:
      v12 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v24, v23, v34);
      goto LABEL_25;
    }
  }
  else
  {
    unsigned __int8 v25 = +[MBError isError:v19 withCode:210];
    v26 = MBGetDefaultLog();
    v27 = v26;
    if ((v25 & 1) == 0)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v37 = v19;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to fetch iCloud Restore state: %{public}@", buf, 0xCu);
        id v34 = v19;
        _MBLog();
      }

      CFStringRef v23 = @"Failed to determine iCloud Restore state";
      uint64_t v24 = 1;
      goto LABEL_24;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No iCloud account", buf, 2u);
      _MBLog();
    }
  }
  v12 = 0;
LABEL_25:

LABEL_26:
  return v12;
}

- (id)_postconditions
{
  return 0;
}

- (id)_resume
{
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting to retrieve previous backup status", buf, 2u);
    _MBLog();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  backupHelper = self->_backupHelper;
  id v35 = 0;
  id v8 = [(MBBackupHelper *)backupHelper readStatusWithError:&v35];
  unsigned __int8 v9 = v35;
  status = self->_status;
  self->_status = v8;

  unsigned int v11 = self->_status;
  if (!v11)
  {
LABEL_10:
    if (!+[MBError isError:v9 withCode:4])
    {
      v27 = +[MBBackupHelper driveReadError:v9 description:@"Error reading status"];
LABEL_22:
      id v28 = v27;
      goto LABEL_23;
    }
    id v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "No status exists", buf, 2u);
      _MBLog();
    }

    [(MBDebugContext *)self->super._debugContext setFlag:@"StatusNotFound"];
    CFStringRef v20 = @"No status exists in backup";
    goto LABEL_16;
  }
  [(MBStatus *)v11 version];
  if (v12 < 2.4)
  {
    unsigned __int8 v13 = self->_status;
    if (v13)
    {
      [(MBStatus *)v13 version];
      if (v14 < 2.4)
      {
        v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          [(MBStatus *)self->_status version];
          double v17 = v16;
          v18 = [(MBStatus *)self->_status snapshotStateName];
          *(_DWORD *)buf = 134218242;
          double v37 = v17;
          __int16 v38 = 2112;
          v39 = v18;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Status: version=%0.1f, name=%@", buf, 0x16u);

          [(MBStatus *)self->_status version];
          id v34 = [(MBStatus *)self->_status snapshotStateName];
          _MBLog();
        }
        [(MBDebugContext *)self->super._debugContext setFlag:@"OldStatusFound"];
        [(MBStatus *)self->_status version];
        uint64_t v33 = v19;
        CFStringRef v20 = @"Unsupported backup status version: %0.1f";
        goto LABEL_20;
      }
    }
    goto LABEL_10;
  }
  debugContext = self->super._debugContext;
  CFStringRef v23 = [(MBStatus *)self->_status backupStateName];
  [(MBDebugContext *)debugContext setValue:v23 forName:@"BackupState"];

  uint64_t v24 = self->super._debugContext;
  unsigned __int8 v25 = [(MBStatus *)self->_status snapshotStateName];
  [(MBDebugContext *)v24 setValue:v25 forName:@"SnapshotState"];

  [(MBDebugContext *)self->super._debugContext setInt:[(MBStatus *)self->_status isFullBackup] forName:@"StatusIsFullBackup"];
  if ([(MBStatus *)self->_status isBackupEmpty])
  {
    CFStringRef v20 = @"Backup state is empty";
LABEL_16:
    uint64_t v26 = 204;
LABEL_21:
    v27 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v26, v20, v33, v34);
    goto LABEL_22;
  }
  if ([(MBStatus *)self->_status isBackupOld])
  {
    CFStringRef v20 = @"Backup is in old format";
LABEL_20:
    uint64_t v26 = 203;
    goto LABEL_21;
  }
  if (![(MBStatus *)self->_status isBackupNew])
  {
    uint64_t v33 = [(MBStatus *)self->_status backupState];
    CFStringRef v20 = @"Invalid backup state: %d";
LABEL_30:
    uint64_t v26 = 205;
    goto LABEL_21;
  }
  if ([(MBStatus *)self->_status isUploading])
  {
    uint64_t v30 = [(MBDriveRestoreEngine *)self _resumeAfterFailureUploading];
    goto LABEL_37;
  }
  if ([(MBStatus *)self->_status isMoving])
  {
    uint64_t v30 = [(MBDriveRestoreEngine *)self _resumeAfterFailureMoving];
    goto LABEL_37;
  }
  if ([(MBStatus *)self->_status isRemoving])
  {
    uint64_t v30 = [(MBDriveRestoreEngine *)self _resumeAfterFailureRemoving];
    goto LABEL_37;
  }
  if (![(MBStatus *)self->_status isFinished])
  {
    uint64_t v33 = [(MBStatus *)self->_status snapshotState];
    CFStringRef v20 = @"Invalid snapshot state: %d";
    goto LABEL_30;
  }
  uint64_t v30 = [(MBDriveRestoreEngine *)self _resumeAfterSuccess];
LABEL_37:
  v31 = (void *)v30;

  if (v31)
  {
    v27 = v31;
    unsigned __int8 v9 = v27;
    goto LABEL_22;
  }
  [(MBManifestLike *)self->_manifest buildIndexFromDatabaseIfNeeded];
  unsigned __int8 v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 134217984;
    double v37 = v32 - v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Finished retrieving previous backup status in %0.3f s", buf, 0xCu);
    +[NSDate timeIntervalSinceReferenceDate];
    _MBLog();
  }
  id v28 = 0;
LABEL_23:

  return v28;
}

- (id)_resumeAfterFailureUploading
{
  backupHelper = self->_backupHelper;
  id v10 = 0;
  id v4 = [(MBBackupHelper *)backupHelper readBackupManifestWithError:&v10];
  id v5 = v10;
  manifest = self->_manifest;
  self->_manifest = v4;

  if (v5)
  {
    if (+[MBError isError:v5 withCode:4])
    {
      id v7 = +[MBError errorWithCode:204 format:@"Initial backup failed while uploading files"];
    }
    else
    {
      id v7 = v5;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_resumeAfterFailureMoving
{
  v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Getting contents of snapshot", buf, 2u);
    _MBLog();
  }

  drive = self->_drive;
  id v5 = [(MBDriveRestoreEngine *)self settingsContext];
  double v6 = [v5 driveSnapshotDir];
  id v54 = 0;
  id v7 = [(MBDrive *)drive contentsOfDirectoryAtPath:v6 options:0 error:&v54];
  id v8 = v54;
  unsigned __int8 v9 = [v7 allKeys];
  id v10 = +[NSSet setWithArray:v9];

  if (v8)
  {
    id v11 = +[MBBackupHelper driveReadError:v8 description:@"Error getting contents of snapshot"];
    goto LABEL_36;
  }
  unsigned __int8 v12 = [v10 containsObject:@"Manifest.plist"];
  backupHelper = self->_backupHelper;
  if (v12)
  {
    uint64_t v53 = 0;
    double v14 = (id *)&v53;
    uint64_t v15 = [(MBBackupHelper *)backupHelper readSnapshotPropertiesWithError:&v53];
  }
  else
  {
    uint64_t v52 = 0;
    double v14 = (id *)&v52;
    uint64_t v15 = [(MBBackupHelper *)backupHelper readBackupPropertiesWithError:&v52];
  }
  double v16 = (void *)v15;
  id v17 = *v14;
  if (v17)
  {
    id v18 = v17;
  }
  else
  {
    if (![v16 hasManifestDB])
    {
      unsigned __int8 v23 = [v10 containsObject:@"Manifest.mbdb"];
      uint64_t v24 = self->_backupHelper;
      if (v23)
      {
        uint64_t v50 = 0;
        unsigned __int8 v25 = (id *)&v50;
        uint64_t v26 = [(MBBackupHelper *)v24 readSnapshotDatabaseWithError:&v50];
      }
      else
      {
        uint64_t v49 = 0;
        unsigned __int8 v25 = (id *)&v49;
        uint64_t v26 = [(MBBackupHelper *)v24 readBackupDatabaseWithError:&v49];
      }
      v27 = (void *)v26;
      id v28 = *v25;
      id v8 = v28;
      if (v28)
      {
        id v11 = v28;
      }
      else
      {
        v43 = v27;
        v29 = +[MBManifest manifestWithProperties:v16 database:v27 databaseIndex:0];
        manifest = self->_manifest;
        self->_manifest = v29;

        [(MBManifestLike *)self->_manifest buildIndexFromDatabaseIfNeeded];
        v31 = MBGetDefaultLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Determining which files remain in the snapshot", buf, 2u);
          _MBLog();
        }

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        v44 = v10;
        id v32 = v10;
        id v33 = [v32 countByEnumeratingWithState:&v45 objects:v57 count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v46;
          do
          {
            for (i = 0; i != v34; i = (char *)i + 1)
            {
              if (*(void *)v46 != v35) {
                objc_enumerationMutation(v32);
              }
              double v37 = +[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", *(void *)(*((void *)&v45 + 1) + 8 * i), v42);
              if (v37)
              {
                __int16 v38 = MBGetDefaultLog();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v56 = v37;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "In snapshot: %@", buf, 0xCu);
                  v42 = v37;
                  _MBLog();
                }

                v39 = [(MBManifestLike *)self->_manifest databaseIndex];
                id v40 = [v39 setFlags:8 forFileID:v37];
              }
            }
            id v34 = [v32 countByEnumeratingWithState:&v45 objects:v57 count:16];
          }
          while (v34);
        }

        id v11 = 0;
        id v10 = v44;
        v27 = v43;
        id v8 = 0;
      }

      goto LABEL_35;
    }
    uint64_t v19 = self->_backupHelper;
    id v51 = 0;
    CFStringRef v20 = [(MBBackupHelper *)v19 readSnapshotManifestDatabaseWithError:&v51];
    id v21 = v51;
    id v22 = self->_manifest;
    self->_manifest = v20;

    if (!v21)
    {
      id v8 = 0;
      id v11 = 0;
      goto LABEL_35;
    }
    id v18 = v21;
  }
  id v8 = v18;
  id v11 = v18;
LABEL_35:

LABEL_36:
  return v11;
}

- (id)_resumeAfterFailureRemoving
{
  backupHelper = self->_backupHelper;
  id v9 = 0;
  id v4 = [(MBBackupHelper *)backupHelper readBackupManifestWithError:&v9];
  id v5 = v9;
  manifest = self->_manifest;
  self->_manifest = v4;

  if (v5) {
    id v7 = v5;
  }

  return v5;
}

- (id)_resumeAfterSuccess
{
  backupHelper = self->_backupHelper;
  id v9 = 0;
  id v4 = [(MBBackupHelper *)backupHelper readBackupManifestWithError:&v9];
  id v5 = v9;
  manifest = self->_manifest;
  self->_manifest = v4;

  if (v5) {
    id v7 = v5;
  }

  return v5;
}

- (id)_prepare
{
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting to prepare for restore", buf, 2u);
    _MBLog();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  id v7 = [(MBDriveRestoreEngine *)self _checkCompatibility];
  if (v7) {
    goto LABEL_9;
  }
  id v7 = [(MBDriveRestoreEngine *)self _prepareEncryption];
  if (v7) {
    goto LABEL_9;
  }
  id v7 = [(MBRestorePolicy *)self->_restorePolicy notifyPluginsPreparingRestoreWithEngine:self];
  if (v7
    || ([(MBDriveRestoreEngine *)self _prepareProgress],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(MBDriveRestoreEngine *)self _prepareFreeSpace],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(MBDriveRestoreEngine *)self _prepareCopyBackup],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_9:
    id v8 = v7;
    id v9 = v8;
  }
  else
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      +[NSDate timeIntervalSinceReferenceDate];
      *(_DWORD *)buf = 134217984;
      double v13 = v11 - v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Finished preparing for restore in %0.3f s", buf, 0xCu);
      +[NSDate timeIntervalSinceReferenceDate];
      _MBLog();
    }
    id v9 = 0;
  }

  return v9;
}

- (id)_checkCompatibility
{
  v3 = [(MBDriveRestoreEngine *)self settingsContext];
  id v4 = [v3 sourceIdentifier];

  double v5 = [v4 stringByAppendingPathComponent:@"Info.plist"];
  double v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    CFStringRef v21 = @"Info.plist";
    __int16 v22 = 2112;
    unsigned __int8 v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Loading %{public}@ at %@", buf, 0x16u);
    _MBLog();
  }

  drive = self->_drive;
  id v19 = 0;
  id v8 = +[MBInfo infoWithDrive:drive path:v5 error:&v19];
  id v9 = v19;
  if (v8)
  {
    id v10 = [v8 productVersion];
    double v11 = [(MBManifestLike *)self->_manifest properties];
    unsigned __int8 v12 = [v11 requiredProductVersion];

    double v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      CFStringRef v21 = @"Info.plist";
      __int16 v22 = 2114;
      unsigned __int8 v23 = v10;
      __int16 v24 = 2114;
      id v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Loaded %{public}@ - productVersion:%{public}@, requiredProductVersion:%{public}@", buf, 0x20u);
      _MBLog();
    }

    if (v10)
    {
      double v14 = MBProductVersion();
      char v15 = MBIsRestoreCompatible();

      double v16 = 0;
      if ((v15 & 1) == 0)
      {
        id v17 = MBGetDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Refusing to restore from an incompatible backup", buf, 2u);
          _MBLog();
        }

        double v16 = +[MBError errorWithCode:203 format:@"Backup is from an incompatible OS version"];
      }
    }
    else
    {
      double v16 = 0;
    }
  }
  else
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      CFStringRef v21 = @"Info.plist";
      __int16 v22 = 2112;
      unsigned __int8 v23 = v5;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to fetch %{public}@ at %@: %@", buf, 0x20u);
      _MBLog();
    }
    double v16 = 0;
  }

  return v16;
}

- (id)_prepareEncryption
{
  v3 = [(MBManifestLike *)self->_manifest properties];
  unsigned int v4 = [v3 encrypted];

  double v5 = [(MBDriveRestoreEngine *)self settingsContext];
  double v6 = [v5 password];

  if ([(MBEngine *)self isDeviceTransferEngine])
  {
    if (v4) {
      __assert_rtn("-[MBDriveRestoreEngine _prepareEncryption]", "MBDriveRestoreEngine.m", 588, "!encrypted");
    }
    if (v6) {
      __assert_rtn("-[MBDriveRestoreEngine _prepareEncryption]", "MBDriveRestoreEngine.m", 589, "!password");
    }
    goto LABEL_10;
  }
  if (!v4)
  {
LABEL_10:
    id v9 = 0;
    goto LABEL_11;
  }
  manifest = self->_manifest;
  id v39 = 0;
  unsigned __int8 v8 = [(MBManifestLike *)manifest setupEncryptionWithPassword:v6 withError:&v39];
  id v9 = (__CFString *)v39;
  if ((v8 & 1) == 0)
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v41 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
      _MBLog();
    }

    double v11 = v9;
    unsigned __int8 v12 = v11;
    goto LABEL_35;
  }
LABEL_11:
  double v13 = [(MBDriveRestoreEngine *)self settingsContext];
  double v14 = [v13 keybag];

  if (!v14)
  {
    id v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Decoding and unlocking backup keybag from manifest", buf, 2u);
      _MBLog();
    }

    id v19 = [(MBManifestLike *)self->_manifest properties];
    CFStringRef v20 = [v19 keybagData];

    if (v20)
    {
      double v37 = v9;
      CFStringRef v21 = +[MBKeyBag unlockedKeyBagWithData:v20 password:v6 error:&v37];
      unsigned __int8 v12 = v37;

      __int16 v22 = [(MBDriveRestoreEngine *)self settingsContext];
      [v22 setKeybag:v21];

      unsigned __int8 v23 = [(MBDriveRestoreEngine *)self settingsContext];
      __int16 v24 = [v23 keybag];

      if (v24)
      {

        goto LABEL_22;
      }
      if (+[MBError isError:v12 withCode:207])
      {
        CFStringRef v34 = @"Invalid password when restoring encrypted backup";
        uint64_t v35 = 207;
      }
      else
      {
        CFStringRef v34 = @"Error decoding keybag";
        uint64_t v35 = 1;
      }
      v31 = +[MBError errorWithCode:v35 error:v12 format:v34];
    }
    else
    {
      v31 = +[MBError errorWithCode:205 format:@"No keybag in manifest"];
      unsigned __int8 v12 = v9;
    }

    goto LABEL_39;
  }
  char v15 = [(MBDriveRestoreEngine *)self settingsContext];
  double v16 = [v15 keybag];
  unsigned __int8 v17 = [v16 isUnlocked];

  if ((v17 & 1) == 0)
  {
    id v25 = MBGetDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Unlocking backup keybag from manifest", buf, 2u);
      _MBLog();
    }

    uint64_t v26 = [(MBDriveRestoreEngine *)self settingsContext];
    v27 = [v26 keybag];
    __int16 v38 = v9;
    unsigned __int8 v28 = [v27 unlockWithPassword:v6 error:&v38];
    unsigned __int8 v12 = v38;

    if (v28) {
      goto LABEL_22;
    }
    if (+[MBError isError:v12 withCode:207])
    {
      CFStringRef v32 = @"Invalid password when restoring encrypted backup";
      uint64_t v33 = 207;
    }
    else
    {
      CFStringRef v32 = @"Error decoding keybag";
      uint64_t v33 = 1;
    }
    double v11 = +[MBError errorWithCode:v33 error:v12 format:v32];
LABEL_35:
    v31 = v11;
    goto LABEL_39;
  }
  unsigned __int8 v12 = v9;
LABEL_22:
  v29 = MBGetDefaultLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      CFStringRef v30 = @"encrypted";
    }
    else {
      CFStringRef v30 = @"unencrypted";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v41 = v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Backup is %@", buf, 0xCu);
    _MBLog();
  }

  [(MBDebugContext *)self->super._debugContext setBool:[(MBDriveRestoreEngine *)self encrypted] forName:@"IsEncrypted"];
  v31 = 0;
LABEL_39:

  return v31;
}

- (id)_prepareProgress
{
  unsigned int v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Calculating expected duration", buf, 2u);
    _MBLog();
  }

  *(void *)buf = 0;
  v36 = buf;
  uint64_t v37 = 0x3032000000;
  __int16 v38 = sub_100213DD4;
  id v39 = sub_100213DE4;
  id v40 = 0;
  uint64_t v31 = 0;
  CFStringRef v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v27 = 0;
  unsigned __int8 v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  CFStringRef v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  manifest = self->_manifest;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100213DEC;
  v18[3] = &unk_1004169C8;
  v18[4] = self;
  v18[5] = buf;
  v18[9] = &v19;
  v18[10] = a2;
  v18[6] = &v31;
  v18[7] = &v27;
  v18[8] = &v23;
  id v6 = [(MBManifestLike *)manifest enumerateFiles:v18];
  uint64_t v7 = v32[3];
  if (v7)
  {
    script = self->_script;
    id v9 = +[MBDriveOperation operationToDownloadFilesWithCount:v7 size:v28[3]];
    [(MBDriveScript *)script addOperation:v9];

    ++v24[3];
  }
  id v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v24[3];
    uint64_t v12 = v20[3];
    unint64_t totalDownloadCount = self->_totalDownloadCount;
    *(_DWORD *)CFStringRef v41 = 134218496;
    uint64_t v42 = v11;
    __int16 v43 = 2048;
    uint64_t v44 = v12;
    __int16 v45 = 2048;
    unint64_t v46 = totalDownloadCount;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Enqueued batches (%lld) of total files (%lld) total download (%lld)", v41, 0x20u);
    _MBLog();
  }

  double v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    char v15 = v14;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      [(MBProgress *)self->_progress total];
      *(_DWORD *)CFStringRef v41 = 134217984;
      uint64_t v42 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Expected duration: %0.3f s", v41, 0xCu);
    }

    [(MBProgress *)self->_progress total];
    _MBLog();
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(buf, 8);

  return 0;
}

- (id)_prepareFreeSpace
{
  v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Checking free disk space", buf, 2u);
    _MBLog();
  }

  unint64_t v4 = MBFreeDiskSpace();
  double v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v11 = v4;
    __int16 v12 = 2048;
    unint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Free disk space on device: %llu (%{bytes}llu)", buf, 0x16u);
    _MBLog();
  }

  if ([(MBEngine *)self isDeviceTransferEngine] || v4 >= self->_totalDownloadSize)
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unint64_t totalDownloadSize = self->_totalDownloadSize;
      *(_DWORD *)buf = 134218752;
      unint64_t v11 = v4;
      __int16 v12 = 2048;
      unint64_t v13 = v4;
      __int16 v14 = 2048;
      unint64_t v15 = totalDownloadSize;
      __int16 v16 = 2048;
      unint64_t v17 = totalDownloadSize;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Insufficient free disk space on device to restore: %llu (%{bytes}llu) < %llu (%{bytes}llu)", buf, 0x2Au);
      _MBLog();
    }

    unsigned __int8 v8 = +[MBError errorWithCode:106, @"Insufficient free disk space on device to restore (%llu < %llu)", v4, self->_totalDownloadSize format];
  }
  return v8;
}

- (id)_prepareCopyBackup
{
  v3 = [(MBDriveRestoreEngine *)self settingsContext];
  unsigned int v4 = [v3 shouldCopyBackup];

  double v5 = MBGetDefaultLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Copying backup", buf, 2u);
      _MBLog();
    }

    uint64_t v7 = [(MBDriveRestoreEngine *)self settingsContext];
    unsigned __int8 v8 = [v7 targetIdentifier];

    double v9 = [v8 stringByAppendingPathComponent:@"Info.plist"];
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      double v70 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Decoding %@", buf, 0xCu);
      double v58 = v9;
      _MBLog();
    }

    drive = self->_drive;
    id v68 = 0;
    __int16 v12 = +[MBInfo infoWithDrive:drive path:*(void *)&v9 error:&v68];
    id v13 = v68;
    if (v13)
    {
      id v14 = v13;
      if (+[MBError isError:v13 withCode:4])
      {
        unint64_t v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "No backup info exists", buf, 2u);
          _MBLog();
        }

        [(MBDriveScript *)self->_script beginPerforming];
        uint64_t v16 = 0;
        goto LABEL_29;
      }
      CFStringRef v28 = @"Error decoding backup info";
LABEL_28:
      uint64_t v16 = +[MBBackupHelper driveReadError:description:](MBBackupHelper, "driveReadError:description:", v14, v28, *(void *)&v58);
LABEL_29:
      int v27 = 1;
      goto LABEL_30;
    }
    unint64_t v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Determining backup usage", buf, 2u);
      _MBLog();
    }

    unint64_t v66 = 0;
    double v67 = 0.0;
    id v18 = self->_drive;
    id v65 = 0;
    unsigned __int8 v19 = [(MBDrive *)v18 usageOfDirectoryAtPath:v8 count:&v67 size:&v66 options:0 error:&v65];
    id v14 = v65;
    if ((v19 & 1) == 0)
    {
      CFStringRef v28 = @"Error determining backup usage";
      goto LABEL_28;
    }
    CFStringRef v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Checking free disk space on drive", buf, 2u);
      _MBLog();
    }

    id v63 = v14;
    *(double *)&unint64_t v64 = 0.0;
    unsigned int v21 = [(MBDrive *)self->_drive freeSpace:&v64 error:&v63];
    id v22 = v63;

    uint64_t v23 = MBGetDefaultLog();
    __int16 v24 = v23;
    if (v21)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v70 = *(double *)&v64;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%{bytes}llu of free disk space on drive", buf, 0xCu);
        double v58 = *(double *)&v64;
        _MBLog();
      }

      unint64_t v25 = v66;
      if (v64 < v66 + 0x8000000)
      {
        uint64_t v26 = MBGetDefaultLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          double v70 = *(double *)&v64;
          __int16 v71 = 2048;
          unint64_t v72 = v66;
          __int16 v73 = 1024;
          int v74 = 0x8000000;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Skipping copying backup because there is not enough free disk space on the drive (%{bytes}llu < %{bytes}llu + %{bytes}d)", buf, 0x1Cu);
          _MBLog();
        }

        [(MBDriveScript *)self->_script beginPerforming];
        uint64_t v16 = 0;
        int v27 = 1;
LABEL_55:
        id v14 = v22;
LABEL_30:

        if (v27) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        double v30 = +[MBError descriptionForError:v22];
        *(_DWORD *)buf = 138412290;
        double v70 = v30;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Error getting free space of drive: %@", buf, 0xCu);

        double v58 = +[MBError descriptionForError:v22];
        _MBLog();
      }
      unint64_t v25 = v66;
    }
    v60 = v12;
    script = self->_script;
    CFStringRef v32 = +[MBDriveOperation operationToC0pyItemWithCount:size:](MBDriveOperation, "operationToC0pyItemWithCount:size:", *(void *)&v67, v25, *(void *)&v58);
    [(MBDriveScript *)script insertOperation:v32 atIndex:0];

    uint64_t v33 = self->_script;
    uint64_t v34 = +[MBDriveOperation operationToUploadFileWithSize:0];
    [(MBDriveScript *)v33 insertOperation:v34 atIndex:1];

    [(MBDriveScript *)self->_script beginPerforming];
    uint64_t v35 = +[NSDate date];
    id v36 = objc_alloc_init((Class)NSDateFormatter);
    [v36 setDateFormat:@"yyyyMMdd-HHmmss"];
    v59 = (void *)v35;
    uint64_t v37 = [v36 stringFromDate:v35];
    double v38 = +[NSString stringWithFormat:@"%@-%@", v8, v37];

    id v39 = MBGetDefaultLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      double v70 = v38;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Naming backup copy %@", buf, 0xCu);
      _MBLog();
    }

    id v40 = MBGetDefaultLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v70 = v67;
      __int16 v71 = 2048;
      unint64_t v72 = v66;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Starting to copy backup with %ld files of size %{bytes}llu", buf, 0x16u);
      _MBLog();
    }

    +[NSDate timeIntervalSinceReferenceDate];
    double v42 = v41;
    __int16 v43 = self->_drive;
    id v62 = v22;
    unsigned __int8 v44 = [(MBDrive *)v43 copyItemAtPath:v8 toPath:*(void *)&v38 options:0 error:&v62];
    id v45 = v62;

    if (v44)
    {
      +[NSDate timeIntervalSinceReferenceDate];
      double v47 = v46;
      long long v48 = MBGetDefaultLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v70 = v47 - v42;
        __int16 v71 = 2048;
        unint64_t v72 = (unint64_t)((double)v66 / (v47 - v42));
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Finished copying backup in %0.3f s at %{bytes}llu/s", buf, 0x16u);
        _MBLog();
      }

      uint64_t v49 = MBGetDefaultLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Updating backup info", buf, 2u);
        _MBLog();
      }

      [v60 setTargetIdentifier:*(void *)&v38];
      id v50 = objc_alloc_init((Class)NSDateFormatter);

      id v51 = MBLocale();
      [v50 setLocale:v51];

      [v50 setDateStyle:2];
      [v50 setTimeStyle:1];
      uint64_t v52 = [v60 displayName];
      uint64_t v53 = [v50 stringFromDate:v59];
      id v54 = +[NSString stringWithFormat:@"%@ - %@", v52, v53];
      [v60 setDisplayName:v54];

      double v55 = [*(id *)&v38 stringByAppendingPathComponent:@"Info.plist"];
      v56 = MBGetDefaultLog();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        double v70 = v55;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Writing %@", buf, 0xCu);
        _MBLog();
      }

      v57 = self->_drive;
      id v61 = v45;
      uint64_t v16 = (uint64_t)[v60 writeToDrive:v57 path:*(void *)&v55 error:&v61];
      id v22 = v61;

      if (v16)
      {
        int v27 = 0;
      }
      else
      {
        uint64_t v16 = +[MBBackupHelper driveWriteError:v22 description:@"Error writing updated backup info"];
        int v27 = 1;
      }

      id v36 = v50;
    }
    else
    {
      uint64_t v16 = +[MBBackupHelper driveWriteError:v45 description:@"Error copying backup"];
      int v27 = 1;
      id v22 = v45;
    }
    __int16 v12 = v60;

    goto LABEL_55;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Not copying backup", buf, 2u);
    _MBLog();
  }

  [(MBDriveScript *)self->_script beginPerforming];
  id v14 = 0;
LABEL_31:
  uint64_t v16 = 0;
LABEL_32:

  return (id)v16;
}

- (id)_restoreContent
{
  double v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t totalDownloadCount = self->_totalDownloadCount;
    unint64_t totalDownloadSize = self->_totalDownloadSize;
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = totalDownloadCount;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = totalDownloadSize;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting to restore %lu files of size %{bytes}llu", buf, 0x16u);
    _MBLog();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v9 = v8;
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v51 = sub_100213DD4;
  uint64_t v52 = sub_100213DE4;
  id v53 = +[NSMutableArray arrayWithCapacity:0];
  uint64_t v40 = 0;
  double v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = (double *)&v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_100213DD4;
  double v30 = sub_100213DE4;
  id v31 = 0;
  manifest = self->_manifest;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1002153C0;
  v25[3] = &unk_1004169C8;
  v25[4] = self;
  v25[5] = &v26;
  v25[9] = &v32;
  v25[10] = a2;
  v25[6] = buf;
  v25[7] = &v40;
  v25[8] = &v36;
  id v11 = [(MBManifestLike *)manifest enumerateFiles:v25];
  __int16 v12 = (void *)v27[5];
  if (v12)
  {
    id v13 = v12;
    goto LABEL_13;
  }
  if ([*(id *)(*(void *)&buf[8] + 40) count])
  {
    id v13 = [(MBDriveRestoreEngine *)self _restoreRegularFiles:*(void *)(*(void *)&buf[8] + 40) size:v41[3]];
    if (v13) {
      goto LABEL_13;
    }
    id v14 = [*(id *)(*(void *)&buf[8] + 40) count];
    v37[3] += (uint64_t)v14;
    ++*((void *)v33 + 3);
  }
  unint64_t v15 = MBGetDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = v33[3];
    unint64_t v17 = v37[3];
    unint64_t v18 = self->_totalDownloadSize;
    *(_DWORD *)unsigned __int8 v44 = 134218496;
    double v45 = v16;
    __int16 v46 = 2048;
    unint64_t v47 = v17;
    __int16 v48 = 2048;
    unint64_t v49 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Restored batches (%lld) of total files (%lld) of total %lld bytes", v44, 0x20u);
    _MBLog();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v20 = v19;
  unsigned int v21 = MBGetDefaultLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    double v22 = v20 - v9;
    unint64_t v23 = (unint64_t)((double)self->_totalDownloadSize / v22);
    *(_DWORD *)unsigned __int8 v44 = 134218240;
    double v45 = v22;
    __int16 v46 = 2048;
    unint64_t v47 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Finished restoring files in %0.3f s at %{bytes}llu/s", v44, 0x16u);
    _MBLog();
  }

  id v13 = 0;
LABEL_13:
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(buf, 8);

  return v13;
}

- (BOOL)_shouldRestoreContentWithFile:(id)a3 quiet:(BOOL)a4
{
  id v84 = a3;
  BOOL v6 = [v84 domain];
  uint64_t v7 = [(MBDriveRestoreEngine *)self settingsContext];
  v85 = v6;
  if ([v7 shouldRestoreSystemFiles])
  {
  }
  else
  {
    unsigned __int8 v8 = [v6 isAppDomain];

    if ((v8 & 1) == 0)
    {
      double v9 = v84;
      if ([v6 isSystemSharedContainerDomain]
        && [(MBRestorePolicy *)self->_restorePolicy shouldAlwaysRestoreSystemSharedContainerDomain:v6])
      {
        BOOL v14 = 1;
        goto LABEL_95;
      }
      BOOL v83 = a4;
      double v45 = [v84 relativePath];
      id v10 = [v45 pathComponents];

      id v46 = [v10 count];
      unint64_t v47 = 0;
      do
      {
        unint64_t v49 = -[NSObject subarrayWithRange:](v10, "subarrayWithRange:", 0, v47);
        id v50 = +[NSString pathWithComponents:v49];

        id v51 = [v6 relativePathsOfSystemFilesToAlwaysRestore];
        unsigned __int8 v52 = [v51 containsObject:v50];

        if (v52)
        {
          BOOL v14 = 1;
          goto LABEL_94;
        }
        ++v47;
      }
      while (v47 <= (unint64_t)v46);
      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v13 = [v6 relativePathsOfSystemFilesToAlwaysRestore];
      id v80 = [v13 countByEnumeratingWithState:&v94 objects:v104 count:16];
      v81 = v10;
      if (v80)
      {
        uint64_t v53 = *(void *)v95;
        uint64_t v79 = *(void *)v95;
        do
        {
          id v54 = 0;
          do
          {
            if (*(void *)v95 != v53) {
              objc_enumerationMutation(v13);
            }
            double v55 = (char *)v54;
            v56 = [*(id *)(*((void *)&v94 + 1) + 8 * (void)v54) pathComponents];
            id v57 = [v56 count];
            unint64_t v58 = 0;
            do
            {
              v59 = objc_msgSend(v56, "subarrayWithRange:", 0, v58);
              v60 = +[NSString pathWithComponents:v59];

              id v61 = [v84 relativePath];
              unsigned __int8 v62 = [v61 isEqualToString:v60];

              if (v62)
              {
                BOOL v14 = 1;
                goto LABEL_71;
              }
              ++v58;
            }
            while (v58 <= (unint64_t)v57);

            id v54 = v55 + 1;
            id v10 = v81;
            BOOL v6 = v85;
            uint64_t v53 = v79;
          }
          while (v54 != v80);
          id v80 = [v13 countByEnumeratingWithState:&v94 objects:v104 count:16];
        }
        while (v80);
      }

      if (!v83)
      {
        id v13 = MBGetDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v63 = [v84 absolutePath];
          *(_DWORD *)buf = 138412290;
          v101 = v63;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Not restoring because it's a system file: %@", buf, 0xCu);

          v56 = [v84 absolutePath];
          _MBLog();
          BOOL v14 = 0;
LABEL_71:

          id v10 = v81;
          goto LABEL_92;
        }
LABEL_68:
        BOOL v14 = 0;
        goto LABEL_93;
      }
LABEL_69:
      BOOL v14 = 0;
      goto LABEL_94;
    }
  }
  double v9 = v84;
  if ([v6 isUninstalledAppDomain])
  {
    if (!a4)
    {
      id v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [v6 containerID];
        __int16 v12 = [v84 relativePath];
        *(_DWORD *)buf = 138412546;
        v101 = v11;
        __int16 v102 = 2112;
        v103 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Not restoring because the app %@ isn't being restored: %@", buf, 0x16u);

        id v13 = [v85 containerID];
        v77 = [v84 relativePath];
        _MBLog();

        BOOL v6 = v85;
        goto LABEL_68;
      }
      goto LABEL_69;
    }
LABEL_10:
    BOOL v14 = 0;
    goto LABEL_95;
  }
  if ([v6 isPlaceholderAppDomain])
  {
    if (!a4)
    {
      id v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        unint64_t v64 = [v84 absolutePath];
        *(_DWORD *)buf = 138412290;
        v101 = v64;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Not restoring because it's a placeholder app file: %@", buf, 0xCu);

        id v13 = [v84 absolutePath];
        _MBLog();
        goto LABEL_68;
      }
      goto LABEL_69;
    }
    goto LABEL_10;
  }
  BOOL v82 = a4;
  unint64_t v15 = [(MBDriveRestoreEngine *)self properties];
  unsigned int v16 = [v15 hasCorruptSQLiteDBs];

  if (v16)
  {
    unint64_t v17 = [v84 relativePath];
    id v10 = [v17 pathExtension];

    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v13 = MBSQLitePathExtensions();
    id v18 = [v13 countByEnumeratingWithState:&v90 objects:v99 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v91;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v91 != v20) {
            objc_enumerationMutation(v13);
          }
          if ([v10 isEqualToString:*(void *)(*((void *)&v90 + 1) + 8 * i)])
          {
            id v65 = MBGetDefaultLog();
            double v9 = v84;
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              unint64_t v66 = [v84 absolutePath];
              *(_DWORD *)buf = 138412290;
              v101 = v66;
              _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Not restoring %@ because sqlite databases are corrupt in this backup", buf, 0xCu);

              double v67 = [v84 absolutePath];
LABEL_89:
              _MBLog();
            }
            goto LABEL_90;
          }
        }
        id v19 = [v13 countByEnumeratingWithState:&v90 objects:v99 count:16];
      }
      while (v19);
    }
  }
  double v9 = v84;
  double v22 = [v84 relativePath];
  unint64_t v23 = [v22 pathComponents];

  id v24 = [v23 count];
  unint64_t v25 = 0;
  while (1)
  {
    id v10 = v23;
    uint64_t v26 = -[NSObject subarrayWithRange:](v23, "subarrayWithRange:", 0, v25);
    id v13 = +[NSString pathWithComponents:v26];

    int v27 = [v85 relativePathsNotToRestore];
    unsigned int v28 = [v27 containsObject:v13];

    if (v28)
    {
      if (v82) {
        goto LABEL_91;
      }
      id v65 = MBGetDefaultLog();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        id v68 = [v84 absolutePath];
        *(_DWORD *)buf = 138412290;
        v101 = v68;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Not restoring: %@", buf, 0xCu);

        double v67 = [v84 absolutePath];
        goto LABEL_89;
      }
      goto LABEL_90;
    }
    if (![(MBDriveRestoreEngine *)self isRestoringToSameDevice])
    {
      uint64_t v29 = [v85 relativePathsNotToMigrate];
      unsigned int v30 = [v29 containsObject:v13];

      if (v30)
      {
        if (v82) {
          goto LABEL_91;
        }
        id v65 = MBGetDefaultLog();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          v69 = [v84 absolutePath];
          *(_DWORD *)buf = 138412290;
          v101 = v69;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Not restoring because this is a migrate: %@", buf, 0xCu);

          double v67 = [v84 absolutePath];
          goto LABEL_89;
        }
        goto LABEL_90;
      }
    }
    BOOL v6 = v85;
    if ([(MBDriveRestoreEngine *)self isIPod])
    {
      id v31 = [v85 relativePathsNotToRestoreToIPods];
      unsigned int v32 = [v31 containsObject:v13];

      BOOL v6 = v85;
      if (v32)
      {
        if (v82) {
          goto LABEL_68;
        }
        id v65 = MBGetDefaultLog();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          double v70 = [v84 absolutePath];
          *(_DWORD *)buf = 138412290;
          v101 = v70;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Not restoring because this is an iPod: %@", buf, 0xCu);

          double v67 = [v84 absolutePath];
          goto LABEL_89;
        }
        goto LABEL_90;
      }
    }
    if (![(MBEngine *)self isDeviceTransferEngine])
    {
      uint64_t v33 = [v6 relativePathsNotToRestoreFromLocal];
      unsigned int v34 = [v33 containsObject:v13];

      BOOL v6 = v85;
      if (v34)
      {
        if (v82) {
          goto LABEL_68;
        }
        id v65 = MBGetDefaultLog();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          __int16 v71 = [v84 absolutePath];
          *(_DWORD *)buf = 138412290;
          v101 = v71;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Not restoring because this is a local restore: %@", buf, 0xCu);

          double v67 = [v84 absolutePath];
          goto LABEL_89;
        }
        goto LABEL_90;
      }
    }
    if (v25 >= (unint64_t)v24 || ![v84 isSymbolicLink]) {
      goto LABEL_38;
    }
    uint64_t v35 = [v10 objectAtIndexedSubscript:v25];
    if (([v35 isEqualToString:@".."] & 1) == 0)
    {

      goto LABEL_38;
    }
    unsigned __int8 v36 = [v85 shouldRestoreRelativeSymlinks];

    if ((v36 & 1) == 0) {
      break;
    }
LABEL_38:

    ++v25;
    unint64_t v23 = v10;
    if (v25 > (unint64_t)v24)
    {
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      uint64_t v37 = [(MBDriveRestoreEngine *)self settingsContext];
      id v13 = [v37 plugins];

      id v38 = [v13 countByEnumeratingWithState:&v86 objects:v98 count:16];
      if (!v38)
      {
        BOOL v14 = 1;
        goto LABEL_92;
      }
      id v39 = v38;
      uint64_t v40 = *(void *)v87;
LABEL_41:
      uint64_t v41 = 0;
      while (1)
      {
        if (*(void *)v87 != v40) {
          objc_enumerationMutation(v13);
        }
        uint64_t v42 = *(void **)(*((void *)&v86 + 1) + 8 * v41);
        if (objc_opt_respondsToSelector())
        {
          restorePolicy = self->_restorePolicy;
          unsigned __int8 v44 = [v84 absolutePath];
          LOBYTE(restorePolicy) = [v42 shouldRestoreContentWithPolicy:restorePolicy atPath:v44];

          if ((restorePolicy & 1) == 0) {
            break;
          }
        }
        if (v39 == (id)++v41)
        {
          id v39 = [v13 countByEnumeratingWithState:&v86 objects:v98 count:16];
          BOOL v14 = 1;
          if (v39) {
            goto LABEL_41;
          }
          goto LABEL_79;
        }
      }
      if (v82)
      {
        BOOL v14 = 0;
LABEL_79:
        double v9 = v84;
        goto LABEL_92;
      }
      id v65 = MBGetDefaultLog();
      double v9 = v84;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        __int16 v73 = (objc_class *)objc_opt_class();
        Name = class_getName(v73);
        v75 = [v84 absolutePath];
        *(_DWORD *)buf = 136446466;
        v101 = Name;
        __int16 v102 = 2112;
        v103 = v75;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Not restoring because it was refused by plugin %{public}s: %@", buf, 0x16u);

        v76 = (objc_class *)objc_opt_class();
        class_getName(v76);
        v78 = [v84 absolutePath];
        _MBLog();
      }
      goto LABEL_90;
    }
  }
  if (v82) {
    goto LABEL_91;
  }
  id v65 = MBGetDefaultLog();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Not restoring because this is a relative symbolic link in a prohibited domain", buf, 2u);
    _MBLog();
  }
LABEL_90:

LABEL_91:
  BOOL v14 = 0;
LABEL_92:
  BOOL v6 = v85;
LABEL_93:

LABEL_94:
LABEL_95:

  return v14;
}

- (id)_restoreRegularFiles:(id)a3 size:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v145 = (const std::__fs::filesystem::path *)[v6 count];
    __int16 v146 = 2048;
    unint64_t v147 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Downloading %lu files of size %{bytes}llu", buf, 0x16u);
    id v104 = [v6 count];
    v105 = (void *)a4;
    _MBLog();
  }

  v122 = +[NSMutableDictionary dictionaryWithCapacity:0];
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v139 objects:v156 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v140;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v140 != v10) {
          objc_enumerationMutation(obj);
        }
        __int16 v12 = *(void **)(*((void *)&v139 + 1) + 8 * i);
        id v13 = [(MBManifestLike *)self->_manifest databaseIndex];
        BOOL v14 = [v12 fileID];
        unsigned __int8 v15 = [v13 flagsForFileID:v14 error:0];

        unsigned int v16 = [(MBDriveRestoreEngine *)self settingsContext];
        unint64_t v17 = v16;
        if ((v15 & 8) != 0) {
          [v16 driveSnapshotDir];
        }
        else {
        id v18 = [v16 driveBackupDir];
        }

        id v19 = [v12 nonRedirectedDomain];
        uint64_t v20 = [v12 relativePath];
        unsigned int v21 = +[MBFileID fileIDWithDomain:v19 relativePath:v20];

        double v22 = [(MBManifestLike *)self->_manifest properties];
        if ([v22 hasManifestDB]) {
          [v21 filenameWithPrefix];
        }
        else {
        unint64_t v23 = [v21 filename];
        }

        id v24 = [v18 stringByAppendingPathComponent:v23];
        unint64_t v25 = [(MBDriveRestoreEngine *)self _temporaryPathForFile:v12];
        [v122 setObject:v25 forKeyedSubscript:v24];
      }
      id v9 = [obj countByEnumeratingWithState:&v139 objects:v156 count:16];
    }
    while (v9);
  }

  CFStringRef v154 = @"FileHandleFactory";
  v155 = self;
  uint64_t v26 = +[NSDictionary dictionaryWithObjects:&v155 forKeys:&v154 count:1];
  drive = self->_drive;
  uint64_t v137 = 0;
  uint64_t v138 = 0;
  v111 = (void *)v26;
  unsigned __int8 v28 = -[MBDrive downloadFilesAtPaths:options:results:error:](drive, "downloadFilesAtPaths:options:results:error:", v122);
  id v112 = 0;
  id v29 = 0;
  if ((v28 & 1) == 0)
  {
    if (!+[MBError isError:v29 withCode:2])
    {
      id v54 = +[MBBackupHelper driveReadError:v29 description:@"Error downloading files"];
      double v55 = v111;
      goto LABEL_102;
    }
    id v109 = v29;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    id v56 = v112;
    id v57 = [v56 countByEnumeratingWithState:&v133 objects:v153 count:16];
    if (v57)
    {
      id v58 = v57;
      char v59 = 0;
      uint64_t v60 = *(void *)v134;
      do
      {
        for (j = 0; j != v58; j = (char *)j + 1)
        {
          if (*(void *)v134 != v60) {
            objc_enumerationMutation(v56);
          }
          unsigned __int8 v62 = *(const std::__fs::filesystem::path **)(*((void *)&v133 + 1) + 8 * (void)j);
          id v63 = objc_msgSend(v56, "objectForKeyedSubscript:", v62, v104, v105);
          if (+[MBError isError:v63 withCode:105])
          {
            char v59 = 1;
          }
          else
          {
            unint64_t v64 = MBGetDefaultLog();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v145 = v62;
              __int16 v146 = 2112;
              unint64_t v147 = (unint64_t)v63;
              _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Error downloading \"%@\": %@", buf, 0x16u);
              id v104 = (id)v62;
              v105 = v63;
              _MBLog();
            }
          }
        }
        id v58 = [v56 countByEnumeratingWithState:&v133 objects:v153 count:16];
      }
      while (v58);

      if (v59)
      {
        CFStringRef v65 = @"No space left on device";
        uint64_t v66 = 106;
LABEL_95:
        id v54 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v66, v65, v104);
        double v55 = v111;
        id v29 = v109;
        goto LABEL_102;
      }
    }
    else
    {
    }
    CFStringRef v65 = @"Multiple errors downloading files";
    uint64_t v66 = 205;
    goto LABEL_95;
  }
  if ([(MBEngine *)self isDeviceTransferEngine]
    && [(MBDriveRestoreEngine *)self shouldVerifyDigests])
  {
    id v108 = v29;
    long long v132 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v129 = 0u;
    id v30 = obj;
    id v31 = [v30 countByEnumeratingWithState:&v129 objects:v152 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v130;
      id v115 = v30;
      uint64_t v117 = *(void *)v130;
      do
      {
        unsigned int v34 = 0;
        id v113 = v32;
        do
        {
          if (*(void *)v130 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void **)(*((void *)&v129 + 1) + 8 * (void)v34);
          unsigned __int8 v36 = objc_msgSend(v35, "domain", v104, v105, v106, v107);
          unsigned int v37 = [v36 shouldDigest];

          if (v37)
          {
            id v38 = [v35 digest];
            if (v38)
            {
              id v39 = [(MBDriveRestoreEngine *)self _temporaryPathForFile:v35];
              uint64_t v40 = +[MBDigest sha256];
              id v128 = 0;
              uint64_t v41 = [v40 digestForFileAtPath:v39 error:&v128];
              id v119 = v128;
              if (v41)
              {
                unsigned __int8 v42 = [(std::__fs::filesystem::path *)v41 isEqualToData:v38];
                uint64_t v43 = MBGetDefaultLog();
                unsigned __int8 v44 = v43;
                if (v42)
                {
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                  {
                    double v45 = [v35 absolutePath];
                    *(_DWORD *)buf = 138412290;
                    v145 = v45;
                    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "Digest matches: %@", buf, 0xCu);

                    id v104 = [v35 absolutePath];
                    _MBLog();
                  }
                }
                else
                {
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                  {
                    id v51 = [v35 absolutePath];
                    unsigned __int8 v52 = [v35 fileID];
                    *(_DWORD *)buf = 138413058;
                    v145 = v41;
                    __int16 v146 = 2112;
                    unint64_t v147 = (unint64_t)v38;
                    __int16 v148 = 2112;
                    v149 = v51;
                    __int16 v150 = 2112;
                    v151 = v52;
                    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "File SHA256 digest does not match manifest (%@ vs %@): %@ (%@)", buf, 0x2Au);

                    uint64_t v53 = [v35 absolutePath];
                    [v35 fileID];
                    v107 = v106 = v53;
                    id v104 = v41;
                    v105 = v38;
                    _MBLog();
                  }
                  [(MBDriveRestoreEngine *)self digestDidNotMatchForFile:v35];
                }
                id v32 = v113;
                id v30 = v115;
              }
              else
              {
                id v50 = MBGetDefaultLog();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v145 = v39;
                  __int16 v146 = 2112;
                  unint64_t v147 = (unint64_t)v119;
                  _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Failed to compute the SHA1 digest for %@: %@", buf, 0x16u);
                  id v104 = v39;
                  v105 = v119;
                  id v30 = v115;
                  _MBLog();
                }

                [(MBDriveRestoreEngine *)self digestDidNotMatchForFile:v35];
              }

              uint64_t v33 = v117;
            }
            else
            {
              id v46 = MBGetDefaultLog();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                unint64_t v47 = [v35 absolutePath];
                __int16 v48 = [v35 fileID];
                *(_DWORD *)buf = 138412546;
                v145 = v47;
                __int16 v146 = 2112;
                unint64_t v147 = (unint64_t)v48;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Digest missing from file: %@ (%@)", buf, 0x16u);

                unint64_t v49 = [v35 absolutePath];
                [v35 fileID];
                v105 = id v104 = v49;
                _MBLog();
              }
              [(MBDriveRestoreEngine *)self digestDidNotMatchForFile:v35];
            }
          }
          unsigned int v34 = (char *)v34 + 1;
        }
        while (v32 != v34);
        id v32 = [v30 countByEnumeratingWithState:&v129 objects:v152 count:16];
      }
      while (v32);
    }

    id v29 = v108;
  }
  if (self->_digestDidNotMatchForSomeFiles)
  {
    id v54 = +[MBError errorWithCode:205 format:@"Digest didn't match for some files"];
    goto LABEL_48;
  }
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id v114 = obj;
  id v116 = [v114 countByEnumeratingWithState:&v124 objects:v143 count:16];
  if (!v116) {
    goto LABEL_92;
  }
  uint64_t v118 = *(void *)v125;
  while (2)
  {
    for (k = 0; k != v116; k = (char *)k + 1)
    {
      id v68 = v29;
      if (*(void *)v125 != v118) {
        objc_enumerationMutation(v114);
      }
      v69 = *(void **)(*((void *)&v124 + 1) + 8 * (void)k);
      -[MBDriveRestoreEngine _temporaryPathForFile:](self, "_temporaryPathForFile:", v69, v104, v105, v106, v107);
      double v70 = (std::__fs::filesystem::path *) objc_claimAutoreleasedReturnValue();
      __int16 v71 = (const std::__fs::filesystem::path *)[(std::__fs::filesystem::path *)v70 fileSystemRepresentation];
      unint64_t v72 = [(MBEngine *)self persona];
      __int16 v73 = [v72 restorePathForDriveRestorable:v69];

      restorePolicy = self->_restorePolicy;
      v75 = [v69 domain];
      v76 = [v69 relativePath];
      v77 = [(MBRestorePolicy *)restorePolicy validateRestoreDomain:v75 relativePath:v76];

      if (v77)
      {
        long long v88 = v73;
        id v97 = v77;
        goto LABEL_98;
      }
      id v120 = v73;
      v78 = (const std::__fs::filesystem::path *)[v120 fileSystemRepresentation];
      uint64_t v79 = MBGetDefaultLog();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
      {
        [v69 description];
        id v80 = v73;
        v81 = (std::__fs::filesystem::path *)objc_claimAutoreleasedReturnValue();
        BOOL v82 = [v69 fileID];
        *(_DWORD *)buf = 138412546;
        v145 = v81;
        __int16 v146 = 2112;
        unint64_t v147 = (unint64_t)v82;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "Restoring regular file: %@ (%@)", buf, 0x16u);

        BOOL v83 = [v69 description];
        [v69 fileID];
        v105 = id v104 = v83;
        _MBLog();

        __int16 v73 = v80;
      }

      id v84 = [v69 restoreRegularFileAtPath:v70 settingAttributes:1];
      if (v84)
      {
        long long v88 = v73;
        id v97 = v84;
LABEL_98:
        id v29 = v97;
LABEL_99:
        id v54 = v97;
        goto LABEL_100;
      }
      rename(v71, v78, v85);
      if (!v86)
      {
        id v29 = 0;
LABEL_87:
        long long v95 = v120;
        goto LABEL_88;
      }
      unint64_t v87 = *__error();
      if (v87 != 92 && v87 != 63)
      {
        long long v88 = v73;
        if (v87 == 21)
        {
          long long v89 = MBGetDefaultLog();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_INFO, "Removing existing directory", buf, 2u);
            _MBLog();
          }

          long long v90 = +[NSFileManager defaultManager];
          id v123 = 0;
          unsigned __int8 v91 = [v90 removeItemAtPath:v120 error:&v123];
          id v29 = v123;

          if ((v91 & 1) == 0)
          {
            id v97 = +[MBError errorWithCode:102 error:v29 path:v120 format:@"Error removing directory item while restoring regular file"];
            goto LABEL_99;
          }
          rename(v71, v78, v92);
          if (v93)
          {
            v101 = MBGetDefaultLog();
            BOOL v102 = os_log_type_enabled(v101, OS_LOG_TYPE_ERROR);
            double v55 = v111;
            if (v102)
            {
              *(_DWORD *)buf = 136315650;
              v145 = v71;
              __int16 v146 = 2080;
              unint64_t v147 = (unint64_t)v78;
              __int16 v148 = 1024;
              LODWORD(v149) = 21;
              _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "rename from %s to %s failed: %{errno}d", buf, 0x1Cu);
              _MBLog();
            }

            v103 = NSStringFromSelector(a2);
            id v54 = +[MBError posixErrorWithCode:21, v120, @"%@ rename error", v103 path format];

            goto LABEL_101;
          }
          goto LABEL_87;
        }
        v99 = MBGetDefaultLog();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v145 = v71;
          __int16 v146 = 2080;
          unint64_t v147 = (unint64_t)v78;
          __int16 v148 = 1024;
          LODWORD(v149) = v87;
          _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "rename from %s to %s failed: %{errno}d", buf, 0x1Cu);
          _MBLog();
        }

        v100 = NSStringFromSelector(a2);
        id v54 = +[MBError posixErrorWithCode:(int)v87, v120, @"%@ rename error", v100 path format];

        id v29 = 0;
LABEL_100:
        double v55 = v111;
LABEL_101:

        goto LABEL_102;
      }
      long long v94 = MBGetDefaultLog();
      long long v95 = v120;
      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v145 = v70;
        __int16 v146 = 2112;
        unint64_t v147 = (unint64_t)v120;
        __int16 v148 = 1024;
        LODWORD(v149) = v87;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "Skipped rename from %@ to %@: %{errno}d", buf, 0x1Cu);
        v105 = v120;
        v106 = (void *)v87;
        id v104 = v70;
        _MBLog();
      }

      id v29 = 0;
LABEL_88:
      long long v96 = MBGetDefaultLog();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v145 = v71;
        __int16 v146 = 2080;
        unint64_t v147 = (unint64_t)v78;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "Renamed %s to %s", buf, 0x16u);
        id v104 = (id)v71;
        v105 = (void *)v78;
        _MBLog();
      }
    }
    id v116 = [v114 countByEnumeratingWithState:&v124 objects:v143 count:16];
    if (v116) {
      continue;
    }
    break;
  }
LABEL_92:

  id v54 = 0;
LABEL_48:
  double v55 = v111;
LABEL_102:

  return v54;
}

- (id)_annotate
{
  unsigned int v4 = [(MBDriveRestoreEngine *)self settingsContext];
  unsigned int v5 = [v4 shouldRemoveItemsNotRestored];

  id v6 = MBGetDefaultLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Annotating", buf, 2u);
      _MBLog();
    }

    +[NSDate timeIntervalSinceReferenceDate];
    double v9 = v8;
    uint64_t v10 = [(MBEngine *)self persona];
    uint64_t engineType = self->_engineType;
    int64_t v12 = [(MBEngine *)self backupPolicy];
    id v13 = [(MBDriveRestoreEngine *)self settingsContext];
    id v6 = +[MBRestoreDirectoryAnnotator restoreDirectoryAnnotatorWithPersona:engineType:backupPolicy:shouldRestoreSystemFiles:encrypted:](MBRestoreDirectoryAnnotator, "restoreDirectoryAnnotatorWithPersona:engineType:backupPolicy:shouldRestoreSystemFiles:encrypted:", v10, engineType, v12, [v13 shouldRestoreSystemFiles], -[MBDriveRestoreEngine encrypted](self, "encrypted"));

    BOOL v14 = [(MBDomainManager *)self->super._domainManager allDomains];
    unsigned __int8 v15 = [v6 annotateDomains:v14];

    if (v15)
    {
      id v16 = v15;

      goto LABEL_12;
    }
    unint64_t v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      +[NSDate timeIntervalSinceReferenceDate];
      *(_DWORD *)buf = 134217984;
      double v21 = v18 - v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Annotated in %0.3f s", buf, 0xCu);
      +[NSDate timeIntervalSinceReferenceDate];
      _MBLog();
    }
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Not annotating", buf, 2u);
    _MBLog();
  }

  id v16 = 0;
LABEL_12:
  return v16;
}

- (id)_restoreDirectoryModificationTimes
{
  uint64_t v16 = 0;
  unint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100213DD4;
  uint64_t v20 = sub_100213DE4;
  id v21 = 0;
  unsigned int v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting to restore directory modification times", buf, 2u);
    _MBLog();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  manifest = self->_manifest;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10021843C;
  v15[3] = &unk_100416A18;
  v15[4] = self;
  v15[5] = &v16;
  id v8 = [(MBManifestLike *)manifest enumerateFiles:v15];
  double v9 = (void *)v17[5];
  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v12 = v11;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        +[NSDate timeIntervalSinceReferenceDate];
        *(_DWORD *)buf = 134217984;
        double v23 = v13 - v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Finished restoring directory modification times in %0.3f s", buf, 0xCu);
      }

      +[NSDate timeIntervalSinceReferenceDate];
      _MBLog();
    }
  }
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (id)_moveRestoreDirs
{
  v2 = [(MBEngine *)self persona];
  id v5 = 0;
  [v2 finalizeRestoreDirectoriesWithError:&v5];
  id v3 = v5;

  return v3;
}

- (id)fileForTemporaryPath:(id)a3
{
  id v5 = a3;
  double v6 = [v5 lastPathComponent];
  BOOL v7 = [v6 stringByDeletingPathExtension];
  id v8 = +[MBFileID fileIDWithString:v7];

  if (!v8)
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MBDriveRestoreEngine.m", 1280, @"Couldn't extract file ID from temporary restore path: %@", v5 object file lineNumber description];
  }
  double v9 = [(MBManifestLike *)self->_manifest fetchFileWithID:v8 error:0];
  if (!v9)
  {
    int64_t v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MBDriveRestoreEngine.m", 1283, @"Couldn't find file object for temporary restore path: %@", v5 object file lineNumber description];
  }
  return v9;
}

- (void)digestDidNotMatchForFile:(id)a3
{
  self->_digestDidNotMatchForSomeFiles = 1;
}

- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = [(MBDriveRestoreEngine *)self fileForTemporaryPath:v10];
  if ([(MBDriveRestoreEngine *)self encrypted])
  {
    int64_t v12 = [(MBDriveRestoreEngine *)self settingsContext];
    double v13 = [v12 keybag];
    BOOL v14 = [v11 encryptionKey];
    unsigned __int8 v15 = +[MBEncryptedFileHandle encryptedFileHandleForRestoreWithPath:v10 keybag:v13 key:v14 error:a6];

    if (!v15) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v16 = +[MBBasicFileHandle basicFileHandleWithPath:v10 flags:v8 mode:v7 error:a6];
    if (!v16)
    {
LABEL_9:
      uint64_t v20 = 0;
      goto LABEL_12;
    }
    unsigned __int8 v15 = (void *)v16;
    unint64_t v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      unsigned int v18 = [v11 protectionClass];
      id v19 = [v11 absolutePath];
      *(_DWORD *)buf = 67109378;
      unsigned int v24 = v18;
      __int16 v25 = 2112;
      uint64_t v26 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Setting protection class to %d: %@", buf, 0x12u);

      [v11 protectionClass];
      double v22 = [v11 absolutePath];
      _MBLog();
    }
    if (!+[MBProtectionClassUtils setWithFD:value:error:](MBProtectionClassUtils, "setWithFD:value:error:", [v15 fd], objc_msgSend(v11, "protectionClass"), a6))
    {
      [v15 closeWithError:0];
      uint64_t v20 = 0;
      goto LABEL_11;
    }
  }
  uint64_t v20 = [[MBRestoreFileHandle alloc] initWithEngine:self fileHandle:v15 file:v11];
LABEL_11:

LABEL_12:
  return v20;
}

- (int)engineType
{
  return self->_engineType;
}

- (MBProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restorePolicy, 0);
  objc_storeStrong((id *)&self->_userTemporaryDirectory, 0);
  objc_storeStrong((id *)&self->_sharedTemporaryDirectory, 0);
  objc_storeStrong((id *)&self->_restoredAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_regularFileIDsByInodeNumber, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_backupHelper, 0);
  objc_storeStrong((id *)&self->_drive, 0);
  objc_storeStrong((id *)&self->_script, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

- (id)domainForName:(id)a3 containerID:(id)a4 domainManager:(id)a5
{
  return +[MBDriveRestoreDomainManagerDelegate domainForName:a3 containerID:a4 engine:self];
}

@end