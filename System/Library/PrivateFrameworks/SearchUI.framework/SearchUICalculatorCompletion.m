@interface SearchUICalculatorCompletion
+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4;
+ (id)richSubtitleForResult:(id)a3 cardSection:(id)a4;
- (id)copyableString;
- (void)updateFields;
@end

@implementation SearchUICalculatorCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(id)objc_opt_class() richSubtitleForResult:v5 cardSection:v6];

  v8 = [v5 applicationBundleIdentifier];
  if ([v8 isEqualToString:@"com.apple.calculation"])
  {
    BOOL v9 = [v7 length] != 0;
  }
  else
  {
    v10 = [v5 applicationBundleIdentifier];
    if ([v10 isEqualToString:@"com.apple.calculator"]) {
      BOOL v9 = [v7 length] != 0;
    }
    else {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (void)updateFields
{
  v3 = [(SearchUICalculatorCompletion *)self copyableString];
  [(SearchUICompletion *)self setExtensionString:v3];

  id v5 = [(SearchUICompletion *)self typedString];
  if (+[SearchUIUtilities stringHasRegexMatch:v5 regex:@"[=＝]\\s*$"])
  {
    v4 = &stru_1F40279D8;
  }
  else
  {
    v4 = @" = ";
  }
  [(SearchUICompletion *)self setBridgeString:v4];
}

- (id)copyableString
{
  v3 = objc_opt_class();
  v4 = [(SearchUICompletion *)self result];
  id v5 = [(SearchUICompletion *)self cardSection];
  id v6 = [v3 richSubtitleForResult:v4 cardSection:v5];

  return v6;
}

+ (id)richSubtitleForResult:(id)a3 cardSection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v6;
  if (!v7)
  {
    BOOL v9 = +[SearchUIUtilities cardSectionsForRenderingResult:v5];
    v10 = [v9 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v8 = v11;
  }
  v12 = [v8 subtitle];

  return v12;
}

@end