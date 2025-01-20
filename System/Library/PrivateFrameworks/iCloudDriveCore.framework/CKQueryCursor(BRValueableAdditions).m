@interface CKQueryCursor(BRValueableAdditions)
+ (uint64_t)newFromSqliteStatement:()BRValueableAdditions atIndex:;
+ (uint64_t)newFromSqliteValue:()BRValueableAdditions;
- (void)sqliteBind:()BRValueableAdditions index:;
@end

@implementation CKQueryCursor(BRValueableAdditions)

+ (uint64_t)newFromSqliteValue:()BRValueableAdditions
{
  if (sqlite3_value_type(a3) == 4)
  {
    v4 = (void *)MEMORY[0x263F08928];
    uint64_t v5 = objc_opt_class();
    v6 = (void *)MEMORY[0x263EFF8F8];
    v7 = sqlite3_value_blob(a3);
    v8 = [v6 dataWithBytes:v7 length:sqlite3_value_bytes(a3)];
    uint64_t v9 = [v4 unarchivedObjectOfClass:v5 fromData:v8 error:0];
  }
  else
  {
    if (sqlite3_value_type(a3) != 5)
    {
      v11 = brc_bread_crumbs();
      v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        +[CKRecordID(BRCItemAdditions) newFromSqliteValue:]();
      }
    }
    return 0;
  }
  return v9;
}

+ (uint64_t)newFromSqliteStatement:()BRValueableAdditions atIndex:
{
  if (sqlite3_column_type(a3, iCol) == 4)
  {
    v6 = (void *)MEMORY[0x263F08928];
    uint64_t v7 = objc_opt_class();
    v8 = (void *)MEMORY[0x263EFF8F8];
    uint64_t v9 = sqlite3_column_blob(a3, iCol);
    v10 = objc_msgSend(v8, "dataWithBytes:length:", v9, sqlite3_column_bytes(a3, iCol));
    uint64_t v11 = [v6 unarchivedObjectOfClass:v7 fromData:v10 error:0];
  }
  else
  {
    if (sqlite3_column_type(a3, iCol) != 5)
    {
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        +[CKRecordID(BRCItemAdditions) newFromSqliteStatement:atIndex:]();
      }
    }
    return 0;
  }
  return v11;
}

- (void)sqliteBind:()BRValueableAdditions index:
{
  id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:0];
  sqlite3_bind_blob(a3, a4, (const void *)[v6 bytes], objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

@end