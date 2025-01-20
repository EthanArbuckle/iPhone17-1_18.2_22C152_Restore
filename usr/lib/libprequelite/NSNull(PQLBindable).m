@interface NSNull(PQLBindable)
- (uint64_t)sqliteBind:()PQLBindable index:;
@end

@implementation NSNull(PQLBindable)

- (uint64_t)sqliteBind:()PQLBindable index:
{
  return sqlite3_bind_null(a3, a4);
}

@end