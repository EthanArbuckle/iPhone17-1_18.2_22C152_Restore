@interface MOSuggestionSheetPrivateAccessSettingsController
- (id)specifiers;
- (void)didTapSuggestionNotificationSettings:(id)a3;
- (void)didTapSuggestionPrivacySettings:(id)a3;
@end

@implementation MOSuggestionSheetPrivateAccessSettingsController

- (id)specifiers
{
  v3 = [MEMORY[0x263EFF980] array];
  v36 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  v35 = [(MOSuggestionSheetPrivateAccessSettingsController *)self specifier];
  uint64_t v4 = [v35 objectForKeyedSubscript:*MEMORY[0x263F5FF00]];
  v34 = (void *)v4;
  if (v4)
  {
    v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:v4];
    v6 = [v5 bundleIdentifier];
    v7 = [v5 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (isValidString(v7))
    {
      v8 = v7;

      v6 = v8;
    }
    v9 = [v5 objectForInfoDictionaryKey:@"CFBundleName"];

    if (isValidString(v9))
    {
      v10 = v9;

      v6 = v10;
    }
  }
  else
  {
    v6 = @"Unknown";
  }
  v31 = v6;
  v11 = +[MOSuggestionSheetSettingsController onboardingSettingsBundle];
  v33 = [v11 localizedStringForKey:@"Private Access" value:&stru_270625C18 table:0];
  v12 = NSString;
  v13 = v11;
  v14 = [v11 localizedStringForKey:@"“%@” can show your moments but can only access the items you select." value:&stru_270625C18 table:0];
  v32 = objc_msgSend(v12, "stringWithFormat:", v14, v6);

  v15 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  v16 = [NSNumber numberWithDouble:*MEMORY[0x263F839B8]];
  [v15 setObject:v16 forKeyedSubscript:*MEMORY[0x263F602A8]];

  [v15 setObject:NSClassFromString(&cfstr_Modataaccessin.isa) forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  [v15 setObject:v33 forKeyedSubscript:@"MOTitle"];
  [v15 setObject:v32 forKeyedSubscript:@"MOBody"];
  v30 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  v17 = (void *)MEMORY[0x263F5FC40];
  v18 = [v13 localizedStringForKey:@"Suggestion Privacy Settings" value:&stru_270625C18 table:0];
  v19 = [v17 preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:13 edit:0];

  uint64_t v20 = *MEMORY[0x263F5FEF8];
  uint64_t v21 = MEMORY[0x263EFFA88];
  [v19 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  [v19 setButtonAction:sel_didTapSuggestionPrivacySettings_];
  v22 = (void *)MEMORY[0x263F5FC40];
  v23 = [v13 localizedStringForKey:@"Suggestion Notification Settings" value:&stru_270625C18 table:0];
  v24 = [v22 preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v24 setProperty:v21 forKey:v20];
  [v24 setButtonAction:sel_didTapSuggestionNotificationSettings_];
  [v3 addObject:v36];
  [v3 addObject:v15];
  [v3 addObject:v30];
  [v3 addObject:v19];
  [v3 addObject:v24];
  uint64_t v25 = (int)*MEMORY[0x263F5FDB8];
  v26 = *(Class *)((char *)&self->super.super.super.super.super.isa + v25);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v25) = (Class)v3;
  id v27 = v3;

  id v28 = *(id *)((char *)&self->super.super.super.super.super.isa + v25);
  return v28;
}

- (void)didTapSuggestionPrivacySettings:(id)a3
{
  [NSURL URLWithString:@"prefs:root=Privacy&path=JOURNALING_SUGGESTIONS"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void)didTapSuggestionNotificationSettings:(id)a3
{
  [NSURL URLWithString:@"app-prefs:com.apple.momentsd.MOUserNotifications&target=com.apple.settings.notifications"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

@end