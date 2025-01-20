@interface SearchUIAppCompletion
+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4;
- (BOOL)completionResultIsPotentiallyPunchout;
- (id)prefixMatchExtensionString;
@end

@implementation SearchUIAppCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  id v5 = a4;
  if ([a3 isLocalApplicationResult])
  {
    char isKindOfClass = 1;
  }
  else
  {
    v7 = [v5 command];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      v8 = [v5 command];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }

  return isKindOfClass & 1;
}

- (id)prefixMatchExtensionString
{
  v3 = [(SearchUICompletion *)self result];
  v4 = [v3 title];
  id v5 = [v4 text];
  v6 = [(SearchUICompletion *)self completionStringToMatch];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(id)objc_opt_class() localizedOpenString];
  }
  else
  {
    v8 = [(SearchUICompletion *)self result];
    v9 = [v8 title];
    v7 = [v9 text];
  }
  return v7;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  return 1;
}

@end