@interface WFStaccatoPreviewViewProvider
+ (id)leadingViewForConfiguredAction:(id)a3;
+ (id)primarySymbolForConfiguredAction:(id)a3;
+ (id)secondarySymbolForConfiguredAction:(id)a3;
+ (id)trailingViewForConfiguredAction:(id)a3;
@end

@implementation WFStaccatoPreviewViewProvider

+ (id)secondarySymbolForConfiguredAction:(id)a3
{
  id v3 = a3;
  v4 = [v3 sectionIdentifier];
  int v5 = [v4 isEqualToString:@"Accessibility"];

  if (v5)
  {
    id v6 = v3;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [v6 intent];
      v8 = [v7 serializedParameters];

      v9 = [v8 objectForKey:@"feature"];
      if (v9)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v10 = v9;
        }
        else {
          v10 = 0;
        }
      }
      else
      {
        v10 = 0;
      }
      id v12 = v10;

      v13 = [v12 objectForKey:@"symbol"];

      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v14 = [v13 objectForKey:@"systemName"];
        if (v14)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v15 = v14;
          }
          else {
            v15 = 0;
          }
        }
        else
        {
          v15 = 0;
        }
        id v11 = v15;
      }
      else
      {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)primarySymbolForConfiguredAction:(id)a3
{
  id v3 = a3;
  v4 = [v3 sectionIdentifier];
  char v5 = [v4 isEqualToString:@"Accessibility"];

  if (v5)
  {
    id v6 = @"accessibility.fill";
  }
  else
  {
    v7 = [v3 sectionIdentifier];
    char v8 = [v7 isEqualToString:@"Camera"];

    if (v8)
    {
      id v6 = @"camera.fill";
    }
    else
    {
      v9 = [v3 sectionIdentifier];
      char v10 = [v9 isEqualToString:@"Magnifier"];

      if (v10)
      {
        id v6 = @"plus.magnifyingglass";
      }
      else
      {
        id v11 = [v3 sectionIdentifier];
        int v12 = [v11 isEqualToString:@"Translate"];

        if (v12) {
          id v6 = @"translate";
        }
        else {
          id v6 = 0;
        }
      }
    }
  }

  return v6;
}

+ (id)trailingViewForConfiguredAction:(id)a3
{
  return (id)[a3 trailingApertureView];
}

+ (id)leadingViewForConfiguredAction:(id)a3
{
  return (id)[a3 leadingApertureView];
}

@end