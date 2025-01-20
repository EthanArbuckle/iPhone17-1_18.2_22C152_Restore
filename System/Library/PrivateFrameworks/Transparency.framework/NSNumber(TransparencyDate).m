@interface NSNumber(TransparencyDate)
- (unint64_t)kt_enumValueWithMax:()TransparencyDate defaultValue:;
@end

@implementation NSNumber(TransparencyDate)

- (unint64_t)kt_enumValueWithMax:()TransparencyDate defaultValue:
{
  unint64_t result = [a1 unsignedIntegerValue];
  if (result > a3) {
    return a4;
  }
  return result;
}

@end