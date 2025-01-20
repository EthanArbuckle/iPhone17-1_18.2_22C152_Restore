@interface UITraitCollection
- (int64_t)mb_appearance;
@end

@implementation UITraitCollection

- (int64_t)mb_appearance
{
  return (id)[(UITraitCollection *)self userInterfaceStyle] == (id)2;
}

@end