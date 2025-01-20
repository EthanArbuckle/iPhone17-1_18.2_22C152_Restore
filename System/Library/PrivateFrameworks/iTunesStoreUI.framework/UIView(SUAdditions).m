@interface UIView(SUAdditions)
- (uint64_t)centerSubviewInBounds:()SUAdditions;
- (uint64_t)superviewOfClass:()SUAdditions;
@end

@implementation UIView(SUAdditions)

- (uint64_t)centerSubviewInBounds:()SUAdditions
{
  [a1 bounds];
  double v5 = v4;
  double v7 = v6;
  [a3 frame];
  float v9 = (v5 - v8) * 0.5;
  float v11 = (v7 - v10) * 0.5;
  objc_msgSend(a3, "setFrame:", floorf(v9), floorf(v11));

  return [a3 setAutoresizingMask:45];
}

- (uint64_t)superviewOfClass:()SUAdditions
{
  while (1)
  {
    uint64_t v1 = [a1 superview];
    if (!v1 || (objc_opt_isKindOfClass() & 1) != 0) {
      break;
    }
    a1 = (void *)v1;
  }
  return v1;
}

@end