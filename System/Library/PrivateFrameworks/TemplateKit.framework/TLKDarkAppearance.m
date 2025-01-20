@interface TLKDarkAppearance
- (BOOL)isDark;
- (id)name;
- (unint64_t)style;
@end

@implementation TLKDarkAppearance

- (BOOL)isDark
{
  return 1;
}

- (unint64_t)style
{
  return 1;
}

- (id)name
{
  return @"Dark";
}

@end