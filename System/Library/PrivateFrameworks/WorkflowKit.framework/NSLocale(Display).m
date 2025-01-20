@interface NSLocale(Display)
- (id)wf_displayName;
- (id)wf_subname;
@end

@implementation NSLocale(Display)

- (id)wf_subname
{
  v2 = [a1 languageCode];
  if ([v2 length])
  {
  }
  else
  {
    v3 = [a1 countryCode];
    uint64_t v4 = [v3 length];

    if (!v4)
    {
      v9 = 0;
      goto LABEL_16;
    }
  }
  v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  v6 = [a1 languageCode];
  int v7 = [&unk_1F2317B50 containsObject:v6];

  if (!v7)
  {
    v9 = 0;
    goto LABEL_13;
  }
  v8 = [a1 countryCode];
  v9 = [v5 localizedStringForRegion:v8 context:3 short:1];

  v10 = [a1 languageIdentifier];
  if (([v10 hasPrefix:@"zh-Hant"] & 1) != 0
    || [v10 hasPrefix:@"zh-TW"])
  {
    v11 = [MEMORY[0x1E4FB46B8] currentDevice];
    int v12 = [v11 isChineseRegionDevice];

    if (v12) {
      v13 = @"Mandarin - Taiwan (China)";
    }
    else {
      v13 = @"Mandarin - Taiwan";
    }
  }
  else
  {
    if (([v10 hasPrefix:@"zh-Hans"] & 1) == 0
      && ![v10 hasPrefix:@"zh-CN"])
    {
      goto LABEL_11;
    }
    v13 = @"Mandarin - China mainland";
  }
  uint64_t v14 = WFLocalizedString(v13);

  v9 = (void *)v14;
LABEL_11:

LABEL_13:
  v15 = [a1 languageCode];
  int v16 = [&unk_1F2317B68 containsObject:v15];

  if (v16)
  {
    v17 = [a1 countryCode];
    uint64_t v18 = [v5 localizedStringForRegion:v17 context:3 short:0];

    v9 = (void *)v18;
  }

LABEL_16:
  return v9;
}

- (id)wf_displayName
{
  v2 = [a1 languageCode];
  v3 = (void *)[v2 length];

  if (!v3) {
    goto LABEL_9;
  }
  uint64_t v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  v5 = [a1 languageCode];
  v6 = [v4 localizedStringForLanguageCode:v5];
  v3 = [v6 capitalizedString];

  int v7 = objc_msgSend(a1, "wf_subname");
  v8 = [a1 languageIdentifier];
  if ([v8 hasPrefix:@"zh-Hans"])
  {

LABEL_5:
    uint64_t v11 = WFLocalizedString(@"Chinese");

    v3 = (void *)v11;
    goto LABEL_6;
  }
  v9 = [a1 languageIdentifier];
  int v10 = [v9 hasPrefix:@"zh-Hant"];

  if (v10) {
    goto LABEL_5;
  }
LABEL_6:
  if ([v7 length])
  {
    uint64_t v12 = [NSString stringWithFormat:@"%@ (%@)", v3, v7];

    v3 = (void *)v12;
  }

LABEL_9:
  return v3;
}

@end