@interface NSNull
- (double)doubleValue;
- (double)floatValue;
- (int64_t)integerValue;
@end

@implementation NSNull

- (int64_t)integerValue
{
  return 0;
}

- (double)floatValue
{
  return 0.0;
}

- (double)doubleValue
{
  return 0.0;
}

@end