@interface MBCKRefreshManifestDomainCache
- (BOOL)_addReferences:(id)a3 forManifest:(id)a4 isPlaceholder:(BOOL)a5 error:(id *)a6;
- (BOOL)addFileReferences:(id)a3 forManifest:(id)a4 error:(id *)a5;
- (BOOL)addPlaceholderReferences:(id)a3 forManifest:(id)a4 error:(id *)a5;
- (BOOL)close:(id *)a3;
- (MBCKRefreshManifestDomainCache)initWithCacheDirPath:(id)a3 error:(id *)a4;
- (MBSQLiteDB)database;
- (id)domainNameForFileRecord:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)dumpContentsToLog;
- (void)setDatabase:(id)a3;
@end

@implementation MBCKRefreshManifestDomainCache

- (MBCKRefreshManifestDomainCache)initWithCacheDirPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBCKRefreshManifestDomainCache initWithCacheDirPath:error:]", "MBCKRefreshManifestDomainCache.m", 41, "cacheDirPath");
  }
  if (!a4) {
    __assert_rtn("-[MBCKRefreshManifestDomainCache initWithCacheDirPath:error:]", "MBCKRefreshManifestDomainCache.m", 42, "error");
  }
  v7 = v6;
  v8 = [v6 stringByAppendingPathComponent:@"cloudkit_cache_refresh_temp.db"];
  v20.receiver = self;
  v20.super_class = (Class)MBCKRefreshManifestDomainCache;
  v9 = [(MBCKRefreshManifestDomainCache *)&v20 init];
  if (v9)
  {
    v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "=domaincache= Opening: %@", buf, 0xCu);
      _MBLog();
    }

    v11 = [[MBSQLiteDB alloc] initWithPath:v8 readOnly:0 shouldDeleteOnFailureToOpen:1 usePQLBatching:0 schemaCurrentVersion:1 schemaMinDatabaseVersionForUpgrade:0 error:a4 schemaUpgrades:0];
    database = v9->_database;
    v9->_database = v11;

    if (v9->_database)
    {
      v21[0] = @"CREATE TEMPORARY TABLE IF NOT EXISTS PendingFileIDToManifestID (referenceID TEXT PRIMARY KEY, manifestID TEXT NOT NULL);";
      v21[1] = @"CREATE TEMPORARY TABLE IF NOT EXISTS PendingPlaceholderIDToManifestID (referenceID TEXT PRIMARY KEY, manifestID TEXT NOT NULL);";
      v21[2] = @"CREATE TEMPORARY TABLE IF NOT EXISTS PendingManifestIDToDomainName (manifestID TEXT PRIMARY KEY, domainName TEXT NOT NULL);";
      v13 = +[NSArray arrayWithObjects:v21 count:3];
      unsigned __int8 v14 = [(MBSQLiteDB *)v9->_database executeStatements:v13 error:a4];
      v15 = MBGetDefaultLog();
      p_super = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v8;
          _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, "=domaincache= Opened: %@", buf, 0xCu);
          _MBLog();
        }
        goto LABEL_17;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v18 = *a4;
        *(_DWORD *)buf = 138412290;
        id v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "=domaincache= Failed to create temporary tables: %@", buf, 0xCu);
        _MBLog();
      }

      p_super = &v9->super;
    }
    else
    {
      p_super = MBGetDefaultLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        id v17 = *a4;
        *(_DWORD *)buf = 138412290;
        id v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "=domaincache= Failed to initialize: %@", buf, 0xCu);
        _MBLog();
      }
      v13 = v9;
    }
    v9 = 0;
LABEL_17:
  }
  return v9;
}

- (void)dealloc
{
  if (self->_database)
  {
    v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = [(MBSQLiteDB *)self->_database path];
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "=domaincache= Database (%@) should be closed before dealloc", buf, 0xCu);

      v5 = [(MBSQLiteDB *)self->_database path];
      _MBLog();
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)MBCKRefreshManifestDomainCache;
  [(MBCKRefreshManifestDomainCache *)&v6 dealloc];
}

- (BOOL)close:(id *)a3
{
  if (!self->_database) {
    __assert_rtn("-[MBCKRefreshManifestDomainCache close:]", "MBCKRefreshManifestDomainCache.m", 101, "_database");
  }
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = [(MBSQLiteDB *)self->_database path];
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "=domaincache= Closing: %@", buf, 0xCu);

    v11 = [(MBSQLiteDB *)self->_database path];
    _MBLog();
  }
  BOOL v7 = [(MBSQLiteDB *)self->_database close:a3];
  if (v7)
  {
    v8 = [(MBSQLiteDB *)self->_database path];
    +[MBSQLiteFileHandle removeAllSQLiteFilesAtPath:v8];

    database = self->_database;
    self->_database = 0;
  }
  return v7;
}

- (BOOL)addPlaceholderReferences:(id)a3 forManifest:(id)a4 error:(id *)a5
{
  return [(MBCKRefreshManifestDomainCache *)self _addReferences:a3 forManifest:a4 isPlaceholder:1 error:a5];
}

- (BOOL)addFileReferences:(id)a3 forManifest:(id)a4 error:(id *)a5
{
  return [(MBCKRefreshManifestDomainCache *)self _addReferences:a3 forManifest:a4 isPlaceholder:0 error:a5];
}

- (BOOL)_addReferences:(id)a3 forManifest:(id)a4 isPlaceholder:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!self->_database) {
    __assert_rtn("-[MBCKRefreshManifestDomainCache _addReferences:forManifest:isPlaceholder:error:]", "MBCKRefreshManifestDomainCache.m", 121, "_database");
  }
  v12 = v11;
  if (!v11) {
    __assert_rtn("-[MBCKRefreshManifestDomainCache _addReferences:forManifest:isPlaceholder:error:]", "MBCKRefreshManifestDomainCache.m", 122, "manifest");
  }
  if (!a6) {
    __assert_rtn("-[MBCKRefreshManifestDomainCache _addReferences:forManifest:isPlaceholder:error:]", "MBCKRefreshManifestDomainCache.m", 123, "error");
  }
  v13 = [v11 manifestID];
  if (!v13) {
    __assert_rtn("-[MBCKRefreshManifestDomainCache _addReferences:forManifest:isPlaceholder:error:]", "MBCKRefreshManifestDomainCache.m", 126, "manifestID");
  }
  unsigned __int8 v14 = v13;
  database = self->_database;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100106A54;
  void v21[3] = &unk_100413608;
  id v22 = v12;
  id v23 = v13;
  id v24 = v10;
  BOOL v25 = a5;
  id v16 = v10;
  id v17 = v14;
  id v18 = v12;
  unsigned __int8 v19 = [(MBSQLiteDB *)database performWithConnection:v21 error:a6];

  return v19;
}

- (id)domainNameForFileRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!self->_database) {
    __assert_rtn("-[MBCKRefreshManifestDomainCache domainNameForFileRecord:error:]", "MBCKRefreshManifestDomainCache.m", 162, "_database");
  }
  if (!a4) {
    __assert_rtn("-[MBCKRefreshManifestDomainCache domainNameForFileRecord:error:]", "MBCKRefreshManifestDomainCache.m", 163, "error");
  }
  BOOL v7 = v6;
  v8 = [v6 recordID];
  v9 = [v8 recordName];

  id v10 = +[MBCKFile fileIDFromRecordName:v9];
  id v11 = [(MBSQLiteDB *)self->_database fetchObjectOfClass:objc_opt_class(), a4, @"SELECT domainName FROM PendingManifestIDToDomainName WHERE manifestID IN (SELECT manifestID FROM PendingFileIDToManifestID WHERE referenceID = %@) LIMIT 1", v10 error sql];
  v12 = v11;
  if (*a4)
  {
    id v13 = 0;
  }
  else if (v11)
  {
    id v13 = v11;
  }
  else
  {
    uint64_t v14 = [(MBSQLiteDB *)self->_database fetchObjectOfClass:objc_opt_class(), a4, @"SELECT domainName FROM PendingManifestIDToDomainName WHERE manifestID IN (SELECT manifestID FROM PendingPlaceholderIDToManifestID WHERE referenceID = %@) LIMIT 1", v10 error sql];
    v15 = (void *)v14;
    if (*a4)
    {
      id v13 = 0;
    }
    else if (v14)
    {
      uint64_t v16 = +[MBDomain containerIDWithName:v14];
      if (!v16) {
        __assert_rtn("-[MBCKRefreshManifestDomainCache domainNameForFileRecord:error:]", "MBCKRefreshManifestDomainCache.m", 196, "baseContainerID");
      }
      id v17 = (void *)v16;
      uint64_t v18 = +[MBDomain placeholderNameWithAppID:v16];
      if (!v18) {
        __assert_rtn("-[MBCKRefreshManifestDomainCache domainNameForFileRecord:error:]", "MBCKRefreshManifestDomainCache.m", 198, "placeholderDomainName");
      }
      id v13 = (id)v18;
    }
    else
    {
      if ((atomic_exchange(&self->_alreadyDumped._Value, 1u) & 1) == 0) {
        [(MBCKRefreshManifestDomainCache *)self dumpContentsToLog];
      }
      +[MBError errorWithCode:1, @"No file record or pending file domain record found with fileID = %@", v10 format];
      id v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v13;
}

- (void)dumpContentsToLog
{
  v3 = [(MBSQLiteDB *)self->_database fetchSQL:@"SELECT referenceID, manifestID FROM PendingFileIDToManifestID"];
  id v16 = 0;
  [v3 enumerateWithError:&v16 block:&stru_100413648];
  id v4 = v16;

  if (v4)
  {
    v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "=domaincache= FileToManifest Error: %@", buf, 0xCu);
      id v12 = v4;
      _MBLog();
    }
  }
  id v6 = [(MBSQLiteDB *)self->_database fetchSQL:@"SELECT referenceID, manifestID FROM PendingPlaceholderIDToManifestID", v12];
  id v15 = v4;
  [v6 enumerateWithError:&v15 block:&stru_100413668];
  id v7 = v15;

  if (v7)
  {
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "=domaincache= PlaceholderToManifest Error: %@", buf, 0xCu);
      id v13 = v7;
      _MBLog();
    }
  }
  v9 = [(MBSQLiteDB *)self->_database fetchSQL:@"SELECT manifestID, domainName FROM PendingManifestIDToDomainName", v13];
  id v14 = v7;
  [v9 enumerateWithError:&v14 block:&stru_100413688];
  id v10 = v14;

  if (v10)
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "=domaincache= ManifestToDomainName Error: %@", buf, 0xCu);
      _MBLog();
    }
  }
}

- (MBSQLiteDB)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (void).cxx_destruct
{
}

@end