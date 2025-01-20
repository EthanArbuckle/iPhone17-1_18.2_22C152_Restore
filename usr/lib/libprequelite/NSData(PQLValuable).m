@interface NSData(PQLValuable)
+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:;
+ (uint64_t)newFromSqliteValue:()PQLValuable;
- (uint64_t)sqliteBind:()PQLValuable index:;
@end

@implementation NSData(PQLValuable)

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  if (sqlite3_column_type(a3, iCol) == 5) {
    return 0;
  }
  v7 = sqlite3_column_blob(a3, iCol);
  [MEMORY[0x1E4F1C9B8] dataWithBytes:v7 length:sqlite3_column_bytes(a3, iCol)];
  return objc_claimAutoreleasedReturnValue();
}

- (uint64_t)sqliteBind:()PQLValuable index:
{
  id v6 = a1;
  uint64_t v7 = [v6 bytes];
  if (v7) {
    v8 = (const char *)v7;
  }
  else {
    v8 = "";
  }
  int v9 = [v6 length];

  return sqlite3_bind_blob(a3, a4, v8, v9, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  if (sqlite3_value_type(a3) == 5) {
    return 0;
  }
  v5 = sqlite3_value_blob(a3);
  [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:sqlite3_value_bytes(a3)];
  return objc_claimAutoreleasedReturnValue();
}

@end