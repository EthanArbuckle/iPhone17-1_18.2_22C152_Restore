@interface STDrillInItemInfoGroupSpecifierProvider
- (PSSpecifier)ageRatingSpecifier;
- (PSSpecifier)appIconSpecifier;
- (PSSpecifier)developerSpecifier;
- (STDrillInItemInfoGroupSpecifierProvider)initWithUsageItem:(id)a3;
- (STUsageItem)usageItem;
- (id)ageRating:(id)a3;
- (id)category:(id)a3;
- (id)developer:(id)a3;
- (void)_didFetchAppInfo:(id)a3;
@end

@implementation STDrillInItemInfoGroupSpecifierProvider

- (STDrillInItemInfoGroupSpecifierProvider)initWithUsageItem:(id)a3
{
  v43[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = [v6 itemType];
  if (v7 > 6 || ((1 << v7) & 0x54) == 0)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"STDrillInItemInfoGroupSpecifierProvider.m", 34, @"Invalid parameter not satisfying: %@", @"(itemType == STUsageItemTypeApp) || (itemType == STUsageItemTypeWebsite) || (itemType == STUsageItemTypePickups)" object file lineNumber description];
  }
  v42.receiver = self;
  v42.super_class = (Class)STDrillInItemInfoGroupSpecifierProvider;
  v10 = [(STGroupSpecifierProvider *)&v42 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_usageItem, a3);
    v12 = +[STScreenTimeSettingsUIBundle bundle];
    v13 = (void *)MEMORY[0x263F5FC40];
    v14 = [v12 localizedStringForKey:@"MostUsedAppInfoGroupSpecifierName" value:&stru_26D9391A8 table:0];
    v15 = [v13 groupSpecifierWithName:v14];

    if ([v6 usageTrusted]) {
      goto LABEL_18;
    }
    unint64_t v16 = [v6 itemType];
    v17 = 0;
    if (v16 <= 6)
    {
      if (((1 << v16) & 0x64) != 0)
      {
        v19 = @"UntrustedApplicationFooterFormat";
      }
      else
      {
        if (((1 << v16) & 0xA) != 0)
        {
          v18 = [MEMORY[0x263F08690] currentHandler];
          [v18 handleFailureInMethod:a2 object:v11 file:@"STDrillInItemInfoGroupSpecifierProvider.m" lineNumber:49 description:@"All screen time and category usage is trusted."];

          v17 = 0;
          goto LABEL_17;
        }
        if (v16 != 4) {
          goto LABEL_17;
        }
        v19 = @"UntrustedWebsiteFooterTextFormat";
      }
      v17 = [v12 localizedStringForKey:v19 value:&stru_26D9391A8 table:0];
    }
LABEL_17:
    v20 = NSString;
    v21 = [v6 displayName];
    v22 = [v20 localizedStringWithValidatedFormat:v17, @"%@", 0, v21 validFormatSpecifiers error];
    [v15 setObject:v22 forKeyedSubscript:*MEMORY[0x263F600F8]];

LABEL_18:
    [(STGroupSpecifierProvider *)v11 setGroupSpecifier:v15];
    v23 = (void *)MEMORY[0x263F5FC40];
    v24 = [v6 displayName];
    uint64_t v25 = [v23 preferenceSpecifierNamed:v24 target:v11 set:0 get:sel_usageItem_ detail:0 cell:-1 edit:0];
    appIconSpecifier = v11->_appIconSpecifier;
    v11->_appIconSpecifier = (PSSpecifier *)v25;

    [(PSSpecifier *)v11->_appIconSpecifier setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    [(PSSpecifier *)v11->_appIconSpecifier setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
    v27 = [(STGroupSpecifierProvider *)v11 mutableSpecifiers];
    [v27 addObject:v11->_appIconSpecifier];
    uint64_t v28 = [v6 categoryIdentifier];
    if (v28)
    {
      v29 = (void *)v28;
      id v30 = [v6 categoryIdentifier];
      if (([v30 isEqualToString:*MEMORY[0x263F31870]] & 1) != 0
        || ([v30 isEqualToString:*MEMORY[0x263F31860]] & 1) != 0)
      {
      }
      else
      {
        char v41 = [v30 isEqualToString:*MEMORY[0x263F31868]];

        if (v41) {
          goto LABEL_23;
        }
        v29 = [v12 localizedStringForKey:@"MostUsedAppCategorySpecifierName" value:&stru_26D9391A8 table:0];
        id v30 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v29 target:v11 set:0 get:sel_category_ detail:0 cell:4 edit:0];
        [v27 addObject:v30];
      }
    }
LABEL_23:
    if (v7 != 4)
    {
      v31 = [v12 localizedStringForKey:@"MostUsedAppAgeRatingSpecifierName" value:&stru_26D9391A8 table:0];
      uint64_t v32 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v31 target:v11 set:0 get:sel_ageRating_ detail:0 cell:4 edit:0];
      ageRatingSpecifier = v11->_ageRatingSpecifier;
      v11->_ageRatingSpecifier = (PSSpecifier *)v32;

      v34 = [v12 localizedStringForKey:@"MostUsedAppDeveloperSpecifierName" value:&stru_26D9391A8 table:0];
      uint64_t v35 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v34 target:v11 set:0 get:sel_developer_ detail:0 cell:4 edit:0];
      developerSpecifier = v11->_developerSpecifier;
      v11->_developerSpecifier = (PSSpecifier *)v35;

      v43[0] = v11->_ageRatingSpecifier;
      v43[1] = v11->_developerSpecifier;
      v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
      [v27 addObjectsFromArray:v37];

      v38 = [MEMORY[0x263F670A8] sharedCache];
      v39 = [v6 budgetItemIdentifier];
      [v38 addObserver:v11 selector:sel__didFetchAppInfo_ bundleIdentifier:v39];
    }
  }

  return v11;
}

- (id)category:(id)a3
{
  v3 = [(STDrillInItemInfoGroupSpecifierProvider *)self usageItem];
  v4 = [v3 categoryIdentifier];
  v5 = STCategoryNameWithIdentifier();

  return v5;
}

- (id)ageRating:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263F670A8], "sharedCache", a3);
  v5 = [(STDrillInItemInfoGroupSpecifierProvider *)self usageItem];
  id v6 = [v5 budgetItemIdentifier];
  unint64_t v7 = [v4 appInfoForBundleIdentifier:v6];

  v8 = +[STRegionRatings sharedRatings];
  v9 = [v7 ratingLabel];
  v10 = [v8 localizedStringForAppRatingLabel:v9];

  return v10;
}

- (id)developer:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263F670A8], "sharedCache", a3);
  v5 = [(STDrillInItemInfoGroupSpecifierProvider *)self usageItem];
  id v6 = [v5 budgetItemIdentifier];
  unint64_t v7 = [v4 appInfoForBundleIdentifier:v6];

  v8 = [v7 developerName];

  return v8;
}

- (void)_didFetchAppInfo:(id)a3
{
  v4 = [(STDrillInItemInfoGroupSpecifierProvider *)self ageRatingSpecifier];
  [(STGroupSpecifierProvider *)self reloadSpecifier:v4 animated:0];

  id v5 = [(STDrillInItemInfoGroupSpecifierProvider *)self developerSpecifier];
  [(STGroupSpecifierProvider *)self reloadSpecifier:v5 animated:0];
}

- (STUsageItem)usageItem
{
  return self->_usageItem;
}

- (PSSpecifier)appIconSpecifier
{
  return self->_appIconSpecifier;
}

- (PSSpecifier)ageRatingSpecifier
{
  return self->_ageRatingSpecifier;
}

- (PSSpecifier)developerSpecifier
{
  return self->_developerSpecifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_developerSpecifier, 0);
  objc_storeStrong((id *)&self->_ageRatingSpecifier, 0);
  objc_storeStrong((id *)&self->_appIconSpecifier, 0);

  objc_storeStrong((id *)&self->_usageItem, 0);
}

@end