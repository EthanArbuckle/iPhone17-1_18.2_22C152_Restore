@interface NSString(PQLValuable)
+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:;
+ (uint64_t)newFromSqliteValue:()PQLValuable;
- (uint64_t)sqliteBind:()PQLValuable index:;
@end

@implementation NSString(PQLValuable)

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  if (sqlite3_column_type(a3, iCol) == 5) {
    return 0;
  }
  v7 = sqlite3_column_text(a3, iCol);
  int v8 = sqlite3_column_bytes(a3, iCol);
  id v9 = [NSString alloc];

  return [v9 initWithBytes:v7 length:v8 encoding:4];
}

- (uint64_t)sqliteBind:()PQLValuable index:
{
  v6 = (const char *)[a1 UTF8String];

  return sqlite3_bind_text(a3, a4, v6, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  if (sqlite3_value_type(a3) == 5) {
    return 0;
  }
  v5 = sqlite3_value_text(a3);
  int v6 = sqlite3_value_bytes(a3);
  id v7 = [NSString alloc];

  return [v7 initWithBytes:v5 length:v6 encoding:4];
}

@end