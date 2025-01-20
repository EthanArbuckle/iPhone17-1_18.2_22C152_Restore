@interface NSNumber(PQLValuable)
+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:;
+ (uint64_t)newFromSqliteValue:()PQLValuable;
- (uint64_t)sqliteBind:()PQLValuable index:;
@end

@implementation NSNumber(PQLValuable)

- (uint64_t)sqliteBind:()PQLValuable index:
{
  id v6 = a1;
  if ((*(unsigned __int8 *)[v6 objCType] | 2) == 0x66)
  {
    [v6 doubleValue];
    return sqlite3_bind_double(a3, a4, v7);
  }
  else
  {
    sqlite3_int64 v9 = [v6 longLongValue];
    return sqlite3_bind_int64(a3, a4, v9);
  }
}

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  int v6 = sqlite3_column_type(a3, iCol);
  if (v6 == 5) {
    return 0;
  }
  if (v6 == 2) {
    [NSNumber numberWithDouble:sqlite3_column_double(a3, iCol)];
  }
  else {
    [NSNumber numberWithLongLong:sqlite3_column_int64(a3, iCol)];
  }
  return objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  int v4 = sqlite3_value_type(a3);
  if (v4 == 5) {
    return 0;
  }
  if (v4 == 2) {
    [NSNumber numberWithDouble:sqlite3_value_double(a3)];
  }
  else {
    [NSNumber numberWithLongLong:sqlite3_value_int64(a3)];
  }
  return objc_claimAutoreleasedReturnValue();
}

@end