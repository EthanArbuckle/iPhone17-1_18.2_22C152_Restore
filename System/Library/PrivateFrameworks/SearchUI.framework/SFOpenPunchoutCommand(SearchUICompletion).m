@interface SFOpenPunchoutCommand(SearchUICompletion)
- (id)_searchui_completionImage;
- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion;
@end

@implementation SFOpenPunchoutCommand(SearchUICompletion)

- (id)_searchui_prefixMatchExtensionStringWithCompletion:()SearchUICompletion
{
  v2 = [a1 punchout];
  v3 = [v2 bundleIdentifier];
  if ([v3 length])
  {
    id v4 = objc_alloc(MEMORY[0x1E4F223C8]);
    v5 = [a1 punchout];
    v6 = [v5 bundleIdentifier];
    v7 = (void *)[v4 initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];
    v8 = [v7 applicationState];
    int v9 = [v8 isInstalled];

    v10 = 0;
    if (v9)
    {
      v10 = +[SearchUICompletion localizedOpenString];
    }
  }
  else
  {

    v10 = 0;
  }
  return v10;
}

- (id)_searchui_completionImage
{
  v2 = objc_opt_new();
  v3 = [a1 punchout];
  id v4 = [v3 bundleIdentifier];
  [v2 setBundleIdentifier:v4];

  return v2;
}

@end