@interface MBCKCacheTracker
- (BOOL)_removeDatabaseAtPath:(id)a3 error:(id *)a4;
- (BOOL)_resetDatabaseForAccount:(id)a3 error:(id *)a4;
- (BOOL)resetDatabaseForAccount:(id)a3 error:(id *)a4;
- (MBCKCacheTracker)initWithCacheDirectory:(id)a3;
- (MBCKCacheTracker)initWithPath:(id)a3;
- (NSHashTable)connections;
- (NSString)path;
- (OS_dispatch_queue)sharedQueue;
- (id)cacheCreationDate;
- (id)openCacheWithAccessType:(int)a3 cached:(BOOL)a4 error:(id *)a5;
- (void)_addCache:(id)a3;
- (void)_closeCache:(id)a3;
- (void)_invalidateConnections;
- (void)_removeCache:(id)a3;
- (void)_removeCorruptDatabaseWithError:(id)a3;
- (void)setConnections:(id)a3;
- (void)setPath:(id)a3;
- (void)setSharedQueue:(id)a3;
@end

@implementation MBCKCacheTracker

- (MBCKCacheTracker)initWithPath:(id)a3
{
  id v5 = a3;
  if (!v5) {
    __assert_rtn("-[MBCKCacheTracker initWithPath:]", "MBCKCache.m", 90, "path");
  }
  v6 = v5;
  v15.receiver = self;
  v15.super_class = (Class)MBCKCacheTracker;
  v7 = [(MBCKCacheTracker *)&v15 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_path, a3);
    v9 = (objc_class *)objc_opt_class();
    Name = class_getName(v9);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(Name, v11);
    sharedQueue = v8->_sharedQueue;
    v8->_sharedQueue = (OS_dispatch_queue *)v12;
  }
  return v8;
}

- (MBCKCacheTracker)initWithCacheDirectory:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKCacheTracker initWithCacheDirectory:]", "MBCKCache.m", 100, "cacheDirectory");
  }
  id v5 = v4;
  if (qword_100482418 != -1) {
    dispatch_once(&qword_100482418, &stru_100412BC0);
  }
  v6 = [v5 stringByAppendingPathComponent:@"cloudkit_cache.db"];
  v7 = [(MBCKCacheTracker *)self initWithPath:v6];

  return v7;
}

- (id)cacheCreationDate
{
  uint64_t v2 = [(MBCKCacheTracker *)self path];
  if (!v2) {
    __assert_rtn("-[MBCKCacheTracker cacheCreationDate]", "MBCKCache.m", 120, "path");
  }
  v3 = (void *)v2;
  id v4 = +[NSFileManager defaultManager];
  uint64_t v8 = 0;
  id v5 = [v4 attributesOfItemAtPath:v3 error:&v8];

  if (v5)
  {
    v6 = [v5 objectForKeyedSubscript:NSFileCreationDate];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)openCacheWithAccessType:(int)a3 cached:(BOOL)a4 error:(id *)a5
{
  if ((a3 - 3) <= 0xFFFFFFFD) {
    __assert_rtn("-[MBCKCacheTracker openCacheWithAccessType:cached:error:]", "MBCKCache.m", 130, "accessType == MBCKCacheAccessTypeReadWrite || accessType == MBCKCacheAccessTypeReadOnly");
  }
  if (!a5) {
    __assert_rtn("-[MBCKCacheTracker openCacheWithAccessType:cached:error:]", "MBCKCache.m", 131, "error");
  }
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_sharedQueue);
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1000D9658;
  v27 = sub_1000D9668;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1000D9658;
  v21 = sub_1000D9668;
  id v22 = 0;
  sharedQueue = self->_sharedQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000D9670;
  v14[3] = &unk_100412BE8;
  BOOL v16 = a4;
  int v15 = a3;
  v14[4] = self;
  v14[5] = &v17;
  v14[6] = &v23;
  dispatch_sync(sharedQueue, v14);
  v10 = (void *)v18[5];
  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    dispatch_queue_t v12 = (void *)v24[5];
    if (!v12) {
      __assert_rtn("-[MBCKCacheTracker openCacheWithAccessType:cached:error:]", "MBCKCache.m", 175, "localError");
    }
    *a5 = v12;
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v10;
}

- (void)_addCache:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  connections = self->_connections;
  if (!connections)
  {
    id v5 = +[NSHashTable weakObjectsHashTable];
    v6 = self->_connections;
    self->_connections = v5;

    connections = self->_connections;
  }
  [(NSHashTable *)connections addObject:v7];
}

- (void)_removeCache:(id)a3
{
  sharedQueue = self->_sharedQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(sharedQueue);
  [(NSHashTable *)self->_connections removeObject:v5];

  connections = self->_connections;
  if (connections && ![(NSHashTable *)connections count])
  {
    id v7 = self->_connections;
    self->_connections = 0;
  }
}

- (void)_closeCache:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_sharedQueue);
  if (v4)
  {
    sharedQueue = self->_sharedQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000D9B54;
    v6[3] = &unk_1004110B0;
    id v7 = v4;
    uint64_t v8 = self;
    dispatch_sync(sharedQueue, v6);
  }
}

- (void)_invalidateConnections
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  id v6 = [(NSHashTable *)self->_connections objectEnumerator];
  uint64_t v3 = [v6 nextObject];
  if (v3)
  {
    id v4 = (void *)v3;
    do
    {
      [v4 _invalidate];
      uint64_t v5 = [v6 nextObject];

      id v4 = (void *)v5;
    }
    while (v5);
  }
}

- (BOOL)_removeDatabaseAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBCKCacheTracker _removeDatabaseAtPath:error:]", "MBCKCache.m", 214, "path");
  }
  if (!a4) {
    __assert_rtn("-[MBCKCacheTracker _removeDatabaseAtPath:error:]", "MBCKCache.m", 215, "error");
  }
  id v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  uint64_t v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing the cache db at %@", buf, 0xCu);
    v29 = v7;
    _MBLog();
  }

  [(MBCKCacheTracker *)self _invalidateConnections];
  v9 = +[NSFileManager defaultManager];
  if ([v9 fileExistsAtPath:v7])
  {
    id v36 = 0;
    unsigned __int8 v10 = [v9 removeItemAtPath:v7 error:&v36];
    id v11 = v36;
    id v12 = v11;
    if ((v10 & 1) == 0)
    {
      if ([v11 code] != (id)4
        || ([v12 domain],
            v13 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v14 = [v13 isEqualToString:NSCocoaErrorDomain],
            v13,
            (v14 & 1) == 0))
      {
        int v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v39 = v7;
          __int16 v40 = 2112;
          id v41 = v12;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to delete %@: %@", buf, 0x16u);
          _MBLog();
        }

        id v12 = v12;
        BOOL v16 = 0;
        *a4 = v12;
        goto LABEL_31;
      }
    }
  }
  else
  {
    id v12 = 0;
  }
  MBSQLiteJournalSuffixes();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v18)
  {
    id v19 = v18;
    v30 = a4;
    uint64_t v20 = *(void *)v33;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = objc_msgSend(v7, "stringByAppendingString:", *(void *)(*((void *)&v32 + 1) + 8 * i), v29);

        if ([v9 fileExistsAtPath:v22])
        {
          id v31 = 0;
          unsigned __int8 v23 = [v9 removeItemAtPath:v22 error:&v31];
          id v24 = v31;
          id v12 = v24;
          if ((v23 & 1) == 0)
          {
            if ([v24 code] != (id)4
              || ([v12 domain],
                  uint64_t v25 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v26 = [v25 isEqualToString:NSCocoaErrorDomain],
                  v25,
                  (v26 & 1) == 0))
            {
              v27 = MBGetDefaultLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v39 = v22;
                __int16 v40 = 2112;
                id v41 = v12;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to delete %@: %@", buf, 0x16u);
                _MBLog();
              }

              id v12 = v12;
              id *v30 = v12;

              BOOL v16 = 0;
              goto LABEL_30;
            }
          }
        }
        else
        {
          id v12 = 0;
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_30:

LABEL_31:
  return v16;
}

- (void)_removeCorruptDatabaseWithError:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKCacheTracker _removeCorruptDatabaseWithError:]", "MBCKCache.m", 269, "error");
  }
  uint64_t v5 = v4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  uint64_t v6 = [(MBCKCacheTracker *)self path];
  if (!v6) {
    __assert_rtn("-[MBCKCacheTracker _removeCorruptDatabaseWithError:]", "MBCKCache.m", 272, "path");
  }
  id v7 = (void *)v6;
  uint64_t v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v7;
    __int16 v31 = 2112;
    id v32 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "The database at %@ is corrupted and will be removed: %@", buf, 0x16u);
    id v24 = v7;
    id v25 = v5;
    _MBLog();
  }

  [(MBCKCacheTracker *)self _invalidateConnections];
  if (MBIsInternalInstall())
  {
    v9 = MBGetCacheDir();
    if (!v9) {
      __assert_rtn("-[MBCKCacheTracker _removeCorruptDatabaseWithError:]", "MBCKCache.m", 281, "dir");
    }
    unsigned __int8 v10 = v9;
    uint64_t v11 = [v9 stringByAppendingPathComponent:@"cloudkit_cache_corrupted.db"];
    if (!v11) {
      __assert_rtn("-[MBCKCacheTracker _removeCorruptDatabaseWithError:]", "MBCKCache.m", 283, "destinationPath");
    }
    id v12 = (void *)v11;
    id v28 = 0;
    unsigned __int8 v13 = +[MBSQLiteFileHandle copySQLiteFileAtPath:v7 toPath:v11 error:&v28];
    id v14 = v28;
    if ((v13 & 1) == 0)
    {
      int v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v30 = v7;
        __int16 v31 = 2112;
        id v32 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to copy the SQLite file at %@: %@", buf, 0x16u);
        id v24 = v7;
        id v25 = v14;
        _MBLog();
      }
    }
  }
  id v27 = 0;
  unsigned __int8 v16 = -[MBCKCacheTracker _removeDatabaseAtPath:error:](self, "_removeDatabaseAtPath:error:", v7, &v27, v24, v25);
  id v17 = v27;
  if ((v16 & 1) == 0)
  {
    uint64_t v20 = MBGetDefaultLog();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_22:

      goto LABEL_23;
    }
    *(_DWORD *)buf = 138412546;
    id v30 = v7;
    __int16 v31 = 2112;
    id v32 = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to delete the database at %@: %@", buf, 0x16u);
LABEL_21:
    _MBLog();
    goto LABEL_22;
  }
  if (!MBIsInternalInstall()) {
    goto LABEL_23;
  }
  id v18 = [v5 domain];
  unsigned int v19 = [v18 isEqualToString:PQLSqliteErrorDomain];

  if (!v19)
  {
    uint64_t v20 = MBGetDefaultLog();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 138412290;
    id v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Removed cache database: %@", buf, 0xCu);
    goto LABEL_21;
  }
  if ([v5 code] != (id)13)
  {
    uint64_t v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      id v21 = [v5 code];
      id v22 = [v5 extendedSqliteCode];
      unsigned __int8 v23 = [v5 description];
      *(_DWORD *)buf = 134218498;
      id v30 = v21;
      __int16 v31 = 2048;
      id v32 = v22;
      __int16 v33 = 2112;
      long long v34 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Removed cache database, code:%ld, extendedCode:%ld, description:\"%@\"", buf, 0x20u);

      [v5 code];
      [v5 extendedSqliteCode];
      unsigned __int8 v26 = [v5 description];
      _MBLog();
    }
    goto LABEL_22;
  }
LABEL_23:
}

- (BOOL)_resetDatabaseForAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!a4) {
    __assert_rtn("-[MBCKCacheTracker _resetDatabaseForAccount:error:]", "MBCKCache.m", 305, "error");
  }
  id v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  uint64_t v8 = [(MBCKCacheTracker *)self path];
  if (!v8) {
    __assert_rtn("-[MBCKCacheTracker _resetDatabaseForAccount:error:]", "MBCKCache.m", 308, "path");
  }
  v9 = (void *)v8;
  unsigned __int8 v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resetting the cache db at %{public}@", buf, 0xCu);
    id v21 = v9;
    _MBLog();
  }

  uint64_t v11 = [v7 persona];
  [v11 setPreferencesValue:0 forKey:@"SyncZoneFetched"];

  [(MBCKCacheTracker *)self _invalidateConnections];
  if (MBIsInternalInstall())
  {
    id v12 = [v9 stringByDeletingLastPathComponent];
    if (!v12) {
      __assert_rtn("-[MBCKCacheTracker _resetDatabaseForAccount:error:]", "MBCKCache.m", 323, "dir");
    }
    unsigned __int8 v13 = v12;
    uint64_t v14 = [v12 stringByAppendingPathComponent:@"cloudkit_cache_previous.db"];
    if (!v14) {
      __assert_rtn("-[MBCKCacheTracker _resetDatabaseForAccount:error:]", "MBCKCache.m", 325, "destinationPath");
    }
    int v15 = (void *)v14;
    id v23 = 0;
    unsigned __int8 v16 = +[MBSQLiteFileHandle copySQLiteFileAtPath:v9 toPath:v14 error:&v23];
    id v17 = v23;
    if ((v16 & 1) == 0)
    {
      id v18 = MBGetDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v25 = v9;
        __int16 v26 = 2114;
        id v27 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to copy the SQLite file at %{public}@: %{public}@", buf, 0x16u);
        id v21 = v9;
        id v22 = v17;
        _MBLog();
      }
    }
  }
  BOOL v19 = -[MBCKCacheTracker _removeDatabaseAtPath:error:](self, "_removeDatabaseAtPath:error:", v9, a4, v21, v22);

  return v19;
}

- (BOOL)resetDatabaseForAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_sharedQueue);
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_1000D9658;
  id v23 = sub_1000D9668;
  id v24 = 0;
  uint64_t v15 = 0;
  unsigned __int8 v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  sharedQueue = self->_sharedQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000DA958;
  v11[3] = &unk_100412C10;
  unsigned __int8 v13 = &v15;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  uint64_t v14 = &v19;
  dispatch_sync(sharedQueue, v11);
  if (*((unsigned char *)v16 + 24))
  {
    LOBYTE(a4) = 1;
  }
  else
  {
    v9 = (void *)v20[5];
    if (!v9) {
      __assert_rtn("-[MBCKCacheTracker resetDatabaseForAccount:error:]", "MBCKCache.m", 344, "localError");
    }
    if (a4)
    {
      *a4 = v9;
      LOBYTE(a4) = *((unsigned char *)v16 + 24) != 0;
    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return (char)a4;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (OS_dispatch_queue)sharedQueue
{
  return self->_sharedQueue;
}

- (void)setSharedQueue:(id)a3
{
}

- (NSHashTable)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_sharedQueue, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_readOnlyCache, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end