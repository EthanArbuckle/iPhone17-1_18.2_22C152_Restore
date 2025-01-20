@interface SHClusterMetadataQuery
+ (BOOL)writeMetadata:(id)a3 toDatabaseAtLocation:(id)a4 error:(id *)a5;
+ (id)dateFormatter;
+ (id)metadataFromDatabaseAtLocation:(id)a3 error:(id *)a4;
+ (id)stringFromStoreType:(int64_t)a3;
+ (int64_t)dataStoreTypeFromString:(id)a3;
@end

@implementation SHClusterMetadataQuery

+ (int64_t)dataStoreTypeFromString:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = 1;
  v6 = [a1 stringFromStoreType:1];
  char v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    int64_t v5 = 2;
    v8 = [a1 stringFromStoreType:2];
    char v9 = [v4 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      v10 = shcore_log_object();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl(&dword_2266BF000, v10, OS_LOG_TYPE_ERROR, "Unknown database type %@, assuming it is tracks", (uint8_t *)&v12, 0xCu);
      }

      int64_t v5 = 1;
    }
  }

  return v5;
}

+ (id)stringFromStoreType:(int64_t)a3
{
  if (a3 == 1) {
    return @"tracks";
  }
  else {
    return @"artists";
  }
}

+ (id)dateFormatter
{
  v2 = (void *)dateFormatter__dateFormatter;
  if (!dateFormatter__dateFormatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F088C0]);
    id v4 = (void *)dateFormatter__dateFormatter;
    dateFormatter__dateFormatter = (uint64_t)v3;

    [(id)dateFormatter__dateFormatter setFormatOptions:1907];
    v2 = (void *)dateFormatter__dateFormatter;
  }
  return v2;
}

+ (id)metadataFromDatabaseAtLocation:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v14 = 0;
  if (+[SHSQLiteUtils openDatabase:&v14 atURL:v6 error:a4])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    id v23 = 0;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __63__SHClusterMetadataQuery_metadataFromDatabaseAtLocation_error___block_invoke;
    v13[3] = &unk_2647AD1A8;
    v13[4] = &buf;
    v13[5] = a1;
    +[SHSQLiteUtils runSQL:@"select type, storefront, hash, creationDate from Metadata LIMIT 1" onDatabase:v14 replacingTokens:MEMORY[0x263EFFA68] withObjects:MEMORY[0x263EFFA68] rowHandler:v13 error:a4];
    if (!a4 || *(void *)(*((void *)&buf + 1) + 40))
    {
      if (!a4)
      {
LABEL_14:
        +[SHSQLiteUtils closeDatabase:v14 error:0];
        a4 = (id *)*(id *)(*((void *)&buf + 1) + 40);
        _Block_object_dispose(&buf, 8);

        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v17 = *MEMORY[0x263F07F80];
      v18 = @"Failed to read the database metadata";
      char v7 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      *a4 = +[SHInsightsError errorWithCode:201 underlyingError:0 keyOverrides:v7];
    }
    if (*a4)
    {
      v10 = shcore_log_object();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = *a4;
        *(_DWORD *)v15 = 138412290;
        id v16 = v11;
        _os_log_impl(&dword_2266BF000, v10, OS_LOG_TYPE_ERROR, "Error reading metadata %@", v15, 0xCu);
      }
    }
    goto LABEL_14;
  }
  if (a4)
  {
    v8 = shcore_log_object();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = *a4;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_2266BF000, v8, OS_LOG_TYPE_ERROR, "Failed to open database for metadata with error %@", (uint8_t *)&buf, 0xCu);
    }

    a4 = 0;
  }
LABEL_15:

  return a4;
}

void __63__SHClusterMetadataQuery_metadataFromDatabaseAtLocation_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = [*(id *)(a1 + 40) dateFormatter];
  int64_t v5 = sh_columnToText(a2, 3);
  id v6 = [v4 dateFromString:v5];

  uint64_t v7 = sh_columnToText(a2, 0);
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v10 = shcore_log_object();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_2266BF000, v10, OS_LOG_TYPE_ERROR, "Unreadable metadata, failing", v18, 2u);
    }
  }
  else
  {
    uint64_t v11 = [(id)objc_opt_class() dataStoreTypeFromString:v7];
    int v12 = [SHClusterMetadata alloc];
    id v13 = sh_columnToText(a2, 1);
    uint64_t v14 = sh_columnToText(a2, 2);
    uint64_t v15 = [(SHClusterMetadata *)v12 initWithType:v11 storefront:v13 uniqueHash:v14 creationDate:v6];
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
}

+ (BOOL)writeMetadata:(id)a3 toDatabaseAtLocation:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v30 = 0;
  if (+[SHSQLiteUtils createDatabase:&v30 atURL:a4 error:a5])
  {
    if (+[SHSQLiteUtils database:v30 hasPopulatedTable:@"Metadata" error:0])
    {
      BOOL v9 = @"UPDATE Metadata set type = ?, hash = ?, storefront = ?, creationDate = ?";
    }
    else
    {
      BOOL v9 = @"INSERT into Metadata(type, hash, storefront, creationDate) VALUES(?,?,?,?)";
    }
    if (sqlite3_prepare_v2(v30, (const char *)-[__CFString cStringUsingEncoding:](v9, "cStringUsingEncoding:", 4, 0), -1, &pStmt, 0))
    {
      BOOL v10 = 0;
    }
    else
    {
      id v13 = pStmt;
      objc_msgSend((id)objc_opt_class(), "stringFromStoreType:", objc_msgSend(v8, "clusterType"));
      id v14 = objc_claimAutoreleasedReturnValue();
      sqlite3_bind_text(v13, 1, (const char *)[v14 cStringUsingEncoding:4], -1, 0);

      uint64_t v15 = pStmt;
      id v16 = [v8 uniqueHash];
      sqlite3_bind_text(v15, 2, (const char *)[v16 cStringUsingEncoding:4], -1, 0);

      uint64_t v17 = pStmt;
      id v18 = [v8 storefront];
      sqlite3_bind_text(v17, 3, (const char *)[v18 cStringUsingEncoding:4], -1, 0);

      v19 = [a1 dateFormatter];
      uint64_t v20 = [v8 creationDate];
      v21 = [v19 stringFromDate:v20];

      v22 = pStmt;
      id v23 = v21;
      sqlite3_bind_text(v22, 4, (const char *)[v23 cStringUsingEncoding:4], -1, 0);
      int v24 = sqlite3_step(pStmt);
      BOOL v10 = v24 == 101;
      if (v24 != 101)
      {
        v25 = sqlite3_errmsg(v30);
        v26 = shcore_log_object();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = [NSString stringWithCString:v25 encoding:4];
          *(_DWORD *)long long buf = 138412290;
          v32 = v27;
          _os_log_impl(&dword_2266BF000, v26, OS_LOG_TYPE_ERROR, "Error updating metadata %@", buf, 0xCu);
        }
        if (a5)
        {
          *a5 = +[SHInsightsError errorWithCode:201 underlyingError:0];
        }
      }
    }
    sqlite3_finalize(pStmt);
    +[SHSQLiteUtils closeDatabase:v30 error:0];
  }
  else
  {
    uint64_t v11 = shcore_log_object();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (a5) {
        int v12 = (__CFString *)*a5;
      }
      else {
        int v12 = @"Unknown Error";
      }
      *(_DWORD *)long long buf = 138412290;
      v32 = v12;
      _os_log_impl(&dword_2266BF000, v11, OS_LOG_TYPE_ERROR, "Failed to open database for metadata with error %@", buf, 0xCu);
    }

    BOOL v10 = 0;
  }

  return v10;
}

@end