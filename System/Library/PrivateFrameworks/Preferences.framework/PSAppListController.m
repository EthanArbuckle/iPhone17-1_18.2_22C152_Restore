@interface PSAppListController
+ (BOOL)canUseOnBoardingKitFOrPrivacyDisplayForBundleName:(id)a3;
+ (BOOL)canUseOnBoardingKitForPrivacyDisplayForBundleID:(id)a3;
+ (id)_typeErrorStringForKeyWithName:(id)a3 expectedType:(Class)a4 actualType:(Class)a5;
+ (id)allowedPrivacyBundlesForID;
+ (id)allowedPrivacyBundlesForName;
+ (id)childPaneSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6;
+ (id)groupSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6;
+ (id)localizedTitlesFromUnlocalizedTitles:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5;
+ (id)multiValueSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6;
+ (id)onBoardingKitBundleIDDict;
+ (id)onBoardingKitBundleNameDict;
+ (id)radioGroupSpecifiersFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6;
+ (id)sliderSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6;
+ (id)specifiersFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6;
+ (id)textFieldSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6;
+ (id)titleValueSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6;
+ (id)toggleSwitchSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6;
- (PSDriverPolicyForApp)driverPolicy;
- (PSSystemPolicyForApp)appPolicy;
- (PSSystemPolicyForApp)systemPolicy;
- (id)_readToggleSwitchSpecifierValue:(id)a3;
- (id)_uiValueFromValue:(id)a3 specifier:(id)a4;
- (id)_valueFromUIValue:(id)a3 specifier:(id)a4;
- (id)bundle;
- (id)specifiers;
- (void)_setToggleSwitchSpecifierValue:(id)a3 specifier:(id)a4;
- (void)postThirdPartySettingDidChangeNotificationForSpecifier:(id)a3;
- (void)setAppPolicy:(id)a3;
- (void)setDriverPolicy:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setSystemPolicy:(id)a3;
- (void)showPrivacyControllerForBundleID:(id)a3;
- (void)showPrivacyControllerForBundleName:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PSAppListController

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
  uint64_t v5 = [(PSViewController *)self readPreferenceValue:v4];
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
    [(PSAppListController *)self setPreferenceValue:v10 specifier:v4];
LABEL_7:
    id v11 = [(PSAppListController *)self _uiValueFromValue:v6 specifier:v4];
    [v4 setProperty:v11 forKey:@"value"];

    goto LABEL_8;
  }
  id v11 = 0;
LABEL_8:

  return v11;
}

- (void)_setToggleSwitchSpecifierValue:(id)a3 specifier:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(PSAppListController *)self _valueFromUIValue:v12 specifier:v6];
  uint64_t v8 = [v6 propertyForKey:@"defaults"];
  uint64_t v9 = [v6 propertyForKey:@"key"];
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v7 == 0)
  {
    NSLog(&cfstr_ErrorCouldnTWr.isa, v7, v9, v8);
  }
  else
  {
    [(PSAppListController *)self setPreferenceValue:v12 specifier:v6];
    GSSendAppPreferencesChanged();
  }
}

- (void)showPrivacyControllerForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PSAppListController onBoardingKitBundleIDDict];
  id v6 = [v4 propertyForKey:@"AppBundleID"];

  id v8 = [v5 objectForKey:v6];

  if ([v8 length])
  {
    id v7 = [getOBPrivacyPresenterClass() presenterForPrivacySplashWithIdentifier:v8];
    [v7 setPresentingViewController:self];
    [v7 present];
  }
}

- (void)showPrivacyControllerForBundleName:(id)a3
{
  id v12 = a3;
  id v4 = +[PSAppListController onBoardingKitBundleNameDict];
  uint64_t v5 = [v12 propertyForKey:@"AppBundleID"];
  id v6 = [v4 objectForKey:v5];

  if ([v6 length])
  {
    id v7 = [v12 objectForKeyedSubscript:@"AppSettingsBundle"];
    id v8 = [v7 bundlePath];
    uint64_t v9 = [v8 stringByDeletingLastPathComponent];
    BOOL v10 = [v9 stringByAppendingPathComponent:v6];
    id v11 = [getOBPrivacyPresenterClass() presenterForPrivacySplashWithBundleAtPath:v10];
    [v11 setPresentingViewController:self];
    [v11 present];
  }
}

+ (id)allowedPrivacyBundlesForID
{
  if (allowedPrivacyBundlesForID_onceToken != -1) {
    dispatch_once(&allowedPrivacyBundlesForID_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)allowedPrivacyBundlesForID_allowedPrivacyBundlesForID;
  return v2;
}

void __49__PSAppListController_allowedPrivacyBundlesForID__block_invoke()
{
  id v2 = +[PSAppListController onBoardingKitBundleIDDict];
  uint64_t v0 = [v2 allKeys];
  v1 = (void *)allowedPrivacyBundlesForID_allowedPrivacyBundlesForID;
  allowedPrivacyBundlesForID_allowedPrivacyBundlesForID = v0;
}

+ (id)allowedPrivacyBundlesForName
{
  if (allowedPrivacyBundlesForName_onceToken != -1) {
    dispatch_once(&allowedPrivacyBundlesForName_onceToken, &__block_literal_global_37);
  }
  id v2 = (void *)allowedPrivacyBundlesForName_allowedPrivacyBundlesForName;
  return v2;
}

void __51__PSAppListController_allowedPrivacyBundlesForName__block_invoke()
{
  id v2 = +[PSAppListController onBoardingKitBundleNameDict];
  uint64_t v0 = [v2 allKeys];
  v1 = (void *)allowedPrivacyBundlesForName_allowedPrivacyBundlesForName;
  allowedPrivacyBundlesForName_allowedPrivacyBundlesForName = v0;
}

+ (id)onBoardingKitBundleIDDict
{
  if (onBoardingKitBundleIDDict_onceToken != -1) {
    dispatch_once(&onBoardingKitBundleIDDict_onceToken, &__block_literal_global_39);
  }
  id v2 = (void *)onBoardingKitBundleIDDict_dict;
  return v2;
}

void __48__PSAppListController_onBoardingKitBundleIDDict__block_invoke()
{
  uint64_t v0 = (void *)onBoardingKitBundleIDDict_dict;
  onBoardingKitBundleIDDict_dict = MEMORY[0x1E4F1CC08];
}

+ (id)onBoardingKitBundleNameDict
{
  if (onBoardingKitBundleNameDict_onceToken != -1) {
    dispatch_once(&onBoardingKitBundleNameDict_onceToken, &__block_literal_global_41);
  }
  id v2 = (void *)onBoardingKitBundleNameDict_dict;
  return v2;
}

void __50__PSAppListController_onBoardingKitBundleNameDict__block_invoke()
{
  uint64_t v0 = (void *)onBoardingKitBundleNameDict_dict;
  onBoardingKitBundleNameDict_dict = (uint64_t)&unk_1EFB73DC8;
}

+ (BOOL)canUseOnBoardingKitForPrivacyDisplayForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = +[PSAppListController allowedPrivacyBundlesForID];
  char v5 = [v4 containsObject:v3];

  return v5;
}

+ (BOOL)canUseOnBoardingKitFOrPrivacyDisplayForBundleName:(id)a3
{
  id v3 = a3;
  id v4 = +[PSAppListController allowedPrivacyBundlesForName];
  char v5 = [v4 containsObject:v3];

  return v5;
}

+ (id)localizedTitlesFromUnlocalizedTitles:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 count];
  id v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v10];
  if (v10)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      v13 = [v9 propertyForKey:@"AppSettingsBundle"];
      v14 = [v7 objectAtIndex:i];
      v15 = [v13 localizedStringForKey:v14 value:&stru_1EFB51FD0 table:v8];
      [v11 addObject:v15];
    }
  }

  return v11;
}

- (void)postThirdPartySettingDidChangeNotificationForSpecifier:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 propertyForKey:@"AppBundleID"];
  id v4 = (void *)v3;
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
  v7.super_class = (Class)PSAppListController;
  id v6 = a4;
  [(PSViewController *)&v7 setPreferenceValue:a3 specifier:v6];
  -[PSAppListController postThirdPartySettingDidChangeNotificationForSpecifier:](self, "postThirdPartySettingDidChangeNotificationForSpecifier:", v6, v7.receiver, v7.super_class);
}

+ (id)groupSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  objc_opt_class();
  v13 = [v12 objectForKeyedSubscript:@"Title"];
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  objc_opt_class();
  v16 = [v12 objectForKeyedSubscript:@"FooterText"];

  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  v19 = [v10 propertyForKey:@"AppSettingsBundle"];
  v20 = [v19 localizedStringForKey:v15 value:&stru_1EFB51FD0 table:v11];

  v21 = [v10 propertyForKey:@"AppSettingsBundle"];

  v22 = [v21 localizedStringForKey:v18 value:&stru_1EFB51FD0 table:v11];

  v23 = +[PSSpecifier preferenceSpecifierNamed:v20 target:v9 set:0 get:0 detail:0 cell:0 edit:0];

  [v23 setProperty:v22 forKey:@"footerText"];
  v24 = [v23 identifier];
  uint64_t v25 = [v24 length];

  if (!v25) {
    [v23 setIdentifier:v15];
  }
  v26 = [v23 identifier];
  uint64_t v27 = [v26 length];

  if (!v27) {
    [v23 setIdentifier:v18];
  }
  v28 = [v23 identifier];
  uint64_t v29 = [v28 length];

  if (!v29)
  {
    v30 = [MEMORY[0x1E4F29128] UUID];
    v31 = [v30 UUIDString];
    [v23 setIdentifier:v31];
  }
  return v23;
}

+ (id)radioGroupSpecifiersFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v57 = a4;
  id v11 = a5;
  id v58 = a6;
  objc_opt_class();
  v56 = v11;
  id v12 = [v11 objectForKeyedSubscript:@"AppBundleID"];
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  v14 = v13;

  objc_opt_class();
  id v15 = [v10 objectForKeyedSubscript:@"Key"];
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v60 = v16;

  v59 = [v10 objectForKey:@"DefaultValue"];
  objc_opt_class();
  v17 = [v10 objectForKeyedSubscript:@"Values"];
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;

  objc_opt_class();
  v20 = [v10 objectForKeyedSubscript:@"Titles"];
  if (objc_opt_isKindOfClass()) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  id v22 = v21;

  objc_opt_class();
  v23 = [v10 objectForKeyedSubscript:@"DisplaySortedByTitle"];
  if (objc_opt_isKindOfClass()) {
    v24 = v23;
  }
  else {
    v24 = 0;
  }
  id v25 = v24;

  uint64_t v26 = [v25 BOOLValue];
  v55 = v14;
  if ([(__CFString *)v14 length])
  {
    if ([v60 length])
    {
      if (v59)
      {
        if (v19)
        {
          if (v22)
          {
            if ([v19 count])
            {
              uint64_t v27 = [v19 count];
              if (v27 == [v22 count])
              {
                v28 = v57;
                [a1 groupSpecifierFromDictionary:v10 stringsTable:v57 parentSpecifier:v56 target:v58];
                v30 = uint64_t v29 = v26;
                v31 = [v56 propertyForKey:@"AppBundleID"];
                v32 = v56;
                v33 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
                [v30 setProperty:v33 forKey:@"isRadioGroup"];

                [v30 setProperty:v31 forKey:@"defaults"];
                [v30 setProperty:v60 forKey:@"key"];
                [v30 setProperty:v59 forKey:@"default"];
                [v30 setProperty:v31 forKey:@"AppBundleID"];
                [v30 setProperty:v31 forKey:@"containerBundleID"];
                v34 = [a1 localizedTitlesFromUnlocalizedTitles:v22 stringsTable:v57 parentSpecifier:v56];
                [v30 setValues:v19 titles:v34 shortTitles:0 usingLocalizedTitleSorting:v29];
                v35 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count") + 1);
                [v35 addObject:v30];
                v36 = +[PSRootController readPreferenceValue:v30];
                v54 = [v30 values];
                v61[0] = MEMORY[0x1E4F143A8];
                v61[1] = 3221225472;
                v61[2] = __94__PSAppListController_radioGroupSpecifiersFromDictionary_stringsTable_parentSpecifier_target___block_invoke;
                v61[3] = &unk_1E5C5D618;
                id v62 = v30;
                id v63 = v36;
                id v37 = v35;
                id v64 = v37;
                id v53 = v30;
                id v38 = v36;
                [v54 enumerateObjectsUsingBlock:v61];

LABEL_26:
                v48 = v55;
                goto LABEL_27;
              }
            }
          }
        }
      }
    }
  }
  v31 = [MEMORY[0x1E4F28E78] string];
  uint64_t v39 = objc_opt_class();
  v40 = [a1 _typeErrorStringForKeyWithName:@"Key" expectedType:v39 actualType:objc_opt_class()];
  v41 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v60, "length"));
  [v31 appendFormat:@"\n\t%@ String length is %@ (must be greater than 0).", v40, v41];

  uint64_t v42 = objc_opt_class();
  v43 = [a1 _typeErrorStringForKeyWithName:@"Values" expectedType:v42 actualType:objc_opt_class()];
  v44 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
  [v31 appendFormat:@"\n\t%@ Number of items is %@ (must be greater than 0).", v43, v44];

  uint64_t v45 = objc_opt_class();
  v46 = [a1 _typeErrorStringForKeyWithName:@"Titles" expectedType:v45 actualType:objc_opt_class()];
  v47 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
  [v31 appendFormat:@"\n\t%@ Number of items is %@ (must be greater than 0).", v46, v47];

  v34 = PKLogForCategory(2);
  if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    id v37 = 0;
    v32 = v56;
    v28 = v57;
    goto LABEL_26;
  }
  v50 = (objc_class *)objc_opt_class();
  v51 = NSStringFromClass(v50);
  v52 = @"unknown";
  *(_DWORD *)buf = 138543874;
  v48 = v14;
  v66 = v51;
  if (v14) {
    v52 = v14;
  }
  __int16 v67 = 2114;
  v68 = v52;
  __int16 v69 = 2114;
  v70 = v31;
  _os_log_error_impl(&dword_1A6597000, v34, OS_LOG_TYPE_ERROR, "%{public}@: Could not create radio group specifiers for application '%{public}@' due to invalid input. %{public}@", buf, 0x20u);

  id v37 = 0;
  v32 = v56;
  v28 = v57;
LABEL_27:

  return v37;
}

void __94__PSAppListController_radioGroupSpecifiersFromDictionary_stringsTable_parentSpecifier_target___block_invoke(id *a1, void *a2)
{
  id v3 = a1[4];
  id v4 = a2;
  char v5 = [v3 titleDictionary];
  id v6 = [v5 objectForKey:v4];
  id v8 = +[PSSpecifier preferenceSpecifierNamed:v6 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  [v8 setProperty:v4 forKey:@"value"];
  int v7 = [a1[5] isEqual:v4];

  if (v7) {
    [a1[4] setProperty:v8 forKey:@"radioGroupCheckedSpecifier"];
  }
  [a1[6] addObject:v8];
}

+ (id)textFieldSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v59 = a6;
  objc_opt_class();
  v13 = [v10 objectForKeyedSubscript:@"Title"];
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  v16 = [v12 propertyForKey:@"AppBundleID"];
  objc_opt_class();
  v17 = [v10 objectForKeyedSubscript:@"Key"];
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;

  v20 = [v10 objectForKey:@"DefaultValue"];
  if (!v20)
  {
    v20 = [NSString string];
  }
  id v57 = v16;
  id v58 = v10;
  if (-[__CFString length](v16, "length") && [v19 length] && v20)
  {
    objc_opt_class();
    v21 = [v10 objectForKeyedSubscript:@"IsSecure"];
    if (objc_opt_isKindOfClass()) {
      id v22 = v21;
    }
    else {
      id v22 = 0;
    }
    id v23 = v22;

    int v24 = [v23 BOOLValue];
    if (v24) {
      uint64_t v25 = 12;
    }
    else {
      uint64_t v25 = 8;
    }
    id v55 = v12;
    uint64_t v26 = [v12 propertyForKey:@"AppSettingsBundle"];
    id v27 = v11;
    v28 = v26;
    id v54 = v15;
    v56 = v27;
    uint64_t v29 = objc_msgSend(v26, "localizedStringForKey:value:table:", v15, &stru_1EFB51FD0);
    v30 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v29 target:v59 set:sel_setPreferenceValue_specifier_ get:sel_readPreferenceValue_ detail:0 cell:v25 edit:0];

    [v30 setProperty:v16 forKey:@"defaults"];
    [v30 setProperty:v19 forKey:@"key"];
    [v30 setProperty:v20 forKey:@"default"];
    objc_opt_class();
    v31 = [v10 objectForKeyedSubscript:@"KeyboardType"];
    if (objc_opt_isKindOfClass()) {
      v32 = v31;
    }
    else {
      v32 = 0;
    }
    id v33 = v32;

    if (v33)
    {
      if ([v33 isEqualToString:@"Alphabet"])
      {
        uint64_t v34 = 0;
      }
      else if ([v33 isEqualToString:@"NumbersAndPunctuation"])
      {
        uint64_t v34 = 2;
      }
      else if ([v33 isEqualToString:@"NumberPad"])
      {
        uint64_t v34 = 11;
      }
      else if ([v33 isEqualToString:@"URL"])
      {
        uint64_t v34 = 3;
      }
      else
      {
        if (![v33 isEqualToString:@"EmailAddress"]) {
          goto LABEL_38;
        }
        uint64_t v34 = 7;
      }
      v30[9] = v34;
    }
LABEL_38:
    objc_opt_class();
    uint64_t v45 = [v10 objectForKeyedSubscript:@"AutocapitalizationType"];
    if (objc_opt_isKindOfClass()) {
      v46 = v45;
    }
    else {
      v46 = 0;
    }
    id v47 = v46;

    if (v47)
    {
      if ([v47 isEqualToString:@"None"])
      {
        uint64_t v48 = 0;
      }
      else if ([v47 isEqualToString:@"Sentences"])
      {
        uint64_t v48 = 2;
      }
      else if ([v47 isEqualToString:@"Words"])
      {
        uint64_t v48 = 1;
      }
      else
      {
        if (![v47 isEqualToString:@"AllCharacters"]) {
          goto LABEL_51;
        }
        uint64_t v48 = 3;
      }
      v30[10] = v48;
    }
LABEL_51:
    uint64_t v39 = v19;
    objc_opt_class();
    v49 = [v58 objectForKeyedSubscript:@"AutocorrectionType"];
    if (objc_opt_isKindOfClass()) {
      v50 = v49;
    }
    else {
      v50 = 0;
    }
    id v51 = v50;

    id v11 = v56;
    v35 = v54;
    if (!v51) {
      goto LABEL_62;
    }
    if ([v51 isEqualToString:@"Default"])
    {
      uint64_t v52 = 0;
    }
    else if ([v51 isEqualToString:@"No"])
    {
      uint64_t v52 = 1;
    }
    else
    {
      if (![v51 isEqualToString:@"Yes"])
      {
LABEL_62:

        id v12 = v55;
        goto LABEL_63;
      }
      uint64_t v52 = 2;
    }
    v30[11] = v52;
    goto LABEL_62;
  }
  v35 = v15;
  v36 = [MEMORY[0x1E4F28E78] string];
  uint64_t v37 = objc_opt_class();
  id v38 = [a1 _typeErrorStringForKeyWithName:@"Key" expectedType:v37 actualType:objc_opt_class()];
  uint64_t v39 = v19;
  v40 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v19, "length"));
  [v36 appendFormat:@"\n\t%@ String length is %@ (must be greater than 0).", v38, v40];

  v41 = PKLogForCategory(2);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    uint64_t v42 = (objc_class *)objc_opt_class();
    v43 = NSStringFromClass(v42);
    v44 = @"unknown";
    *(_DWORD *)buf = 138543874;
    v61 = v43;
    if (v57) {
      v44 = v57;
    }
    __int16 v62 = 2114;
    id v63 = v44;
    __int16 v64 = 2114;
    v65 = v36;
    _os_log_error_impl(&dword_1A6597000, v41, OS_LOG_TYPE_ERROR, "%{public}@: Could not create text-field specifier for application '%{public}@' due to invalid input. %{public}@", buf, 0x20u);
  }
  v30 = 0;
LABEL_63:

  return v30;
}

+ (id)toggleSwitchSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v45 = a4;
  id v10 = a5;
  id v44 = a6;
  id v11 = a3;
  objc_opt_class();
  id v12 = [v11 objectForKeyedSubscript:@"Title"];
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  id v15 = [v10 propertyForKey:@"AppBundleID"];
  objc_opt_class();
  v16 = [v11 objectForKeyedSubscript:@"Key"];
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  id v19 = [v11 objectForKey:@"DefaultValue"];
  uint64_t v43 = [v11 objectForKey:@"TrueValue"];
  uint64_t v42 = [v11 objectForKey:@"FalseValue"];

  id v41 = v10;
  if ([v14 length] && -[__CFString length](v15, "length") && objc_msgSend(v18, "length") && v19)
  {
    v20 = [v10 propertyForKey:@"AppSettingsBundle"];
    v21 = v45;
    id v22 = [v20 localizedStringForKey:v14 value:&stru_1EFB51FD0 table:v45];
    id v23 = v44;
    int v24 = +[PSSpecifier preferenceSpecifierNamed:v22 target:v44 set:sel__setToggleSwitchSpecifierValue_specifier_ get:sel__readToggleSwitchSpecifierValue_ detail:0 cell:6 edit:0];

    uint64_t v25 = v15;
    [v24 setProperty:v15 forKey:@"defaults"];
    [v24 setProperty:v18 forKey:@"key"];
    [v24 setProperty:v19 forKey:@"default"];
    uint64_t v26 = (void *)v43;
    if (v43) {
      [v24 setProperty:v43 forKey:@"TrueValue"];
    }
    id v27 = (void *)v42;
    if (v42) {
      [v24 setProperty:v42 forKey:@"FalseValue"];
    }
    v28 = v41;
  }
  else
  {
    uint64_t v29 = [MEMORY[0x1E4F28E78] string];
    uint64_t v30 = objc_opt_class();
    v31 = [a1 _typeErrorStringForKeyWithName:@"Key" expectedType:v30 actualType:objc_opt_class()];
    v32 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v18, "length"));
    [v29 appendFormat:@"\n\t%@ String length is %@ (must be greater than 0).", v31, v32];

    uint64_t v33 = objc_opt_class();
    uint64_t v34 = [a1 _typeErrorStringForKeyWithName:@"Title" expectedType:v33 actualType:objc_opt_class()];
    v35 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
    [v29 appendFormat:@"\n\t%@ String length is %@ (must be greater than 0).", v34, v35];

    if (!v19) {
      [v29 appendString:@"\n\t DefaultValue is missing (must be set)."];
    }
    v36 = PKLogForCategory(2);
    v21 = v45;
    uint64_t v25 = v15;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v38 = (objc_class *)objc_opt_class();
      uint64_t v39 = NSStringFromClass(v38);
      v40 = @"unknown";
      *(_DWORD *)buf = 138543874;
      id v47 = v39;
      if (v15) {
        v40 = v15;
      }
      __int16 v48 = 2114;
      v49 = v40;
      __int16 v50 = 2114;
      id v51 = v29;
      _os_log_error_impl(&dword_1A6597000, v36, OS_LOG_TYPE_ERROR, "%{public}@: Could not create toggle switch specifier for application '%{public}@' due to invalid input. %{public}@", buf, 0x20u);
    }
    int v24 = 0;
    v28 = v41;
    id v27 = (void *)v42;
    uint64_t v26 = (void *)v43;
    id v23 = v44;
  }

  return v24;
}

+ (id)sliderSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v59 = a6;
  id v8 = a5;
  id v9 = a3;
  uint64_t v58 = [v8 propertyForKey:@"AppSettingsBundle"];
  uint64_t v10 = [v8 propertyForKey:@"AppBundleID"];

  objc_opt_class();
  id v11 = [v9 objectForKeyedSubscript:@"Key"];
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  objc_opt_class();
  id v14 = [v9 objectForKeyedSubscript:@"DefaultValue"];
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v61 = v15;

  objc_opt_class();
  v16 = [v9 objectForKeyedSubscript:@"MinimumValue"];
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  objc_opt_class();
  id v19 = [v9 objectForKeyedSubscript:@"MaximumValue"];
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  objc_opt_class();
  id v22 = [v9 objectForKeyedSubscript:@"MinimumValueImage"];
  if (objc_opt_isKindOfClass()) {
    id v23 = v22;
  }
  else {
    id v23 = 0;
  }
  id v57 = v23;

  objc_opt_class();
  int v24 = [v9 objectForKeyedSubscript:@"MaximumValueImage"];

  if (objc_opt_isKindOfClass()) {
    uint64_t v25 = v24;
  }
  else {
    uint64_t v25 = 0;
  }
  id v26 = v25;

  id v60 = (__CFString *)v10;
  id v27 = (void *)v10;
  v28 = v13;
  if ([v27 length] && objc_msgSend(v13, "length") && v61 && v18 && v21)
  {
    uint64_t v29 = +[PSSpecifier preferenceSpecifierNamed:0 target:v59 set:sel_setPreferenceValue_specifier_ get:sel_readPreferenceValue_ detail:0 cell:5 edit:0];
    [v29 setProperty:v60 forKey:@"defaults"];
    [v29 setProperty:v13 forKey:@"key"];
    [v29 setProperty:v61 forKey:@"default"];
    [v29 setProperty:v18 forKey:@"min"];
    [v29 setProperty:v21 forKey:@"max"];
    uint64_t v30 = v57;
    if (v57)
    {
      v31 = (void *)MEMORY[0x1E4F42A80];
      v32 = [MEMORY[0x1E4F42D90] mainScreen];
      uint64_t v33 = [v32 traitCollection];
      uint64_t v34 = [v31 imageNamed:v57 inBundle:v58 compatibleWithTraitCollection:v33];

      if (v34) {
        [v29 setProperty:v34 forKey:@"leftImage"];
      }

      v28 = v13;
    }
    if (v26)
    {
      v35 = v28;
      v36 = (void *)MEMORY[0x1E4F42A80];
      uint64_t v37 = [MEMORY[0x1E4F42D90] mainScreen];
      id v38 = [v37 traitCollection];
      uint64_t v39 = (void *)v58;
      v40 = [v36 imageNamed:v26 inBundle:v58 compatibleWithTraitCollection:v38];

      if (v40) {
        [v29 setProperty:v40 forKey:@"rightImage"];
      }

      v28 = v35;
    }
    else
    {
      uint64_t v39 = (void *)v58;
    }
  }
  else
  {
    id v41 = [MEMORY[0x1E4F28E78] string];
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = [a1 _typeErrorStringForKeyWithName:@"Key" expectedType:v42 actualType:objc_opt_class()];
    id v44 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v13, "length"));
    [v41 appendFormat:@"\n\t%@ String length is %@ (must be greater than 0).", v43, v44];

    uint64_t v45 = objc_opt_class();
    v46 = [a1 _typeErrorStringForKeyWithName:@"DefaultValue" expectedType:v45 actualType:objc_opt_class()];
    [v41 appendFormat:@"\n\t%@", v46];

    uint64_t v47 = objc_opt_class();
    __int16 v48 = [a1 _typeErrorStringForKeyWithName:@"MinimumValue" expectedType:v47 actualType:objc_opt_class()];
    [v41 appendFormat:@"\n\t%@", v48];

    uint64_t v49 = objc_opt_class();
    __int16 v50 = [a1 _typeErrorStringForKeyWithName:@"MaximumValue" expectedType:v49 actualType:objc_opt_class()];
    [v41 appendFormat:@"\n\t%@", v50];

    id v51 = PKLogForCategory(2);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      id v53 = (objc_class *)objc_opt_class();
      id v54 = NSStringFromClass(v53);
      id v55 = @"unknown";
      *(_DWORD *)buf = 138543874;
      id v63 = v54;
      if (v60) {
        id v55 = v60;
      }
      __int16 v64 = 2114;
      v65 = v55;
      __int16 v66 = 2114;
      __int16 v67 = v41;
      _os_log_error_impl(&dword_1A6597000, v51, OS_LOG_TYPE_ERROR, "%{public}@: Could not create slider specifier for application '%{public}@' due to invalid input. %{public}@", buf, 0x20u);
    }
    uint64_t v29 = 0;
    uint64_t v30 = v57;
    uint64_t v39 = (void *)v58;
  }

  return v29;
}

+ (id)titleValueSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v56 = a4;
  id v9 = a5;
  id v57 = a6;
  id v10 = a3;
  objc_opt_class();
  id v11 = [v10 objectForKeyedSubscript:@"Title"];
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  id v55 = v9;
  id v14 = [v9 propertyForKey:@"AppBundleID"];
  objc_opt_class();
  id v15 = [v10 objectForKeyedSubscript:@"Key"];
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  id v18 = [v10 objectForKey:@"DefaultValue"];
  objc_opt_class();
  id v19 = [v10 objectForKeyedSubscript:@"Values"];
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  objc_opt_class();
  id v22 = [v10 objectForKeyedSubscript:@"Titles"];

  if (objc_opt_isKindOfClass()) {
    id v23 = v22;
  }
  else {
    id v23 = 0;
  }
  id v24 = v23;

  uint64_t v58 = v14;
  if (-[__CFString length](v14, "length") && [v17 length] && v18)
  {
    id v53 = v24;
    uint64_t v25 = v55;
    id v26 = [v55 propertyForKey:@"AppSettingsBundle"];
    id v27 = v56;
    [v26 localizedStringForKey:v13 value:&stru_1EFB51FD0 table:v56];
    id v28 = v21;
    v30 = uint64_t v29 = v18;
    v31 = v57;
    v32 = +[PSSpecifier preferenceSpecifierNamed:v30 target:v57 set:0 get:sel_readPreferenceValue_ detail:0 cell:4 edit:0];

    id v18 = v29;
    id v21 = v28;

    [v32 setProperty:v58 forKey:@"defaults"];
    [v32 setProperty:v17 forKey:@"key"];
    [v32 setProperty:v18 forKey:@"default"];
    if (v28)
    {
      id v24 = v53;
      if (v53 && [v21 count])
      {
        uint64_t v33 = [v21 count];
        if (v33 == [v53 count])
        {
          uint64_t v34 = [a1 localizedTitlesFromUnlocalizedTitles:v53 stringsTable:v56 parentSpecifier:v55];
          [v32 setValues:v21 titles:v34 shortTitles:0];
        }
        v31 = v57;
      }
    }
    else
    {
      id v24 = v53;
    }
  }
  else
  {
    v35 = [MEMORY[0x1E4F28E78] string];
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = [a1 _typeErrorStringForKeyWithName:@"Key" expectedType:v36 actualType:objc_opt_class()];
    id v38 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v17, "length"));
    [v35 appendFormat:@"\n\t%@ String length is %@ (must be greater than 0).", v37, v38];

    uint64_t v39 = objc_opt_class();
    v40 = [a1 _typeErrorStringForKeyWithName:@"Title" expectedType:v39 actualType:objc_opt_class()];
    id v41 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v13, "length"));
    [v35 appendFormat:@"\n\t%@ String length is %@ (must be greater than 0).", v40, v41];

    uint64_t v42 = objc_opt_class();
    uint64_t v43 = [a1 _typeErrorStringForKeyWithName:@"Values" expectedType:v42 actualType:objc_opt_class()];
    id v44 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
    [v35 appendFormat:@"\n\t%@ Number of items is %@ (must be greater than 0).", v43, v44];

    uint64_t v45 = objc_opt_class();
    v46 = [a1 _typeErrorStringForKeyWithName:@"Titles" expectedType:v45 actualType:objc_opt_class()];
    uint64_t v47 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
    [v35 appendFormat:@"\n\t%@ Number of items is %@ (must be greater than 0).", v46, v47];

    __int16 v48 = PKLogForCategory(2);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      __int16 v50 = (objc_class *)objc_opt_class();
      id v51 = NSStringFromClass(v50);
      uint64_t v52 = @"unknown";
      *(_DWORD *)buf = 138543874;
      id v60 = v51;
      if (v14) {
        uint64_t v52 = v14;
      }
      __int16 v61 = 2114;
      __int16 v62 = v52;
      __int16 v63 = 2114;
      __int16 v64 = v35;
      _os_log_error_impl(&dword_1A6597000, v48, OS_LOG_TYPE_ERROR, "%{public}@: Could not create title-value specifier for application '%{public}@' due to invalid input. %{public}@", buf, 0x20u);
    }
    v32 = 0;
    uint64_t v25 = v55;
    id v27 = v56;
    v31 = v57;
  }

  return v32;
}

+ (id)multiValueSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v63 = a4;
  id v10 = a5;
  id v61 = a6;
  id v11 = a3;
  objc_opt_class();
  id v12 = [v11 objectForKeyedSubscript:@"Title"];
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  id v62 = v10;
  id v15 = [v10 propertyForKey:@"AppBundleID"];
  objc_opt_class();
  v16 = [v11 objectForKeyedSubscript:@"Key"];
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }
  id v67 = v17;

  uint64_t v65 = [v11 objectForKey:@"DefaultValue"];
  objc_opt_class();
  id v18 = [v11 objectForKeyedSubscript:@"Values"];
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }
  id v20 = v19;

  objc_opt_class();
  id v21 = [v11 objectForKeyedSubscript:@"Titles"];
  if (objc_opt_isKindOfClass()) {
    id v22 = v21;
  }
  else {
    id v22 = 0;
  }
  id v23 = v22;

  objc_opt_class();
  id v24 = [v11 objectForKeyedSubscript:@"ShortTitles"];
  if (objc_opt_isKindOfClass()) {
    uint64_t v25 = v24;
  }
  else {
    uint64_t v25 = 0;
  }
  id v60 = v25;

  objc_opt_class();
  id v26 = [v11 objectForKeyedSubscript:@"DisplaySortedByTitle"];

  if (objc_opt_isKindOfClass()) {
    id v27 = v26;
  }
  else {
    id v27 = 0;
  }
  id v28 = v27;

  uint64_t v29 = [v28 BOOLValue];
  __int16 v66 = v14;
  __int16 v64 = v15;
  if ([v14 length]
    && [(__CFString *)v15 length]
    && [v67 length]
    && v65
    && v20
    && v23
    && [v20 count]
    && (uint64_t v30 = [v20 count], v30 == objc_msgSend(v23, "count")))
  {
    v31 = v10;
    id v57 = [v10 propertyForKey:@"AppSettingsBundle"];
    v32 = v63;
    id v56 = [v57 localizedStringForKey:v14 value:&stru_1EFB51FD0 table:v63];
    uint64_t v33 = v15;
    uint64_t v34 = v61;
    v35 = +[PSSpecifier preferenceSpecifierNamed:v56 target:v61 set:sel_setPreferenceValue_specifier_ get:sel_readPreferenceValue_ detail:objc_opt_class() cell:2 edit:0];

    [v35 setProperty:v33 forKey:@"defaults"];
    [v35 setProperty:v67 forKey:@"key"];
    [v35 setProperty:v65 forKey:@"default"];
    id v59 = [a1 localizedTitlesFromUnlocalizedTitles:v23 stringsTable:v63 parentSpecifier:v62];
    uint64_t v36 = v60;
    if (v60 && (uint64_t v58 = [v60 count], v58 == objc_msgSend(v23, "count")))
    {
      uint64_t v37 = [a1 localizedTitlesFromUnlocalizedTitles:v60 stringsTable:v63 parentSpecifier:v62];
    }
    else
    {
      uint64_t v37 = 0;
    }
    [v35 setValues:v20 titles:v59 shortTitles:v37 usingLocalizedTitleSorting:v29];
  }
  else
  {
    id v38 = [MEMORY[0x1E4F28E78] string];
    uint64_t v39 = objc_opt_class();
    v40 = [a1 _typeErrorStringForKeyWithName:@"Key" expectedType:v39 actualType:objc_opt_class()];
    id v41 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v67, "length"));
    [v38 appendFormat:@"\n\t%@ String length is %@ (must be greater than 0).", v40, v41];

    uint64_t v42 = objc_opt_class();
    uint64_t v43 = [a1 _typeErrorStringForKeyWithName:@"Title" expectedType:v42 actualType:objc_opt_class()];
    id v44 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
    [v38 appendFormat:@"\n\t%@ String length is %@ (must be greater than 0).", v43, v44];

    uint64_t v45 = objc_opt_class();
    v46 = [a1 _typeErrorStringForKeyWithName:@"Values" expectedType:v45 actualType:objc_opt_class()];
    uint64_t v47 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
    [v38 appendFormat:@"\n\t%@ Number of items is %@ (must be greater than 0).", v46, v47];

    uint64_t v48 = objc_opt_class();
    uint64_t v49 = [a1 _typeErrorStringForKeyWithName:@"Titles" expectedType:v48 actualType:objc_opt_class()];
    __int16 v50 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
    [v38 appendFormat:@"\n\t%@ Number of items is %@ (must be greater than 0).", v49, v50];

    id v51 = PKLogForCategory(2);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      id v53 = (objc_class *)objc_opt_class();
      id v54 = NSStringFromClass(v53);
      id v55 = @"unknown";
      *(_DWORD *)buf = 138543874;
      __int16 v69 = v54;
      if (v64) {
        id v55 = v64;
      }
      __int16 v70 = 2114;
      uint64_t v71 = v55;
      __int16 v72 = 2114;
      v73 = v38;
      _os_log_error_impl(&dword_1A6597000, v51, OS_LOG_TYPE_ERROR, "%{public}@: Could not multi-value specifier for application '%{public}@' due to invalid input. %{public}@", buf, 0x20u);
    }
    v35 = 0;
    v31 = v62;
    v32 = v63;
    uint64_t v36 = v60;
    uint64_t v34 = v61;
  }

  return v35;
}

+ (id)childPaneSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v57 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = a3;
  objc_opt_class();
  id v12 = [v11 objectForKeyedSubscript:@"Title"];
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  objc_opt_class();
  id v15 = [v11 objectForKeyedSubscript:@"File"];
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  objc_opt_class();
  id v18 = [v11 objectForKeyedSubscript:@"ShouldShowGDPR"];
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }
  id v20 = v19;

  objc_opt_class();
  id v21 = [v11 objectForKeyedSubscript:@"ShouldShowGDPRFromAppBundle"];

  if (objc_opt_isKindOfClass()) {
    id v22 = v21;
  }
  else {
    id v22 = 0;
  }
  id v23 = v22;

  id v56 = v20;
  if ([v20 BOOLValue])
  {
    id v24 = [v9 propertyForKey:@"AppBundleID"];
    BOOL v25 = +[PSAppListController canUseOnBoardingKitForPrivacyDisplayForBundleID:v24];
  }
  else
  {
    BOOL v25 = 0;
  }
  id v55 = v10;
  if ([v23 BOOLValue])
  {
    id v26 = [v9 propertyForKey:@"AppBundleID"];
    BOOL v27 = +[PSAppListController canUseOnBoardingKitFOrPrivacyDisplayForBundleName:v26];
  }
  else
  {
    BOOL v27 = 0;
  }
  uint64_t v58 = v9;
  if ([v14 length])
  {
    if (v25)
    {
      id v28 = [v9 propertyForKey:@"AppSettingsBundle"];
      uint64_t v29 = v57;
      uint64_t v30 = [v28 localizedStringForKey:v14 value:&stru_1EFB51FD0 table:v57];
      v31 = v55;
      v32 = +[PSSpecifier preferenceSpecifierNamed:v30 target:v55 set:0 get:0 detail:0 cell:1 edit:0];

      [v32 setProperty:MEMORY[0x1E4F1CC38] forKey:@"enabled"];
      [v32 setProperty:MEMORY[0x1E4F1CC28] forKey:@"searchable"];
      [v32 setButtonAction:sel_showPrivacyControllerForBundleID_];
      uint64_t v33 = v17;
    }
    else
    {
      uint64_t v29 = v57;
      uint64_t v33 = v17;
      if (v27)
      {
        uint64_t v42 = [v9 propertyForKey:@"AppSettingsBundle"];
        uint64_t v43 = [v42 localizedStringForKey:v14 value:&stru_1EFB51FD0 table:v57];
        v31 = v55;
        v32 = +[PSSpecifier preferenceSpecifierNamed:v43 target:v55 set:0 get:0 detail:0 cell:1 edit:0];

        [v32 setProperty:MEMORY[0x1E4F1CC38] forKey:@"enabled"];
        [v32 setProperty:MEMORY[0x1E4F1CC28] forKey:@"searchable"];
        [v32 setButtonAction:sel_showPrivacyControllerForBundleName_];
      }
      else if ([v17 length])
      {
        id v44 = [v9 propertyForKey:@"AppSettingsBundle"];
        uint64_t v45 = [v44 localizedStringForKey:v14 value:&stru_1EFB51FD0 table:v57];
        v31 = v55;
        v32 = +[PSSpecifier preferenceSpecifierNamed:v45 target:v55 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

        [v32 setProperty:v17 forKey:@"File"];
      }
      else
      {
        v32 = 0;
        v31 = v55;
      }
    }
    [v32 setProperty:v14 forKey:@"id"];
  }
  else
  {
    uint64_t v34 = [MEMORY[0x1E4F28E78] string];
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = [a1 _typeErrorStringForKeyWithName:@"Title" expectedType:v35 actualType:objc_opt_class()];
    uint64_t v37 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
    [v34 appendFormat:@"\n\t%@ String length is %@ (must be greater than 0).", v36, v37];

    uint64_t v38 = objc_opt_class();
    uint64_t v39 = [a1 _typeErrorStringForKeyWithName:@"File" expectedType:v38 actualType:objc_opt_class()];
    uint64_t v33 = v17;
    v40 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v17, "length"));
    [v34 appendFormat:@"\n\t%@ String length is %@ (must be greater than 0).", v39, v40];

    id v41 = PKLogForCategory(2);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      uint64_t v47 = (objc_class *)objc_opt_class();
      uint64_t v48 = NSStringFromClass(v47);
      objc_opt_class();
      uint64_t v49 = [v9 objectForKeyedSubscript:@"AppBundleID"];
      if (objc_opt_isKindOfClass()) {
        __int16 v50 = v49;
      }
      else {
        __int16 v50 = 0;
      }
      id v51 = v50;
      uint64_t v52 = v51;
      id v53 = @"unknown";
      *(_DWORD *)buf = 138543874;
      id v60 = v48;
      if (v51) {
        id v53 = v51;
      }
      __int16 v61 = 2114;
      id v62 = v53;
      __int16 v63 = 2114;
      __int16 v64 = v34;
      _os_log_error_impl(&dword_1A6597000, v41, OS_LOG_TYPE_ERROR, "%{public}@: Could not create child pane specifier for application '%{public}@' due to invalid input. %{public}@", buf, 0x20u);
    }
    v32 = 0;
    uint64_t v29 = v57;
    v31 = v55;
  }

  return v32;
}

+ (id)specifiersFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v14 = [v10 objectForKeyedSubscript:@"Type"];
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    id v17 = [v10 objectForKey:@"SupportedUserInterfaceIdioms"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v17 = 0;
    }
    id v18 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v19 = [v18 userInterfaceIdiom];

    id v20 = [v12 propertyForKey:@"AppBundleID"];
    if (!v17
      || (v19 ? (id v21 = @"Pad") : (id v21 = @"Phone"), [v17 containsObject:v21]))
    {
      if ([v16 isEqualToString:@"PSGroupSpecifier"])
      {
        uint64_t v22 = [a1 groupSpecifierFromDictionary:v10 stringsTable:v11 parentSpecifier:v12 target:v13];
        goto LABEL_29;
      }
      if ([v16 isEqualToString:@"PSTextFieldSpecifier"])
      {
        uint64_t v22 = [a1 textFieldSpecifierFromDictionary:v10 stringsTable:v11 parentSpecifier:v12 target:v13];
        goto LABEL_29;
      }
      if ([v16 isEqualToString:@"PSToggleSwitchSpecifier"])
      {
        uint64_t v22 = [a1 toggleSwitchSpecifierFromDictionary:v10 stringsTable:v11 parentSpecifier:v12 target:v13];
        goto LABEL_29;
      }
      if ([v16 isEqualToString:@"PSSliderSpecifier"])
      {
        uint64_t v22 = [a1 sliderSpecifierFromDictionary:v10 stringsTable:v11 parentSpecifier:v12 target:v13];
        goto LABEL_29;
      }
      if ([v16 isEqualToString:@"PSTitleValueSpecifier"])
      {
        uint64_t v22 = [a1 titleValueSpecifierFromDictionary:v10 stringsTable:v11 parentSpecifier:v12 target:v13];
        goto LABEL_29;
      }
      if ([v16 isEqualToString:@"PSMultiValueSpecifier"])
      {
        uint64_t v22 = [a1 multiValueSpecifierFromDictionary:v10 stringsTable:v11 parentSpecifier:v12 target:v13];
        goto LABEL_29;
      }
      if ([v16 isEqualToString:@"PSChildPaneSpecifier"])
      {
        uint64_t v22 = [a1 childPaneSpecifierFromDictionary:v10 stringsTable:v11 parentSpecifier:v12 target:v13];
LABEL_29:
        id v23 = v22;
        if (v22)
        {
          id v24 = [MEMORY[0x1E4F1C978] arrayWithObject:v22];
LABEL_35:
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __84__PSAppListController_specifiersFromDictionary_stringsTable_parentSpecifier_target___block_invoke;
          v27[3] = &unk_1E5C5D640;
          id v28 = v20;
          id v29 = v12;
          id v25 = v20;
          [v24 enumerateObjectsUsingBlock:v27];

          goto LABEL_36;
        }
LABEL_34:
        id v24 = 0;
        goto LABEL_35;
      }
      if ([v16 isEqualToString:@"PSRadioGroupSpecifier"])
      {
        id v24 = [a1 radioGroupSpecifiersFromDictionary:v10 stringsTable:v11 parentSpecifier:v12 target:v13];
        id v23 = 0;
        goto LABEL_35;
      }
    }
    id v23 = 0;
    goto LABEL_34;
  }
  id v23 = PKLogForCategory(2);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    +[PSAppListController specifiersFromDictionary:stringsTable:parentSpecifier:target:]((uint64_t)a1, v23);
  }
  id v24 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_36:

  return v24;
}

void __84__PSAppListController_specifiersFromDictionary_stringsTable_parentSpecifier_target___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 setProperty:*(void *)(a1 + 32) forKey:@"AppBundleID"];
  [v7 setProperty:*(void *)(a1 + 32) forKey:@"containerBundleID"];
  id v3 = [*(id *)(a1 + 40) propertyForKey:@"AppSettingsBundle"];
  [v7 setProperty:v3 forKey:@"AppSettingsBundle"];

  [v7 setProperty:MEMORY[0x1E4F1CC38] forKey:@"isThirdPartyDetail"];
  id v4 = [*(id *)(a1 + 40) propertyForKey:@"appGroupBundleID"];

  if (v4)
  {
    char v5 = [*(id *)(a1 + 40) propertyForKey:@"appGroupBundleID"];
    [v7 setProperty:v5 forKey:@"containerBundleID"];

    id v6 = [*(id *)(a1 + 40) propertyForKey:@"appGroupBundleID"];
    [v7 setProperty:v6 forKey:@"appGroupBundleID"];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSAppListController;
  [(PSListController *)&v4 viewWillAppear:a3];
  [(PSListController *)self reloadSpecifierID:@"NOTIFICATIONS"];
  [(PSListController *)self reloadSpecifierID:@"SIRI"];
  [(PSListController *)self reloadSpecifierID:@"SEARCH"];
}

- (id)specifiers
{
  specifiers = self->super._specifiers;
  if (!specifiers)
  {
    objc_super v4 = [MEMORY[0x1E4F1CA48] array];
    char v5 = -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:");
    id v6 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"isThirdPartyDetail"];
    int v7 = [v6 BOOLValue];

    int v76 = v7;
    if (v7)
    {
      BOOL v68 = 1;
    }
    else
    {
      id v8 = [(PSAppListController *)self appPolicy];

      if (!v8)
      {
        id v9 = [[PSSystemPolicyForApp alloc] initWithBundleIdentifier:v5];
        [(PSAppListController *)self setAppPolicy:v9];

        id v10 = [(PSAppListController *)self appPolicy];
        [v10 setDelegate:self];

        id v11 = [(PSAppListController *)self appPolicy];
        [(PSAppListController *)self setSystemPolicy:v11];
      }
      id v12 = [(PSAppListController *)self systemPolicy];
      id v13 = [v12 specifiers];

      BOOL v68 = [v13 count] == 0;
      [(NSArray *)v4 addObjectsFromArray:v13];
    }
    uint64_t v14 = [(PSAppListController *)self title];
    id v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v16 = [(PSListController *)self loadSpecifiersFromPlistName:@"KeyboardExtension" target:self bundle:v15];

    uint64_t v71 = (void *)v16;
    [(NSArray *)v4 addObjectsFromArray:v16];
    __int16 v72 = (void *)v14;
    [(PSListController *)self setTitle:v14];
    id v17 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v18 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"File"];
    uint64_t v19 = [(PSAppListController *)self bundle];
    id v20 = [v19 pathForResource:v18 ofType:@"plist"];
    if (![v20 length]) {
      NSLog(&cfstr_ErrorCanTFindP.isa, v18, v19);
    }
    __int16 v69 = v19;
    __int16 v70 = (void *)v18;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v20];
    unint64_t v22 = 0x1E4F29000uLL;
    v73 = v20;
    uint64_t v74 = v5;
    v75 = v21;
    if (v21)
    {
      objc_opt_class();
      id v23 = [v21 objectForKeyedSubscript:@"StringsTable"];
      if (objc_opt_isKindOfClass()) {
        id v24 = v23;
      }
      else {
        id v24 = 0;
      }
      id v25 = v24;

      if (v25)
      {
        specifier = self->super.super._specifier;
        BOOL v27 = [v25 stringByDeletingPathExtension];
        [(PSSpecifier *)specifier setProperty:v27 forKey:@"StringsTable"];
      }
      id v67 = v4;
      objc_opt_class();
      id v28 = [v21 objectForKeyedSubscript:@"ApplicationGroupContainerIdentifier"];
      if (objc_opt_isKindOfClass()) {
        id v29 = v28;
      }
      else {
        id v29 = 0;
      }
      id v30 = v29;

      if (v30)
      {
        v31 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v5];
        v32 = [v31 groupContainerURLs];
        uint64_t v33 = [v32 objectForKey:v30];

        if (v33)
        {
          [(PSSpecifier *)self->super.super._specifier setProperty:v30 forKey:@"appGroupBundleID"];
          [(PSSpecifier *)self->super.super._specifier setProperty:v30 forKey:@"containerBundleID"];
        }
      }
      objc_opt_class();
      uint64_t v34 = [v75 objectForKeyedSubscript:@"PreferenceSpecifiers"];
      if (objc_opt_isKindOfClass()) {
        uint64_t v35 = v34;
      }
      else {
        uint64_t v35 = 0;
      }
      id v36 = v35;

      uint64_t v37 = [v36 count];
      if (v37)
      {
        uint64_t v38 = v37;
        for (uint64_t i = 0; i != v38; ++i)
        {
          v40 = [v36 objectAtIndex:i];
          id v41 = [(id)objc_opt_class() specifiersFromDictionary:v40 stringsTable:v25 parentSpecifier:self->super.super._specifier target:self];
          if (v41) {
            [v17 addObjectsFromArray:v41];
          }
        }
      }

      objc_super v4 = v67;
      id v20 = v73;
      char v5 = v74;
      id v21 = v75;
      unint64_t v22 = 0x1E4F29000;
    }
    else
    {
      NSLog(&cfstr_ErrorCouldnTLo.isa, v20);
    }
    uint64_t v42 = [v17 count];
    int v43 = v76;
    if (!v42) {
      int v43 = 1;
    }
    if (((v43 | v68) & 1) == 0)
    {
      id v44 = v5;
      uint64_t v45 = v4;
      v46 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v44];
      uint64_t v47 = [v46 localizedName];

      uint64_t v48 = *(void **)(v22 + 24);
      uint64_t v49 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      __int16 v50 = [v49 localizedStringForKey:@"APP_SETTINGS" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      id v51 = objc_msgSend(v48, "stringWithFormat:", v50, v47);
      uint64_t v52 = [v51 localizedUppercaseString];

      id v53 = [v17 firstObject];
      id v54 = [v53 name];
      uint64_t v55 = [v54 length];

      if (v55)
      {
        id v56 = +[PSSpecifier groupSpecifierWithName:v52];
        objc_super v4 = v45;
        [(NSArray *)v45 addObject:v56];
      }
      else
      {
        id v56 = [v17 firstObject];
        [v56 setName:v52];
        objc_super v4 = v45;
      }

      id v20 = v73;
      char v5 = v74;
      id v21 = v75;
    }
    [(NSArray *)v4 addObjectsFromArray:v17];
    if ((v76 & 1) == 0)
    {
      id v57 = [(PSAppListController *)self driverPolicy];

      if (!v57)
      {
        uint64_t v58 = [[PSDriverPolicyForApp alloc] initWithBundleIdentifier:v5];
        [(PSAppListController *)self setDriverPolicy:v58];

        id v59 = [(PSAppListController *)self driverPolicy];
        [v59 setDelegate:self];
      }
      id v60 = [(PSAppListController *)self driverPolicy];
      __int16 v61 = [v60 specifiers];

      [(NSArray *)v4 addObjectsFromArray:v61];
    }
    id v62 = self->super.super._specifier;
    if (v62)
    {
      __int16 v63 = [(PSSpecifier *)v62 propertyForKey:@"id"];

      if (!v63)
      {
        __int16 v64 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"AppBundleID"];
        [(PSSpecifier *)self->super.super._specifier setProperty:v64 forKey:@"id"];
      }
    }
    uint64_t v65 = self->super._specifiers;
    self->super._specifiers = v4;

    specifiers = self->super._specifiers;
  }
  return specifiers;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PSAppListController;
  id v6 = a4;
  [(PSListController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = objc_msgSend(v6, "section", v12.receiver, v12.super_class);

  id v8 = [(PSListController *)self specifierAtIndex:[(PSListController *)self indexOfGroup:v7]];
  id v9 = [v8 propertyForKey:@"isRadioGroup"];
  LODWORD(v6) = [v9 BOOLValue];

  if (v6)
  {
    id v10 = [v8 propertyForKey:@"radioGroupCheckedSpecifier"];
    id v11 = [v10 propertyForKey:@"value"];
    [(PSAppListController *)self setPreferenceValue:v11 specifier:v8];
  }
}

- (id)bundle
{
  id v3 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"AppSettingsBundle"];
  objc_super v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v3 bundlePath];
  int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v7 = v3;
  }
  else
  {
    id v8 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"AppBundleID"];
    id v9 = +[PSSystemPolicyManager thirdPartyApplicationForBundleID:v8];

    id v10 = [v9 record];
    id v11 = [v10 URL];
    objc_super v12 = [v11 URLByAppendingPathComponent:@"Settings.bundle"];

    if (v12)
    {
      id v7 = [MEMORY[0x1E4F28B50] bundleWithURL:v12];
      [(PSSpecifier *)self->super.super._specifier setProperty:v7 forKey:@"AppSettingsBundle"];
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

+ (id)_typeErrorStringForKeyWithName:(id)a3 expectedType:(Class)a4 actualType:(Class)a5
{
  id v7 = NSString;
  id v8 = a3;
  id v9 = NSStringFromClass(a5);
  id v10 = NSStringFromClass(a4);
  id v11 = [v7 stringWithFormat:@"The type of the '%@' key is %@ (expected %@)", v8, v9, v10];

  return v11;
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

+ (void)specifiersFromDictionary:(uint64_t)a1 stringsTable:(NSObject *)a2 parentSpecifier:target:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  objc_super v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  int v6 = v4;
  _os_log_error_impl(&dword_1A6597000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Preference Items array contains an object that isn't a dictionary", (uint8_t *)&v5, 0xCu);
}

@end