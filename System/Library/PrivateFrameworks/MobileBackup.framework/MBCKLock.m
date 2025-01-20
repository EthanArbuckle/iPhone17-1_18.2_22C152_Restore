@interface MBCKLock
+ (id)recordNameWithDeviceUUID:(id)a3;
- (BOOL)_saveWithAccount:(id)a3 timeout:(unint64_t)a4 pluginFields:(id)a5 error:(id *)a6;
- (BOOL)clearLockWithAccount:(id)a3 pluginFields:(id)a4 error:(id *)a5;
- (BOOL)saveLockWithAccount:(id)a3 timeout:(double)a4 pluginFields:(id)a5 error:(id *)a6;
- (CKOperationGroup)ckOperationGroup;
- (MBCKDatabaseManager)databaseManager;
- (MBCKLock)initWithDeviceUUID:(id)a3 databaseManager:(id)a4;
- (NSDictionary)pluginFields;
- (NSString)deviceUUID;
- (NSString)owner;
- (id)_getRecordIDString;
- (id)recordRepresentation;
- (id)recordType;
- (int64_t)savePolicy;
- (unint64_t)duration;
- (unint64_t)recordZone;
- (void)refreshWithRecord:(id)a3;
- (void)setCkOperationGroup:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDeviceUUID:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setOwner:(id)a3;
- (void)setPluginFields:(id)a3;
@end

@implementation MBCKLock

+ (id)recordNameWithDeviceUUID:(id)a3
{
  id v3 = a3;
  if (!v3) {
    __assert_rtn("+[MBCKLock recordNameWithDeviceUUID:]", "MBCKLock.m", 28, "deviceUUID");
  }
  v4 = v3;
  id v5 = [objc_alloc((Class)NSString) initWithFormat:@"%@:Lock", v3];

  return v5;
}

- (MBCKLock)initWithDeviceUUID:(id)a3 databaseManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MBCKLock;
  v8 = [(MBCKModel *)&v11 initWithRecord:0 cache:0];
  v9 = v8;
  if (v8)
  {
    [(MBCKLock *)v8 setDeviceUUID:v6];
    [(MBCKLock *)v9 setDatabaseManager:v7];
  }

  return v9;
}

- (id)_getRecordIDString
{
  id v3 = objc_opt_class();
  v4 = [(MBCKLock *)self deviceUUID];
  id v5 = [v3 recordNameWithDeviceUUID:v4];

  return v5;
}

- (id)recordType
{
  return @"Lock";
}

- (unint64_t)recordZone
{
  return 2;
}

- (void)refreshWithRecord:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MBCKLock;
  [(MBCKModel *)&v3 refreshWithRecord:a3];
}

- (id)recordRepresentation
{
  v15.receiver = self;
  v15.super_class = (Class)MBCKLock;
  objc_super v3 = [(MBCKModel *)&v15 recordRepresentation];
  v4 = [(MBCKLock *)self owner];
  if (!v4)
  {
    v4 = MBDeviceUUID();
    if (!v4) {
      __assert_rtn("-[MBCKLock recordRepresentation]", "MBCKLock.m", 57, "owner");
    }
  }
  id v5 = objc_opt_new();
  v18[0] = @"owner";
  v18[1] = @"duration";
  v19[0] = v4;
  id v6 = +[NSNumber numberWithUnsignedLongLong:[(MBCKLock *)self duration]];
  v19[1] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v5 addEntriesFromDictionary:v7];

  v8 = [(MBCKLock *)self pluginFields];

  if (v8)
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(MBCKLock *)self pluginFields];
      *(_DWORD *)buf = 138543362;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Merging pluginFields from delegate for lock: %{public}@", buf, 0xCu);

      v14 = [(MBCKLock *)self pluginFields];
      _MBLog();
    }
    objc_super v11 = [(MBCKLock *)self pluginFields];
    [v5 addEntriesFromDictionary:v11];
  }
  objc_msgSend(v3, "setPluginFields:", v5, v14);
  v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Lock record representation: %{public}@", buf, 0xCu);
    _MBLog();
  }

  return v3;
}

- (BOOL)_saveWithAccount:(id)a3 timeout:(unint64_t)a4 pluginFields:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (!v10) {
    __assert_rtn("-[MBCKLock _saveWithAccount:timeout:pluginFields:error:]", "MBCKLock.m", 70, "account");
  }
  if (!a6) {
    __assert_rtn("-[MBCKLock _saveWithAccount:timeout:pluginFields:error:]", "MBCKLock.m", 71, "error");
  }
  v12 = v11;
  v13 = +[MBCKOperationPolicy expensiveCellularPolicy];
  v14 = [(MBCKLock *)self databaseManager];
  objc_super v15 = +[MBCKOperationTracker operationTrackerWithAccount:v10 databaseManager:v14 policy:v13 error:a6];

  if (v15)
  {
    v16 = [(MBCKLock *)self ckOperationGroup];
    [v15 setCkOperationGroup:v16];

    [(MBCKLock *)self setDuration:a4];
    [(MBCKLock *)self setPluginFields:v12];
    BOOL v17 = [(MBCKModel *)self saveWithOperationTracker:v15 error:a6];
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)saveLockWithAccount:(id)a3 timeout:(double)a4 pluginFields:(id)a5 error:(id *)a6
{
  return [(MBCKLock *)self _saveWithAccount:a3 timeout:(unint64_t)a4 pluginFields:a5 error:a6];
}

- (BOOL)clearLockWithAccount:(id)a3 pluginFields:(id)a4 error:(id *)a5
{
  return [(MBCKLock *)self _saveWithAccount:a3 timeout:0 pluginFields:a4 error:a5];
}

- (int64_t)savePolicy
{
  return 2;
}

- (CKOperationGroup)ckOperationGroup
{
  return self->_ckOperationGroup;
}

- (void)setCkOperationGroup:(id)a3
{
}

- (NSString)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (NSDictionary)pluginFields
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPluginFields:(id)a3
{
}

- (MBCKDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_pluginFields, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_ckOperationGroup, 0);
}

@end