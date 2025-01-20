@interface NSObject(PLValue)
- (BOOL)isNil;
- (int64_t)plCompare:()PLValue;
@end

@implementation NSObject(PLValue)

- (int64_t)plCompare:()PLValue
{
  return +[PLValueUtilties compare:a1 with:a3];
}

- (BOOL)isNil
{
  return +[PLValueUtilties isNil:a1];
}

@end