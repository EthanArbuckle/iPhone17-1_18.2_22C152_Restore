@interface SHClusterStatementRunner
+ (id)supportedKeys;
- (NSArray)validDatabaseKeys;
- (NSURL)databaseURL;
- (SHClusterStatementRunner)initWithDatabaseURL:(id)a3;
- (id)mediaItemsAtCohesionLevel:(int64_t)a3 forQueryMediaIDs:(id)a4 filteredBySeedMediaIDs:(id)a5 error:(id *)a6;
- (id)mediaItemsFromPropertyCollection:(id)a3 error:(id *)a4;
- (id)mediaItemsSimilarToMediaItemValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (id)mediaItemsWithQuery:(id)a3 tokens:(id)a4 objects:(id)a5 error:(id *)a6;
- (id)supportedKeysForDatabase;
- (id)supportedKeysForDatabaseAsString;
- (id)supportedKeysForDatabaseAsStringWithPrefix:(id)a3;
- (sqlite3)db;
- (void)dealloc;
@end

@implementation SHClusterStatementRunner

- (void)dealloc
{
  db = self->_db;
  if (db) {
    +[SHSQLiteUtils closeDatabase:db error:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)SHClusterStatementRunner;
  [(SHClusterStatementRunner *)&v4 dealloc];
}

- (SHClusterStatementRunner)initWithDatabaseURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHClusterStatementRunner;
  v6 = [(SHClusterStatementRunner *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseURL, a3);
    uint64_t v8 = [(SHClusterStatementRunner *)v7 supportedKeysForDatabase];
    validDatabaseKeys = v7->_validDatabaseKeys;
    v7->_validDatabaseKeys = (NSArray *)v8;
  }
  return v7;
}

- (sqlite3)db
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  p_db = &self->_db;
  result = self->_db;
  if (!result)
  {
    id v5 = [(SHClusterStatementRunner *)self databaseURL];
    id v9 = 0;
    BOOL v6 = +[SHSQLiteUtils openDatabase:p_db atURL:v5 error:&v9];
    id v7 = v9;

    if (!v6)
    {
      uint64_t v8 = sh_log_object();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v7;
        _os_log_impl(&dword_2266BF000, v8, OS_LOG_TYPE_ERROR, "Failed to open database for artist query %@", buf, 0xCu);
      }
    }
    return *p_db;
  }
  return result;
}

+ (id)supportedKeys
{
  v7[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = *MEMORY[0x263F17800];
  v7[0] = *MEMORY[0x263F177B8];
  v7[1] = v3;
  v7[2] = *MEMORY[0x263F177A8];
  objc_super v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
  id v5 = [v2 setWithArray:v4];

  return v5;
}

- (id)supportedKeysForDatabase
{
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  objc_super v4 = [(SHClusterStatementRunner *)self db];
  id v11 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__SHClusterStatementRunner_supportedKeysForDatabase__block_invoke;
  v12[3] = &unk_2647AD360;
  id v13 = v3;
  id v5 = v3;
  +[SHSQLiteUtils runSQL:@"PRAGMA table_info('MediaItems')" onDatabase:v4 replacingTokens:MEMORY[0x263EFFA68] withObjects:MEMORY[0x263EFFA68] rowHandler:v12 error:&v11];
  id v6 = v11;
  id v7 = [(id)objc_opt_class() supportedKeys];
  uint64_t v8 = (void *)[v7 mutableCopy];

  [v8 intersectSet:v5];
  id v9 = [v8 allObjects];

  return v9;
}

void __52__SHClusterStatementRunner_supportedKeysForDatabase__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  v2 = *(void **)(a1 + 32);
  sh_columnToText(a2, 1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (id)mediaItemsSimilarToMediaItemValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  v20[2] = *MEMORY[0x263EF8340];
  uint64_t v8 = NSString;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SHClusterStatementRunner *)self supportedKeysForDatabaseAsString];
  uint64_t v12 = [v8 stringWithFormat:@"select %@ from MediaItems where cohesion = (select cohesion from MediaItems where %@ = <MEDIA_NAME> COLLATE %@) and %@ != <MEDIA_NAME2> COLLATE %@", v11, v9, SHInsightsCustomCollation, v9, SHInsightsCustomCollation];

  id v19 = v10;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
  v20[0] = v13;
  id v18 = v10;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  v20[1] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];

  v16 = [(SHClusterStatementRunner *)self mediaItemsWithQuery:v12 tokens:&unk_26DA45090 objects:v15 error:a5];

  return v16;
}

- (id)mediaItemsFromPropertyCollection:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = NSString;
  id v7 = a3;
  uint64_t v8 = [(SHClusterStatementRunner *)self supportedKeysForDatabaseAsString];
  id v9 = [v7 property];
  id v10 = [v6 stringWithFormat:@"select %@ from MediaItems where %@ COLLATE %@ in (<MEDIA_IDS>)", v8, v9, SHInsightsCustomCollation];

  id v11 = [v7 collection];

  uint64_t v12 = [v11 allObjects];
  v16[0] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  v14 = [(SHClusterStatementRunner *)self mediaItemsWithQuery:v10 tokens:&unk_26DA450A8 objects:v13 error:a4];

  return v14;
}

- (id)mediaItemsWithQuery:(id)a3 tokens:(id)a4 objects:(id)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = (void *)MEMORY[0x263EFF9C0];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_msgSend(v10, "setWithCapacity:", objc_msgSend(v11, "count"));
  v15 = [(SHClusterStatementRunner *)self db];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __69__SHClusterStatementRunner_mediaItemsWithQuery_tokens_objects_error___block_invoke;
  v24 = &unk_2647AD388;
  v25 = self;
  id v16 = v14;
  id v26 = v16;
  LOBYTE(self) = +[SHSQLiteUtils runSQL:v13 onDatabase:v15 replacingTokens:v12 withObjects:v11 rowHandler:&v21 error:a6];

  if (self)
  {
    v17 = objc_msgSend(v16, "copy", v21, v22, v23, v24, v25);
  }
  else
  {
    id v18 = sh_log_object();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      if (a6) {
        id v19 = (__CFString *)*a6;
      }
      else {
        id v19 = &stru_26DA42830;
      }
      *(_DWORD *)buf = 138412290;
      v28 = v19;
      _os_log_impl(&dword_2266BF000, v18, OS_LOG_TYPE_ERROR, "Failed to perform artists query %@", buf, 0xCu);
    }

    v17 = 0;
  }

  return v17;
}

void __69__SHClusterStatementRunner_mediaItemsWithQuery_tokens_objects_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v13 = [MEMORY[0x263EFF9A0] dictionary];
  objc_super v4 = [*(id *)(a1 + 32) validDatabaseKeys];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = sh_columnToText(a2, v6);
      uint64_t v8 = [*(id *)(a1 + 32) validDatabaseKeys];
      id v9 = [v8 objectAtIndexedSubscript:v6];
      [v13 setValue:v7 forKey:v9];

      ++v6;
      id v10 = [*(id *)(a1 + 32) validDatabaseKeys];
      unint64_t v11 = [v10 count];
    }
    while (v11 > v6);
  }
  id v12 = [MEMORY[0x263F17788] mediaItemWithProperties:v13];
  [*(id *)(a1 + 40) addObject:v12];
}

- (id)mediaItemsAtCohesionLevel:(int64_t)a3 forQueryMediaIDs:(id)a4 filteredBySeedMediaIDs:(id)a5 error:(id *)a6
{
  v41[2] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = NSString;
  id v11 = a5;
  id v12 = [(SHClusterStatementRunner *)self supportedKeysForDatabaseAsStringWithPrefix:@"t1."];
  id v13 = [v9 property];
  v14 = [v9 property];
  uint64_t v15 = [v10 stringWithFormat:@"select %@ from MediaItems t1, Cohesion c1 INNER JOIN (select  c2.high, c2.medium, c2.low from MediaItems t2, Cohesion c2 where t2.%@ in (<SEED_MEDIA_IDS>) AND t2.cohesion = c2.id order by %@) as s1 ON s1.low = c1.low", v12, v13, v14];

  v36 = (void *)v15;
  id v16 = [MEMORY[0x263F089D8] stringWithString:v15];
  v17 = v16;
  if (a3 == 2)
  {
    id v18 = @" AND s1.medium = c1.medium";
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    id v18 = @" AND s1.high = c1.high AND s1.medium = c1.medium";
  }
  [v16 appendString:v18];
LABEL_6:
  id v19 = [v9 property];
  v20 = [v9 property];
  [v17 appendFormat:@" where t1.%@ in (<QUERY_MEDIA_IDS>) AND t1.cohesion = c1.id order by %@", v19, v20];

  uint64_t v21 = [MEMORY[0x263EFF9C0] set];
  uint64_t v22 = [(SHClusterStatementRunner *)self db];
  v23 = [v11 collection];

  v24 = [v23 allObjects];
  v41[0] = v24;
  v25 = [v9 collection];
  id v26 = [v25 allObjects];
  v41[1] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __100__SHClusterStatementRunner_mediaItemsAtCohesionLevel_forQueryMediaIDs_filteredBySeedMediaIDs_error___block_invoke;
  v37[3] = &unk_2647AD388;
  v37[4] = self;
  id v28 = v21;
  uint64_t v29 = v17;
  id v30 = v28;
  id v38 = v28;
  LOBYTE(v22) = +[SHSQLiteUtils runSQL:v29 onDatabase:v22 replacingTokens:&unk_26DA450C0 withObjects:v27 rowHandler:v37 error:a6];

  if (v22)
  {

    v31 = (void *)[v30 copy];
  }
  else
  {
    v32 = sh_log_object();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      if (a6) {
        v33 = (__CFString *)*a6;
      }
      else {
        v33 = &stru_26DA42830;
      }
      *(_DWORD *)buf = 138412290;
      v40 = v33;
      _os_log_impl(&dword_2266BF000, v32, OS_LOG_TYPE_ERROR, "Failed to query database %@", buf, 0xCu);
    }

    v31 = 0;
  }

  return v31;
}

void __100__SHClusterStatementRunner_mediaItemsAtCohesionLevel_forQueryMediaIDs_filteredBySeedMediaIDs_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  objc_super v4 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = [*(id *)(a1 + 32) validDatabaseKeys];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = sh_columnToText(a2, v7);
      id v9 = [*(id *)(a1 + 32) validDatabaseKeys];
      id v10 = [v9 objectAtIndexedSubscript:v7];
      [v4 setValue:v8 forKey:v10];

      ++v7;
      id v11 = [*(id *)(a1 + 32) validDatabaseKeys];
      unint64_t v12 = [v11 count];
    }
    while (v12 > v7);
  }
  id v13 = [MEMORY[0x263F17788] mediaItemWithProperties:v4];
  if (v13)
  {
    [*(id *)(a1 + 40) addObject:v13];
  }
  else
  {
    v14 = sh_log_object();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_2266BF000, v14, OS_LOG_TYPE_ERROR, "Failed get a trackID from tracks query", v15, 2u);
    }
  }
}

- (id)supportedKeysForDatabaseAsString
{
  return [(SHClusterStatementRunner *)self supportedKeysForDatabaseAsStringWithPrefix:&stru_26DA42830];
}

- (id)supportedKeysForDatabaseAsStringWithPrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F089D8] string];
  uint64_t v6 = [(SHClusterStatementRunner *)self validDatabaseKeys];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      [v5 appendString:v4];
      id v9 = [(SHClusterStatementRunner *)self validDatabaseKeys];
      id v10 = [v9 objectAtIndexedSubscript:v8];
      [v5 appendString:v10];

      id v11 = [(SHClusterStatementRunner *)self validDatabaseKeys];
      uint64_t v12 = [v11 count] - 1;

      if (v8 != v12) {
        [v5 appendString:@", "];
      }
      ++v8;
      id v13 = [(SHClusterStatementRunner *)self validDatabaseKeys];
      unint64_t v14 = [v13 count];
    }
    while (v14 > v8);
  }

  return v5;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (NSArray)validDatabaseKeys
{
  return self->_validDatabaseKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validDatabaseKeys, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

@end