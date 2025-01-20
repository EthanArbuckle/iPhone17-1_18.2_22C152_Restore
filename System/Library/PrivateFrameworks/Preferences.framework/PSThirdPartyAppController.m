@interface PSThirdPartyAppController
- (PSDriverPolicyForApp)driverPolicy;
- (PSSystemPolicyForApp)appPolicy;
- (PSSystemPolicyForApp)systemPolicy;
- (id)_readToggleSwitchSpecifierValue:(id)a3;
- (id)_uiValueFromValue:(id)a3 specifier:(id)a4;
- (id)_valueFromUIValue:(id)a3 specifier:(id)a4;
- (id)bundle;
- (id)loadSpecifiers;
- (id)plistFileURL;
- (void)_setToggleSwitchSpecifierValue:(id)a3 specifier:(id)a4;
- (void)postThirdPartySettingDidChangeNotificationForSpecifier:(id)a3;
- (void)setAppPolicy:(id)a3;
- (void)setDriverPolicy:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setSystemPolicy:(id)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)showPrivacyControllerForBundleID:(id)a3;
- (void)showPrivacyControllerForBundleName:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PSThirdPartyAppController

- (id)_uiValueFromValue:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [a4 propertyForKey:@"TrueValue"];
  v7 = (id *)MEMORY[0x1E4F1CFD0];
  if (!v6) {
    id v6 = (id)*MEMORY[0x1E4F1CFD0];
  }
  int v8 = [v5 isEqual:v6];

  v9 = (id *)MEMORY[0x1E4F1CFC8];
  if (v8) {
    v9 = v7;
  }
  id v10 = *v9;

  return v10;
}

- (id)_valueFromUIValue:(id)a3 specifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 propertyForKey:@"TrueValue"];
  id v8 = [v5 propertyForKey:@"FalseValue"];

  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v7 = (id)*MEMORY[0x1E4F1CFD0];
    if (v8) {
      goto LABEL_3;
    }
  }
  id v8 = (id)*MEMORY[0x1E4F1CFC8];
LABEL_3:
  int v9 = [v6 BOOLValue];

  if (v9) {
    id v10 = v7;
  }
  else {
    id v10 = v8;
  }
  id v11 = v10;

  return v11;
}

- (id)_readToggleSwitchSpecifierValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSSpecifierController *)self readPreferenceValue:v4];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [v4 propertyForKey:@"negate"];
    int v8 = [v7 BOOLValue];

    if (v8)
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v6, "BOOLValue") ^ 1);

      id v6 = (void *)v9;
    }
    [v4 setProperty:v6 forKey:@"value"];
    goto LABEL_7;
  }
  uint64_t v10 = [v4 propertyForKey:@"default"];
  if (v10)
  {
    id v6 = (void *)v10;
    [(PSThirdPartyAppController *)self setPreferenceValue:v10 specifier:v4];
LABEL_7:
    id v11 = [(PSThirdPartyAppController *)self _uiValueFromValue:v6 specifier:v4];
    [v4 setProperty:v11 forKey:@"value"];

    goto LABEL_8;
  }
  id v11 = (void *)MEMORY[0x1E4F1CC28];
LABEL_8:

  return v11;
}

- (void)_setToggleSwitchSpecifierValue:(id)a3 specifier:(id)a4
{
  id v11 = a4;
  id v6 = [(PSThirdPartyAppController *)self _valueFromUIValue:a3 specifier:v11];
  uint64_t v7 = [v11 propertyForKey:@"defaults"];
  uint64_t v8 = [v11 propertyForKey:@"key"];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v6 == 0)
  {
    NSLog(&cfstr_ErrorCouldnTWr.isa, v6, v8, v7);
  }
  else
  {
    [(PSThirdPartyAppController *)self setPreferenceValue:v6 specifier:v11];
    GSSendAppPreferencesChanged();
  }
}

- (void)showPrivacyControllerForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PSAppListController onBoardingKitBundleIDDict];
  id v6 = [v4 propertyForKey:@"AppBundleID"];

  id v9 = [v5 objectForKey:v6];

  if ([v9 length])
  {
    uint64_t v7 = [getOBPrivacyPresenterClass_0() presenterForPrivacySplashWithIdentifier:v9];
    uint64_t v8 = [(PSSpecifierController *)self viewController];
    [v7 setPresentingViewController:v8];

    [v7 present];
  }
}

- (void)showPrivacyControllerForBundleName:(id)a3
{
  id v13 = a3;
  id v4 = +[PSAppListController onBoardingKitBundleNameDict];
  uint64_t v5 = [v13 propertyForKey:@"AppBundleID"];
  id v6 = [v4 objectForKey:v5];

  if ([v6 length])
  {
    uint64_t v7 = [v13 objectForKeyedSubscript:@"AppSettingsBundle"];
    uint64_t v8 = [v7 bundlePath];
    id v9 = [v8 stringByDeletingLastPathComponent];
    uint64_t v10 = [v9 stringByAppendingPathComponent:v6];
    id v11 = [getOBPrivacyPresenterClass_0() presenterForPrivacySplashWithBundleAtPath:v10];
    v12 = [(PSSpecifierController *)self viewController];
    [v11 setPresentingViewController:v12];

    [v11 present];
  }
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PSSpecifierController *)self viewController];
  [v7 presentViewController:v6 animated:v4 completion:0];
}

- (void)postThirdPartySettingDidChangeNotificationForSpecifier:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 propertyForKey:@"AppBundleID"];
  BOOL v4 = (void *)v3;
  if (v3)
  {
    v5[0] = v3;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    _CFPreferencesPostValuesChangedInDomains();
  }
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PSThirdPartyAppController;
  id v6 = a4;
  [(PSSpecifierController *)&v7 setPreferenceValue:a3 specifier:v6];
  -[PSThirdPartyAppController postThirdPartySettingDidChangeNotificationForSpecifier:](self, "postThirdPartySettingDidChangeNotificationForSpecifier:", v6, v7.receiver, v7.super_class);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSThirdPartyAppController;
  [(PSSpecifierController *)&v4 viewWillAppear:a3];
  [(PSSpecifierController *)self reloadSpecifiers];
}

- (id)loadSpecifiers
{
  uint64_t v3 = [(PSSpecifierController *)self specifiers];

  if (v3) {
    goto LABEL_43;
  }
  objc_super v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [(PSSpecifierController *)self specifier];
  id v6 = [v5 propertyForKey:@"id"];

  objc_super v7 = [(PSSpecifierController *)self specifier];
  uint64_t v8 = [v7 propertyForKey:@"isThirdPartyDetail"];
  LODWORD(v9) = [v8 BOOLValue];

  if (v9)
  {
    BOOL v70 = 1;
  }
  else
  {
    uint64_t v10 = [(PSThirdPartyAppController *)self appPolicy];

    if (!v10)
    {
      id v11 = [[PSSystemPolicyForApp alloc] initWithBundleIdentifier:v6];
      [(PSThirdPartyAppController *)self setAppPolicy:v11];

      v12 = [(PSThirdPartyAppController *)self appPolicy];
      [v12 setDelegate:self];

      id v13 = [(PSThirdPartyAppController *)self appPolicy];
      [(PSThirdPartyAppController *)self setSystemPolicy:v13];
    }
    v14 = [(PSThirdPartyAppController *)self systemPolicy];
    v15 = [v14 specifiers];

    BOOL v70 = [v15 count] == 0;
    [v4 addObjectsFromArray:v15];
  }
  v16 = [(PSSpecifierController *)self viewController];
  v17 = [v16 title];

  v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v19 = [(PSSpecifierController *)self loadSpecifiersFromPlistName:@"KeyboardExtension" target:self bundle:v18];

  v72 = (void *)v19;
  [v4 addObjectsFromArray:v19];
  v20 = [(PSSpecifierController *)self viewController];
  [v20 setTitle:v17];

  v21 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v22 = [(PSThirdPartyAppController *)self plistFileURL];
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v22];
  v74 = v6;
  int v73 = v9;
  v71 = (void *)v22;
  v75 = v23;
  if (v23)
  {
    v24 = v23;
    v76 = v21;
    v25 = [v23 objectForKey:@"StringsTable"];
    uint64_t v9 = [v25 stringByDeletingPathExtension];

    if (v9)
    {
      v26 = [(PSSpecifierController *)self specifier];
      [v26 setProperty:v9 forKey:@"StringsTable"];
    }
    v27 = [v24 objectForKey:@"ApplicationGroupContainerIdentifier"];
    if (v27)
    {
      v28 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v6];
      v29 = [v28 groupContainerURLs];
      v30 = [v29 objectForKey:v27];

      if (v30)
      {
        v31 = [(PSSpecifierController *)self specifier];
        [v31 setProperty:v27 forKey:@"appGroupBundleID"];

        v32 = [(PSSpecifierController *)self specifier];
        [v32 setProperty:v27 forKey:@"containerBundleID"];
      }
      v24 = v75;
    }
    v68 = v17;
    v33 = [v24 objectForKey:@"PreferenceSpecifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v34 = [v33 count];
      if (v34)
      {
        uint64_t v35 = v34;
        for (uint64_t i = 0; i != v35; ++i)
        {
          v37 = [v33 objectAtIndex:i];
          v38 = [(PSSpecifierController *)self specifier];
          v39 = +[PSAppListController specifiersFromDictionary:v37 stringsTable:v9 parentSpecifier:v38 target:self];

          if (v39) {
            [v76 addObjectsFromArray:v39];
          }
        }
      }
    }
    else
    {
      NSLog(&cfstr_ErrorPreferenc.isa);
    }

    v17 = v68;
    id v6 = v74;
    LODWORD(v9) = v73;
    v21 = v76;
  }
  else
  {
    NSLog(&cfstr_ErrorCouldnTLo.isa, v22);
  }
  if ([v21 count]) {
    int v40 = v9;
  }
  else {
    int v40 = 1;
  }
  if (((v40 | v70) & 1) == 0)
  {
    v41 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v6];
    v42 = [v41 localizedName];

    v43 = NSString;
    v44 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    [v44 localizedStringForKey:@"APP_SETTINGS" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    uint64_t v46 = v45 = v21;
    uint64_t v9 = objc_msgSend(v43, "stringWithFormat:", v46, v42);

    v47 = [v45 firstObject];
    v48 = [v47 identifier];
    LOBYTE(v46) = [v48 isEqualToString:v9];

    if (v46)
    {
LABEL_34:

      LOBYTE(v9) = v73;
      v21 = v45;
      id v6 = v74;
      goto LABEL_35;
    }
    v69 = v17;
    v49 = [v45 firstObject];
    if ([v49 cellType])
    {
    }
    else
    {
      v50 = [v45 firstObject];
      v51 = [v50 name];
      uint64_t v52 = [v51 length];

      if (!v52)
      {
        v53 = [v45 firstObject];
        [v53 setName:v9];
        goto LABEL_33;
      }
    }
    v53 = +[PSSpecifier groupSpecifierWithName:v9];
    [v4 addObject:v53];
LABEL_33:
    v17 = v69;

    goto LABEL_34;
  }
LABEL_35:
  [v4 addObjectsFromArray:v21];
  if ((v9 & 1) == 0)
  {
    v54 = [(PSThirdPartyAppController *)self driverPolicy];

    if (!v54)
    {
      v55 = [[PSDriverPolicyForApp alloc] initWithBundleIdentifier:v6];
      [(PSThirdPartyAppController *)self setDriverPolicy:v55];

      v56 = [(PSThirdPartyAppController *)self driverPolicy];
      [v56 setDelegate:self];
    }
    v57 = [(PSThirdPartyAppController *)self driverPolicy];
    v58 = [v57 specifiers];

    [v4 addObjectsFromArray:v58];
  }
  uint64_t v59 = [(PSSpecifierController *)self specifier];
  if (v59)
  {
    v60 = (void *)v59;
    v61 = [(PSSpecifierController *)self specifier];
    v62 = [v61 propertyForKey:@"id"];

    if (!v62)
    {
      v63 = [(PSSpecifierController *)self specifier];
      v64 = [v63 propertyForKey:@"AppBundleID"];

      v65 = [(PSSpecifierController *)self specifier];
      [v65 setProperty:v64 forKey:@"id"];
    }
  }
  v66 = (void *)[v4 copy];
  [(PSSpecifierController *)self setSpecifiers:v66];

LABEL_43:
  return [(PSSpecifierController *)self specifiers];
}

- (id)bundle
{
  uint64_t v3 = [(PSSpecifierController *)self specifier];
  objc_super v4 = [v3 propertyForKey:@"AppSettingsBundle"];

  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v4 bundlePath];
  int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    id v8 = v4;
  }
  else
  {
    uint64_t v9 = [(PSSpecifierController *)self specifier];
    uint64_t v10 = [v9 propertyForKey:@"AppBundleID"];
    id v11 = +[PSSystemPolicyManager thirdPartyApplicationForBundleID:v10];

    v12 = [v11 record];
    id v13 = [v12 URL];
    v14 = [v13 URLByAppendingPathComponent:@"Settings.bundle"];

    if (v14)
    {
      id v8 = [MEMORY[0x1E4F28B50] bundleWithURL:v14];
      v15 = [(PSSpecifierController *)self specifier];
      [v15 setProperty:v8 forKey:@"AppSettingsBundle"];
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (id)plistFileURL
{
  uint64_t v3 = [(PSSpecifierController *)self specifier];
  objc_super v4 = [v3 propertyForKey:@"File"];

  uint64_t v5 = [(PSThirdPartyAppController *)self bundle];
  id v6 = [v5 URLForResource:v4 withExtension:@"plist"];
  if (!v6) {
    NSLog(&cfstr_ErrorCanTFindP.isa, v4, v5);
  }

  return v6;
}

- (PSSystemPolicyForApp)systemPolicy
{
  return self->_systemPolicy;
}

- (void)setSystemPolicy:(id)a3
{
}

- (PSDriverPolicyForApp)driverPolicy
{
  return self->_driverPolicy;
}

- (void)setDriverPolicy:(id)a3
{
}

- (PSSystemPolicyForApp)appPolicy
{
  return self->_appPolicy;
}

- (void)setAppPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPolicy, 0);
  objc_storeStrong((id *)&self->_driverPolicy, 0);
  objc_storeStrong((id *)&self->_systemPolicy, 0);
}

@end