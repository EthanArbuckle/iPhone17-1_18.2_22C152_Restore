@interface UIColor(SUAdditions)
+ (id)colorWithStyleString:()SUAdditions;
- (uint64_t)initWithStyleString:()SUAdditions;
@end

@implementation UIColor(SUAdditions)

+ (id)colorWithStyleString:()SUAdditions
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStyleString:a3];

  return v3;
}

- (uint64_t)initWithStyleString:()SUAdditions
{
  CGColorRef v4 = SUCreateColorFromStyleString(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = [a1 initWithCGColor:v4];
    CGColorRelease(v5);
    return v6;
  }
  else
  {

    return 0;
  }
}

@end