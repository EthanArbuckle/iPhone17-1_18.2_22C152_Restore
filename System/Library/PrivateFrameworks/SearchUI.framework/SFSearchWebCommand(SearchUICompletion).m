@interface SFSearchWebCommand(SearchUICompletion)
- (id)_searchui_completionImage;
- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion;
@end

@implementation SFSearchWebCommand(SearchUICompletion)

- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion
{
  v0 = +[SearchUIUtilities defaultBrowserBundleIdentifier];
  v1 = +[SearchUICompletion localizedNameForBundleIdentifier:v0];
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[SearchUICompletion localizedOpenString];
  }
  v4 = v3;

  return v4;
}

- (id)_searchui_completionImage
{
  v0 = objc_opt_new();
  [v0 setIconType:1];
  return v0;
}

@end