@interface SFLaunchAppCommand(SearchUICompletion)
- (id)_searchui_completionImage;
- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion;
@end

@implementation SFLaunchAppCommand(SearchUICompletion)

- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion
{
  id v3 = a3;
  v4 = [v3 result];
  v5 = [v4 title];
  v6 = [v5 text];

  v7 = [v3 completionStringToMatch];

  if ([v6 isEqualToString:v7])
  {
    id v8 = +[SearchUICompletion localizedOpenString];
  }
  else
  {
    id v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)_searchui_completionImage
{
  v1 = [a1 applicationBundleIdentifier];
  v2 = +[SearchUIAppIconImage appIconForBundleIdentifier:v1 variant:2];

  return v2;
}

@end