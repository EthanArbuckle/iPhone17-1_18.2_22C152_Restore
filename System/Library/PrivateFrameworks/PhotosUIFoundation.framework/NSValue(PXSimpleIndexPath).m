@interface NSValue(PXSimpleIndexPath)
+ (uint64_t)px_valueWithSimpleIndexPath:()PXSimpleIndexPath;
- (uint64_t)px_simpleIndexPathValue;
@end

@implementation NSValue(PXSimpleIndexPath)

- (uint64_t)px_simpleIndexPathValue
{
  *x8_0 = 0u;
  x8_0[1] = 0u;
  return [a1 getValue:x8_0];
}

+ (uint64_t)px_valueWithSimpleIndexPath:()PXSimpleIndexPath
{
  return [MEMORY[0x263F08D40] valueWithBytes:a3 objCType:"{PXSimpleIndexPath=qqqq}"];
}

@end