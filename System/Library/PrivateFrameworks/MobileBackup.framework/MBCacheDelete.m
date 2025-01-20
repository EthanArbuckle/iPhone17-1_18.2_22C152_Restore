@interface MBCacheDelete
- (id)periodic:(id)a3 urgency:(int)a4;
- (id)purge:(id)a3 urgency:(int)a4;
- (id)purgeable:(id)a3 urgency:(int)a4;
- (void)cancelPurge;
@end

@implementation MBCacheDelete

- (id)purgeable:(id)a3 urgency:(int)a4
{
  v4 = objc_msgSend(a3, "objectForKeyedSubscript:", @"CACHE_DELETE_VOLUME", *(void *)&a4);
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CacheDelete requested purgeable amount for volume %@. Unsupported", buf, 0xCu);
    _MBLog();
  }

  v8[0] = @"CACHE_DELETE_VOLUME";
  v8[1] = @"CACHE_DELETE_AMOUNT";
  v9[0] = v4;
  v9[1] = &off_1000152C8;
  v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)purge:(id)a3 urgency:(int)a4
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v6 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v7 = +[MBPersona allPersonae];
  id v8 = [v7 countByEnumeratingWithState:&v33 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v34;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v12 = [v11 volumeMountPoint];
        unsigned int v13 = [v12 isEqualToString:v5];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v33 objects:v51 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v44 = v6;
    __int16 v45 = 2048;
    uint64_t v46 = a4;
    __int16 v47 = 2112;
    v48 = v5;
    __int16 v49 = 2112;
    id v50 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Requested to purge %@ with urgency %ld for volume %@ for persona %@", buf, 0x2Au);
    v28 = v5;
    id v29 = v8;
    id v26 = v6;
    uint64_t v27 = a4;
    _MBLog();
  }

  v15 = +[NSDate dateWithTimeIntervalSinceNow:-60.0];
  id v32 = 0;
  unsigned int v16 = +[MBFileSystemManager deleteAllSnapshotsForVolume:v5 withPrefix:@"com.apple.mobilebackup" latestCreationDate:v15 error:&v32];
  id v17 = v32;
  if (v16)
  {
    v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to remove MobileBackup file system snapshots: %@", buf, 0xCu);
      id v26 = v17;
      _MBLog();
    }
  }
  id v31 = v17;
  +[MBFileSystemManager deleteAllSnapshotsForVolume:v5, @"com.appleinternal.mobilebackup", &v31, v26, v27, v28, v29 withPrefix error];
  id v19 = v31;

  if (!v8)
  {
    v41[0] = @"CACHE_DELETE_VOLUME";
    v41[1] = @"CACHE_DELETE_AMOUNT";
    v42[0] = v5;
    v42[1] = &off_1000152C8;
    v24 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
    goto LABEL_25;
  }
  if ([v8 isPersonalPersona])
  {
    v20 = +[NSDate dateWithTimeIntervalSinceNow:-604800.0];
    +[MBFileSystemManager removeDriveBackupSnapshotsWithLatestCreationDate:v20];
    if (a4 < 2)
    {
      v39[0] = @"CACHE_DELETE_VOLUME";
      v39[1] = @"CACHE_DELETE_AMOUNT";
      v40[0] = v5;
      v40[1] = &off_1000152C8;
      v24 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
      goto LABEL_24;
    }
    v21 = +[NSDate dateWithTimeIntervalSinceNow:-864000.0];
    +[MBFileSystemManager removeDeviceTransferDirectoryWithEarliestCreationDate:v21];
  }
  v20 = +[NSDate dateWithTimeIntervalSinceNow:-3600.0];
  id v22 = [v8 removeRestorePrefetchCachesOlderThanDate:v20];
  v37[0] = @"CACHE_DELETE_VOLUME";
  v37[1] = @"CACHE_DELETE_AMOUNT";
  v38[0] = v5;
  v23 = +[NSNumber numberWithUnsignedLongLong:v22];
  v38[1] = v23;
  v24 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

LABEL_24:
LABEL_25:

  return v24;
}

- (id)periodic:(id)a3 urgency:(int)a4
{
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v7 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = a4;
    __int16 v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requested to periodic purge %@ with urgency %ld for volume %@. Unsupported", buf, 0x20u);
    _MBLog();
  }

  v11[0] = @"CACHE_DELETE_VOLUME";
  v11[1] = @"CACHE_DELETE_AMOUNT";
  v12[0] = v6;
  v12[1] = &off_1000152C8;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (void)cancelPurge
{
  v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Requested to cancel purge. Not supported.", v3, 2u);
    _MBLog();
  }
}

@end