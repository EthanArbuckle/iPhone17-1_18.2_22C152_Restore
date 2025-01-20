@interface UITraitCollection(VideosUICore)
+ (uint64_t)current;
- (BOOL)isAXEnabled;
- (BOOL)isAXLargeEnabled;
- (BOOL)isAXSmallEnabled;
- (uint64_t)vuiUserInterfaceStyle;
- (unint64_t)vuiPreferredContentSizeCategory;
@end

@implementation UITraitCollection(VideosUICore)

- (BOOL)isAXLargeEnabled
{
  uint64_t v1 = [a1 vuiPreferredContentSizeCategory];
  return +[VUIAccessibility isAXLargeEnabled:v1];
}

- (unint64_t)vuiPreferredContentSizeCategory
{
  uint64_t v1 = [a1 preferredContentSizeCategory];
  unint64_t v2 = +[VUICoreUtilities vuiContentSizeCategoryFor:v1];

  return v2;
}

- (BOOL)isAXEnabled
{
  uint64_t v1 = [a1 vuiPreferredContentSizeCategory];
  return +[VUIAccessibility contentSizeCategoryIsAccessibility:v1];
}

+ (uint64_t)current
{
  return [MEMORY[0x1E4F42F80] currentTraitCollection];
}

- (uint64_t)vuiUserInterfaceStyle
{
  if ([a1 userInterfaceStyle] == 1) {
    return 1;
  }
  else {
    return 2;
  }
}

- (BOOL)isAXSmallEnabled
{
  uint64_t v1 = [a1 vuiPreferredContentSizeCategory];
  return +[VUIAccessibility isAXSmallEnabled:v1];
}

@end