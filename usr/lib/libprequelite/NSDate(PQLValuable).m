@interface NSDate(PQLValuable)
+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:;
+ (uint64_t)newFromSqliteValue:()PQLValuable;
- (uint64_t)sqliteBind:()PQLValuable index:;
@end

@implementation NSDate(PQLValuable)

- (uint64_t)sqliteBind:()PQLValuable index:
{
  [a1 timeIntervalSince1970];

  return sqlite3_bind_double(a3, a4, v6);
}

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  if (sqlite3_column_type(a3, iCol) == 5) {
    return 0;
  }
  [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:sqlite3_column_double(a3, iCol)];
  return objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  if (sqlite3_value_type(a3) == 5) {
    return 0;
  }
  [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:sqlite3_value_double(a3)];
  return objc_claimAutoreleasedReturnValue();
}

@end