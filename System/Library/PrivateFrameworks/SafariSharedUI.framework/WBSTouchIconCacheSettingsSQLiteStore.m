@interface WBSTouchIconCacheSettingsSQLiteStore
+ (Class)cacheSettingsEntryClass;
+ (int64_t)databaseSchemaVersion;
- (id)_createNewDatabaseSQLiteStatement;
- (id)_deleteAllEntriesSQLiteStatement;
- (id)_deleteEntrySQLiteStatementWithHost:(id)a3;
- (id)_insertEntrySQLiteStatementWithEntry:(id)a3;
- (id)_selectAllEntriesSQLiteStatement;
- (id)_selectEntrySQLiteStatementWithHost:(id)a3;
- (id)_statementsForMigrationToSchemaVersion:(int64_t)a3;
- (id)_updateEntrySQLiteStatementWithEntry:(id)a3;
@end

@implementation WBSTouchIconCacheSettingsSQLiteStore

+ (int64_t)databaseSchemaVersion
{
  return 4;
}

+ (Class)cacheSettingsEntryClass
{
  return (Class)objc_opt_class();
}

- (id)_selectAllEntriesSQLiteStatement
{
  id v3 = objc_alloc(MEMORY[0x1E4F983C8]);
  v4 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self database];
  v5 = (void *)[v3 initWithDatabase:v4 query:@"SELECT * FROM cache_settings"];

  return v5;
}

- (id)_createNewDatabaseSQLiteStatement
{
  id v3 = objc_alloc(MEMORY[0x1E4F983C8]);
  v4 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self database];
  v5 = (void *)[v3 initWithDatabase:v4 query:@"CREATE TABLE IF NOT EXISTS cache_settings (id INTEGER PRIMARY KEY AUTOINCREMENT,host TEXT NOT NULL UNIQUE,last_request_date REAL NOT NULL,last_request_was_in_user_loaded_page BOOLEAN NOT NULL DEFAULT 0,request_count INTEGER NOT NULL DEFAULT 0,icon_is_in_cache BOOLEAN NOT NULL DEFAULT 0,download_status_flags INTEGER NOT NULL DEFAULT 0,extracted_color BLOB NULL,transparency_analysis_result INTEGER NOT NULL DEFAULT 0,uuid TEXT NULL,last_response_status_code INTEGER NOT NULL DEFAULT 0)"];

  return v5;
}

- (id)_selectEntrySQLiteStatementWithHost:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F983C8]);
  v6 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self database];
  v7 = (void *)[v5 initWithDatabase:v6 query:@"SELECT * FROM cache_settings WHERE host = ? LIMIT 1"];

  [v7 bindString:v4 atParameterIndex:1];
  return v7;
}

- (id)_insertEntrySQLiteStatementWithEntry:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F983C8]);
  v6 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self database];
  v7 = (void *)[v5 initWithDatabase:v6, @"INSERT INTO cache_settings (host, last_request_date, last_request_was_in_user_loaded_page, request_count, icon_is_in_cache, download_status_flags, transparency_analysis_result, uuid, last_response_status_code) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" query];

  id v19 = [v4 host];
  v8 = [v4 lastRequestDate];
  [v8 timeIntervalSinceReferenceDate];
  uint64_t v18 = v9;
  unsigned __int8 v17 = [v4 lastRequestWasInUserLoadedWebpage];
  uint64_t v16 = [v4 requestCount];
  unsigned __int8 v15 = [v4 isIconInCache];
  uint64_t v14 = [v4 downloadStatusFlags];
  uint64_t v13 = [v4 transparencyAnalysisResult];
  id v12 = [v4 UUIDString];
  uint64_t v11 = [v4 lastResponseStatusCode];
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},double,BOOL,long,BOOL,unsigned long,long,NSString * {__strong},long>(v7, &v19, (double *)&v18, &v17, &v16, &v15, &v14, &v13, &v12, &v11);

  return v7;
}

- (id)_updateEntrySQLiteStatementWithEntry:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F983C8]);
  v6 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self database];
  v7 = (void *)[v5 initWithDatabase:v6, @"UPDATE cache_settings SET host = ?, last_request_date = ?, last_request_was_in_user_loaded_page = ?, request_count = ?, icon_is_in_cache = ?, download_status_flags = ?, transparency_analysis_result = ?, uuid = ?, last_response_status_code = ? WHERE id = ?" query];

  id v20 = [v4 host];
  v8 = [v4 lastRequestDate];
  [v8 timeIntervalSinceReferenceDate];
  uint64_t v19 = v9;
  unsigned __int8 v18 = [v4 lastRequestWasInUserLoadedWebpage];
  uint64_t v17 = [v4 requestCount];
  unsigned __int8 v16 = [v4 isIconInCache];
  uint64_t v15 = [v4 downloadStatusFlags];
  uint64_t v14 = [v4 transparencyAnalysisResult];
  id v13 = [v4 UUIDString];
  uint64_t v12 = [v4 lastResponseStatusCode];
  uint64_t v11 = [v4 databaseID];
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},double,BOOL,long,BOOL,unsigned long,long,NSString * {__strong},long,long>(v7, &v20, (double *)&v19, &v18, &v17, &v16, &v15, &v14, &v13, &v12, &v11);

  return v7;
}

- (id)_deleteEntrySQLiteStatementWithHost:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F983C8]);
  v6 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self database];
  v7 = (void *)[v5 initWithDatabase:v6 query:@"DELETE FROM cache_settings WHERE host = ?"];

  [v7 bindString:v4 atParameterIndex:1];
  return v7;
}

- (id)_deleteAllEntriesSQLiteStatement
{
  id v3 = objc_alloc(MEMORY[0x1E4F983C8]);
  id v4 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self database];
  id v5 = (void *)[v3 initWithDatabase:v4 query:@"DELETE FROM cache_settings"];

  return v5;
}

- (id)_statementsForMigrationToSchemaVersion:(int64_t)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() databaseSchemaVersion] != a3)
  {
    v10 = 0;
    goto LABEL_10;
  }
  if (a3 == 3)
  {
    id v5 = [NSString stringWithFormat:@"ALTER TABLE cache_settings ADD COLUMN uuid TEXT NULL"];
    id v11 = objc_alloc(MEMORY[0x1E4F983C8]);
    uint64_t v12 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self database];
    v8 = (void *)[v11 initWithDatabase:v12 query:v5];

    unsigned __int8 v18 = v8;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
LABEL_8:
    v10 = (void *)v13;
    goto LABEL_9;
  }
  if (a3 != 2)
  {
    id v5 = [NSString stringWithFormat:@"ALTER TABLE cache_settings ADD COLUMN last_response_status_code INTEGER NOT NULL DEFAULT 0"];
    id v14 = objc_alloc(MEMORY[0x1E4F983C8]);
    uint64_t v15 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self database];
    v8 = (void *)[v14 initWithDatabase:v15 query:v5];

    uint64_t v17 = v8;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    goto LABEL_8;
  }
  id v5 = [NSString stringWithFormat:@"DROP TABLE IF EXISTS cache_settings"];
  id v6 = objc_alloc(MEMORY[0x1E4F983C8]);
  v7 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self database];
  v8 = (void *)[v6 initWithDatabase:v7 query:v5];

  v19[0] = v8;
  uint64_t v9 = [(WBSTouchIconCacheSettingsSQLiteStore *)self _createNewDatabaseSQLiteStatement];
  v19[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];

LABEL_9:
LABEL_10:
  return v10;
}

@end