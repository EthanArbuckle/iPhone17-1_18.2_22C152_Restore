@interface STUsageDetailItem(UIAdditions)
+ (void)iconImageForBundleIdentifier:()UIAdditions completionHandler:;
- (id)_monogramUsingDarkColors:()UIAdditions;
- (id)iconImage;
- (id)localizedDisplayName;
- (uint64_t)_didFindIconImage:()UIAdditions;
- (uint64_t)darkColorsMonogram;
- (uint64_t)lightColorsMonogram;
- (void)iconImage;
@end

@implementation STUsageDetailItem(UIAdditions)

- (id)localizedDisplayName
{
  v2 = [a1 identifier];
  if ([v2 isEqualToString:*MEMORY[0x263F673D8]])
  {
    v3 = +[STScreenTimeUIBundle bundle];
    v4 = v3;
    v5 = @"AllAppsAndCategories";
LABEL_9:
    v6 = [v3 localizedStringForKey:v5 value:&stru_26CF0D240 table:0];

    goto LABEL_10;
  }
  if ([v2 isEqualToString:*MEMORY[0x263F673E0]])
  {
    v3 = +[STScreenTimeUIBundle bundle];
    v4 = v3;
    v5 = @"AllApps";
    goto LABEL_9;
  }
  if ([v2 isEqualToString:*MEMORY[0x263F673E8]])
  {
    v3 = +[STScreenTimeUIBundle bundle];
    v4 = v3;
    v5 = @"AllCategories";
    goto LABEL_9;
  }
  if ([v2 isEqualToString:*MEMORY[0x263F673F0]])
  {
    v3 = +[STScreenTimeUIBundle bundle];
    v4 = v3;
    v5 = @"MostUsedWebsites";
    goto LABEL_9;
  }
  uint64_t v8 = [a1 type];
  switch(v8)
  {
    case 3:
      uint64_t v11 = [MEMORY[0x263F318B8] shortLocalizedNameForIdentifier:v2];
LABEL_21:
      v6 = (void *)v11;
      break;
    case 2:
      uint64_t v11 = objc_msgSend(v2, "_lp_userVisibleHost");
      goto LABEL_21;
    case 1:
      v9 = [MEMORY[0x263F670A8] sharedCache];
      v10 = [v9 appInfoForBundleIdentifier:v2];
      v6 = [v10 displayName];
      if (![v10 source])
      {
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __54__STUsageDetailItem_UIAdditions__localizedDisplayName__block_invoke;
        v12[3] = &unk_26449BBE0;
        v12[4] = a1;
        [v9 fetchAppInfoForBundleIdentifier:v2 completionHandler:v12];
      }

      break;
    default:
      v6 = 0;
      break;
  }
LABEL_10:

  return v6;
}

- (id)iconImage
{
  v2 = +[STIconCache sharedCache];
  v3 = [a1 identifier];
  uint64_t v4 = [a1 type];
  if (v4 == 3)
  {
    uint64_t v5 = [v2 imageForCategoryIdentifier:v3];
LABEL_6:
    v6 = (void *)v5;
    if (v5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      uint64_t v5 = [v2 imageForBundleIdentifier:v3];
      goto LABEL_6;
    }
LABEL_7:
    v6 = [v2 imageForBlankApplicationIcon];
    [v2 addObserver:a1 selector:sel__didFindIconImage_ bundleIdentifier:v3];
    v7 = [MEMORY[0x263F670A8] sharedCache];
    [v7 addObserver:a1 selector:sel__didFindIconImage_ bundleIdentifier:v3];

    goto LABEL_8;
  }
  id v9 = [a1 localizedDisplayName];
  if ([v9 length])
  {
    v10 = objc_opt_new();
    [v10 setScheme:@"https"];
    [v10 setHost:v9];
    v21 = [v10 URL];
    uint64_t v11 = objc_msgSend(v21, "_lp_highLevelDomain");
    v12 = [v10 host];
    v13 = [v10 URL];
    id v14 = v11;
    id v15 = v12;
    id v16 = v13;
    if ([v14 length])
    {
      v17 = [v14 substringToIndex:1];
      v18 = [v17 uppercaseString];
    }
    else
    {
      v19 = [v15 substringToIndex:1];
      v18 = [v19 uppercaseString];

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[STUsageDetailItem(UIAdditions) iconImage]();
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[STUsageDetailItem(UIAdditions) iconImage]((uint64_t)v9);
    }
    v18 = 0;
  }

  v20 = [MEMORY[0x263F1CB00] currentTraitCollection];
  v6 = objc_msgSend(v2, "monogramImageForInitial:useDarkColors:", v18, objc_msgSend(v20, "userInterfaceStyle") == 2);

  if (!v6) {
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (uint64_t)lightColorsMonogram
{
  return [a1 _monogramUsingDarkColors:0];
}

- (uint64_t)darkColorsMonogram
{
  return [a1 _monogramUsingDarkColors:1];
}

- (id)_monogramUsingDarkColors:()UIAdditions
{
  uint64_t v5 = +[STIconCache sharedCache];
  id v6 = [a1 localizedDisplayName];
  if ([v6 length])
  {
    v7 = objc_opt_new();
    [v7 setScheme:@"https"];
    [v7 setHost:v6];
    uint64_t v8 = [v7 URL];
    id v9 = objc_msgSend(v8, "_lp_highLevelDomain");
    v10 = [v7 host];
    uint64_t v11 = [v7 URL];
    id v12 = v9;
    id v13 = v10;
    id v14 = v11;
    if ([v12 length])
    {
      id v15 = [v12 substringToIndex:1];
      id v16 = [v15 uppercaseString];
    }
    else
    {
      v17 = [v13 substringToIndex:1];
      id v16 = [v17 uppercaseString];

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[STUsageDetailItem(UIAdditions) iconImage]();
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[STUsageDetailItem(UIAdditions) iconImage]((uint64_t)v6);
    }
    id v16 = 0;
  }

  v18 = [v5 monogramImageForInitial:v16 useDarkColors:a3];

  return v18;
}

- (uint64_t)_didFindIconImage:()UIAdditions
{
  [a1 willChangeValueForKey:@"iconImage"];
  v2 = +[STIconCache sharedCache];
  v3 = [a1 identifier];
  [v2 removeObserver:a1 bundleIdentifier:v3];

  uint64_t v4 = [MEMORY[0x263F670A8] sharedCache];
  uint64_t v5 = [a1 identifier];
  [v4 removeObserver:a1 bundleIdentifier:v5];

  return [a1 didChangeValueForKey:@"iconImage"];
}

+ (void)iconImageForBundleIdentifier:()UIAdditions completionHandler:
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[STIconCache sharedCache];
  [v7 imageForBundleIdentifier:v6 completionHandler:v5];
}

- (void)iconImage
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(&dword_21E199000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to extract high level domain for URL: %@. Creating initial for host instead: %@", v0, 0x16u);
}

@end