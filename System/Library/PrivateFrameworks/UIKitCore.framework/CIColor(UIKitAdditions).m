@interface CIColor(UIKitAdditions)
- (uint64_t)initWithColor:()UIKitAdditions;
@end

@implementation CIColor(UIKitAdditions)

- (uint64_t)initWithColor:()UIKitAdditions
{
  uint64_t v4 = [a3 CGColor];
  return [a1 initWithCGColor:v4];
}

@end