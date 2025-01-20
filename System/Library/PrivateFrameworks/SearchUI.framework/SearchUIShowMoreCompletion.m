@interface SearchUIShowMoreCompletion
+ (BOOL)resultIsContact:(id)a3;
+ (BOOL)resultIsStoreSheet:(id)a3;
+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4;
- (id)image;
- (id)prefixMatchExtensionString;
@end

@implementation SearchUIShowMoreCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 card];
  if (v8)
  {
    char v9 = 1;
  }
  else
  {
    v10 = [v7 nextCard];
    if (v10) {
      char v9 = 1;
    }
    else {
      char v9 = [a1 resultIsContact:v6];
    }
  }
  return v9;
}

+ (BOOL)resultIsContact:(id)a3
{
  id v3 = a3;
  v4 = [v3 contactIdentifier];
  if (v4)
  {
    v5 = [v3 applicationBundleIdentifier];
    id v6 = +[SearchUIUtilities bundleIdentifierForApp:5];
    if ([v5 isEqualToString:v6])
    {
      char v7 = 1;
    }
    else
    {
      v8 = [v3 applicationBundleIdentifier];
      char v7 = [v8 isEqualToString:@"com.apple.CoreSuggestions"];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)resultIsStoreSheet:(id)a3
{
  id v3 = a3;
  v4 = [v3 storeIdentifier];
  if (v4)
  {
    v5 = [v3 action];
    if (v5)
    {
      id v6 = [v3 action];
      if ([v6 requiresLocalMedia]) {
        BOOL v7 = [v3 type] == 1;
      }
      else {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = [v3 type] == 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)prefixMatchExtensionString
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SEARCH_RESULTS_SHOW_MORE_BUTTON_TITLE" value:&stru_1F40279D8 table:0];

  return v3;
}

- (id)image
{
  return 0;
}

@end