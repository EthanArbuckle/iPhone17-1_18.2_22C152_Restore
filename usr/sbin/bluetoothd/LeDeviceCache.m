@interface LeDeviceCache
+ (id)sharedInstance;
- (BOOL)createDatabase:(sqlite3 *)a3 type:(unint64_t)a4 path:(const char *)a5 flags:(int)a6;
- (BOOL)initializeDatabases:(LeDeviceCacheEventListener *)a3 queue:(dispatch_queue_s *)a4;
- (BOOL)json:(id)a3 hasAllProperties:(id)a4;
- (BOOL)json:(id)a3 hasAnyProperty:(id)a4;
- (BOOL)loadDatabase:(unint64_t)a3;
- (BOOL)readIntFromDatabase:(sqlite3 *)a3 statement:(id)a4 value:(int *)a5;
- (LeDeviceCache)init;
- (const)friendlyNameForType:(unint64_t)a3;
- (const)tableNameForType:(unint64_t)a3;
- (id)customPropertiesJSONFromDevice:(const void *)a3;
- (id)databaseContainerURL;
- (id)nameFromSanitizedName:(id)a3;
- (id)readCustomPropertiesJSONForDeviceUUID:(id)a3 inDatabase:(sqlite3 *)a4;
- (int)_genericExecute:(id)a3 inDatabase:(sqlite3 *)a4;
- (int)connectedDeviceCount;
- (int)duplicatePairedDevicesForAddress:(unint64_t)a3 originalUuid:(id)a4;
- (int)maxConnectedDevices;
- (int)maxSeenDevices;
- (int)seenDeviceCount;
- (vector<std::string,)findUUIDsWithAllCustomProperties:(LeDeviceCache *)self;
- (vector<std::string,)findUUIDsWithCustomProperties:(LeDeviceCache *)self;
- (void)clearAllDatabases;
- (void)createTablesForDatabase:(sqlite3 *)a3 type:(unint64_t)a4;
- (void)customPropertiesToDevice:(void *)a3 fromJSON:(id)a4;
- (void)evictIfNeeded:(BOOL)a3;
- (void)loadPairedDevice:(id)a3 address:(unint64_t)a4 ifMissing:(BOOL)a5;
- (void)migratePlistData:(id)a3 database:(sqlite3 *)a4 type:(unint64_t)a5;
- (void)printDatabase:(unint64_t)a3;
- (void)printDebug;
- (void)readCustomPropertiesJSONForDevice:(void *)a3 inDatabase:(sqlite3 *)a4;
- (void)readDevice:(id)a3;
- (void)readDeviceByAddress:(unint64_t)a3;
- (void)readDeviceFromDatabase:(sqlite3 *)a3 statement:(id)a4;
- (void)removeCustomPropertiesJSONForDeviceUUID:(id)a3 inDatabase:(sqlite3 *)a4;
- (void)removeDevice:(const void *)a3 internal:(BOOL)a4;
- (void)removeDevicesDuplicatesOf:(unint64_t)a3 originalUuid:(id)a4;
- (void)setConnectedDeviceCount:(int)a3;
- (void)setSeenDeviceCount:(int)a3;
- (void)tryLoadProtectedCache;
- (void)updateProtectedCacheMetrics;
- (void)wipeDatabaseNameOrigin:(unint64_t)a3;
- (void)writeCustomPropertiesJSONForDevice:(const void *)a3 inDatabase:(sqlite3 *)a4;
- (void)writeDevice:(const void *)a3;
@end

@implementation LeDeviceCache

+ (id)sharedInstance
{
  if (qword_100A12478 != -1) {
    dispatch_once(&qword_100A12478, &stru_1009A93D0);
  }
  v2 = (void *)qword_100A12470;

  return v2;
}

- (LeDeviceCache)init
{
  v16.receiver = self;
  v16.super_class = (Class)LeDeviceCache;
  v2 = [(LeDeviceCache *)&v16 init];
  v3 = v2;
  if (!v2) {
    return v3;
  }
  *(_OWORD *)&v2->_maxSeenDevices = xmmword_1007BBE80;
  v2->_pairedDatabase = 0;
  v2->_otherDatabase = 0;
  int v15 = 0;
  uint64_t v4 = sub_100017768();
  sub_10004191C(buf, "LeDeviceCache");
  sub_10004191C(__p, "MaxConnectedOnDisk");
  int v5 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, int *))(*(void *)v4 + 88))(v4, buf, __p, &v15);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if ((v18 & 0x80000000) == 0)
  {
    if (!v5) {
      goto LABEL_14;
    }
LABEL_8:
    int v6 = v15;
    v7 = qword_100A19E78;
    if (v15 < 1)
    {
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
        sub_100759B0C();
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Warning: Using override value (%d) for max number of connected devices to be cached on disk", buf, 8u);
        int v6 = v15;
      }
      v3->_maxSeenDevices = v6;
    }
    goto LABEL_14;
  }
  operator delete(*(void **)buf);
  if (v5) {
    goto LABEL_8;
  }
LABEL_14:
  uint64_t v8 = sub_100017768();
  sub_10004191C(buf, "LeDeviceCache");
  sub_10004191C(__p, "MaxSeenOnDisk");
  int v9 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, int *))(*(void *)v8 + 88))(v8, buf, __p, &v15);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if (v18 < 0)
  {
    operator delete(*(void **)buf);
    if (!v9) {
      return v3;
    }
  }
  else if (!v9)
  {
    return v3;
  }
  int v10 = v15;
  v11 = qword_100A19E78;
  if (v15 < 1)
  {
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
      sub_100759AA4();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Warning: Using override value (%d) for max number of seen devices to be cached on disk", buf, 8u);
      int v10 = v15;
    }
    v3->_maxConnectedDevices = v10;
  }
  return v3;
}

- (int)_genericExecute:(id)a3 inDatabase:(sqlite3 *)a4
{
  ppStmt = 0;
  id v5 = a3;
  int v6 = sqlite3_prepare_v2(a4, (const char *)[v5 UTF8String], -1, &ppStmt, 0);
  if (v6)
  {
    v7 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v5 UTF8String];
      int v9 = sqlite3_errmsg(a4);
      int v10 = sqlite3_extended_errcode(a4);
      *(_DWORD *)buf = 136315906;
      id v18 = v8;
      __int16 v19 = 1024;
      int v20 = v6;
      __int16 v21 = 2082;
      v22 = v9;
      __int16 v23 = 1024;
      int v24 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to prepare statement \"%s\" with error %d (%{public}s, %d)", buf, 0x22u);
    }
  }
  else
  {
    int v6 = sqlite3_step(ppStmt);
    if (v6 != 101)
    {
      v11 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
      {
        id v13 = [v5 UTF8String];
        char v14 = sqlite3_errmsg(a4);
        int v15 = sqlite3_extended_errcode(a4);
        *(_DWORD *)buf = 136315906;
        id v18 = v13;
        __int16 v19 = 1024;
        int v20 = v6;
        __int16 v21 = 2082;
        v22 = v14;
        __int16 v23 = 1024;
        int v24 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to execute statement \"%s\" with error %d (%{public}s, %d)", buf, 0x22u);
      }
    }
    sqlite3_finalize(ppStmt);
  }

  return v6;
}

- (void)clearAllDatabases
{
  v3 = +[NSString stringWithFormat:@"DELETE FROM %s", "CustomProperties"];
  unsigned int v4 = [(LeDeviceCache *)self _genericExecute:v3 inDatabase:self->_pairedDatabase];
  id v5 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    objc_super v16 = v3;
    __int16 v17 = 1024;
    unsigned int v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Executing %@ on _pairedDatabase devices returned %d", buf, 0x12u);
  }
  unsigned int v6 = [(LeDeviceCache *)self _genericExecute:v3 inDatabase:self->_otherDatabase];
  v7 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    objc_super v16 = v3;
    __int16 v17 = 1024;
    unsigned int v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Executing %@ on _otherDatabase devices returned %d", buf, 0x12u);
  }
  uint64_t v8 = +[NSString stringWithFormat:@"DELETE FROM %s", [(LeDeviceCache *)self tableNameForType:0]];

  int v9 = (void *)v8;
  unsigned int v10 = [(LeDeviceCache *)self _genericExecute:v8 inDatabase:self->_pairedDatabase];
  v11 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    objc_super v16 = v9;
    __int16 v17 = 1024;
    unsigned int v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Executing %@ on _pairedDatabase devices returned %d", buf, 0x12u);
  }
  v12 = +[NSString stringWithFormat:@"DELETE FROM %s", [(LeDeviceCache *)self tableNameForType:1]];

  unsigned int v13 = [(LeDeviceCache *)self _genericExecute:v12 inDatabase:self->_otherDatabase];
  char v14 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    objc_super v16 = v12;
    __int16 v17 = 1024;
    unsigned int v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Executing %@ on _otherDatabase devices returned %d", buf, 0x12u);
  }
}

- (BOOL)initializeDatabases:(LeDeviceCacheEventListener *)a3 queue:(dispatch_queue_s *)a4
{
  self->_listener = a3;
  uint64_t v8 = +[NSFileManager defaultManager];
  int v9 = [(LeDeviceCache *)self databaseContainerURL];
  unsigned int v10 = [v9 path];
  unsigned __int8 v11 = [v8 fileExistsAtPath:v10];

  if ((v11 & 1) == 0)
  {
    v12 = +[NSFileManager defaultManager];
    unsigned int v13 = [(LeDeviceCache *)self databaseContainerURL];
    id v37 = 0;
    unsigned __int8 v14 = [v12 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:&v37];
    id v15 = v37;

    if ((v14 & 1) == 0)
    {
      objc_super v16 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
      {
        v27 = [(LeDeviceCache *)self databaseContainerURL];
        id v28 = [v27 path];
        id v29 = [v28 UTF8String];
        id v30 = [v15 localizedDescription];
        id v31 = [v30 UTF8String];
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = v29;
        __int16 v39 = 2082;
        id v40 = v31;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Could not create directory at path \"%s\" with error %{public}s", buf, 0x16u);
      }
    }
  }
  int out_token = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1003628E4;
  handler[3] = &unk_100997478;
  handler[4] = self;
  uint32_t v17 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, (dispatch_queue_t)a4, handler);
  unsigned int v18 = qword_100A19E78;
  if (v17)
  {
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
      sub_100759BB0();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Successfully registered for MKB first unlock notification", buf, 2u);
  }
  if (![(LeDeviceCache *)self loadDatabase:0])
  {
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
      sub_100759B74((uint64_t)[(LeDeviceCache *)self friendlyNameForType:0], (uint64_t)buf);
    }
    goto LABEL_29;
  }
  LODWORD(__p[0]) = 0;
  if ([(LeDeviceCache *)self readIntFromDatabase:self->_pairedDatabase statement:@"SELECT COUNT() FROM PairedDevices" value:__p])
  {
    __int16 v19 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = __p[0];
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Paired device cache contains %d device(s)", buf, 8u);
    }
  }
  char v34 = 0;
  uint64_t v20 = sub_10003FFD4();
  (*(void (**)(uint64_t, char *))(*(void *)v20 + 104))(v20, &v34);
  if (!v34)
  {
    v22 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = [(LeDeviceCache *)self friendlyNameForType:1];
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Ignoring request to load '%{public}s' cache as we're before first unlock", buf, 0xCu);
    }
    goto LABEL_22;
  }
  if (![(LeDeviceCache *)self loadDatabase:1])
  {
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
      sub_100759B74((uint64_t)[(LeDeviceCache *)self friendlyNameForType:1], (uint64_t)buf);
    }
LABEL_29:
    int v25 = 1;
    goto LABEL_30;
  }
  [(LeDeviceCache *)self updateProtectedCacheMetrics];
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, @"SystemKeybagUnlocked", 0, 0, 1u);
LABEL_22:
  uint64_t v24 = sub_100017768();
  sub_10004191C(buf, "LeDeviceCache");
  sub_10004191C(__p, "WipeNameOrigin");
  (*(void (**)(uint64_t, unsigned char *, void **, void))(*(void *)v24 + 80))(v24, buf, __p, 0);
  if (v33 < 0) {
    operator delete(__p[0]);
  }
  if (v41 < 0) {
    operator delete(*(void **)buf);
  }
  int v25 = 0;
LABEL_30:
  return v25 == 0;
}

- (id)databaseContainerURL
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v9 = 0;
  uint64_t v2 = sub_10003FFD4();
  (*(void (**)(uint64_t, void **))(*(void *)v2 + 168))(v2, __p);
  if (v9 >= 0) {
    v3 = __p;
  }
  else {
    v3 = (void **)__p[0];
  }
  unsigned int v4 = +[NSString stringWithUTF8String:v3];
  id v5 = [v4 stringByAppendingPathComponent:@"/Library/Database"];

  unsigned int v6 = +[NSURL fileURLWithPath:v5 isDirectory:1];
  if (SHIBYTE(v9) < 0) {
    operator delete(__p[0]);
  }

  return v6;
}

- (void)tryLoadProtectedCache
{
  if (!self->_otherDatabase
    && MKBDeviceUnlockedSinceBoot() == 1
    && [(LeDeviceCache *)self loadDatabase:1])
  {
    [(LeDeviceCache *)self updateProtectedCacheMetrics];
  }
}

- (void)removeDevicesDuplicatesOf:(unint64_t)a3 originalUuid:(id)a4
{
  unsigned int v6 = (unsigned __int8 *)a4;
  v7 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
  {
    sub_1006AD3F0();
    uint64_t v8 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    char v33 = v6;
    __int16 v34 = 2114;
    v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Removing duplicates of %{public}@ (%{public}@)", buf, 0x16u);
  }
  int v9 = [(LeDeviceCache *)self duplicatePairedDevicesForAddress:a3 originalUuid:v6];
  if (v9)
  {
    unsigned int v10 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v11 = sub_1006AD3F0();
      sub_100759CD4(v11, v31, v9, v10);
    }
    v12 = [(LeDeviceCache *)self tableNameForType:0];
    unsigned int v13 = [v6 UUIDString];
    unsigned __int8 v14 = sub_1006AD3F0();
    id v15 = sub_1006AD3F0();
    objc_super v16 = +[NSString stringWithFormat:@"SELECT Uuid FROM %s WHERE Uuid != '%@' AND (Address = '%@' OR ResolvedAddress = '%@')", v12, v13, v14, v15];

    ppStmt = 0;
    pairedDatabase = self->_pairedDatabase;
    id v18 = v16;
    if (!sqlite3_prepare_v2(pairedDatabase, (const char *)[v18 UTF8String], -1, &ppStmt, 0))
    {
      while (sqlite3_step(ppStmt) == 100)
      {
        __int16 v19 = sqlite3_column_text(ppStmt, 0);
        if (v19)
        {
          uint64_t v20 = qword_100A19E78;
          if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
          {
            v22 = [(LeDeviceCache *)self friendlyNameForType:0];
            *(_DWORD *)buf = 136315394;
            char v33 = v19;
            __int16 v34 = 2080;
            v35 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Removing stale device \"%s\" from '%s' cache", buf, 0x16u);
          }
          __int16 v21 = +[NSString stringWithUTF8String:v19];
          [(LeDeviceCache *)self removeCustomPropertiesJSONForDeviceUUID:v21 inDatabase:self->_pairedDatabase];
        }
      }
      sqlite3_finalize(ppStmt);
    }
    __int16 v23 = [(LeDeviceCache *)self tableNameForType:0];
    uint64_t v24 = [v6 UUIDString];
    int v25 = sub_1006AD3F0();
    v26 = sub_1006AD3F0();
    v27 = +[NSString stringWithFormat:@"DELETE FROM %s WHERE Uuid != '%@' AND (Address = '%@' OR ResolvedAddress = '%@')", v23, v24, v25, v26];

    id v28 = self->_pairedDatabase;
    id v29 = v27;
    sqlite3_exec(v28, (const char *)[v29 UTF8String], 0, 0, 0);
  }
}

- (void)loadPairedDevice:(id)a3 address:(unint64_t)a4 ifMissing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v8)
  {
    int v9 = [(LeDeviceCache *)self tableNameForType:0];
    unsigned int v10 = [v8 UUIDString];
    unsigned __int8 v11 = +[NSString stringWithFormat:@"SELECT * FROM %s WHERE Uuid = '%@'", v9, v10];
  }
  else
  {
    v12 = [(LeDeviceCache *)self tableNameForType:0];
    unsigned int v10 = sub_1006AD3F0();
    unsigned int v13 = sub_1006AD3F0();
    unsigned __int8 v11 = +[NSString stringWithFormat:@"SELECT * FROM %s WHERE Address = '%@' OR ResolvedAddress = '%@'", v12, v10, v13];
  }
  unsigned __int8 v14 = [(LeDeviceCache *)self readDeviceFromDatabase:self->_pairedDatabase statement:v11];
  otherDatabase = self->_otherDatabase;
  if (!v14)
  {
    if (!otherDatabase) {
      goto LABEL_10;
    }
    objc_super v16 = [(LeDeviceCache *)self tableNameForType:1];
    if (v8)
    {
      uint32_t v17 = [v8 UUIDString];
      +[NSString stringWithFormat:@"SELECT * FROM %s WHERE Uuid = '%@'", v16, v17];
      v11 = id v18 = v11;
    }
    else
    {
      uint32_t v17 = sub_1006AD3F0();
      id v18 = sub_1006AD3F0();
      uint64_t v22 = +[NSString stringWithFormat:@"SELECT * FROM %s WHERE Address = '%@' OR ResolvedAddress = '%@'", v16, v17, v18];

      unsigned __int8 v11 = (void *)v22;
    }

    unsigned __int8 v14 = [(LeDeviceCache *)self readDeviceFromDatabase:self->_otherDatabase statement:v11];
    if (!v14) {
      goto LABEL_17;
    }
LABEL_13:
    uint64_t v20 = v8;
    sub_1006B1588(v14, 1);
    goto LABEL_14;
  }
  if (otherDatabase) {
    goto LABEL_13;
  }
LABEL_10:
  __int16 v19 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = [(LeDeviceCache *)self friendlyNameForType:1];
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Ignoring read as '%{public}s' cache has not been loaded yet", buf, 0xCu);
  }
  if (v14) {
    goto LABEL_13;
  }
LABEL_17:
  __int16 v23 = qword_100A19E78;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
    {
      v26 = sub_1006AD3F0();
      v27 = [(LeDeviceCache *)self friendlyNameForType:0];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&buf[14] = v26;
      __int16 v36 = 2082;
      id v37 = v27;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to load paired device \"%{public}@\" (%{public}@) from '%{public}s' cache", buf, 0x20u);

      __int16 v23 = qword_100A19E78;
      if (v8) {
        goto LABEL_31;
      }
    }
    else if (v8)
    {
      goto LABEL_31;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v28 = sub_1006AD3F0();
      sub_100759DA0(v28, (uint64_t)v34);
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = 0;
    uuid_clear(buf);
    uint64_t v29 = sub_1002284B8(a4);
    int v31 = v29;
    char v33 = BYTE6(v29);
    __int16 v32 = WORD2(v29);
    if (uuid_is_null(buf)) {
      int v30 = 7;
    }
    else {
      int v30 = 0;
    }
    sub_10010D328(buf, (uint64_t)&v31, v30);
    sub_100031234(buf);
    objc_claimAutoreleasedReturnValue();
    __int16 v23 = qword_100A19E78;
LABEL_31:
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      sub_1006AD3F0();
      objc_claimAutoreleasedReturnValue();
      sub_100759D3C();
    }
    operator new();
  }
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = sub_1006AD3F0();
    int v25 = [(LeDeviceCache *)self friendlyNameForType:0];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&unsigned char buf[12] = 2114;
    *(void *)&buf[14] = v24;
    __int16 v36 = 2082;
    id v37 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed to load paired device \"%{public}@\" (%{public}@) from '%{public}s' cache, but thats ok.", buf, 0x20u);
  }
  unsigned __int8 v14 = 0;
  uint64_t v20 = v8;
LABEL_14:
  [(LeDeviceCache *)self removeDevicesDuplicatesOf:a4 originalUuid:v20];

  return v14;
}

- (void)readDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(LeDeviceCache *)self tableNameForType:0];
  unsigned int v6 = [v4 UUIDString];
  v7 = +[NSString stringWithFormat:@"SELECT * FROM %s WHERE Uuid = '%@'", v5, v6];

  id v8 = [(LeDeviceCache *)self readDeviceFromDatabase:self->_pairedDatabase statement:v7];
  int v9 = v8;
  if (v8)
  {
    sub_1006B1588((uint64_t *)v8, 1);
  }
  else
  {
    unsigned int v10 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = (const char *)v4;
      __int16 v19 = 2082;
      uint64_t v20 = [(LeDeviceCache *)self friendlyNameForType:0];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Unable to locate device \"%{public}@\" in '%{public}s' cache", buf, 0x16u);
    }
    if (self->_otherDatabase)
    {
      uint64_t v11 = +[NSString stringWithFormat:@"SELECT * FROM %s WHERE Uuid = '%@'", [(LeDeviceCache *)self tableNameForType:1], v4];

      int v9 = [(LeDeviceCache *)self readDeviceFromDatabase:self->_otherDatabase statement:v11];
      if (!v9)
      {
        v12 = qword_100A19E78;
        if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
        {
          unsigned int v13 = [(LeDeviceCache *)self friendlyNameForType:1];
          *(_DWORD *)buf = 138543618;
          id v18 = (const char *)v4;
          __int16 v19 = 2082;
          uint64_t v20 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Unable to locate device \"%{public}@\" in '%{public}s' cache", buf, 0x16u);
        }
        int v9 = 0;
      }
      v7 = (void *)v11;
    }
    else
    {
      unsigned __int8 v14 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
      {
        id v15 = [(LeDeviceCache *)self friendlyNameForType:1];
        *(_DWORD *)buf = 136446210;
        id v18 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Ignoring read as '%{public}s' cache has not been loaded yet", buf, 0xCu);
      }
      int v9 = 0;
    }
  }

  return v9;
}

- (void)readDeviceByAddress:(unint64_t)a3
{
  id v4 = [(LeDeviceCache *)self tableNameForType:0];
  BOOL v5 = sub_1006AD3F0();
  unsigned int v6 = sub_1006AD3F0();
  v7 = +[NSString stringWithFormat:@"SELECT * FROM %s WHERE Address = '%@' OR ResolvedAddress = '%@'", v4, v5, v6];

  id v8 = [(LeDeviceCache *)self readDeviceFromDatabase:self->_pairedDatabase statement:v7];
  int v9 = v8;
  if (v8)
  {
    sub_1006B1588((uint64_t *)v8, 1);
  }
  else
  {
    unsigned int v10 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
    {
      sub_1006AD3F0();
      uint64_t v11 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v11;
      __int16 v23 = 2082;
      uint64_t v24 = [(LeDeviceCache *)self friendlyNameForType:0];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Unable to locate device address %{public}@ in '%{public}s' cache", buf, 0x16u);
    }
    if (self->_otherDatabase)
    {
      v12 = [(LeDeviceCache *)self tableNameForType:1];
      unsigned int v13 = sub_1006AD3F0();
      uint64_t v14 = +[NSString stringWithFormat:@"SELECT * FROM %s WHERE Address = '%@'", v12, v13];

      int v9 = [(LeDeviceCache *)self readDeviceFromDatabase:self->_otherDatabase statement:v14];
      if (!v9)
      {
        id v15 = qword_100A19E78;
        if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
        {
          sub_1006AD3F0();
          objc_super v16 = (char *)objc_claimAutoreleasedReturnValue();
          uint32_t v17 = [(LeDeviceCache *)self friendlyNameForType:1];
          *(_DWORD *)buf = 138543618;
          uint64_t v22 = v16;
          __int16 v23 = 2082;
          uint64_t v24 = v17;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Unable to locate device address %{public}@ in '%{public}s' cache", buf, 0x16u);
        }
        int v9 = 0;
      }
      v7 = (void *)v14;
    }
    else
    {
      id v18 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
      {
        __int16 v19 = [(LeDeviceCache *)self friendlyNameForType:1];
        *(_DWORD *)buf = 136446210;
        uint64_t v22 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Ignoring read as '%{public}s' cache has not been loaded yet", buf, 0xCu);
      }
      int v9 = 0;
    }
  }

  return v9;
}

- (int)duplicatePairedDevicesForAddress:(unint64_t)a3 originalUuid:(id)a4
{
  id v5 = a4;
  int v12 = 0;
  unsigned int v6 = [(LeDeviceCache *)self tableNameForType:0];
  v7 = [v5 UUIDString];
  id v8 = sub_1006AD3F0();
  int v9 = sub_1006AD3F0();
  unsigned int v10 = +[NSString stringWithFormat:@"SELECT COUNT() FROM %s WHERE Uuid != '%@' AND (Address = '%@' OR ResolvedAddress = '%@')", v6, v7, v8, v9];

  [(LeDeviceCache *)self readIntFromDatabase:self->_pairedDatabase statement:v10 value:&v12];
  LODWORD(self) = v12;

  return (int)self;
}

- (void)writeDevice:(const void *)a3
{
  int v6 = *((unsigned __int8 *)a3 + 160);
  BOOL v7 = *((unsigned char *)a3 + 160) == 0;
  uint64_t v8 = 24;
  if (*((unsigned char *)a3 + 160)) {
    uint64_t v8 = 16;
  }
  v45 = *(Class *)((char *)&self->super.isa + v8);
  int v9 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
  {
    id v10 = *(id *)a3;
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&unsigned char buf[12] = 2082;
    *(void *)&buf[14] = [(LeDeviceCache *)self friendlyNameForType:v7];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Writing device \"%{public}@\" to '%{public}s' cache", buf, 0x16u);
  }
  if (v6 || self->_otherDatabase)
  {
    [(LeDeviceCache *)self removeDevice:a3 internal:1];
    if (!v6) {
      [(LeDeviceCache *)self evictIfNeeded:*((_DWORD *)a3 + 34) != 0];
    }
    if (*((void *)a3 + 24))
    {
      unsigned int v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
      uint64_t v14 = (void *)*((void *)a3 + 22);
      if (v14 != (void *)((char *)a3 + 184))
      {
        do
        {
          id v15 = v14 + 4;
          if (*((char *)v14 + 55) < 0) {
            id v15 = (void *)*v15;
          }
          objc_super v16 = +[NSString stringWithUTF8String:v15];
          [v13 addObject:v16];

          uint32_t v17 = (void *)v14[1];
          if (v17)
          {
            do
            {
              id v18 = v17;
              uint32_t v17 = (void *)*v17;
            }
            while (v17);
          }
          else
          {
            do
            {
              id v18 = (void *)v14[2];
              BOOL v19 = *v18 == (void)v14;
              uint64_t v14 = v18;
            }
            while (!v19);
          }
          uint64_t v14 = v18;
        }
        while (v18 != (void *)((char *)a3 + 184));
      }
      uint64_t v20 = [v13 componentsJoinedByString:@","];
    }
    else
    {
      uint64_t v20 = 0;
    }
    if (v6) {
      uint64_t v21 = 32;
    }
    else {
      uint64_t v21 = 40;
    }
    uint64_t v22 = *(Class *)((char *)&self->super.isa + v21);
    id v23 = *(id *)a3;
    id v24 = [v23 UUIDString];
    sqlite3_bind_text(v22, 1, (const char *)[v24 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    int v25 = *(Class *)((char *)&self->super.isa + v21);
    if (*((char *)a3 + 127) < 0)
    {
      sub_10003B098(buf, *((void **)a3 + 13), *((void *)a3 + 14));
    }
    else
    {
      *(_OWORD *)buf = *(_OWORD *)((char *)a3 + 104);
      *(void *)&buf[16] = *((void *)a3 + 15);
    }
    if (buf[23] >= 0) {
      v26 = buf;
    }
    else {
      v26 = *(const char **)buf;
    }
    sqlite3_bind_text(v25, 2, v26, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    sqlite3_bind_int(*(sqlite3_stmt **)((char *)&self->super.isa + v21), 3, *((_DWORD *)a3 + 32));
    v27 = *(Class *)((char *)&self->super.isa + v21);
    sub_1006AD3F0();
    id v28 = objc_claimAutoreleasedReturnValue();
    sqlite3_bind_text(v27, 4, (const char *)[v28 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    uint64_t v29 = *(Class *)((char *)&self->super.isa + v21);
    uint64_t v30 = *((void *)a3 + 3);
    if (v30)
    {
      sub_1006AD3F0();
      v27 = (sqlite3_stmt *) objc_claimAutoreleasedReturnValue();
      int v31 = (const char *)[(sqlite3_stmt *)v27 UTF8String];
    }
    else
    {
      int v31 = 0;
    }
    sqlite3_bind_text(v29, 5, v31, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (v30) {

    }
    sqlite3_bind_int(*(sqlite3_stmt **)((char *)&self->super.isa + v21), 6, *((_DWORD *)a3 + 33));
    sqlite3_bind_int(*(sqlite3_stmt **)((char *)&self->super.isa + v21), 7, *((_DWORD *)a3 + 34));
    sqlite3_bind_int(*(sqlite3_stmt **)((char *)&self->super.isa + v21), 8, *((unsigned __int8 *)a3 + 162));
    __int16 v32 = *(Class *)((char *)&self->super.isa + v21);
    id v33 = v20;
    sqlite3_bind_text(v32, 9, (const char *)[v33 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    __int16 v34 = *(Class *)((char *)&self->super.isa + v21);
    if (*((char *)a3 + 231) < 0)
    {
      sub_10003B098(buf, *((void **)a3 + 26), *((void *)a3 + 27));
    }
    else
    {
      *(_OWORD *)buf = *((_OWORD *)a3 + 13);
      *(void *)&buf[16] = *((void *)a3 + 28);
    }
    if (buf[23] >= 0) {
      v35 = buf;
    }
    else {
      v35 = *(const char **)buf;
    }
    sqlite3_bind_text(v34, 10, v35, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    int v36 = sqlite3_step(*(sqlite3_stmt **)((char *)&self->super.isa + v21));
    if (v36 == 101)
    {
      [(LeDeviceCache *)self writeCustomPropertiesJSONForDevice:a3 inDatabase:v45];
      if (!v6)
      {
        if (*((_DWORD *)a3 + 34)) {
          [(LeDeviceCache *)self setConnectedDeviceCount:[(LeDeviceCache *)self connectedDeviceCount] + 1];
        }
        else {
          [(LeDeviceCache *)self setSeenDeviceCount:[(LeDeviceCache *)self seenDeviceCount] + 1];
        }
      }
      v42 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
      {
        id v43 = *(id *)a3;
        v44 = [(LeDeviceCache *)self friendlyNameForType:v7];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v43;
        *(_WORD *)&unsigned char buf[12] = 2082;
        *(void *)&buf[14] = v44;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Successfully wrote device \"%{public}@\" into '%{public}s' cache", buf, 0x16u);
      }
    }
    else
    {
      id v37 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
      {
        id v38 = *(id *)a3;
        __int16 v39 = [(LeDeviceCache *)self friendlyNameForType:v7];
        id v40 = sqlite3_errmsg(v45);
        int v41 = sqlite3_extended_errcode(v45);
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&unsigned char buf[12] = 2082;
        *(void *)&buf[14] = v39;
        *(_WORD *)&unsigned char buf[22] = 1024;
        int v47 = v36;
        __int16 v48 = 2082;
        v49 = v40;
        __int16 v50 = 1024;
        int v51 = v41;
        _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to write device \"%{public}@\" into '%{public}s' cache with error %d (%{public}s, %d)", buf, 0x2Cu);
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)((char *)&self->super.isa + v21));
    sqlite3_clear_bindings(*(sqlite3_stmt **)((char *)&self->super.isa + v21));
  }
  else
  {
    uint64_t v11 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
    {
      int v12 = [(LeDeviceCache *)self friendlyNameForType:1];
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Ignoring write as '%{public}s' cache has not been loaded yet", buf, 0xCu);
    }
  }
}

- (void)removeDevice:(const void *)a3 internal:(BOOL)a4
{
  int v38 = 0;
  BOOL v7 = [(LeDeviceCache *)self tableNameForType:0];
  uint64_t v8 = [*(id *)a3 UUIDString];
  +[NSString stringWithFormat:@"SELECT COUNT() FROM %s WHERE Uuid = '%@'", v7, v8];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [(LeDeviceCache *)self readIntFromDatabase:self->_pairedDatabase statement:v9 value:&v38];
  if (v38)
  {
    id v10 = [(LeDeviceCache *)self tableNameForType:0];
    uint64_t v11 = [*(id *)a3 UUIDString];
    int v12 = +[NSString stringWithFormat:@"DELETE FROM %s WHERE Uuid = '%@'", v10, v11];

    pairedDatabase = self->_pairedDatabase;
    id v9 = v12;
    int v14 = sqlite3_exec(pairedDatabase, (const char *)[v9 UTF8String], 0, 0, 0);
    if (!a4 && !v14)
    {
      id v15 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = *(id *)a3;
        uint32_t v17 = [v16 UUIDString];
        id v18 = [(LeDeviceCache *)self friendlyNameForType:0];
        *(_DWORD *)buf = 138543618;
        id v40 = v17;
        __int16 v41 = 2082;
        v42 = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removed device \"%{public}@\" from '%{public}s' cache", buf, 0x16u);
      }
    }
    id v19 = *(id *)a3;
    uint64_t v20 = [v19 UUIDString];
    [(LeDeviceCache *)self removeCustomPropertiesJSONForDeviceUUID:v20 inDatabase:self->_pairedDatabase];

    goto LABEL_24;
  }
  if (self->_otherDatabase)
  {
    int v37 = 0;
    uint64_t v21 = [(LeDeviceCache *)self tableNameForType:1];
    uint64_t v22 = [*(id *)a3 UUIDString];
    id v23 = +[NSString stringWithFormat:@"SELECT LastConnectionTime FROM %s WHERE Uuid = '%@'", v21, v22];

    if ([(LeDeviceCache *)self readIntFromDatabase:self->_otherDatabase statement:v23 value:&v37])
    {
      id v24 = *(id *)a3;
      int v25 = [v24 UUIDString];
      [(LeDeviceCache *)self removeCustomPropertiesJSONForDeviceUUID:v25 inDatabase:self->_otherDatabase];

      v26 = [(LeDeviceCache *)self tableNameForType:1];
      v27 = [*(id *)a3 UUIDString];
      id v28 = +[NSString stringWithFormat:@"DELETE FROM %s WHERE Uuid = '%@'", v26, v27];

      otherDatabase = self->_otherDatabase;
      id v30 = v28;
      if (!sqlite3_exec(otherDatabase, (const char *)[v30 UTF8String], 0, 0, 0))
      {
        if (!a4)
        {
          __int16 v34 = qword_100A19E78;
          if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
          {
            v35 = (char *)*(id *)a3;
            int v36 = [(LeDeviceCache *)self friendlyNameForType:1];
            *(_DWORD *)buf = 138543618;
            id v40 = v35;
            __int16 v41 = 2082;
            v42 = v36;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Removed device \"%{public}@\" from '%{public}s' cache", buf, 0x16u);
          }
        }
        if (v37) {
          [(LeDeviceCache *)self setConnectedDeviceCount:[(LeDeviceCache *)self connectedDeviceCount] - 1];
        }
        else {
          [(LeDeviceCache *)self setSeenDeviceCount:[(LeDeviceCache *)self seenDeviceCount] - 1];
        }
        id v23 = v30;
        goto LABEL_23;
      }
      id v23 = v30;
    }
    if (!a4)
    {
      int v31 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
        sub_100759DEC((void **)a3, v31);
      }
    }
LABEL_23:
    id v9 = v23;
    goto LABEL_24;
  }
  __int16 v32 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
  {
    id v33 = [(LeDeviceCache *)self friendlyNameForType:1];
    *(_DWORD *)buf = 136446210;
    id v40 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Ignoring read as '%{public}s' cache has not been loaded yet", buf, 0xCu);
  }
LABEL_24:
}

- (BOOL)createDatabase:(sqlite3 *)a3 type:(unint64_t)a4 path:(const char *)a5 flags:(int)a6
{
  int v10 = sqlite3_open_v2(a5, a3, a6 | 4, 0);
  if (v10)
  {
    uint64_t v11 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
    {
      unsigned int v13 = [(LeDeviceCache *)self friendlyNameForType:a4];
      int v14 = sqlite3_errmsg(*a3);
      int v15 = sqlite3_extended_errcode(*a3);
      int v16 = 136447234;
      uint32_t v17 = v13;
      __int16 v18 = 2080;
      id v19 = a5;
      __int16 v20 = 1024;
      int v21 = v10;
      __int16 v22 = 2082;
      id v23 = v14;
      __int16 v24 = 1024;
      int v25 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create '%{public}s' cache at \"%s\" with error %d (%{public}s, %d)", (uint8_t *)&v16, 0x2Cu);
    }
    if (*a3)
    {
      sqlite3_close_v2(*a3);
      *a3 = 0;
    }
  }
  else
  {
    [(LeDeviceCache *)self createTablesForDatabase:*a3 type:a4];
  }
  return v10 == 0;
}

- (BOOL)loadDatabase:(unint64_t)a3
{
  v92 = +[NSFileManager defaultManager];
  if (a3)
  {
    id v5 = [(LeDeviceCache *)self databaseContainerURL];
    int v6 = [v5 URLByAppendingPathComponent:@"com.apple.MobileBluetooth.ledevices.other.db"];

    id v7 = [v6 path];
    uint64_t v8 = (const std::__fs::filesystem::path *)[v7 UTF8String];

    id v9 = [v6 path];
    p_otherDatabase = &self->_otherDatabase;
    ppStmt = &self->_writeOtherDeviceStmt;
    if ([v92 fileExistsAtPath:v9])
    {
      uint64_t v11 = 3145730;
    }
    else
    {
      unsigned int v15 = [v92 fileExistsAtPath:@"/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db"];
      uint64_t v11 = 3145730;

      if (v15)
      {
        int v16 = qword_100A19E78;
        if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [v6 path];
          buf.st_dev = 136315394;
          *(void *)&buf.st_mode = "/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db";
          WORD2(buf.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)[v17 UTF8String];
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Moving LE database from %s to %s", (uint8_t *)&buf, 0x16u);
        }
        chmod("/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db", 0x1B6u);
        __int16 v18 = [v6 path];
        id v97 = 0;
        unsigned int v19 = [v92 copyItemAtPath:@"/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db" toPath:v18 error:&v97];
        id v20 = v97;

        if (v19)
        {
          [v92 removeItemAtPath:@"/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db" error:0];
        }
        else
        {
          v27 = qword_100A19E78;
          if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
          {
            id v82 = [v20 localizedDescription];
            id v83 = [v82 UTF8String];
            buf.st_dev = 136446210;
            *(void *)&buf.st_mode = v83;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to move old database to new path: %{public}s", (uint8_t *)&buf, 0xCu);
          }
        }
      }
    }
  }
  else
  {
    int v12 = [(LeDeviceCache *)self databaseContainerURL];
    int v6 = [v12 URLByAppendingPathComponent:@"com.apple.MobileBluetooth.ledevices.paired.db"];

    id v13 = [v6 path];
    uint64_t v8 = (const std::__fs::filesystem::path *)[v13 UTF8String];

    int v14 = [v6 path];
    p_otherDatabase = &self->_pairedDatabase;
    ppStmt = &self->_writePairedDeviceStmt;
    if ([v92 fileExistsAtPath:v14])
    {
    }
    else
    {
      unsigned int v21 = [v92 fileExistsAtPath:@"/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.paired.db"];

      if (!v21)
      {
        uint64_t v11 = 4194306;
        goto LABEL_24;
      }
      __int16 v22 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [v6 path];
        buf.st_dev = 136315394;
        *(void *)&buf.st_mode = "/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.paired.db";
        WORD2(buf.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)[v23 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Moving LE database from %s to %s", (uint8_t *)&buf, 0x16u);
      }
      chmod("/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.paired.db", 0x1B6u);
      __int16 v24 = [v6 path];
      id v98 = 0;
      unsigned int v25 = [v92 copyItemAtPath:@"/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.paired.db" toPath:v24 error:&v98];
      id v26 = v98;

      if (v25)
      {
        [v92 removeItemAtPath:@"/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.paired.db" error:0];
      }
      else
      {
        id v28 = qword_100A19E78;
        if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
        {
          id v84 = [v26 localizedDescription];
          id v85 = [v84 UTF8String];
          buf.st_dev = 136446210;
          *(void *)&buf.st_mode = v85;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to move old database to new path: %{public}s", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    uint64_t v11 = 4194306;
  }
LABEL_24:
  uint64_t v29 = +[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.apple.MobileBluetooth.ledevices.plist"];
  int v96 = v29 != 0;
  memset(&buf, 0, sizeof(buf));
  if (!stat((const char *)v8, &buf))
  {
    if (v96 == 1 && os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_FAULT)) {
      sub_100759F54();
    }
    int v30 = sqlite3_open_v2((const char *)v8, p_otherDatabase, v11, 0);
    if (v30)
    {
      int v31 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
      {
        __int16 v32 = [(LeDeviceCache *)self friendlyNameForType:a3];
        *(_DWORD *)v99 = 136446722;
        *(void *)&v99[4] = v32;
        *(_WORD *)&v99[12] = 2080;
        *(void *)&v99[14] = v8;
        *(_WORD *)&v99[22] = 1024;
        *(_DWORD *)&v99[24] = v30;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to open '%{public}s' cache at \"%s\", result is %d", v99, 0x1Cu);
      }
    }
    else
    {
      v89 = objc_opt_new();
      [v89 setDateFormat:@"HH:mm:ss_MM-dd-yyyy"];
      if ([(LeDeviceCache *)self readIntFromDatabase:*p_otherDatabase statement:@"SELECT value FROM _SqliteDatabaseProperties WHERE key = '_ClientVersion'" value:&v96])
      {
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT COUNT() FROM sqlite_master WHERE type='table' AND name='%s';",
        uint64_t v33 = [(LeDeviceCache *)self tableNameForType:a3]);
        v102[0] = 0;
        v88 = (void *)v33;
        unsigned __int8 v34 = [(LeDeviceCache *)self readIntFromDatabase:*p_otherDatabase statement:v33 value:v102];
        if (v102[0]) {
          unsigned __int8 v35 = v34;
        }
        else {
          unsigned __int8 v35 = 0;
        }
        if (v35)
        {
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"CREATE INDEX IF NOT EXISTS UuidIndex ON %s(Uuid);",
          int v36 = [(LeDeviceCache *)self tableNameForType:a3]);
          int v37 = *p_otherDatabase;
          id v87 = v36;
          int v38 = sqlite3_exec(v37, (const char *)[v87 UTF8String], 0, 0, 0);
          __int16 v39 = qword_100A19E78;
          if (v38)
          {
            if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
            {
              id v40 = sqlite3_errmsg(*p_otherDatabase);
              int v41 = sqlite3_extended_errcode(*p_otherDatabase);
              *(_DWORD *)v99 = 67109634;
              *(_DWORD *)&v99[4] = v38;
              *(_WORD *)&v99[8] = 2080;
              *(void *)&v99[10] = v40;
              *(_WORD *)&v99[18] = 1024;
              *(_DWORD *)&v99[20] = v41;
              _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to create Uuid index with error %d (%s, %d)", v99, 0x18u);
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
            {
              v52 = [(LeDeviceCache *)self friendlyNameForType:a3];
              *(_DWORD *)v99 = 136446210;
              *(void *)&v99[4] = v52;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Created index for '%{public}s'", v99, 0xCu);
            }
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"CREATE TABLE IF NOT EXISTS %s (%s TEXT, %s TEXT, UNIQUE(%s));CREATE INDEX IF NOT EXISTS %s ON %s (%s);",
              "CustomProperties",
              "Uuid",
              "JSON",
              "Uuid",
              "CustomPropertiesIndex",
              "CustomProperties",
            v53 = "Uuid");
            v54 = *p_otherDatabase;
            id v86 = v53;
            v55 = v86;
            int v56 = sqlite3_exec(v54, (const char *)[v86 UTF8String], 0, 0, 0);
            v57 = qword_100A19E78;
            if (v56)
            {
              if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
              {
                v58 = sqlite3_errmsg(*p_otherDatabase);
                int v59 = sqlite3_extended_errcode(*p_otherDatabase);
                *(_DWORD *)v99 = 67109634;
                *(_DWORD *)&v99[4] = v56;
                *(_WORD *)&v99[8] = 2080;
                *(void *)&v99[10] = v58;
                *(_WORD *)&v99[18] = 1024;
                *(_DWORD *)&v99[20] = v59;
                _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Failed to create CustomProperties table and index with error %d (%s, %d)", v99, 0x18u);
                v55 = v86;
              }
            }
            else if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
            {
              v60 = [(LeDeviceCache *)self friendlyNameForType:a3];
              *(_DWORD *)v99 = 136446210;
              *(void *)&v99[4] = v60;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "Verified CustomProperties table is ready and indexed for '%{public}s'", v99, 0xCu);
            }
          }
        }
        else
        {
          int v47 = +[NSDate date];
          __int16 v48 = [v89 stringFromDate:v47];
          id v49 = +[NSString stringWithFormat:@"%s.%@.corrupt", v8, v48];
          __int16 v50 = (const std::__fs::filesystem::path *)[v49 UTF8String];
          rename(v8, v50, v51);

          if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_FAULT))
          {
            [(LeDeviceCache *)self friendlyNameForType:a3];
            sub_100759EE4();
          }
          int v96 = 0;
          sqlite3_close_v2(*p_otherDatabase);
          *p_otherDatabase = 0;
        }
      }
      else
      {
        v42 = +[NSDate date];
        id v43 = [v89 stringFromDate:v42];
        id v44 = +[NSString stringWithFormat:@"%s.%@.corrupt", v8, v43];
        v45 = (const std::__fs::filesystem::path *)[v44 UTF8String];
        rename(v8, v45, v46);

        if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_FAULT))
        {
          [(LeDeviceCache *)self friendlyNameForType:a3];
          sub_100759F1C();
        }
        sqlite3_close_v2(*p_otherDatabase);
        *p_otherDatabase = 0;
      }
    }
  }
  if (!v96)
  {
    v65 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
    {
      v66 = [(LeDeviceCache *)self friendlyNameForType:a3];
      *(_DWORD *)v99 = 136446210;
      *(void *)&v99[4] = v66;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Current '%{public}s' cache version is: none", v99, 0xCu);
    }
    if ([(LeDeviceCache *)self createDatabase:p_otherDatabase type:a3 path:v8 flags:v11])
    {
      goto LABEL_71;
    }
    goto LABEL_68;
  }
  if (v96 != 1)
  {
    if (v96 == 2)
    {
      v61 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
      {
        v62 = [(LeDeviceCache *)self friendlyNameForType:a3];
        *(_DWORD *)v99 = 136446466;
        *(void *)&v99[4] = v62;
        *(_WORD *)&v99[12] = 1024;
        *(_DWORD *)&v99[14] = v96;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Current '%{public}s' cache version is: up-to-date (v%d)", v99, 0x12u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_FAULT))
    {
      [(LeDeviceCache *)self friendlyNameForType:a3];
      sub_100759E80();
    }
    goto LABEL_71;
  }
  v63 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
  {
    v64 = [(LeDeviceCache *)self friendlyNameForType:a3];
    *(_DWORD *)v99 = 136446210;
    *(void *)&v99[4] = v64;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Current '%{public}s' cache version is: legacy plist", v99, 0xCu);
  }
  if (![(LeDeviceCache *)self createDatabase:p_otherDatabase type:a3 path:v8 flags:v11])
  {
LABEL_68:
    BOOL v67 = 0;
    goto LABEL_92;
  }
  [(LeDeviceCache *)self migratePlistData:v29 database:*p_otherDatabase type:a3];
LABEL_71:
  if (*p_otherDatabase)
  {
    sqlite3_extended_result_codes(*p_otherDatabase, 1);
    sqlite3_exec(*p_otherDatabase, "PRAGMA journal_mode = 'wal'", 0, 0, 0);
  }
  v68 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
  {
    v69 = [(LeDeviceCache *)self friendlyNameForType:a3];
    *(_DWORD *)v99 = 136446210;
    *(void *)&v99[4] = v69;
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Successfully loaded '%{public}s' cache from disk", v99, 0xCu);
  }
  v70 = +[NSString stringWithFormat:@"INSERT INTO %s (Uuid, Name, NameOrigin, Address, ResolvedAddress, LastSeenTime, LastConnectionTime, GATTServiceChangeConfig, Tags, iCloudIdentifier) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10)", [(LeDeviceCache *)self tableNameForType:a3]];
  v71 = *p_otherDatabase;
  id v72 = v70;
  int v73 = sqlite3_prepare_v2(v71, (const char *)[v72 UTF8String], -1, ppStmt, 0);
  if (v73)
  {
    v74 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
    {
      ppStmta = [(LeDeviceCache *)self friendlyNameForType:a3];
      v80 = sqlite3_errmsg(*p_otherDatabase);
      int v81 = sqlite3_extended_errcode(*p_otherDatabase);
      *(_DWORD *)v99 = 136446978;
      *(void *)&v99[4] = ppStmta;
      *(_WORD *)&v99[12] = 1024;
      *(_DWORD *)&v99[14] = v73;
      *(_WORD *)&v99[18] = 2082;
      *(void *)&v99[20] = v80;
      __int16 v100 = 1024;
      int v101 = v81;
      _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "Failed to create prepared write statement for '%{public}s' cache with error %d (%{public}s, %d)", v99, 0x22u);
    }
  }
  char v95 = 0;
  uint64_t v75 = sub_100017768();
  sub_10004191C(v99, "LeDeviceCache");
  sub_10004191C(__p, "WipeNameOrigin");
  (*(void (**)(uint64_t, unsigned char *, void **, char *))(*(void *)v75 + 72))(v75, v99, __p, &v95);
  if (v94 < 0) {
    operator delete(__p[0]);
  }
  if ((v99[23] & 0x80000000) != 0) {
    operator delete(*(void **)v99);
  }
  if (qword_1009F8158 != -1) {
    dispatch_once(&qword_1009F8158, &stru_1009A93F0);
  }
  int v76 = sub_1004FA2D0((uint64_t)off_1009F8150);
  if (v95) {
    int v77 = 1;
  }
  else {
    int v77 = v76;
  }
  if (v77 == 1)
  {
    v78 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v99 = 0;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "LeDeviceCache Wipe Name Origin for all LE devices", v99, 2u);
    }
    [(LeDeviceCache *)self wipeDatabaseNameOrigin:a3];
  }

  BOOL v67 = 1;
LABEL_92:

  return v67;
}

- (void)createTablesForDatabase:(sqlite3 *)a3 type:(unint64_t)a4
{
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"DROP TABLE IF EXISTS _SqliteDatabaseProperties;CREATE TABLE _SqliteDatabaseProperties(key TEXT, value TEXT, UNIQUE(key));INSERT INTO _SqliteDatabaseProperties (key, value) VALUES ('_ClientVersion', %d);DROP TABLE IF EXISTS %s;CREATE TABLE %s(Uuid TEXT, Name TEXT, NameOrigin INT, Address TEXT, ResolvedAddress TEXT, LastSeenTime INT, LastConnectionTime INT, GATTServiceChangeConfig INT, Tags TEXT, iCloudIdentifier TEXT);DROP INDEX IF EXISTS %s;DROP TABLE IF EXISTS %s;CREATE TABLE %s (%s TEXT, %s TEXT, UNIQUE(%s));CREATE INDEX IF NOT EXISTS %s ON %s (%s);",
    2,
    [(LeDeviceCache *)self tableNameForType:a4],
    [(LeDeviceCache *)self tableNameForType:a4],
    "CustomPropertiesIndex",
    "CustomProperties",
    "CustomProperties",
    "Uuid",
    "JSON",
    "Uuid",
    "CustomPropertiesIndex",
    "CustomProperties",
  id v7 = "Uuid");
  uint64_t v8 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136446210;
    *(void *)unsigned int v15 = [(LeDeviceCache *)self friendlyNameForType:a4];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating new '%{public}s' cache", buf, 0xCu);
  }
  id v9 = v7;
  int v10 = sqlite3_exec(a3, (const char *)[v9 UTF8String], 0, 0, 0);
  if (v10)
  {
    uint64_t v11 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
    {
      int v12 = sqlite3_errmsg(a3);
      int v13 = sqlite3_extended_errcode(a3);
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)unsigned int v15 = v10;
      *(_WORD *)&v15[4] = 2082;
      *(void *)&v15[6] = v12;
      __int16 v16 = 1024;
      int v17 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create tables with error %d (%{public}s, %d)", buf, 0x18u);
    }
  }
}

- (void)migratePlistData:(id)a3 database:(sqlite3 *)a4 type:(unint64_t)a5
{
  id v67 = a3;
  int v6 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136446210;
    *(void *)int v77 = [(LeDeviceCache *)self friendlyNameForType:a5];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Migrating '%{public}s' cache from legacy plist", buf, 0xCu);
  }
  int v7 = sqlite3_exec(a4, "CREATE TABLE Temp(Uuid TEXT, Name TEXT, NameOrigin INT, Address TEXT, ResolvedAddress TEXT, LastSeenTime INT, LastConnectionTime INT, GATTServiceChangeConfig INT, Tags TEXT, iCloudIdentifier TEXT)", 0, 0, 0);
  if (v7)
  {
    uint64_t v8 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
    {
      v57 = sqlite3_errmsg(a4);
      int v58 = sqlite3_extended_errcode(a4);
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)int v77 = v7;
      *(_WORD *)&v77[4] = 2082;
      *(void *)&v77[6] = v57;
      *(_WORD *)&v77[14] = 1024;
      *(_DWORD *)&v77[16] = v58;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to create temporary table with error %d (%{public}s, %d)", buf, 0x18u);
    }
  }
  id v9 = +[NSString stringWithUTF8String:[(LeDeviceCache *)self tableNameForType:a5]];
  id v72 = [v67 objectForKeyedSubscript:v9];

  v71 = [v72 keyEnumerator];
  ppStmt = 0;
  int v10 = sqlite3_prepare_v2(a4, "INSERT INTO Temp (Uuid, Name, NameOrigin, Address, ResolvedAddress, LastSeenTime, LastConnectionTime, GATTServiceChangeConfig, Tags, iCloudIdentifier) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10)", -1, &ppStmt, 0);
  db = a4;
  if (v10)
  {
    uint64_t v11 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
    {
      int v12 = sqlite3_errmsg(a4);
      int v13 = sqlite3_extended_errcode(a4);
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)int v77 = v10;
      *(_WORD *)&v77[4] = 2082;
      *(void *)&v77[6] = v12;
      *(_WORD *)&v77[14] = 1024;
      *(_DWORD *)&v77[16] = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create prepared write statement for temporary cache with error %d (%{public}s, %d)", buf, 0x18u);
    }
  }
  else
  {
    while (1)
    {
      int v14 = [v71 nextObject];
      if (!v14) {
        break;
      }
      id v15 = v14;
      __int16 v16 = [v72 objectForKeyedSubscript:v15];
      int v17 = ppStmt;
      id v18 = v15;
      sqlite3_bind_text(v17, 1, (const char *)[v18 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      unsigned int v19 = ppStmt;
      id v20 = [v16 objectForKeyedSubscript:@"Name"];
      sqlite3_bind_text(v19, 2, (const char *)[v20 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      unsigned int v21 = ppStmt;
      __int16 v22 = [v16 objectForKeyedSubscript:@"NameOrigin"];
      sqlite3_bind_int(v21, 3, (int)[v22 intValue]);

      id v23 = ppStmt;
      id v24 = [v16 objectForKeyedSubscript:@"Address"];
      sqlite3_bind_text(v23, 4, (const char *)[v24 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      unsigned int v25 = ppStmt;
      id v26 = [v16 objectForKeyedSubscript:@"ResolvedAddress"];
      sqlite3_bind_text(v25, 5, (const char *)[v26 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      v27 = ppStmt;
      id v28 = [v16 objectForKeyedSubscript:@"LastSeenTime"];
      sqlite3_bind_int(v27, 6, (int)[v28 intValue]);

      uint64_t v29 = ppStmt;
      int v30 = [v16 objectForKeyedSubscript:@"LastConnectionTime"];
      sqlite3_bind_int(v29, 7, (int)[v30 intValue]);

      int v31 = ppStmt;
      __int16 v32 = [v16 objectForKeyedSubscript:@"GATTServiceChangeConfig"];
      sqlite3_bind_int(v31, 8, (int)[v32 intValue]);

      uint64_t v33 = ppStmt;
      unsigned __int8 v34 = [v16 objectForKeyedSubscript:@"Tags"];
      id v35 = [v34 componentsJoinedByString:@","];
      sqlite3_bind_text(v33, 9, (const char *)[v35 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      int v36 = ppStmt;
      id v37 = [v16 objectForKeyedSubscript:@"iCloudIdentifier"];
      sqlite3_bind_text(v36, 10, (const char *)[v37 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      int v38 = sqlite3_step(ppStmt);
      if (v38 != 101)
      {
        __int16 v39 = qword_100A19E78;
        if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
        {
          id v40 = [v18 UTF8String];
          int v41 = sqlite3_errmsg(db);
          int v42 = sqlite3_extended_errcode(db);
          *(_DWORD *)stat buf = 136446978;
          *(void *)int v77 = v40;
          *(_WORD *)&v77[8] = 1024;
          *(_DWORD *)&v77[10] = v38;
          *(_WORD *)&v77[14] = 2082;
          *(void *)&v77[16] = v41;
          __int16 v78 = 1024;
          int v79 = v42;
          _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to migrate device \"%{public}s\" with error %d (%{public}s, %d)", buf, 0x22u);
        }
      }
      sqlite3_reset(ppStmt);
      sqlite3_clear_bindings(ppStmt);
    }
    sqlite3_finalize(ppStmt);
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"INSERT INTO %s SELECT * FROM Temp ORDER BY LastConnectionTime,LastSeenTime ASC; DROP TABLE Temp",
    [(LeDeviceCache *)self tableNameForType:a5]);
  id v43 = objc_claimAutoreleasedReturnValue();
  int v44 = sqlite3_exec(db, (const char *)[v43 UTF8String], 0, 0, 0);
  if (v44)
  {
    v45 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
    {
      int v59 = sqlite3_errmsg(db);
      int v60 = sqlite3_extended_errcode(db);
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)int v77 = v44;
      *(_WORD *)&v77[4] = 2082;
      *(void *)&v77[6] = v59;
      *(_WORD *)&v77[14] = 1024;
      *(_DWORD *)&v77[16] = v60;
      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to insert from temporary table with error %d (%{public}s, %d)", buf, 0x18u);
    }
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"UPDATE %s SET LastSeenTime = ROWID WHERE LastSeenTime > 0; UPDATE %s SET LastConnectionTime = ROWID WHERE LastConnectionTime > 0",
    [(LeDeviceCache *)self tableNameForType:a5],
  v46 = [(LeDeviceCache *)self tableNameForType:a5]);

  id v47 = v46;
  int v48 = sqlite3_exec(db, (const char *)[v47 UTF8String], 0, 0, 0);
  if (v48)
  {
    id v49 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
    {
      v61 = sqlite3_errmsg(db);
      int v62 = sqlite3_extended_errcode(db);
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)int v77 = v48;
      *(_WORD *)&v77[4] = 2082;
      *(void *)&v77[6] = v61;
      *(_WORD *)&v77[14] = 1024;
      *(_DWORD *)&v77[16] = v62;
      _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Failed to update from temporary table with error %d (%{public}s, %d)", buf, 0x18u);
    }
  }
  if (a5 == 1)
  {
    __int16 v50 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 136315394;
      *(void *)int v77 = "/var/mobile/Library/Preferences/com.apple.MobileBluetooth.ledevices.plist";
      *(_WORD *)&v77[8] = 2080;
      *(void *)&v77[10] = "/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.plist";
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "Backing up legacy plist from \"%s\" to \"%s\"", buf, 0x16u);
    }
    int v51 = +[NSFileManager defaultManager];
    id v74 = 0;
    [v51 copyItemAtPath:@"/var/mobile/Library/Preferences/com.apple.MobileBluetooth.ledevices.plist" toPath:@"/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.plist" error:&v74];
    id v52 = v74;

    if (v52)
    {
      v53 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
      {
        id v63 = [v52 localizedDescription];
        id v64 = [v63 UTF8String];
        *(_DWORD *)stat buf = 136446210;
        *(void *)int v77 = v64;
        _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Failed to backup legacy plist with error %{public}s", buf, 0xCu);
      }
    }

    v54 = +[NSFileManager defaultManager];
    id v73 = 0;
    [v54 removeItemAtPath:@"/var/mobile/Library/Preferences/com.apple.MobileBluetooth.ledevices.plist" error:&v73];
    id v55 = v73;

    if (v55)
    {
      int v56 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
      {
        id v65 = [v55 localizedDescription];
        id v66 = [v65 UTF8String];
        *(_DWORD *)stat buf = 136446210;
        *(void *)int v77 = v66;
        _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to clean up legacy plist with error %{public}s", buf, 0xCu);
      }
    }
  }
}

- (void)wipeDatabaseNameOrigin:(unint64_t)a3
{
  id v5 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = "Other";
    if (!a3) {
      int v6 = "Paired";
    }
    *(_DWORD *)stat buf = 136446210;
    *(void *)id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wipe Name Origin of %{public}s LE Device Database", buf, 0xCu);
  }
  uint64_t v7 = 24;
  if (!a3) {
    uint64_t v7 = 16;
  }
  uint64_t v8 = *(Class *)((char *)&self->super.isa + v7);
  if (v8)
  {
    +[NSString stringWithFormat:@"UPDATE %s SET NameOrigin = %d WHERE iCloudIdentifier = ''", [(LeDeviceCache *)self tableNameForType:a3], 1];
    id v9 = objc_claimAutoreleasedReturnValue();
    int v10 = sqlite3_exec(v8, (const char *)[v9 UTF8String], 0, 0, 0);
    if (v10)
    {
      uint64_t v11 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
      {
        int v12 = sqlite3_errmsg(v8);
        int v13 = sqlite3_extended_errcode(v8);
        *(_DWORD *)stat buf = 67109634;
        *(_DWORD *)id v15 = v10;
        *(_WORD *)&v15[4] = 2082;
        *(void *)&v15[6] = v12;
        __int16 v16 = 1024;
        int v17 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to wipe name origin column of the table with error %d (%{public}s, %d)", buf, 0x18u);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
  {
    sub_100759F88();
  }
}

- (void)updateProtectedCacheMetrics
{
  uint64_t v11 = 0;
  if (![(LeDeviceCache *)self readIntFromDatabase:self->_otherDatabase statement:@"SELECT COUNT() FROM OtherDevices WHERE LastSeenTime > 0 AND LastConnectionTime = 0" value:&self->_seenDeviceCount]&& os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
  {
    sub_10075A024();
  }
  if (![(LeDeviceCache *)self readIntFromDatabase:self->_otherDatabase statement:@"SELECT COUNT() FROM OtherDevices WHERE LastConnectionTime > 0" value:&self->_connectedDeviceCount]&& os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
  {
    sub_100759FF0();
  }
  if (![(LeDeviceCache *)self readIntFromDatabase:self->_otherDatabase statement:@"SELECT MAX(LastSeenTime) FROM OtherDevices" value:(char *)&v11 + 4]&& os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
  {
    sub_100759FBC();
  }
  unsigned __int8 v3 = [(LeDeviceCache *)self readIntFromDatabase:self->_otherDatabase statement:@"SELECT MAX(LastConnectionTime) FROM OtherDevices" value:&v11];
  id v4 = qword_100A19E78;
  if ((v3 & 1) == 0 && os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)stat buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to find the maximum last connected time", buf, 2u);
    id v4 = qword_100A19E78;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(LeDeviceCache *)self connectedDeviceCount];
    unsigned int v6 = [(LeDeviceCache *)self seenDeviceCount];
    *(_DWORD *)stat buf = 67109376;
    unsigned int v13 = v5;
    __int16 v14 = 1024;
    unsigned int v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unpaired device cache contains %d connected device(s) and %d seen device(s)", buf, 0xEu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100366C64;
  block[3] = &unk_100998A38;
  block[4] = self;
  int v9 = HIDWORD(v11);
  int v10 = v11;
  dispatch_async(global_queue, block);
}

- (const)tableNameForType:(unint64_t)a3
{
  if (a3) {
    return "OtherDevices";
  }
  else {
    return "PairedDevices";
  }
}

- (const)friendlyNameForType:(unint64_t)a3
{
  if (a3) {
    return "other devices";
  }
  else {
    return "paired devices";
  }
}

- (BOOL)readIntFromDatabase:(sqlite3 *)a3 statement:(id)a4 value:(int *)a5
{
  ppStmt = 0;
  id v7 = a4;
  if (sqlite3_prepare_v2(a3, (const char *)[v7 UTF8String], -1, &ppStmt, 0))
  {
    BOOL v8 = 0;
  }
  else
  {
    int v9 = sqlite3_step(ppStmt);
    BOOL v8 = v9 == 100;
    if (v9 == 100) {
      *a5 = sqlite3_column_int(ppStmt, 0);
    }
    sqlite3_finalize(ppStmt);
  }

  return v8;
}

- (vector<std::string,)findUUIDsWithCustomProperties:(LeDeviceCache *)self
{
  id v6 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  id v7 = +[NSString stringWithFormat:@"SELECT * FROM %s", "CustomProperties"];
  ppStmt = 0;
  otherDatabase = self->_otherDatabase;
  id v56 = v7;
  if (!sqlite3_prepare_v2(otherDatabase, (const char *)[v56 UTF8String], -1, &ppStmt, 0))
  {
    while (sqlite3_step(ppStmt) == 100)
    {
      int v12 = sqlite3_column_text(ppStmt, 0);
      unsigned int v13 = sqlite3_column_text(ppStmt, 1);
      if (v13 && v12)
      {
        __int16 v14 = +[NSString stringWithUTF8String:v13];
        unsigned int v15 = +[NSString stringWithUTF8String:v12];
        if ([(LeDeviceCache *)self json:v14 hasAnyProperty:v6])
        {
          sub_10004191C(__p, (char *)[v15 UTF8String]);
          var1 = (char *)retstr->var1;
          var0 = (char *)retstr->var2.var0;
          if (var1 >= var0)
          {
            unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((var1 - (char *)retstr->var0) >> 3);
            unint64_t v20 = v19 + 1;
            if (v19 + 1 > 0xAAAAAAAAAAAAAAALL) {
              abort();
            }
            unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((var0 - (char *)retstr->var0) >> 3);
            if (2 * v21 > v20) {
              unint64_t v20 = 2 * v21;
            }
            if (v21 >= 0x555555555555555) {
              unint64_t v22 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v22 = v20;
            }
            p_var2 = &retstr->var2;
            if (v22) {
              id v23 = (char *)sub_1002B3440((uint64_t)&retstr->var2, v22);
            }
            else {
              id v23 = 0;
            }
            id v24 = &v23[24 * v19];
            long long v25 = *(_OWORD *)__p;
            *((void *)v24 + 2) = v58;
            *(_OWORD *)id v24 = v25;
            __p[1] = 0;
            uint64_t v58 = 0;
            __p[0] = 0;
            v27 = (char *)retstr->var0;
            id v26 = (char *)retstr->var1;
            if (v26 == retstr->var0)
            {
              int64x2_t v30 = vdupq_n_s64((unint64_t)v26);
              id v28 = &v23[24 * v19];
            }
            else
            {
              id v28 = &v23[24 * v19];
              do
              {
                long long v29 = *(_OWORD *)(v26 - 24);
                *((void *)v28 - 1) = *((void *)v26 - 1);
                *(_OWORD *)(v28 - 24) = v29;
                v28 -= 24;
                *((void *)v26 - 2) = 0;
                *((void *)v26 - 1) = 0;
                *((void *)v26 - 3) = 0;
                v26 -= 24;
              }
              while (v26 != v27);
              int64x2_t v30 = *(int64x2_t *)&retstr->var0;
            }
            int v31 = v24 + 24;
            retstr->var0 = v28;
            retstr->var1 = v24 + 24;
            int64x2_t v61 = v30;
            __int16 v32 = retstr->var2.var0;
            retstr->var2.var0 = &v23[24 * v22];
            int v62 = v32;
            uint64_t v60 = v30.i64[0];
            sub_1002B4440((uint64_t)&v60);
            int v33 = SHIBYTE(v58);
            retstr->var1 = v31;
            if (v33 < 0) {
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v18 = *(_OWORD *)__p;
            *((void *)var1 + 2) = v58;
            *(_OWORD *)var1 = v18;
            retstr->var1 = var1 + 24;
          }
        }
      }
    }
  }
  pairedDatabase = self->_pairedDatabase;
  id v10 = v56;
  if (!sqlite3_prepare_v2(pairedDatabase, (const char *)[v10 UTF8String], -1, &ppStmt, 0))
  {
    while (sqlite3_step(ppStmt) == 100)
    {
      unsigned __int8 v34 = sqlite3_column_text(ppStmt, 0);
      id v35 = sqlite3_column_text(ppStmt, 1);
      if (v35 && v34)
      {
        int v36 = +[NSString stringWithUTF8String:v35];
        id v37 = +[NSString stringWithUTF8String:v34];
        if ([(LeDeviceCache *)self json:v36 hasAnyProperty:v6])
        {
          sub_10004191C(__p, (char *)[v37 UTF8String]);
          __int16 v39 = (char *)retstr->var1;
          int v38 = (char *)retstr->var2.var0;
          if (v39 >= v38)
          {
            unint64_t v41 = 0xAAAAAAAAAAAAAAABLL * ((v39 - (char *)retstr->var0) >> 3);
            unint64_t v42 = v41 + 1;
            if (v41 + 1 > 0xAAAAAAAAAAAAAAALL) {
              abort();
            }
            unint64_t v43 = 0xAAAAAAAAAAAAAAABLL * ((v38 - (char *)retstr->var0) >> 3);
            if (2 * v43 > v42) {
              unint64_t v42 = 2 * v43;
            }
            if (v43 >= 0x555555555555555) {
              unint64_t v44 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v44 = v42;
            }
            p_var2 = &retstr->var2;
            if (v44) {
              v45 = (char *)sub_1002B3440((uint64_t)&retstr->var2, v44);
            }
            else {
              v45 = 0;
            }
            v46 = &v45[24 * v41];
            long long v47 = *(_OWORD *)__p;
            *((void *)v46 + 2) = v58;
            *(_OWORD *)v46 = v47;
            __p[1] = 0;
            uint64_t v58 = 0;
            __p[0] = 0;
            id v49 = (char *)retstr->var0;
            int v48 = (char *)retstr->var1;
            if (v48 == retstr->var0)
            {
              int64x2_t v52 = vdupq_n_s64((unint64_t)v48);
              __int16 v50 = &v45[24 * v41];
            }
            else
            {
              __int16 v50 = &v45[24 * v41];
              do
              {
                long long v51 = *(_OWORD *)(v48 - 24);
                *((void *)v50 - 1) = *((void *)v48 - 1);
                *(_OWORD *)(v50 - 24) = v51;
                v50 -= 24;
                *((void *)v48 - 2) = 0;
                *((void *)v48 - 1) = 0;
                *((void *)v48 - 3) = 0;
                v48 -= 24;
              }
              while (v48 != v49);
              int64x2_t v52 = *(int64x2_t *)&retstr->var0;
            }
            v53 = v46 + 24;
            retstr->var0 = v50;
            retstr->var1 = v46 + 24;
            int64x2_t v61 = v52;
            v54 = retstr->var2.var0;
            retstr->var2.var0 = &v45[24 * v44];
            int v62 = v54;
            uint64_t v60 = v52.i64[0];
            sub_1002B4440((uint64_t)&v60);
            int v55 = SHIBYTE(v58);
            retstr->var1 = v53;
            if (v55 < 0) {
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v40 = *(_OWORD *)__p;
            *((void *)v39 + 2) = v58;
            *(_OWORD *)__int16 v39 = v40;
            retstr->var1 = v39 + 24;
          }
        }
      }
    }
  }

  return result;
}

- (vector<std::string,)findUUIDsWithAllCustomProperties:(LeDeviceCache *)self
{
  id v6 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  id v7 = +[NSString stringWithFormat:@"SELECT * FROM %s", "CustomProperties"];
  ppStmt = 0;
  otherDatabase = self->_otherDatabase;
  id v56 = v7;
  if (!sqlite3_prepare_v2(otherDatabase, (const char *)[v56 UTF8String], -1, &ppStmt, 0))
  {
    while (sqlite3_step(ppStmt) == 100)
    {
      int v12 = sqlite3_column_text(ppStmt, 0);
      unsigned int v13 = sqlite3_column_text(ppStmt, 1);
      if (v13 && v12)
      {
        __int16 v14 = +[NSString stringWithUTF8String:v13];
        unsigned int v15 = +[NSString stringWithUTF8String:v12];
        if ([(LeDeviceCache *)self json:v14 hasAllProperties:v6])
        {
          sub_10004191C(__p, (char *)[v15 UTF8String]);
          var1 = (char *)retstr->var1;
          var0 = (char *)retstr->var2.var0;
          if (var1 >= var0)
          {
            unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((var1 - (char *)retstr->var0) >> 3);
            unint64_t v20 = v19 + 1;
            if (v19 + 1 > 0xAAAAAAAAAAAAAAALL) {
              abort();
            }
            unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((var0 - (char *)retstr->var0) >> 3);
            if (2 * v21 > v20) {
              unint64_t v20 = 2 * v21;
            }
            if (v21 >= 0x555555555555555) {
              unint64_t v22 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v22 = v20;
            }
            p_var2 = &retstr->var2;
            if (v22) {
              id v23 = (char *)sub_1002B3440((uint64_t)&retstr->var2, v22);
            }
            else {
              id v23 = 0;
            }
            id v24 = &v23[24 * v19];
            long long v25 = *(_OWORD *)__p;
            *((void *)v24 + 2) = v58;
            *(_OWORD *)id v24 = v25;
            __p[1] = 0;
            uint64_t v58 = 0;
            __p[0] = 0;
            v27 = (char *)retstr->var0;
            id v26 = (char *)retstr->var1;
            if (v26 == retstr->var0)
            {
              int64x2_t v30 = vdupq_n_s64((unint64_t)v26);
              id v28 = &v23[24 * v19];
            }
            else
            {
              id v28 = &v23[24 * v19];
              do
              {
                long long v29 = *(_OWORD *)(v26 - 24);
                *((void *)v28 - 1) = *((void *)v26 - 1);
                *(_OWORD *)(v28 - 24) = v29;
                v28 -= 24;
                *((void *)v26 - 2) = 0;
                *((void *)v26 - 1) = 0;
                *((void *)v26 - 3) = 0;
                v26 -= 24;
              }
              while (v26 != v27);
              int64x2_t v30 = *(int64x2_t *)&retstr->var0;
            }
            int v31 = v24 + 24;
            retstr->var0 = v28;
            retstr->var1 = v24 + 24;
            int64x2_t v61 = v30;
            __int16 v32 = retstr->var2.var0;
            retstr->var2.var0 = &v23[24 * v22];
            int v62 = v32;
            uint64_t v60 = v30.i64[0];
            sub_1002B4440((uint64_t)&v60);
            int v33 = SHIBYTE(v58);
            retstr->var1 = v31;
            if (v33 < 0) {
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v18 = *(_OWORD *)__p;
            *((void *)var1 + 2) = v58;
            *(_OWORD *)var1 = v18;
            retstr->var1 = var1 + 24;
          }
        }
      }
    }
  }
  pairedDatabase = self->_pairedDatabase;
  id v10 = v56;
  if (!sqlite3_prepare_v2(pairedDatabase, (const char *)[v10 UTF8String], -1, &ppStmt, 0))
  {
    while (sqlite3_step(ppStmt) == 100)
    {
      unsigned __int8 v34 = sqlite3_column_text(ppStmt, 0);
      id v35 = sqlite3_column_text(ppStmt, 1);
      if (v35 && v34)
      {
        int v36 = +[NSString stringWithUTF8String:v35];
        id v37 = +[NSString stringWithUTF8String:v34];
        if ([(LeDeviceCache *)self json:v36 hasAllProperties:v6])
        {
          sub_10004191C(__p, (char *)[v37 UTF8String]);
          __int16 v39 = (char *)retstr->var1;
          int v38 = (char *)retstr->var2.var0;
          if (v39 >= v38)
          {
            unint64_t v41 = 0xAAAAAAAAAAAAAAABLL * ((v39 - (char *)retstr->var0) >> 3);
            unint64_t v42 = v41 + 1;
            if (v41 + 1 > 0xAAAAAAAAAAAAAAALL) {
              abort();
            }
            unint64_t v43 = 0xAAAAAAAAAAAAAAABLL * ((v38 - (char *)retstr->var0) >> 3);
            if (2 * v43 > v42) {
              unint64_t v42 = 2 * v43;
            }
            if (v43 >= 0x555555555555555) {
              unint64_t v44 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v44 = v42;
            }
            p_var2 = &retstr->var2;
            if (v44) {
              v45 = (char *)sub_1002B3440((uint64_t)&retstr->var2, v44);
            }
            else {
              v45 = 0;
            }
            v46 = &v45[24 * v41];
            long long v47 = *(_OWORD *)__p;
            *((void *)v46 + 2) = v58;
            *(_OWORD *)v46 = v47;
            __p[1] = 0;
            uint64_t v58 = 0;
            __p[0] = 0;
            id v49 = (char *)retstr->var0;
            int v48 = (char *)retstr->var1;
            if (v48 == retstr->var0)
            {
              int64x2_t v52 = vdupq_n_s64((unint64_t)v48);
              __int16 v50 = &v45[24 * v41];
            }
            else
            {
              __int16 v50 = &v45[24 * v41];
              do
              {
                long long v51 = *(_OWORD *)(v48 - 24);
                *((void *)v50 - 1) = *((void *)v48 - 1);
                *(_OWORD *)(v50 - 24) = v51;
                v50 -= 24;
                *((void *)v48 - 2) = 0;
                *((void *)v48 - 1) = 0;
                *((void *)v48 - 3) = 0;
                v48 -= 24;
              }
              while (v48 != v49);
              int64x2_t v52 = *(int64x2_t *)&retstr->var0;
            }
            v53 = v46 + 24;
            retstr->var0 = v50;
            retstr->var1 = v46 + 24;
            int64x2_t v61 = v52;
            v54 = retstr->var2.var0;
            retstr->var2.var0 = &v45[24 * v44];
            int v62 = v54;
            uint64_t v60 = v52.i64[0];
            sub_1002B4440((uint64_t)&v60);
            int v55 = SHIBYTE(v58);
            retstr->var1 = v53;
            if (v55 < 0) {
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v40 = *(_OWORD *)__p;
            *((void *)v39 + 2) = v58;
            *(_OWORD *)__int16 v39 = v40;
            retstr->var1 = v39 + 24;
          }
        }
      }
    }
  }

  return result;
}

- (id)customPropertiesJSONFromDevice:(const void *)a3
{
  id v3 = (id)a3;
  if (a3)
  {
    id v4 = sub_1006B2CCC((uint64_t)a3);
    unsigned int v5 = v4;
    if (!v4 || ![v4 count])
    {
      id v3 = 0;
LABEL_23:

      goto LABEL_24;
    }
    id v6 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          int v12 = sub_1006B2D0C((uint64_t)v3, v11);
          if (v12) {
            [v6 setValue:v12 forKey:v11];
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    if (+[NSJSONSerialization isValidJSONObject:v6])
    {
      id v13 = objc_alloc((Class)NSString);
      id v17 = 0;
      __int16 v14 = +[NSJSONSerialization dataWithJSONObject:v6 options:3 error:&v17];
      id v15 = v17;
      id v3 = [v13 initWithData:v14 encoding:4];

      if (!v15)
      {
        unsigned int v5 = v7;
        goto LABEL_22;
      }
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
        sub_10075A058();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
    {
      sub_10075A0CC();
    }
    id v3 = 0;
LABEL_22:

    goto LABEL_23;
  }
LABEL_24:

  return v3;
}

- (BOOL)json:(id)a3 hasAnyProperty:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [v5 dataUsingEncoding:4];
    id v22 = 0;
    id v8 = +[NSJSONSerialization JSONObjectWithData:v7 options:17 error:&v22];
    id v9 = v22;

    if (v9)
    {
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
        sub_10075A1AC();
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = v6;
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v19;
          while (2)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v11);
              }
              uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              __int16 v16 = [v9 allKeys];
              LOBYTE(v15) = [v16 containsObject:v15];

              if (v15)
              {

                BOOL v10 = 1;
                goto LABEL_19;
              }
            }
            id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
      {
        sub_10075A138();
      }
    }
    BOOL v10 = 0;
LABEL_19:
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)json:(id)a3 hasAllProperties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [v5 dataUsingEncoding:4];
    id v16 = 0;
    id v8 = +[NSJSONSerialization JSONObjectWithData:v7 options:17 error:&v16];
    id v9 = v16;

    if (v9)
    {
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
        sub_10075A294();
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v8;
        id v12 = [v11 allKeys];
        uint64_t v13 = +[NSSet setWithArray:v12];

        __int16 v14 = +[NSSet setWithArray:v6];
        unsigned __int8 v10 = [v14 isSubsetOfSet:v13];

LABEL_11:
        goto LABEL_12;
      }
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
        sub_10075A220();
      }
    }
    unsigned __int8 v10 = 0;
    goto LABEL_11;
  }
  unsigned __int8 v10 = 0;
LABEL_12:

  return v10;
}

- (void)customPropertiesToDevice:(void *)a3 fromJSON:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 && v5)
  {
    id v7 = [v5 dataUsingEncoding:4];
    id v21 = 0;
    id v8 = +[NSJSONSerialization JSONObjectWithData:v7 options:17 error:&v21];
    id v16 = v21;

    if (v16 && os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
      sub_10075A37C();
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      unsigned __int8 v10 = [v9 allKeys];
      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v18;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v10);
            }
            __int16 v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            uint64_t v15 = [v9 objectForKey:v14];
            sub_1006B2DA8((uint64_t)a3, v14, v15);
          }
          id v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v11);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
    {
      sub_10075A308();
    }
  }
}

- (void)writeCustomPropertiesJSONForDevice:(const void *)a3 inDatabase:(sqlite3 *)a4
{
  if (a3 && a4)
  {
    id v7 = *(id *)a3;
    if (v7)
    {
      id v8 = [(LeDeviceCache *)self customPropertiesJSONFromDevice:a3];
      if (v8)
      {
        ppStmt = 0;
        id v9 = +[NSString stringWithFormat:@"INSERT OR REPLACE INTO %s (%s, %s) VALUES (?1, ?2)", "CustomProperties", "Uuid", "JSON"];
        if (sqlite3_prepare_v2(a4, (const char *)[v9 UTF8String], -1, &ppStmt, 0))
        {
          if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
            sub_10075A424();
          }
        }
        else
        {
          uint64_t v12 = ppStmt;
          id v13 = [v7 UUIDString];
          sqlite3_bind_text(v12, 1, (const char *)[v13 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

          sqlite3_bind_text(ppStmt, 2, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          int v14 = sqlite3_step(ppStmt);
          if (v14 != 101)
          {
            uint64_t v15 = qword_100A19E78;
            if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
            {
              id v16 = sqlite3_errmsg(a4);
              int v17 = sqlite3_extended_errcode(a4);
              *(_DWORD *)stat buf = 67109634;
              int v20 = v14;
              __int16 v21 = 2082;
              id v22 = v16;
              __int16 v23 = 1024;
              int v24 = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to create prepared write statement for Custom Properties cache with error %d (%{public}s, %d)", buf, 0x18u);
            }
          }
          sqlite3_reset(ppStmt);
          sqlite3_clear_bindings(ppStmt);
          sqlite3_finalize(ppStmt);
        }
      }
      else
      {
        id v11 = [v7 UUIDString];
        [(LeDeviceCache *)self removeCustomPropertiesJSONForDeviceUUID:v11 inDatabase:a4];
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
    {
      sub_10075A3F0();
    }
  }
  else
  {
    unsigned __int8 v10 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
      sub_10075A490(a3 != 0, a4 != 0, v10);
    }
  }
}

- (void)removeCustomPropertiesJSONForDeviceUUID:(id)a3 inDatabase:(sqlite3 *)a4
{
  id v6 = a3;
  id v7 = [(LeDeviceCache *)self readCustomPropertiesJSONForDeviceUUID:v6 inDatabase:a4];

  if (v7)
  {
    +[NSString stringWithFormat:@"DELETE FROM %s WHERE %s = '%@'", "CustomProperties", "Uuid", v6];
    ppStmt = 0;
    id v8 = objc_claimAutoreleasedReturnValue();
    int v9 = sqlite3_prepare_v2(a4, (const char *)[v8 UTF8String], -1, &ppStmt, 0);
    if (v9)
    {
      unsigned __int8 v10 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v8 UTF8String];
        uint64_t v12 = sqlite3_errmsg(a4);
        int v13 = sqlite3_extended_errcode(a4);
        *(_DWORD *)stat buf = 136315906;
        id v21 = v11;
        __int16 v22 = 1024;
        int v23 = v9;
        __int16 v24 = 2082;
        long long v25 = v12;
        __int16 v26 = 1024;
        int v27 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to prepare statement \"%s\" with error %d (%{public}s, %d)", buf, 0x22u);
      }
    }
    else
    {
      int v14 = sqlite3_step(ppStmt);
      if (v14 != 101)
      {
        uint64_t v15 = qword_100A19E78;
        if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
        {
          id v16 = [v8 UTF8String];
          int v17 = sqlite3_errmsg(a4);
          int v18 = sqlite3_extended_errcode(a4);
          *(_DWORD *)stat buf = 136315906;
          id v21 = v16;
          __int16 v22 = 1024;
          int v23 = v14;
          __int16 v24 = 2082;
          long long v25 = v17;
          __int16 v26 = 1024;
          int v27 = v18;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to execute statement \"%s\" with error %d (%{public}s, %d)", buf, 0x22u);
        }
      }
      sqlite3_finalize(ppStmt);
    }
  }
}

- (id)readCustomPropertiesJSONForDeviceUUID:(id)a3 inDatabase:(sqlite3 *)a4
{
  id v5 = a3;
  id v6 = 0;
  if (v5 && a4)
  {
    +[NSString stringWithFormat:@"SELECT * FROM %s WHERE %s = '%@'", "CustomProperties", "Uuid", v5];
    ppStmt = 0;
    id v7 = objc_claimAutoreleasedReturnValue();
    int v8 = sqlite3_prepare_v2(a4, (const char *)[v7 UTF8String], -1, &ppStmt, 0);
    if (v8)
    {
      int v9 = qword_100A19E78;
      if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
      {
        id v13 = [v7 UTF8String];
        int v14 = sqlite3_errmsg(a4);
        int v15 = sqlite3_extended_errcode(a4);
        *(_DWORD *)stat buf = 136315906;
        id v18 = v13;
        __int16 v19 = 1024;
        int v20 = v8;
        __int16 v21 = 2082;
        __int16 v22 = v14;
        __int16 v23 = 1024;
        int v24 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to execute statement \"%s\" with error %d (%{public}s, %d)", buf, 0x22u);
      }
      id v6 = 0;
      goto LABEL_15;
    }
    int v10 = sqlite3_step(ppStmt);
    if (v10 != 101)
    {
      if (v10 == 100)
      {
        id v11 = sqlite3_column_text(ppStmt, 1);
        if (v11)
        {
          id v6 = +[NSString stringWithUTF8String:v11];
LABEL_14:
          sqlite3_finalize(ppStmt);
LABEL_15:

          goto LABEL_16;
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
      {
        sub_10075A530();
      }
    }
    id v6 = 0;
    goto LABEL_14;
  }
LABEL_16:

  return v6;
}

- (void)readCustomPropertiesJSONForDevice:(void *)a3 inDatabase:(sqlite3 *)a4
{
  if (a3 && a4)
  {
    id v7 = *(id *)a3;
    int v8 = v7;
    if (v7)
    {
      int v9 = [v7 UUIDString];
      int v10 = [(LeDeviceCache *)self readCustomPropertiesJSONForDeviceUUID:v9 inDatabase:a4];

      if (v10) {
        [(LeDeviceCache *)self customPropertiesToDevice:a3 fromJSON:v10];
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
    {
      sub_10075A598();
    }
  }
}

- (void)readDeviceFromDatabase:(sqlite3 *)a3 statement:(id)a4
{
  ppStmt = 0;
  id v5 = a4;
  int v6 = sqlite3_prepare_v2(a3, (const char *)[v5 UTF8String], -1, &ppStmt, 0);
  if (v6)
  {
    id v7 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v5 UTF8String];
      __int16 v21 = sqlite3_errmsg(a3);
      int v22 = sqlite3_extended_errcode(a3);
      *(_DWORD *)stat buf = 136315906;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v21;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to execute statement \"%s\" with error %d (%{public}s, %d)", buf, 0x22u);
    }
    goto LABEL_30;
  }
  int v8 = sqlite3_step(ppStmt);
  int v9 = v8;
  if (v8 == 101) {
    goto LABEL_29;
  }
  if (v8 == 100)
  {
    uint64_t v10 = 0;
    id v32 = 0;
    id v33 = 0;
    id v30 = 0;
    id v31 = 0;
    id v28 = 0;
    id v29 = 0;
    id v26 = 0;
    id v27 = 0;
    id v25 = 0;
    *(void *)stat buf = &v33;
    *(void *)&uint8_t buf[8] = &v32;
    *(void *)&buf[16] = &v27;
    *(void *)&unsigned char buf[24] = &v31;
    *(void *)&buf[32] = &v30;
    id v37 = &v26;
    int v38 = &v25;
    __int16 v39 = &v24;
    long long v40 = &v29;
    unint64_t v41 = &v28;
    id v24 = 0;
    while (1)
    {
      uint64_t v11 = qword_100A19A58[v10];
      if (v11 == objc_opt_class())
      {
        int v15 = sqlite3_column_text(ppStmt, v10);
        if (!v15) {
          goto LABEL_16;
        }
        id v13 = *(uint64_t **)&buf[8 * v10];
        if (*v13) {
          goto LABEL_16;
        }
        uint64_t v14 = +[NSString stringWithUTF8String:v15];
      }
      else
      {
        uint64_t v12 = qword_100A19A58[v10];
        if (v12 != objc_opt_class()) {
          goto LABEL_16;
        }
        id v13 = *(uint64_t **)&buf[8 * v10];
        if (*v13) {
          goto LABEL_16;
        }
        uint64_t v14 = +[NSNumber numberWithInt:sqlite3_column_int(ppStmt, v10)];
      }
      id v16 = (void *)*v13;
      *id v13 = v14;

LABEL_16:
      if (++v10 == 10)
      {
        id v17 = objc_alloc((Class)NSUUID);
        id v18 = [v17 initWithUUIDString:v33];
        if (!v31 && os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_FAULT)) {
          sub_10075A6A0((uint64_t)[v33 UTF8String], (uint64_t)v35);
        }
        if (v18)
        {
          if (v31) {
            operator new();
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_FAULT))
        {
          [v31 UTF8String];
          [v33 UTF8String];
          sub_10075A658();
        }

        goto LABEL_29;
      }
    }
  }
  __int16 v19 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
    sub_10075A5CC(v9, v19);
  }
LABEL_29:
  sqlite3_finalize(ppStmt);
LABEL_30:

  return 0;
}

- (id)nameFromSanitizedName:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"///900"];
  id v4 = [v3 componentsJoinedByString:@"’"];

  id v5 = [v4 componentsSeparatedByString:@"///901"];
  int v6 = [v5 componentsJoinedByString:@"'"];

  int v8 = v7 = [v6 componentsSeparatedByString:@"///902"];

  return v8;
}

- (void)evictIfNeeded:(BOOL)a3
{
  ppStmt = 0;
  if (a3)
  {
    int v4 = [(LeDeviceCache *)self connectedDeviceCount];
    if (v4 >= [(LeDeviceCache *)self maxConnectedDevices]
      && !sqlite3_prepare_v2(self->_otherDatabase, "SELECT Uuid FROM OtherDevices WHERE ROWID = (SELECT ROWID FROM OtherDevices WHERE LastConnectionTime != 0 ORDER BY LastConnectionTime ASC LIMIT 1)", -1, &ppStmt, 0))
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        id v5 = sqlite3_column_text(ppStmt, 0);
        if (v5)
        {
          int v6 = +[NSString stringWithUTF8String:v5];
        }
        else
        {
          int v6 = 0;
        }
        otherDatabase = self->_otherDatabase;
        +[NSString stringWithFormat:@"DELETE FROM OtherDevices WHERE Uuid = '%s'", v5];
        id v10 = objc_claimAutoreleasedReturnValue();
        int v11 = sqlite3_exec(otherDatabase, (const char *)[v10 UTF8String], 0, 0, 0);

        uint64_t v12 = qword_100A19E78;
        if (v11)
        {
          if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
          {
            id v13 = [(LeDeviceCache *)self friendlyNameForType:1];
            uint64_t v14 = sqlite3_errmsg(self->_otherDatabase);
            int v15 = sqlite3_extended_errcode(self->_otherDatabase);
            *(_DWORD *)stat buf = 136447234;
            id v27 = v5;
            __int16 v28 = 2082;
            id v29 = v13;
            __int16 v30 = 1024;
            int v31 = v11;
            __int16 v32 = 2082;
            id v33 = v14;
            __int16 v34 = 1024;
            int v35 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to delete the oldest connected device \"%{public}s\" from '%{public}s' cache with error %d (%{public}s, %d)", buf, 0x2Cu);
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
          {
            __int16 v23 = [(LeDeviceCache *)self friendlyNameForType:1];
            *(_DWORD *)stat buf = 136446466;
            id v27 = v5;
            __int16 v28 = 2082;
            id v29 = v23;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Successfully evicted oldest connected device \"%{public}s\" from '%{public}s' cache", buf, 0x16u);
          }
          [(LeDeviceCache *)self setConnectedDeviceCount:[(LeDeviceCache *)self connectedDeviceCount] - 1];
        }
        if (v6)
        {
LABEL_24:
          [(LeDeviceCache *)self removeCustomPropertiesJSONForDeviceUUID:v6 inDatabase:self->_otherDatabase];
LABEL_34:

          goto LABEL_35;
        }
        if (!os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
LABEL_33:
        sub_10075A6E4();
        goto LABEL_34;
      }
      goto LABEL_35;
    }
  }
  else
  {
    int v7 = [(LeDeviceCache *)self seenDeviceCount];
    if (v7 >= [(LeDeviceCache *)self maxSeenDevices]
      && !sqlite3_prepare_v2(self->_otherDatabase, "SELECT Uuid FROM OtherDevices WHERE ROWID = (SELECT ROWID FROM OtherDevices WHERE LastConnectionTime = 0 ORDER BY LastSeenTime ASC LIMIT 1)", -1, &ppStmt, 0))
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        int v8 = sqlite3_column_text(ppStmt, 0);
        if (v8)
        {
          int v6 = +[NSString stringWithUTF8String:v8];
        }
        else
        {
          int v6 = 0;
        }
        id v16 = self->_otherDatabase;
        +[NSString stringWithFormat:@"DELETE FROM OtherDevices WHERE Uuid = '%s'", v8];
        id v17 = objc_claimAutoreleasedReturnValue();
        int v18 = sqlite3_exec(v16, (const char *)[v17 UTF8String], 0, 0, 0);

        __int16 v19 = qword_100A19E78;
        if (v18)
        {
          if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR))
          {
            id v20 = [(LeDeviceCache *)self friendlyNameForType:1];
            __int16 v21 = sqlite3_errmsg(self->_otherDatabase);
            int v22 = sqlite3_extended_errcode(self->_otherDatabase);
            *(_DWORD *)stat buf = 136447234;
            id v27 = v8;
            __int16 v28 = 2082;
            id v29 = v20;
            __int16 v30 = 1024;
            int v31 = v18;
            __int16 v32 = 2082;
            id v33 = v21;
            __int16 v34 = 1024;
            int v35 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to delete the oldest seen device \"%{public}s\" from '%{public}s' cache with error %d (%{public}s, %d)", buf, 0x2Cu);
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_INFO))
          {
            id v24 = [(LeDeviceCache *)self friendlyNameForType:1];
            *(_DWORD *)stat buf = 136446466;
            id v27 = v8;
            __int16 v28 = 2082;
            id v29 = v24;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Successfully evicted oldest seen device \"%{public}s\" from '%{public}s' cache", buf, 0x16u);
          }
          [(LeDeviceCache *)self setSeenDeviceCount:[(LeDeviceCache *)self seenDeviceCount] - 1];
        }
        if (v6) {
          goto LABEL_24;
        }
        if (!os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
LABEL_35:
      sqlite3_finalize(ppStmt);
    }
  }
}

- (void)printDebug
{
  id v3 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "statedump: ---------------- LE Device Database ----------------", v4, 2u);
  }
  [(LeDeviceCache *)self printDatabase:0];
  [(LeDeviceCache *)self printDatabase:1];
}

- (void)printDatabase:(unint64_t)a3
{
  id v46 = 0;
  id v47 = 0;
  id v44 = 0;
  id v45 = 0;
  id v42 = 0;
  id v43 = 0;
  id v40 = 0;
  id v41 = 0;
  id v38 = 0;
  id v39 = 0;
  v67[0] = &v47;
  v67[1] = &v46;
  v67[2] = &v41;
  v67[3] = &v45;
  v67[4] = &v44;
  v67[5] = &v40;
  v67[6] = &v39;
  v67[7] = &v38;
  v67[8] = &v43;
  v67[9] = &v42;
  id v5 = qword_100A19E78;
  if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = "Other devices";
    if (!a3) {
      int v6 = "Paired devices";
    }
    *(_DWORD *)stat buf = 136446210;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump: %{public}s:", buf, 0xCu);
  }
  uint64_t v7 = 24;
  if (!a3) {
    uint64_t v7 = 16;
  }
  int v8 = *(Class *)((char *)&self->super.isa + v7);
  if (v8)
  {
    ppStmt = 0;
    id v9 = +[NSString stringWithFormat:@"SELECT * FROM %s", [(LeDeviceCache *)self tableNameForType:a3]];
    int v10 = sqlite3_prepare_v2(v8, (const char *)[v9 UTF8String], -1, &ppStmt, 0);

    if (!v10)
    {
      while (1)
      {
        if (sqlite3_step(ppStmt) != 100)
        {
          sqlite3_finalize(ppStmt);
          break;
        }
        for (uint64_t i = 0; i != 10; ++i)
        {
          uint64_t v13 = qword_100A19A58[i];
          if (v13 == objc_opt_class())
          {
            id v16 = sqlite3_column_text(ppStmt, i);
            if (!v16)
            {
              __int16 v19 = (void **)v67[i];
              int v18 = *v19;
              *__int16 v19 = &stru_1009C1AC8;
              goto LABEL_19;
            }
            uint64_t v15 = +[NSString stringWithUTF8String:v16];
          }
          else
          {
            uint64_t v14 = qword_100A19A58[i];
            if (v14 != objc_opt_class()) {
              continue;
            }
            uint64_t v15 = +[NSNumber numberWithInt:sqlite3_column_int(ppStmt, i)];
          }
          id v17 = (void **)v67[i];
          int v18 = *v17;
          *id v17 = (void *)v15;
LABEL_19:
        }
        uint64_t v66 = 0;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        *(_OWORD *)v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        *(_OWORD *)stat buf = 0u;
        long long v51 = 0u;
        sub_1000419CC((uint64_t)buf);
        if (v47)
        {
          strlen((const char *)[v47 UTF8String]);
          sub_10003AB28((uint64_t)buf);
        }
        sub_10003AB28((uint64_t)buf);
        if ([v45 length])
        {
          strlen((const char *)[v45 UTF8String]);
          sub_10003AB28((uint64_t)buf);
          if ([v44 length])
          {
            if (([v45 isEqualToString:v44] & 1) == 0)
            {
              uint64_t v20 = sub_10003AB28((uint64_t)buf);
              strlen((const char *)[v44 UTF8String]);
              uint64_t v21 = sub_10003AB28(v20);
              sub_10003AB28(v21);
            }
          }
        }
        if ([v46 length])
        {
          sub_10003AB28((uint64_t)buf);
          if ([v41 intValue] == 2
            || [v41 intValue] == 1
            || [v41 intValue] == 4
            || [v41 intValue] == 3)
          {
            sub_10003AB28((uint64_t)buf);
          }
          uint64_t v22 = sub_10003AB28((uint64_t)buf);
          uint64_t v23 = sub_10003AB28(v22);
          uint64_t v24 = sub_100017768();
          id v25 = "";
          if ((*(unsigned int (**)(uint64_t))(*(void *)v24 + 8))(v24)) {
            id v25 = (const char *)[v46 UTF8String];
          }
          strlen(v25);
          uint64_t v26 = sub_10003AB28(v23);
          sub_10003AB28(v26);
        }
        if ([v40 intValue])
        {
          sub_10003AB28((uint64_t)buf);
          [v40 intValue];
          std::ostream::operator<<();
        }
        if ([v39 intValue])
        {
          sub_10003AB28((uint64_t)buf);
          [v39 intValue];
          std::ostream::operator<<();
        }
        if ([v42 length])
        {
          uint64_t v27 = sub_10003AB28((uint64_t)buf);
          strlen((const char *)[v42 UTF8String]);
          sub_10003AB28(v27);
        }
        if ([v38 BOOLValue]) {
          sub_10003AB28((uint64_t)buf);
        }
        if ([v43 length])
        {
          uint64_t v28 = sub_10003AB28((uint64_t)buf);
          id v29 = [v43 stringByReplacingOccurrencesOfString:@",", @", " withString];
          strlen((const char *)[v29 UTF8String]);
          sub_10003AB28(v28);
        }
        __int16 v30 = qword_100A19E78;
        if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
        {
          std::stringbuf::str();
          p_p = &__p;
          if (v36 < 0) {
            p_p = __p;
          }
          *(_DWORD *)int v48 = 136446210;
          id v49 = p_p;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "statedump: %{public}s", v48, 0xCu);
          if (v36 < 0) {
            operator delete(__p);
          }
        }
        *(void *)stat buf = v34;
        *(void *)&buf[*(void *)(v34 - 24)] = v33;
        if (SHIBYTE(v55) < 0) {
          operator delete(v54[1]);
        }
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        std::ios::~ios();
      }
    }
  }
  else
  {
    __int16 v32 = qword_100A19E78;
    if (os_log_type_enabled((os_log_t)qword_100A19E78, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "statedump:    Cache has not been loaded", buf, 2u);
    }
  }
}

- (int)maxSeenDevices
{
  return self->_maxSeenDevices;
}

- (int)maxConnectedDevices
{
  return self->_maxConnectedDevices;
}

- (int)seenDeviceCount
{
  return self->_seenDeviceCount;
}

- (void)setSeenDeviceCount:(int)a3
{
  self->_seenDeviceCount = a3;
}

- (int)connectedDeviceCount
{
  return self->_connectedDeviceCount;
}

- (void)setConnectedDeviceCount:(int)a3
{
  self->_connectedDeviceCount = a3;
}

@end