@interface TLKLightAppearance
- (id)name;
- (unint64_t)style;
@end

@implementation TLKLightAppearance

- (unint64_t)style
{
  return 0;
}

- (id)name
{
  return @"Light";
}

@end