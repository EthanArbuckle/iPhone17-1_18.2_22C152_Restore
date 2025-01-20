@interface NSDate(ML3DatabaseDatatypesBridge)
- (uint64_t)ml_bindToSQLiteStatement:()ML3DatabaseDatatypesBridge atPosition:;
- (uint64_t)ml_stringValueForSQL;
@end

@implementation NSDate(ML3DatabaseDatatypesBridge)

- (uint64_t)ml_stringValueForSQL
{
  v1 = NSString;
  [a1 timeIntervalSinceReferenceDate];
  return objc_msgSend(v1, "stringWithFormat:", @"%f", v2);
}

- (uint64_t)ml_bindToSQLiteStatement:()ML3DatabaseDatatypesBridge atPosition:
{
  [a1 timeIntervalSinceReferenceDate];

  return sqlite3_bind_double(a3, a4, v6);
}

@end