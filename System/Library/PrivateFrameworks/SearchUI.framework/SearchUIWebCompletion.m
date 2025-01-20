@interface SearchUIWebCompletion
+ (BOOL)cardSectionIsWeb:(id)a3;
+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4;
- (BOOL)completionResultIsPotentiallyPunchout;
- (id)image;
- (id)nonPrefixMatchExtensionString;
- (id)prefixMatchExtensionString;
@end

@implementation SearchUIWebCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 punchout];
  v9 = [v8 preferredOpenableURL];
  if (v9)
  {
    char v10 = 1;
  }
  else
  {
    v11 = [v7 punchoutOptions];
    v12 = [v11 firstObject];
    v13 = [v12 preferredOpenableURL];
    if (v13
      || ([a1 cardSectionIsWeb:v7] & 1) != 0
      || [v6 type] == 29
      || [v6 type] == 28)
    {
      char v10 = 1;
    }
    else
    {
      v15 = [v6 resultBundleId];
      char v10 = [v15 isEqualToString:@"com.apple.safari.userTypedURL"];
    }
  }

  return v10;
}

+ (BOOL)cardSectionIsWeb:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v5 = 0;
  if (v3 && (isKindOfClass & 1) != 0) {
    BOOL v5 = [v3 suggestionType] == 4;
  }

  return v5;
}

- (id)image
{
  v2 = objc_opt_new();
  [v2 setIconType:1];
  return v2;
}

- (id)prefixMatchExtensionString
{
  v2 = objc_opt_class();
  id v3 = +[SearchUIUtilities defaultBrowserBundleIdentifier];
  v4 = [v2 localizedNameForBundleIdentifier:v3];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)objc_opt_class() localizedOpenString];
  }
  id v7 = v6;

  return v7;
}

- (id)nonPrefixMatchExtensionString
{
  id v3 = [(SearchUICompletion *)self result];
  v4 = [v3 title];
  BOOL v5 = [v4 text];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUIWebCompletion;
    id v7 = [(SearchUICompletion *)&v10 nonPrefixMatchExtensionString];
  }
  v8 = v7;

  return v8;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  return 1;
}

@end