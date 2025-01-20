@interface UIScrollView(PKAppearanceObject)
- (uint64_t)pk_applyAppearance:()PKAppearanceObject;
@end

@implementation UIScrollView(PKAppearanceObject)

- (uint64_t)pk_applyAppearance:()PKAppearanceObject
{
  if ([a3 hasDarkAppearance]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }

  return [a1 setIndicatorStyle:v4];
}

@end