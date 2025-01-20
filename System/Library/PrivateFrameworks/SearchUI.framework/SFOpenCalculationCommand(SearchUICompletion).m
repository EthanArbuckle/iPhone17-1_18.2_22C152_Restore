@interface SFOpenCalculationCommand(SearchUICompletion)
- (__CFString)_searchui_overriddenBridgeStringWithCompletion:()SearchUICompletion;
- (id)_searchui_completionImage;
@end

@implementation SFOpenCalculationCommand(SearchUICompletion)

- (id)_searchui_completionImage
{
  v0 = +[SearchUIUtilities bundleIdentifierForApp:3];
  v1 = +[SearchUIAppIconImage appIconForBundleIdentifier:v0 variant:2];

  return v1;
}

- (__CFString)_searchui_overriddenBridgeStringWithCompletion:()SearchUICompletion
{
  v3 = [a3 typedString];
  if (+[SearchUIUtilities stringHasRegexMatch:v3 regex:@"[=＝]\\s*$"])
  {
    v4 = &stru_1F40279D8;
  }
  else
  {
    v4 = @" = ";
  }
  v5 = v4;

  return v5;
}

@end