@interface SearchUIQuickActionCompletion
+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4;
- (BOOL)completionResultIsPotentiallyPunchout;
- (id)image;
- (id)prefixMatchExtensionString;
@end

@implementation SearchUIQuickActionCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  v4 = [a3 sectionBundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.datadetector.quick_actions"];

  return v5;
}

- (id)prefixMatchExtensionString
{
  v2 = [(SearchUICompletion *)self result];
  v3 = [v2 completion];

  return v3;
}

- (id)image
{
  v2 = [(SearchUICompletion *)self result];
  v3 = [v2 punchout];
  v4 = [v3 preferredOpenableURL];

  if (v4)
  {
    char v5 = objc_opt_new();
    [v5 setIconType:1];
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  return 1;
}

@end