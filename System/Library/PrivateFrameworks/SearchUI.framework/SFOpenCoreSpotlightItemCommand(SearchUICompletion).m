@interface SFOpenCoreSpotlightItemCommand(SearchUICompletion)
- (id)_searchui_completionImage;
- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion;
@end

@implementation SFOpenCoreSpotlightItemCommand(SearchUICompletion)

- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion
{
  return +[SearchUICompletion localizedOpenString];
}

- (id)_searchui_completionImage
{
  v1 = [a1 applicationBundleIdentifier];
  v2 = +[SearchUIAppIconImage appIconForBundleIdentifier:v1 variant:2];

  return v2;
}

@end