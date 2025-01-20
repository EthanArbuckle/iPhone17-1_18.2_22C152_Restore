@interface CNFavoritesEntry(TelephonyUI)
- (id)localizedBundleName;
- (id)localizedContactPropertyLabel;
- (void)localizedBundleName;
@end

@implementation CNFavoritesEntry(TelephonyUI)

- (id)localizedBundleName
{
  v2 = [a1 bundleIdentifier];
  if ([v2 isEqualToString:*MEMORY[0x1E4F1AD10]])
  {
    v3 = [a1 localizedContactPropertyLabel];
  }
  else
  {
    id v10 = 0;
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v2 allowPlaceholder:0 error:&v10];
    id v5 = v10;
    v6 = v5;
    if (v4)
    {
      v3 = [v4 localizedName];
    }
    else
    {
      if (v5)
      {
        v7 = TPDefaultLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          [(CNFavoritesEntry(TelephonyUI) *)(uint64_t)v2 localizedBundleName];
        }
      }
      v3 = 0;
    }
  }
  if (![v3 length])
  {
    uint64_t v8 = [a1 localizedContactPropertyLabel];

    v3 = (void *)v8;
  }

  return v3;
}

- (id)localizedContactPropertyLabel
{
  v2 = [a1 contactProperty];
  v3 = [v2 key];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F1BA20];
    id v5 = [a1 contactProperty];
    v6 = [v5 label];
    v7 = [v4 localizedDisplayStringForLabel:v6 propertyName:v3];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)localizedBundleName
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1C2F24000, log, OS_LOG_TYPE_ERROR, "Attempt to obtain application record for bundle identifier %@ failed with error %@", (uint8_t *)&v3, 0x16u);
}

@end