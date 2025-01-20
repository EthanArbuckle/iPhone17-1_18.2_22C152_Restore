@interface NSNumber(ML3DatabaseDatatypesBridge)
- (uint64_t)ml_bindToSQLiteStatement:()ML3DatabaseDatatypesBridge atPosition:;
@end

@implementation NSNumber(ML3DatabaseDatatypesBridge)

- (uint64_t)ml_bindToSQLiteStatement:()ML3DatabaseDatatypesBridge atPosition:
{
  CFNumberType Type = CFNumberGetType(a1);
  if ((unint64_t)Type > kCFNumberCGFloatType) {
    goto LABEL_10;
  }
  if (((1 << Type) & 0x38E) != 0)
  {
    int v8 = [(__CFNumber *)a1 intValue];
    return sqlite3_bind_int(a3, a4, v8);
  }
  if (((1 << Type) & 0x10060) != 0)
  {
    [(__CFNumber *)a1 doubleValue];
    return sqlite3_bind_double(a3, a4, v10);
  }
  else
  {
LABEL_10:
    sqlite3_int64 v11 = [(__CFNumber *)a1 longLongValue];
    return sqlite3_bind_int64(a3, a4, v11);
  }
}

@end