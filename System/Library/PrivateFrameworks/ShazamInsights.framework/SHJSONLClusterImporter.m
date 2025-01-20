@interface SHJSONLClusterImporter
- (BOOL)createTables:(sqlite3 *)a3 error:(id *)a4;
- (BOOL)insert:(sqlite3 *)a3 appleMusicID:(id)a4 cohesionID:(int64_t)a5;
- (BOOL)loadDataFromFileInfo:(id)a3 withMetadata:(id)a4 toDestinationURL:(id)a5 error:(id *)a6;
- (int64_t)insert:(sqlite3 *)a3 low:(int)a4 medium:(int)a5 high:(int)a6;
@end

@implementation SHJSONLClusterImporter

- (BOOL)createTables:(sqlite3 *)a3 error:(id *)a4
{
  if (!+[SHSQLiteUtils runNoResultSQL:onDatabase:error:](SHSQLiteUtils, "runNoResultSQL:onDatabase:error:", @"CREATE TABLE if not exists Cohesion(id INTEGER PRIMARY KEY, high INTEGER, medium INTEGER, low INTEGER, CONSTRAINT constraint_name UNIQUE(low, medium, high) ON CONFLICT IGNORE)", a3, a4)|| !+[SHSQLiteUtils runNoResultSQL:@"CREATE TABLE if not exists MediaItems(sh_appleMusicID VARCHAR, cohesion INTEGER, FOREIGN KEY(cohesion) REFERENCES Cohesion(id))" onDatabase:a3 error:a4])
  {
    return 0;
  }
  return +[SHSQLiteUtils runNoResultSQL:@"CREATE TABLE if not exists Metadata(type VARCHAR, hash VARCHAR, storefront VARCHAR, creationDate DATE)" onDatabase:a3 error:a4];
}

- (int64_t)insert:(sqlite3 *)a3 low:(int)a4 medium:(int)a5 high:(int)a6
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(a3, (const char *)objc_msgSend(@"INSERT INTO Cohesion (low, medium, high) VALUES (?, ?, ?) returning id", "cStringUsingEncoding:", 4), -1, &ppStmt, 0)|| (sqlite3_bind_int(ppStmt, 1, a4), sqlite3_bind_int(ppStmt, 2, a5), sqlite3_bind_int(ppStmt, 3, a6), sqlite3_step(ppStmt) != 100))
  {
    int64_t v9 = -1;
  }
  else
  {
    int64_t v9 = sqlite3_column_int(ppStmt, 0);
  }
  sqlite3_finalize(ppStmt);
  return v9;
}

- (BOOL)insert:(sqlite3 *)a3 appleMusicID:(id)a4 cohesionID:(int64_t)a5
{
  id v7 = a4;
  ppStmt = 0;
  if (sqlite3_prepare_v2(a3, (const char *)objc_msgSend(@"INSERT INTO MediaItems (sh_appleMusicID, cohesion) VALUES (?, ?);",
                         "cStringUsingEncoding:",
                         4),
         -1,
         &ppStmt,
         0))
  {
    BOOL v8 = 0;
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)[v7 cStringUsingEncoding:4], -1, 0);
    sqlite3_bind_int64(ppStmt, 2, a5);
    BOOL v8 = sqlite3_step(ppStmt) == 101;
  }
  sqlite3_finalize(ppStmt);

  return v8;
}

- (BOOL)loadDataFromFileInfo:(id)a3 withMetadata:(id)a4 toDestinationURL:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = +[SHClusterImporterUtils buildTemporaryClusterURLWithError:a6];
  if (!v13) {
    goto LABEL_11;
  }
  uint64_t v25 = 0;
  +[SHSQLiteUtils createDatabase:&v25 atURL:v13 error:a6];
  if (!v25) {
    goto LABEL_11;
  }
  if (![(SHJSONLClusterImporter *)self createTables:v25 error:a6])
  {
    +[SHClusterImporterUtils clearTemporaryDatabaseFileAtURL:v13 withError:0];
LABEL_11:
    BOOL v20 = 0;
    goto LABEL_12;
  }
  +[SHSQLiteUtils startTransactionOnDatabase:v25];
  v14 = objc_alloc_init(SHClusterJSONLReader);
  v15 = [v10 dataFilePathURL];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __83__SHJSONLClusterImporter_loadDataFromFileInfo_withMetadata_toDestinationURL_error___block_invoke;
  v23[3] = &unk_2647AD050;
  v23[4] = self;
  v23[5] = v25;
  id v24 = 0;
  v22 = v14;
  BOOL v16 = [(SHClusterJSONLReader *)v14 readDataLineByLineFromURL:v15 error:&v24 callback:v23];
  id v17 = v24;

  +[SHSQLiteUtils commitTransactionOnDatabase:v25];
  if (a6 && v17)
  {
    *a6 = +[SHInsightsError errorWithCode:201 underlyingError:v17];
  }
  +[SHSQLiteUtils closeDatabase:v25 error:0];
  if (v16)
  {
    BOOL v18 = +[SHClusterImporterUtils copyDatabaseFromURL:v13 toDatabaseDestinationURL:v12 error:a6];
    +[SHClusterImporterUtils clearTemporaryDatabaseFileAtURL:v13 withError:0];
    v19 = v22;
    BOOL v20 = v18
       && +[SHClusterMetadataQuery writeMetadata:v11 toDatabaseAtLocation:v12 error:a6];
  }
  else
  {
    +[SHClusterImporterUtils clearTemporaryDatabaseFileAtURL:v13 withError:0];
    BOOL v20 = 0;
    v19 = v22;
  }

LABEL_12:
  return v20;
}

void __83__SHJSONLClusterImporter_loadDataFromFileInfo_withMetadata_toDestinationURL_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "insert:low:medium:high:", *(void *)(a1 + 40), objc_msgSend(a4, "intValue"), objc_msgSend(v10, "intValue"), objc_msgSend(v9, "intValue"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(a1 + 32), "insert:appleMusicID:cohesionID:", *(void *)(a1 + 40), *(void *)(*((void *)&v18 + 1) + 8 * v17++), v12, (void)v18);
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

@end