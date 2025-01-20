@interface MBFileHashDB
- (BOOL)addFilePath:(id)a3 forHash:(id)a4 error:(id *)a5;
- (BOOL)close:(id *)a3;
- (MBFileHashDB)initWithPath:(id)a3;
- (NSString)path;
- (id)filePathForHash:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation MBFileHashDB

- (MBFileHashDB)initWithPath:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MBFileHashDB;
  v5 = [(MBFileHashDB *)&v15 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    path = v5->_path;
    v5->_path = v6;

    v8 = [MBSQLiteDB alloc];
    v17[0] = @"CREATE TABLE IF NOT EXISTS Files (hash TEXT, path TEXT, PRIMARY KEY (hash));";
    v17[1] = @"CREATE INDEX IF NOT EXISTS FilesHashIdx ON Files(hash);";
    v9 = +[NSArray arrayWithObjects:v17 count:2];
    v10 = +[MBPQLSchemaUpgrade upgradeWithVersion:2 shouldVacuum:0 statements:v9];

    v16 = v10;
    v11 = +[NSArray arrayWithObjects:&v16 count:1];

    v12 = [(MBSQLiteDB *)v8 initWithPath:v4 readOnly:0 shouldDeleteOnFailureToOpen:1 usePQLBatching:1 schemaCurrentVersion:2 schemaMinDatabaseVersionForUpgrade:0 error:0 schemaUpgrades:v11];
    database = v5->_database;
    v5->_database = v12;
  }
  return v5;
}

- (void)dealloc
{
  if (self->_database)
  {
    v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      *(_DWORD *)buf = 138412290;
      v11 = path;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Database (%@) should be closed before dealloc", buf, 0xCu);
      v7 = self->_path;
      _MBLog();
    }
  }
  id v9 = 0;
  -[MBFileHashDB close:](self, "close:", &v9, v7);
  v5 = (NSString *)v9;
  if (v5)
  {
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error closing file hash DB: %@", buf, 0xCu);
      _MBLog();
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)MBFileHashDB;
  [(MBFileHashDB *)&v8 dealloc];
}

- (BOOL)close:(id *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  database = v4->_database;
  if (database)
  {
    unsigned __int8 v6 = [(MBSQLiteDB *)database close:a3];
    v7 = v4->_database;
    v4->_database = 0;
  }
  else
  {
    unsigned __int8 v6 = 1;
  }
  objc_sync_exit(v4);

  return v6;
}

- (id)filePathForHash:(id)a3 error:(id *)a4
{
  database = self->_database;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  objc_super v8 = [v6 base64EncodedStringWithOptions:0];

  id v9 = [(MBSQLiteDB *)database fetchObjectOfClass:v7, a4, @"SELECT path FROM Files WHERE hash = %@", v8 error sql];

  return v9;
}

- (BOOL)addFilePath:(id)a3 forHash:(id)a4 error:(id *)a5
{
  database = self->_database;
  id v8 = a3;
  id v9 = [a4 base64EncodedStringWithOptions:0];
  LOBYTE(a5) = [(MBSQLiteDB *)database executeWithError:a5, @"INSERT OR REPLACE INTO Files (hash, path) VALUES (%@, %@)", v9, v8 sql];

  return (char)a5;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end