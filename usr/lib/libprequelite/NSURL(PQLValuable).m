@interface NSURL(PQLValuable)
+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:;
+ (uint64_t)newFromSqliteValue:()PQLValuable;
- (void)sqliteBind:()PQLValuable index:;
@end

@implementation NSURL(PQLValuable)

- (void)sqliteBind:()PQLValuable index:
{
  id v6 = [a1 absoluteString];
  [v6 sqliteBind:a3 index:a4];
}

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  v0 = [NSString newFromSqliteStatement:atIndex:];
  if (v0) {
    uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v0];
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  v0 = [NSString newFromSqliteValue:];
  if (v0) {
    uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v0];
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

@end