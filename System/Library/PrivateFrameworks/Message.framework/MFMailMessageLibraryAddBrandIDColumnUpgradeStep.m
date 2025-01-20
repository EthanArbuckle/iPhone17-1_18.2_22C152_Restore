@interface MFMailMessageLibraryAddBrandIDColumnUpgradeStep
+ (id)_businessesTableSchema;
+ (id)log;
+ (int)runWithConnection:(id)a3 databaseName:(id)a4;
@end

@implementation MFMailMessageLibraryAddBrandIDColumnUpgradeStep

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MFMailMessageLibraryAddBrandIDColumnUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_15 != -1) {
    dispatch_once(&log_onceToken_15, block);
  }
  v2 = (void *)log_log_15;
  return v2;
}

void __54__MFMailMessageLibraryAddBrandIDColumnUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_15;
  log_log_15 = (uint64_t)v1;
}

+ (int)runWithConnection:(id)a3 databaseName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 columnExists:@"brand_id" inTable:@"businesses" type:0])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"ALTER TABLE %@.%@ RENAME TO old_businesses;",
      v7,
    v10 = @"businesses");
    v11 = (sqlite3 *)[v6 sqlDB];
    v8 = v10;
    int v9 = sqlite3_exec(v11, (const char *)[v8 UTF8String], 0, 0, 0);
    if (v9)
    {
      v12 = +[MFMailMessageLibraryAddBrandIDColumnUpgradeStep log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[MFMailMessageLibraryAddBrandIDColumnUpgradeStep runWithConnection:databaseName:].cold.4();
      }
      goto LABEL_19;
    }
    v12 = [a1 _businessesTableSchema];
    v13 = [v12 definitionWithDatabaseName:v7];
    v14 = (sqlite3 *)[v6 sqlDB];
    id v15 = v13;
    int v9 = sqlite3_exec(v14, (const char *)[v15 UTF8String], 0, 0, 0);
    if (v9)
    {
      v16 = +[MFMailMessageLibraryAddBrandIDColumnUpgradeStep log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[MFMailMessageLibraryAddBrandIDColumnUpgradeStep runWithConnection:databaseName:]();
      }
    }
    else
    {
      int v9 = sqlite3_exec((sqlite3 *)[v6 sqlDB], "INSERT INTO businesses (ROWID, domain, address_comment) SELECT ROWID, domain, address_comment FROM old_businesses;",
             0,
             0,
             0);
      if (v9)
      {
        v16 = +[MFMailMessageLibraryAddBrandIDColumnUpgradeStep log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          +[MFMailMessageLibraryAddBrandIDColumnUpgradeStep runWithConnection:databaseName:]();
        }
      }
      else
      {
        int v9 = sqlite3_exec((sqlite3 *)[v6 sqlDB], "DROP TABLE old_businesses", 0, 0, 0);
        if (!v9)
        {
LABEL_18:

LABEL_19:
          goto LABEL_20;
        }
        v16 = +[MFMailMessageLibraryAddBrandIDColumnUpgradeStep log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          +[MFMailMessageLibraryAddBrandIDColumnUpgradeStep runWithConnection:databaseName:]();
        }
      }
    }

    goto LABEL_18;
  }
  v8 = +[MFMailMessageLibraryAddBrandIDColumnUpgradeStep log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "Brand ID column already exists, skipping upgrade step.", buf, 2u);
  }
  int v9 = 0;
LABEL_20:

  return v9;
}

+ (id)_businessesTableSchema
{
  v33[3] = *MEMORY[0x1E4F143B8];
  v27 = [MEMORY[0x1E4F60E80] textColumnWithName:@"domain" collation:2 nullable:1];
  v26 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"brand_id" nullable:1];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] textColumnWithName:@"address_comment" collation:2 nullable:0];
  v33[0] = v3;
  v33[1] = v27;
  v33[2] = v26;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  v5 = (void *)[v2 initWithName:@"businesses" rowIDType:2 columns:v4];

  v32[0] = @"address_comment";
  v32[1] = @"domain";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  [v5 addUniquenessConstraintForColumns:v6 conflictResolution:1];

  v31 = @"brand_id";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  [v5 addUniquenessConstraintForColumns:v7 conflictResolution:1];

  id v8 = objc_alloc(MEMORY[0x1E4F60E48]);
  int v9 = [v27 columnExpression];
  v10 = [v9 isNotNull];
  v30[0] = v10;
  v11 = [v26 columnExpression];
  v12 = [v11 isNull];
  v30[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v14 = (void *)[v8 initWithExpressions:v13];

  id v15 = objc_alloc(MEMORY[0x1E4F60E48]);
  v16 = [v27 columnExpression];
  v17 = [v16 isNull];
  v29[0] = v17;
  v18 = [v26 columnExpression];
  v19 = [v18 isNotNull];
  v29[1] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v21 = (void *)[v15 initWithExpressions:v20];

  id v22 = objc_alloc(MEMORY[0x1E4F60ED8]);
  v28[0] = v14;
  v28[1] = v21;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v24 = (void *)[v22 initWithExpressions:v23];

  [v5 addCheckConstraintForExpression:v24];
  return v5;
}

+ (void)runWithConnection:databaseName:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "Failed to drop old_businesses table", v2, v3, v4, v5, v6);
}

+ (void)runWithConnection:databaseName:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "Failed to drop populate businesses table with existing values", v2, v3, v4, v5, v6);
}

+ (void)runWithConnection:databaseName:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "Failed to create new businesses table", v2, v3, v4, v5, v6);
}

+ (void)runWithConnection:databaseName:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "Failed to rename businesses table", v2, v3, v4, v5, v6);
}

@end