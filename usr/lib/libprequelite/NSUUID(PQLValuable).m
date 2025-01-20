@interface NSUUID(PQLValuable)
+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:;
+ (uint64_t)newFromSqliteValue:()PQLValuable;
- (uint64_t)sqliteBind:()PQLValuable index:;
@end

@implementation NSUUID(PQLValuable)

- (uint64_t)sqliteBind:()PQLValuable index:
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  v7[1] = 0;
  [a1 getUUIDBytes:v7];
  return sqlite3_bind_blob(a3, a4, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (sqlite3_column_type(a3, iCol) != 4)
  {
    if (sqlite3_column_type(a3, iCol) == 3)
    {
      v9 = sqlite3_column_text(a3, iCol);
      memset(uu, 0, sizeof(uu));
      if (!uuid_parse((const char *)v9, uu)) {
        return [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];
      }
    }
    return 0;
  }
  v6 = sqlite3_column_blob(a3, iCol);
  if (sqlite3_column_bytes(a3, iCol) != 16) {
    return 0;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F29128]);

  return [v7 initWithUUIDBytes:v6];
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (sqlite3_value_type(a3) != 4)
  {
    if (sqlite3_value_type(a3) == 3)
    {
      id v7 = sqlite3_value_text(a3);
      memset(uu, 0, sizeof(uu));
      if (!uuid_parse((const char *)v7, uu)) {
        return [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];
      }
    }
    return 0;
  }
  v4 = sqlite3_value_blob(a3);
  if (sqlite3_value_bytes(a3) != 16) {
    return 0;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);

  return [v5 initWithUUIDBytes:v4];
}

@end