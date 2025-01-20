@interface MBServiceSettingsContext
- (MBManagerDelegate)internalDelegate;
- (MBPowerAssertion)powerAssertion;
- (MBServiceAccount)account;
- (MBServiceLockManager)lockManager;
- (MBServiceRestoreMode)restoreMode;
- (MBWatchdog)watchdog;
- (NSNumber)qos;
- (NSString)backupUDID;
- (NSString)cacheDir;
- (NSString)cachePath;
- (NSString)chunkStorePath;
- (NSString)snapshotUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)volumeMountPoint;
- (int64_t)snapshotID;
- (void)setAccount:(id)a3;
- (void)setBackupUDID:(id)a3;
- (void)setCacheDir:(id)a3;
- (void)setInternalDelegate:(id)a3;
- (void)setLockManager:(id)a3;
- (void)setPowerAssertion:(id)a3;
- (void)setQos:(id)a3;
- (void)setRestoreMode:(id)a3;
- (void)setSnapshotID:(int64_t)a3;
- (void)setSnapshotUUID:(id)a3;
- (void)setWatchdog:(id)a3;
@end

@implementation MBServiceSettingsContext

- (NSString)cachePath
{
  return [(NSString *)self->_cacheDir stringByAppendingPathComponent:@"cache.db"];
}

- (NSString)chunkStorePath
{
  return [(NSString *)self->_cacheDir stringByAppendingPathComponent:@"ChunkStore"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MBServiceSettingsContext;
  id v5 = -[MBSettingsContext copyWithZone:](&v11, "copyWithZone:");
  [v5 setAccount:self->_account];
  [v5 setLockManager:self->_lockManager];
  id v6 = [(NSString *)self->_backupUDID copyWithZone:a3];
  [v5 setBackupUDID:v6];

  [v5 setSnapshotID:self->_snapshotID];
  id v7 = [(NSString *)self->_snapshotUUID copyWithZone:a3];
  [v5 setSnapshotUUID:v7];

  id v8 = [(NSString *)self->_cacheDir copyWithZone:a3];
  [v5 setCacheDir:v8];

  [v5 setRestoreMode:self->_restoreMode];
  id v9 = [(NSNumber *)self->_qos copyWithZone:a3];
  [v5 setQos:v9];

  [v5 setWatchdog:self->_watchdog];
  [v5 setPowerAssertion:self->_powerAssertion];
  return v5;
}

- (id)volumeMountPoint
{
  v2 = [(MBServiceSettingsContext *)self account];
  v3 = [v2 persona];
  v4 = [v3 volumeMountPoint];

  return v4;
}

- (MBServiceAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (MBServiceLockManager)lockManager
{
  return self->_lockManager;
}

- (void)setLockManager:(id)a3
{
}

- (NSString)backupUDID
{
  return self->_backupUDID;
}

- (void)setBackupUDID:(id)a3
{
}

- (int64_t)snapshotID
{
  return self->_snapshotID;
}

- (void)setSnapshotID:(int64_t)a3
{
  self->_snapshotID = a3;
}

- (NSString)snapshotUUID
{
  return self->_snapshotUUID;
}

- (void)setSnapshotUUID:(id)a3
{
}

- (NSString)cacheDir
{
  return self->_cacheDir;
}

- (void)setCacheDir:(id)a3
{
}

- (MBServiceRestoreMode)restoreMode
{
  return self->_restoreMode;
}

- (void)setRestoreMode:(id)a3
{
}

- (NSNumber)qos
{
  return self->_qos;
}

- (void)setQos:(id)a3
{
}

- (MBWatchdog)watchdog
{
  return self->_watchdog;
}

- (void)setWatchdog:(id)a3
{
}

- (MBPowerAssertion)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(id)a3
{
}

- (MBManagerDelegate)internalDelegate
{
  return self->_internalDelegate;
}

- (void)setInternalDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDelegate, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_qos, 0);
  objc_storeStrong((id *)&self->_restoreMode, 0);
  objc_storeStrong((id *)&self->_cacheDir, 0);
  objc_storeStrong((id *)&self->_snapshotUUID, 0);
  objc_storeStrong((id *)&self->_backupUDID, 0);
  objc_storeStrong((id *)&self->_lockManager, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end