@interface NSString(TSUDatabaseAdditions)
+ (const)stringWithSqlStatement:()TSUDatabaseAdditions columnIndex:;
- (uint64_t)bindToSqlStatement:()TSUDatabaseAdditions index:error:;
- (uint64_t)initWithSqlStatement:()TSUDatabaseAdditions columnIndex:;
@end

@implementation NSString(TSUDatabaseAdditions)

- (uint64_t)initWithSqlStatement:()TSUDatabaseAdditions columnIndex:
{
  v5 = sqlite3_column_text(a3, iCol);
  return [a1 initWithUTF8String:v5];
}

- (uint64_t)bindToSqlStatement:()TSUDatabaseAdditions index:error:
{
  unint64_t v9 = [a1 lengthOfBytesUsingEncoding:4];
  if (HIDWORD(v9)) {
    return 0;
  }
  if (!sqlite3_bind_text(a3, a4, (const char *)[a1 UTF8String], v9, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))return 1; {
  TSULogErrorInFunction((uint64_t)"-[NSString(TSUDatabaseAdditions) bindToSqlStatement:index:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m", 445, @"Couldn't bind string to SQL statement", v10, v11, v12, v13, v16);
  }
  if (!a5 || *a5) {
    return 0;
  }
  uint64_t v15 = [MEMORY[0x263F087E8] tsuErrorWithCode:0];
  uint64_t result = 0;
  *a5 = v15;
  return result;
}

+ (const)stringWithSqlStatement:()TSUDatabaseAdditions columnIndex:
{
  uint64_t result = sqlite3_column_text(a3, iCol);
  if (result)
  {
    v7 = (void *)[[NSString alloc] initWithSqlStatement:a3 columnIndex:iCol];
    return (const unsigned __int8 *)v7;
  }
  return result;
}

@end