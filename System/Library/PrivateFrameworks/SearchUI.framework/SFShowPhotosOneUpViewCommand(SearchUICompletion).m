@interface SFShowPhotosOneUpViewCommand(SearchUICompletion)
- (id)_searchui_completionImage;
- (id)_searchui_overriddenExtensionString;
@end

@implementation SFShowPhotosOneUpViewCommand(SearchUICompletion)

- (id)_searchui_overriddenExtensionString
{
  return +[SearchUICompletion localizedOpenString];
}

- (id)_searchui_completionImage
{
  v0 = +[SearchUIUtilities bundleIdentifierForApp:13];
  v1 = +[SearchUIAppIconImage appIconForBundleIdentifier:v0 variant:2];

  return v1;
}

@end