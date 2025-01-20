@interface NSNull(ML3DatabaseDatatypesBridge)
- (__CFString)ml_stringValueForSQL;
- (uint64_t)ml_bindToSQLiteStatement:()ML3DatabaseDatatypesBridge atPosition:;
@end

@implementation NSNull(ML3DatabaseDatatypesBridge)

- (__CFString)ml_stringValueForSQL
{
  return @"NULL";
}

- (uint64_t)ml_bindToSQLiteStatement:()ML3DatabaseDatatypesBridge atPosition:
{
  return sqlite3_bind_null(a3, a4);
}

@end