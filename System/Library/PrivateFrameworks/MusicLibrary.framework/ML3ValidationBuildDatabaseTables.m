@interface ML3ValidationBuildDatabaseTables
@end

@implementation ML3ValidationBuildDatabaseTables

BOOL ___ML3ValidationBuildDatabaseTables_block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = +[ML3MusicLibrary allSchemaSQL];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = _ML3ValidationExecuteSQLArray(v2, v3);

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = 0;
      v15 = "Failed to build tables with schema.";
      v16 = (uint8_t *)&v23;
      goto LABEL_19;
    }
LABEL_20:

    int v13 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    return v13 != 0;
  }
  id v4 = *(id *)(a1 + 32);
  v5 = +[ML3MusicLibrary indexSchemaSQL];
  v6 = [v5 allObjects];
  char v7 = _ML3ValidationExecuteSQLArray(v4, v6);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = 0;
      v15 = "Failed to create indexes on database connection.";
      v16 = (uint8_t *)&v22;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  id v8 = *(id *)(a1 + 32);
  v9 = +[ML3MusicLibrary allTriggersSQL];
  char v10 = _ML3ValidationExecuteSQLArray(v8, v9);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = 0;
      v15 = "Failed to create triggers on database connection.";
      v16 = (uint8_t *)&v21;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ML3ValidationRunInitialInsertStatements(*(void **)(a1 + 32));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = 0;
      v15 = "Failed to complete initial insertion statements.";
      v16 = (uint8_t *)&v20;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v11 = *(void **)(a1 + 32);
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %d", 2220020);;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v11 executeUpdate:v12];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v15 = "Failed to set latest database version on connection.";
      v16 = buf;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) executeUpdate:@"ANALYZE"];
  int v13 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = 0;
      v15 = "Failed to prepare SQLite query optimizer.";
      v16 = (uint8_t *)&v18;
LABEL_19:
      _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_ERROR, v15, v16, 2u);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  return v13 != 0;
}

@end