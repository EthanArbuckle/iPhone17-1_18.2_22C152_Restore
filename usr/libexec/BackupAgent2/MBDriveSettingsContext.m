@interface MBDriveSettingsContext
+ (id)defaultSettingsContext;
- (BOOL)isDeviceTransfer;
- (BOOL)shouldCopyBackup;
- (BOOL)shouldNotifySpringBoard;
- (BOOL)shouldRemoveItemsNotRestored;
- (BOOL)shouldRestoreAppWithID:(id)a3;
- (BOOL)shouldRestoreSystemFiles;
- (MBDrive)drive;
- (MBDriveEncryptionManager)encryptionManager;
- (MBDriveSettingsContext)initWithPersona:(id)a3;
- (MBKeyBag)keybag;
- (MBManager)manager;
- (NSMutableDictionary)options;
- (NSSet)applicationIDs;
- (NSString)deviceCacheDir;
- (NSString)driveBackupDatabaseIndexPath;
- (NSString)driveBackupDatabasePath;
- (NSString)driveBackupDir;
- (NSString)driveBackupInfoPath;
- (NSString)driveBackupManifestDatabasePath;
- (NSString)driveBackupPropertiesPath;
- (NSString)driveBackupStatusPath;
- (NSString)driveSnapshotDatabaseIndexPath;
- (NSString)driveSnapshotDatabasePath;
- (NSString)driveSnapshotDir;
- (NSString)driveSnapshotManifestDatabasePath;
- (NSString)driveSnapshotPropertiesPath;
- (NSString)password;
- (NSString)sourceIdentifier;
- (NSString)targetDeviceClass;
- (NSString)targetIdentifier;
- (double)protocolVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (void)log;
- (void)setApplicationIDs:(id)a3;
- (void)setDeviceCacheDir:(id)a3;
- (void)setDrive:(id)a3;
- (void)setEncryptionManager:(id)a3;
- (void)setIsDeviceTransfer:(BOOL)a3;
- (void)setKeybag:(id)a3;
- (void)setManager:(id)a3;
- (void)setOptions:(id)a3;
- (void)setProtocolVersion:(double)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setTargetDeviceClass:(id)a3;
- (void)setTargetIdentifier:(id)a3;
- (void)updatePassword:(id)a3;
@end

@implementation MBDriveSettingsContext

+ (id)defaultSettingsContext
{
  id v7 = 0;
  v2 = +[MBPersona personalPersonaWithError:&v7];
  id v3 = v7;
  if (v2)
  {
    v4 = [[MBDriveSettingsContext alloc] initWithPersona:v2];
  }
  else
  {
    v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Failed to fetch personal persona: %@", buf, 0xCu);
      _MBLog();
    }

    v4 = 0;
  }

  return v4;
}

- (MBDriveSettingsContext)initWithPersona:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MBDriveSettingsContext;
  id v3 = [(MBSettingsContext *)&v15 init];
  if (v3)
  {
    uint64_t v4 = MBDeviceClass();
    targetDeviceClass = v3->_targetDeviceClass;
    v3->_targetDeviceClass = (NSString *)v4;

    v6 = MBDefaultOptions();
    id v7 = (NSMutableDictionary *)[v6 mutableCopy];
    options = v3->_options;
    v3->_options = v7;

    id v9 = [[MBDriveEncryptionManager alloc] initWithSettingsContext:v3];
    encryptionManager = v3->_encryptionManager;
    v3->_encryptionManager = v9;

    uint64_t v11 = MBGetCacheDir();
    deviceCacheDir = v3->_deviceCacheDir;
    v3->_deviceCacheDir = (NSString *)v11;

    v13 = [(NSMutableDictionary *)v3->_options objectForKeyedSubscript:@"RestorePreserveSettings"];
    -[MBSettingsContext setShouldPreserveSettings:](v3, "setShouldPreserveSettings:", [v13 BOOLValue]);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MBDriveSettingsContext;
  id v5 = -[MBSettingsContext copyWithZone:](&v9, "copyWithZone:");
  [v5 setProtocolVersion:self->_protocolVersion];
  [v5 setTargetDeviceClass:self->_targetDeviceClass];
  [v5 setSourceIdentifier:self->_sourceIdentifier];
  [v5 setTargetIdentifier:self->_targetIdentifier];
  id v6 = [(NSSet *)self->_applicationIDs mutableCopyWithZone:a3];
  [v5 setApplicationIDs:v6];

  id v7 = [(NSMutableDictionary *)self->_options mutableCopyWithZone:a3];
  [v5 setOptions:v7];

  [v5 setDrive:self->_drive];
  [v5 setEncryptionManager:self->_encryptionManager];
  [v5 setDeviceCacheDir:self->_deviceCacheDir];
  return v5;
}

- (BOOL)shouldNotifySpringBoard
{
  v2 = [(NSMutableDictionary *)self->_options objectForKeyedSubscript:@"RestoreShouldReboot"];
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (BOOL)shouldCopyBackup
{
  v2 = [(NSMutableDictionary *)self->_options objectForKeyedSubscript:@"RestoreDontCopyBackup"];
  char v3 = [v2 BOOLValue] ^ 1;

  return v3;
}

- (BOOL)shouldRestoreSystemFiles
{
  v2 = [(NSMutableDictionary *)self->_options objectForKeyedSubscript:@"RestoreSystemFiles"];
  char v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (BOOL)shouldRemoveItemsNotRestored
{
  v2 = [(NSMutableDictionary *)self->_options objectForKeyedSubscript:@"RemoveItemsNotRestored"];
  char v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (NSString)password
{
  return (NSString *)[(NSMutableDictionary *)self->_options objectForKeyedSubscript:@"Password"];
}

- (NSString)driveBackupDir
{
  sourceIdentifier = self->_sourceIdentifier;
  if (!sourceIdentifier) {
    sourceIdentifier = self->_targetIdentifier;
  }
  return sourceIdentifier;
}

- (NSString)driveBackupStatusPath
{
  v2 = [(MBDriveSettingsContext *)self driveBackupDir];
  char v3 = [v2 stringByAppendingPathComponent:@"Status.plist"];

  return (NSString *)v3;
}

- (NSString)driveBackupPropertiesPath
{
  v2 = [(MBDriveSettingsContext *)self driveBackupDir];
  char v3 = [v2 stringByAppendingPathComponent:@"Manifest.plist"];

  return (NSString *)v3;
}

- (NSString)driveBackupDatabasePath
{
  v2 = [(MBDriveSettingsContext *)self driveBackupDir];
  char v3 = [v2 stringByAppendingPathComponent:@"Manifest.mbdb"];

  return (NSString *)v3;
}

- (NSString)driveBackupDatabaseIndexPath
{
  v2 = [(MBDriveSettingsContext *)self driveBackupDir];
  char v3 = [v2 stringByAppendingPathComponent:@"Manifest.mbdx"];

  return (NSString *)v3;
}

- (NSString)driveBackupManifestDatabasePath
{
  v2 = [(MBDriveSettingsContext *)self driveBackupDir];
  char v3 = [v2 stringByAppendingPathComponent:@"Manifest.db"];

  return (NSString *)v3;
}

- (NSString)driveBackupInfoPath
{
  v2 = [(MBDriveSettingsContext *)self driveBackupDir];
  char v3 = [v2 stringByAppendingPathComponent:@"Info.plist"];

  return (NSString *)v3;
}

- (NSString)driveSnapshotDir
{
  v2 = [(MBDriveSettingsContext *)self driveBackupDir];
  char v3 = [v2 stringByAppendingPathComponent:@"Snapshot"];

  return (NSString *)v3;
}

- (NSString)driveSnapshotPropertiesPath
{
  v2 = [(MBDriveSettingsContext *)self driveSnapshotDir];
  char v3 = [v2 stringByAppendingPathComponent:@"Manifest.plist"];

  return (NSString *)v3;
}

- (NSString)driveSnapshotDatabasePath
{
  v2 = [(MBDriveSettingsContext *)self driveSnapshotDir];
  char v3 = [v2 stringByAppendingPathComponent:@"Manifest.mbdb"];

  return (NSString *)v3;
}

- (NSString)driveSnapshotDatabaseIndexPath
{
  v2 = [(MBDriveSettingsContext *)self driveSnapshotDir];
  char v3 = [v2 stringByAppendingPathComponent:@"Manifest.mbdx"];

  return (NSString *)v3;
}

- (NSString)driveSnapshotManifestDatabasePath
{
  v2 = [(MBDriveSettingsContext *)self driveSnapshotDir];
  char v3 = [v2 stringByAppendingPathComponent:@"Manifest.db"];

  return (NSString *)v3;
}

- (BOOL)shouldRestoreAppWithID:(id)a3
{
  applicationIDs = self->_applicationIDs;
  if (applicationIDs) {
    return [(NSSet *)applicationIDs containsObject:a3];
  }
  else {
    return 1;
  }
}

- (void)updatePassword:(id)a3
{
  options = self->_options;
  if (a3) {
    [(NSMutableDictionary *)options setObject:a3 forKeyedSubscript:@"Password"];
  }
  else {
    [(NSMutableDictionary *)options removeObjectForKey:@"Password"];
  }
}

- (void)log
{
  v25.receiver = self;
  v25.super_class = (Class)MBDriveSettingsContext;
  [(MBSettingsContext *)&v25 log];
  char v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v4 = [(MBDriveSettingsContext *)self targetDeviceClass];
    *(_DWORD *)buf = 138412290;
    v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "TargetDeviceClass: %@", buf, 0xCu);

    v20 = [(MBDriveSettingsContext *)self targetDeviceClass];
    _MBLog();
  }
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    [(MBDriveSettingsContext *)self protocolVersion];
    *(_DWORD *)buf = 134217984;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "ProtocolVersion: %0.1f", buf, 0xCu);
    [(MBDriveSettingsContext *)self protocolVersion];
    _MBLog();
  }

  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [(MBDriveSettingsContext *)self sourceIdentifier];
    *(_DWORD *)buf = 138412290;
    v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SourceIdentifier: %@", buf, 0xCu);

    v21 = [(MBDriveSettingsContext *)self sourceIdentifier];
    _MBLog();
  }
  objc_super v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = [(MBDriveSettingsContext *)self targetIdentifier];
    *(_DWORD *)buf = 138412290;
    v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "TargetIdentifier: %@", buf, 0xCu);

    v22 = [(MBDriveSettingsContext *)self targetIdentifier];
    _MBLog();
  }
  uint64_t v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [(MBDriveSettingsContext *)self applicationIDs];
    v13 = MBStringWithSet();
    *(_DWORD *)buf = 138412290;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "ApplicationIDs: %@", buf, 0xCu);

    v14 = [(MBDriveSettingsContext *)self applicationIDs];
    v23 = MBStringWithSet();
    _MBLog();
  }
  objc_super v15 = [(MBDriveSettingsContext *)self options];
  id v16 = [v15 mutableCopy];

  v17 = [v16 objectForKeyedSubscript:@"Password"];

  if (v17) {
    [v16 setObject:@"********" forKeyedSubscript:@"Password"];
  }
  v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = MBStringWithDictionary();
    *(_DWORD *)buf = 138412290;
    v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Options: %@", buf, 0xCu);

    v24 = MBStringWithDictionary();
    _MBLog();
  }
}

- (double)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(double)a3
{
  self->_protocolVersion = a3;
}

- (NSString)targetDeviceClass
{
  return self->_targetDeviceClass;
}

- (void)setTargetDeviceClass:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (NSString)targetIdentifier
{
  return self->_targetIdentifier;
}

- (void)setTargetIdentifier:(id)a3
{
}

- (NSSet)applicationIDs
{
  return self->_applicationIDs;
}

- (void)setApplicationIDs:(id)a3
{
}

- (NSMutableDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (MBDrive)drive
{
  return self->_drive;
}

- (void)setDrive:(id)a3
{
}

- (MBDriveEncryptionManager)encryptionManager
{
  return self->_encryptionManager;
}

- (void)setEncryptionManager:(id)a3
{
}

- (MBKeyBag)keybag
{
  return self->_keybag;
}

- (void)setKeybag:(id)a3
{
}

- (MBManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (BOOL)isDeviceTransfer
{
  return self->_isDeviceTransfer;
}

- (void)setIsDeviceTransfer:(BOOL)a3
{
  self->_isDeviceTransfer = a3;
}

- (NSString)deviceCacheDir
{
  return self->_deviceCacheDir;
}

- (void)setDeviceCacheDir:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCacheDir, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_drive, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_applicationIDs, 0);
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_targetDeviceClass, 0);

  objc_storeStrong((id *)&self->_deviceTemporaryDir, 0);
}

@end