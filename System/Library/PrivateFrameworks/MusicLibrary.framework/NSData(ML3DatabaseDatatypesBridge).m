@interface NSData(ML3DatabaseDatatypesBridge)
- (uint64_t)ml_bindToSQLiteStatement:()ML3DatabaseDatatypesBridge atPosition:;
- (uint64_t)ml_stringValueForSQL;
@end

@implementation NSData(ML3DatabaseDatatypesBridge)

- (uint64_t)ml_stringValueForSQL
{
  return 0;
}

- (uint64_t)ml_bindToSQLiteStatement:()ML3DatabaseDatatypesBridge atPosition:
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

  return sqlite3_bind_blob(a3, a4, v8, v9, 0);
}

@end