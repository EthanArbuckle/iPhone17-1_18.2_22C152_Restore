@interface MBiTunesStorePlugin
- (BOOL)_mkdir:(id)a3;
- (id)backingUpSQLiteFileCopyAtPath:(id)a3 temporaryPath:(id)a4;
- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4;
@end

@implementation MBiTunesStorePlugin

- (id)backingUpSQLiteFileCopyAtPath:(id)a3 temporaryPath:(id)a4
{
  if ([a3 isEqualToString:@"/var/mobile/Library/com.apple.itunesstored/kvs.sqlitedb"])
  {
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Deleting unneeded domains from %@", buf, 0xCu);
      id v9 = a3;
      _MBLog();
    }
    *(void *)buf = 0;
    sqlite3_open_v2((const char *)objc_msgSend(a4, "fileSystemRepresentation", v9), (sqlite3 **)buf, 2, 0);
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"delete from kvs_value where domain not in ('%@', '%@'); vacuum;",
           @"com.apple.itunesstored",
           @"com.apple.mobile.iTunes.store");
    sqlite3_exec(*(sqlite3 **)buf, [(NSString *)v7 UTF8String], 0, 0, 0);
    sqlite3_close(*(sqlite3 **)buf);
  }
  return 0;
}

- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  if (!objc_msgSend(a4, "restoresPrimaryAccount", a3)) {
    return 0;
  }
  CFStringRef v21 = 0;
  unsigned __int8 v6 = objc_msgSend(objc_msgSend(a4, "settingsContext"), "shouldRestoreSystemFiles");
  v7 = MBGetDefaultLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Restoring iTunesStore KeyValueStore", buf, 2u);
      _MBLog();
    }
    id v9 = [a4 persona];
    if (!v9) {
      __assert_rtn("-[MBiTunesStorePlugin endingRestoreWithPolicy:engine:]", "MBiTunesStorePlugin.m", 62, "persona");
    }
    v10 = v9;
    id v11 = +[MBiTunesStoreKVS iTunesStoreKVS];
    id v12 = objc_msgSend(objc_msgSend(v10, "userIncompleteRestoreDirectory"), "stringByAppendingPathComponent:", @"/var/mobile/Library/com.apple.itunesstored");
    id v13 = objc_msgSend(objc_msgSend(v10, "userIncompleteRestoreDirectory"), "stringByAppendingPathComponent:", @"/var/mobile/Library/com.apple.itunesstored/kvs.sqlitedb");
    id v14 = [v11 knownAccountsByDSID];
    if ([+[NSFileManager defaultManager] fileExistsAtPath:v13])
    {
      if (!+[MBSQLiteFileHandle copySQLiteFileAtPath:v13 toPath:@"/var/mobile/Library/com.apple.itunesstored/kvs.sqlitedb" timeout:&v21 error:10.0])
      {
        v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v23 = v21;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Error copying iTMS KVS db from backup to local path: %@", buf, 0xCu);
LABEL_12:
          _MBLog();
          return 0;
        }
        return 0;
      }
    }
    else
    {
      [v11 removeAllValues];
    }
    id v16 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "properties"), "lockdownKeys"), "objectForKeyedSubscript:", @"com.apple.itunesstored");
    if ([v16 count])
    {
      [v11 setValuesWithDictionary:v16 forDomain:@"com.apple.itunesstored"];
    }
    else
    {
      v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v23 = @"com.apple.itunesstored";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "No keys found in %@ lockdown domain", buf, 0xCu);
        CFStringRef v20 = @"com.apple.itunesstored";
        _MBLog();
      }
    }
    objc_msgSend(v11, "setKnownAccounts:", objc_msgSend(+[MBiTunesStoreKVS mergeKnownAccountsByDSID:into:](MBiTunesStoreKVS, "mergeKnownAccountsByDSID:into:", v14, objc_msgSend(v11, "knownAccountsByDSID", v20)), "allValues"));
    if ([(MBiTunesStorePlugin *)self _mkdir:v12])
    {
      if (!+[MBSQLiteFileHandle copySQLiteFileAtPath:@"/var/mobile/Library/com.apple.itunesstored/kvs.sqlitedb" toPath:v13 timeout:&v21 error:10.0])
      {
        v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v23 = v21;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Error copying iTMS KVS db from local to backup path: %@", buf, 0xCu);
          goto LABEL_12;
        }
      }
    }
    return 0;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Not restoring iTunesStore KeyValueStore since system files weren't restored", buf, 2u);
    goto LABEL_12;
  }
  return 0;
}

- (BOOL)_mkdir:(id)a3
{
  uint64_t v10 = 0;
  char v9 = 0;
  if ([+[NSFileManager defaultManager] fileExistsAtPath:a3 isDirectory:&v9])
  {
    BOOL v4 = v9 == 0;
  }
  else
  {
    BOOL v4 = 1;
  }
  if (!v4) {
    return 1;
  }
  if (!v9
    && ![+[NSFileManager defaultManager] removeItemAtPath:a3 error:&v10])
  {
    v7 = MBGetDefaultLog();
    BOOL v6 = 0;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      return v6;
    }
    *(_DWORD *)buf = 138412546;
    id v12 = a3;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error removing directory: %@: %@", buf, 0x16u);
LABEL_13:
    _MBLog();
    return 0;
  }
  BOOL v6 = 1;
  if (![+[NSFileManager defaultManager] createDirectoryAtPath:a3 withIntermediateDirectories:1 attributes:MBMobileFileAttributes() error:&v10])
  {
    v5 = MBGetDefaultLog();
    BOOL v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = a3;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error creating directory: %@: %@", buf, 0x16u);
      goto LABEL_13;
    }
  }
  return v6;
}

@end