@interface PSPhotosPickerOptionsController
- (id)_metadataSetting:(id)a3;
- (id)specifiers;
- (unint64_t)_formatSetting;
- (void)_setFormatSetting:(unint64_t)a3;
- (void)_setMetadataSetting:(id)a3 specifier:(id)a4;
- (void)setSpecifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PSPhotosPickerOptionsController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)PSPhotosPickerOptionsController;
  [(PSListController *)&v2 viewDidLoad];
}

- (void)setSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PSPhotosPickerOptionsController;
  id v4 = a3;
  [(PSListController *)&v7 setSpecifier:v4];
  objc_msgSend(v4, "propertyForKey:", @"appBundleID", v7.receiver, v7.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  clientIdentifier = self->_clientIdentifier;
  self->_clientIdentifier = v5;
}

- (id)specifiers
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  if (!v2->super._specifiers)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    id v4 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_PICKER_OPTIONS_METADATA_TITLE");
    v5 = +[PSSpecifier groupSpecifierWithName:v4];

    [v5 setIdentifier:@"metadataGroupID"];
    [v5 setProperty:@"metadataGroupID" forKey:@"id"];
    [v3 addObject:v5];
    v6 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_PICKER_OPTIONS_METADATA_LOCATION");
    objc_super v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:v2 set:sel__setMetadataSetting_specifier_ get:sel__metadataSetting_ detail:0 cell:6 edit:0];

    [v7 setProperty:@"pickerShouldStripLocation" forKey:@"pickerOptionsPropertyKey"];
    [v3 addObject:v7];
    v8 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_PICKER_OPTIONS_METADATA_CAPTION");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:v2 set:sel__setMetadataSetting_specifier_ get:sel__metadataSetting_ detail:0 cell:6 edit:0];

    [v9 setProperty:@"pickerShouldStripCaption" forKey:@"pickerOptionsPropertyKey"];
    [v3 addObject:v9];
    v10 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_PICKER_OPTIONS_FORMAT_TITLE");
    v11 = +[PSSpecifier groupSpecifierWithName:v10];

    [v11 setIdentifier:@"formatGroupID"];
    [v11 setProperty:@"formatGroupID" forKey:@"id"];
    [v11 setProperty:MEMORY[0x1E4F1CC38] forKey:@"isRadioGroup"];
    v12 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_PICKER_OPTIONS_FORMAT_FOOTER");
    [v11 setProperty:v12 forKey:@"footerText"];

    [v3 addObject:v11];
    v13 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_PICKER_OPTIONS_FORMAT_AUTOMATIC");
    v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

    [v14 setIdentifier:@"PhotosPickerFormatOptionAutomatic"];
    [v14 setProperty:&unk_1EFB73E98 forKey:@"pickerFormatOptionPropertyKey"];
    [v3 addObject:v14];
    v15 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_PICKER_OPTIONS_FORMAT_CURRENT");
    v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

    [v16 setIdentifier:@"PhotosPickerFormatOptionCurrent"];
    [v16 setProperty:&unk_1EFB73EB0 forKey:@"pickerFormatOptionPropertyKey"];
    [v3 addObject:v16];
    v17 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_PICKER_OPTIONS_FORMAT_COMPATIBLE");
    v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

    [v18 setIdentifier:@"PhotosPickerFormatOptionCompatible"];
    [v18 setProperty:&unk_1EFB73EC8 forKey:@"pickerFormatOptionPropertyKey"];
    [v3 addObject:v18];
    uint64_t v19 = [(PSPhotosPickerOptionsController *)v2 _formatSetting];
    v20 = v14;
    if (v19)
    {
      v20 = v16;
      if (v19 != 1)
      {
        if (v19 != 2)
        {
LABEL_7:
          uint64_t v21 = [v3 copy];
          specifiers = v2->super._specifiers;
          v2->super._specifiers = (NSArray *)v21;

          goto LABEL_8;
        }
        v20 = v18;
      }
    }
    [v11 setProperty:v20 forKey:@"radioGroupCheckedSpecifier"];
    goto LABEL_7;
  }
LABEL_8:
  objc_sync_exit(v2);

  v23 = v2->super._specifiers;
  return v23;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  int64_t v7 = [(PSListController *)self indexForIndexPath:v6];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return;
  }
  id v15 = [(PSListController *)self specifierAtIndex:v7];
  v8 = [v15 identifier];
  if (([v8 isEqualToString:@"PhotosPickerFormatOptionAutomatic"] & 1) == 0)
  {
    v9 = [v15 identifier];
    if (![v9 isEqualToString:@"PhotosPickerFormatOptionCurrent"])
    {
      v13 = [v15 identifier];
      char v14 = [v13 isEqualToString:@"PhotosPickerFormatOptionCompatible"];

      if ((v14 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
LABEL_6:
  v10 = [v15 propertyForKey:@"pickerFormatOptionPropertyKey"];
  uint64_t v11 = [v10 unsignedIntegerValue];

  [(PSPhotosPickerOptionsController *)self _setFormatSetting:v11];
  v12 = [(PSListController *)self specifierForID:@"formatGroupID"];
  [v12 setProperty:v15 forKey:@"radioGroupCheckedSpecifier"];
  [(PSListController *)self reloadSpecifier:v12 animated:1];

LABEL_7:
}

- (void)_setMetadataSetting:(id)a3 specifier:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v7 = a4;
  id v8 = a3;
  id v22 = (id)[[v6 alloc] initWithSuiteName:@"com.apple.photos.picker"];
  v9 = [v22 dictionaryForKey:@"metadata"];
  v10 = v9;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  if (!v9) {
    v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  v12 = (void *)[v9 mutableCopy];

  v13 = [v12 objectForKeyedSubscript:self->_clientIdentifier];
  char v14 = v13;
  if (!v13) {
    v13 = v11;
  }
  id v15 = (void *)[v13 mutableCopy];

  v16 = [v7 propertyForKey:@"pickerOptionsPropertyKey"];

  v17 = (void *)MEMORY[0x1E4F28ED0];
  int v18 = [v8 BOOLValue];

  uint64_t v19 = [v17 numberWithInt:v18 ^ 1u];
  [v15 setObject:v19 forKeyedSubscript:v16];

  [v12 setObject:v15 forKeyedSubscript:self->_clientIdentifier];
  [v22 setObject:v12 forKey:@"metadata"];
  v20 = [(PSViewController *)self parentController];
  objc_opt_class();
  LOBYTE(v19) = objc_opt_isKindOfClass();

  if (v19)
  {
    uint64_t v21 = [(PSViewController *)self parentController];
    [v21 reloadSpecifiers];
  }
}

- (id)_metadataSetting:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithSuiteName:@"com.apple.photos.picker"];
  id v7 = [v6 dictionaryForKey:@"metadata"];
  id v8 = [v7 objectForKeyedSubscript:self->_clientIdentifier];
  v9 = [v5 propertyForKey:@"pickerOptionsPropertyKey"];

  v10 = [v8 objectForKeyedSubscript:v9];
  int v11 = [v10 BOOLValue];

  v12 = [MEMORY[0x1E4F28ED0] numberWithInt:v11 ^ 1u];

  return v12;
}

- (void)_setFormatSetting:(unint64_t)a3
{
  id v9 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.photos.picker"];
  id v5 = [v9 dictionaryForKey:@"format"];
  id v6 = v5;
  if (!v5) {
    id v5 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v7 = (void *)[v5 mutableCopy];

  id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [v7 setObject:v8 forKeyedSubscript:self->_clientIdentifier];

  [v9 setObject:v7 forKey:@"format"];
}

- (unint64_t)_formatSetting
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.photos.picker"];
  id v4 = [v3 dictionaryForKey:@"format"];
  id v5 = [v4 objectForKeyedSubscript:self->_clientIdentifier];
  unint64_t v6 = [v5 unsignedIntegerValue];

  if (v6 >= 3) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v6;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end