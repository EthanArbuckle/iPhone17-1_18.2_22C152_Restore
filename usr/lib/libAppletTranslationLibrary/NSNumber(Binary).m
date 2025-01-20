@interface NSNumber(Binary)
- (unint64_t)isBitSet:()Binary;
@end

@implementation NSNumber(Binary)

- (unint64_t)isBitSet:()Binary
{
  return ((unint64_t)[a1 unsignedLongValue] >> a3) & 1;
}

@end