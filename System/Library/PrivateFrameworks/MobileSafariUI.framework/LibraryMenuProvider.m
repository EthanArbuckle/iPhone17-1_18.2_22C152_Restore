@interface LibraryMenuProvider
+ (id)contextMenuConfigurationForLibraryItems:(id)a3 dataSource:(id)a4;
@end

@implementation LibraryMenuProvider

+ (id)contextMenuConfigurationForLibraryItems:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] == 1
    && ([v5 firstObject],
        v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) != 0))
  {
    v9 = [v5 firstObject];
    v10 = [v9 tab];

    if (v10)
    {
      v11 = [v9 tab];
      v12 = [v9 tabGroup];
      v13 = [v6 contextMenuConfigurationForTab:v11 inTabGroup:v12];
    }
    else
    {
      v11 = [v9 tabGroup];
      v13 = [v6 contextMenuConfigurationForTabGroup:v11 variant:0];
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end