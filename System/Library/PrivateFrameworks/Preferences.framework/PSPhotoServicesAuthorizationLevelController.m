@interface PSPhotoServicesAuthorizationLevelController
- (NSBundle)entityBundle;
- (NSDictionary)details;
- (NSString)displayName;
- (id)_limitedLibrarySectionSpecifiers;
- (id)_locationSetting:(id)a3;
- (id)_parentTCCSpecifiers;
- (id)_pickerUsageSectionSpecifiers;
- (id)footerStringForSpecifiers:(id)a3;
- (id)specifiers;
- (unint64_t)_currentTCCAuthorizationRight;
- (void)_addLimitedLibrarySection;
- (void)_addPickerUsageSectionIfNeeded;
- (void)_handleUpgradePromptNotification:(id)a3;
- (void)_presentImagePickerForModifyingSelection;
- (void)_removeLimitedLibrarySectionIfPresent;
- (void)_removePickerUsageSectionIfPresent;
- (void)setDetails:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEntityBundle:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PSPhotoServicesAuthorizationLevelController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PSPhotoServicesAuthorizationLevelController;
  [(PSListItemsController *)&v4 viewDidLoad];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleUpgradePromptNotification_ name:@"PUIPhotosPrivacyUpgradePromptCompletedNotification" object:0];
}

- (void)_handleUpgradePromptNotification:(id)a3
{
  objc_super v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"PUIPhotosPrivacyUpgradePromptAppIdentifierKey"];
  int v6 = [v5 isEqualToString:self->_clientIdentifier];

  if (v6)
  {
    dispatch_time_t v7 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__PSPhotoServicesAuthorizationLevelController__handleUpgradePromptNotification___block_invoke;
    block[3] = &unk_1E5C5D680;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __80__PSPhotoServicesAuthorizationLevelController__handleUpgradePromptNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)_parentTCCSpecifiers
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)PSPhotoServicesAuthorizationLevelController;
  v2 = [(PSListItemsController *)&v40 specifiers];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (v8[7] == 3)
        {
          v9 = [v8 identifier];
          int v10 = [v9 intValue];

          if (v10 == 4)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (!v12) {
    goto LABEL_45;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v33;
  char v15 = v5 ^ 1;
  v30 = v3;
  do
  {
    for (uint64_t j = 0; j != v13; ++j)
    {
      if (*(void *)v33 != v14) {
        objc_enumerationMutation(v11);
      }
      v17 = *(void **)(*((void *)&v32 + 1) + 8 * j);
      v18 = [v17 identifier];
      int v19 = [v18 intValue];

      uint64_t v20 = v17[7];
      if (v20 != 3 || v19 != 4)
      {
        if (v20 == 3) {
          char v22 = v15;
        }
        else {
          char v22 = 1;
        }
        if ((v22 & 1) == 0 && !v19)
        {
          limitedLibraryRowSpecifier = objc_msgSend(NSString, "stringWithFormat:", @"%d", 4);
          [v17 setIdentifier:limitedLibraryRowSpecifier];
          goto LABEL_27;
        }
        if (v20 == 3 && (v19 & 0xFFFFFFFE) == 2)
        {
          [v17 setProperty:objc_opt_class() forKey:@"cellClass"];
          if (v19 == 3)
          {
            if (!PhotosUICoreLibraryCore() || !getPXTCCSettingsLimitedAccessSubtitleSymbolLoc()) {
              goto LABEL_42;
            }
            v26 = PSPXTCCSettingsLimitedAccessSubtitle(self->_clientIdentifier);
            [v17 setProperty:v26 forKey:@"cellSubtitleText"];

            v27 = v17;
            limitedLibraryRowSpecifier = self->_limitedLibraryRowSpecifier;
            self->_limitedLibraryRowSpecifier = v27;
            v3 = v30;
          }
          else
          {
            if (v19 != 2 || !PhotosUICoreLibraryCore() || !getPXTCCSettingsFullAccessSubtitleSymbolLoc()) {
              goto LABEL_42;
            }
            PXTCCSettingsFullAccessSubtitleSymbolLoc = (void (*)(void))getPXTCCSettingsFullAccessSubtitleSymbolLoc();
            if (!PXTCCSettingsFullAccessSubtitleSymbolLoc) {
              -[PSContactsAuthorizationLevelController dealloc]();
            }
            limitedLibraryRowSpecifier = PXTCCSettingsFullAccessSubtitleSymbolLoc();
            [v17 setProperty:limitedLibraryRowSpecifier forKey:@"cellSubtitleText"];
          }
LABEL_27:
        }
LABEL_42:
        [v3 addObject:v17];
        continue;
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v41 count:16];
  }
  while (v13);
LABEL_45:

  v28 = (void *)[v3 copy];
  return v28;
}

- (void)setSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PSPhotoServicesAuthorizationLevelController;
  id v4 = a3;
  [(PSListController *)&v7 setSpecifier:v4];
  objc_msgSend(v4, "propertyForKey:", @"appBundleID", v7.receiver, v7.super_class);
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  clientIdentifier = self->_clientIdentifier;
  self->_clientIdentifier = v5;
}

- (id)specifiers
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->super.super._specifiers)
  {
    uint64_t v3 = [(PSPhotoServicesAuthorizationLevelController *)v2 _currentTCCAuthorizationRight];
    id v4 = [(PSListController *)v2 specifier];
    uint64_t v5 = [v4 propertyForKey:@"hasPickerInfo"];
    int v6 = [v5 BOOLValue];
    if (v3 == 2) {
      int v7 = 0;
    }
    else {
      int v7 = v6;
    }

    v8 = [(PSListController *)v2 specifier];
    v9 = [v8 propertyForKey:@"hasTCCOptions"];
    int v10 = [v9 BOOLValue];

    id v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v10)
    {
      uint64_t v12 = [(PSPhotoServicesAuthorizationLevelController *)v2 _parentTCCSpecifiers];
      [(NSArray *)v11 addObjectsFromArray:v12];
      uint64_t v13 = [v12 firstObject];
      uint64_t v14 = [(PSPhotoServicesAuthorizationLevelController *)v2 footerStringForSpecifiers:v11];
      [v13 setProperty:v14 forKey:@"footerText"];
      char v15 = [(PSPhotoServicesAuthorizationLevelController *)v2 _limitedLibrarySectionSpecifiers];
      [(NSArray *)v11 addObjectsFromArray:v15];
    }
    v16 = [(PSPhotoServicesAuthorizationLevelController *)v2 _pickerUsageSectionSpecifiers];
    v17 = v16;
    if (v7)
    {
      if ((v10 & 1) == 0)
      {
        v18 = [v16 firstObject];
        int v19 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_AUTH_ONGOING_HEADER");
        [v18 setName:v19];
      }
      [(NSArray *)v11 addObjectsFromArray:v17];
    }
    specifiers = v2->super.super._specifiers;
    v2->super.super._specifiers = v11;
  }
  objc_sync_exit(v2);

  v21 = v2->super.super._specifiers;
  return v21;
}

- (id)footerStringForSpecifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) values];
        int v10 = [v9 firstObject];
        int v11 = [v10 intValue];

        if (v11 == 3)
        {
          uint64_t v12 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_AUTH_FOOTER");

          int v6 = (void *)v12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)_presentImagePickerForModifyingSelection
{
  v20[1] = *MEMORY[0x1E4F143B8];
  clientIdentifier = self->_clientIdentifier;
  uint64_t v19 = @"PHLimitedLibraryPickerClientApplicationIdentifier";
  v20[0] = clientIdentifier;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  Class v5 = NSClassFromString(&cfstr_Phlimitedlibra_0.isa);
  if (v5)
  {
    Class v6 = v5;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = self->_limitedLibraryRowSpecifier;
      v8 = self->_clientIdentifier;
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      long long v14 = __87__PSPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke;
      long long v15 = &unk_1E5C5D8E8;
      long long v16 = v7;
      long long v17 = v8;
      v18 = self;
      v9 = v8;
      int v10 = v7;
      int v11 = (void *)MEMORY[0x1AD0BE2A0](&v12);
      -[objc_class presentLimitedLibraryPickerFromViewController:options:completionHandler:](v6, "presentLimitedLibraryPickerFromViewController:options:completionHandler:", self, v4, v11, v12, v13, v14, v15);
    }
    else
    {
      [(objc_class *)v6 presentLimitedLibraryPickerFromViewController:self options:v4];
    }
  }
}

void __87__PSPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PSPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke_2;
  block[3] = &unk_1E5C5D548;
  id v6 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __87__PSPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  id v3 = PSPXTCCSettingsLimitedAccessSubtitle(*(void **)(a1 + 40));
  [v2 setProperty:v3 forKey:@"cellSubtitleText"];

  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  return [v4 reloadSpecifier:v5];
}

- (id)_locationSetting:(id)a3
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.photos.picker"];
  uint64_t v5 = [v4 dictionaryForKey:@"metadata"];
  id v6 = [v5 objectForKeyedSubscript:self->_clientIdentifier];
  id v7 = [v6 objectForKeyedSubscript:@"pickerShouldStripLocation"];
  int v8 = [v7 BOOLValue];

  v9 = [NSNumber numberWithInt:v8 ^ 1u];

  return v9;
}

- (id)_pickerUsageSectionSpecifiers
{
  dispatch_time_t v2 = self;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E96BE000;
  if (!self->_pickerUsageSectionSpecifiers)
  {
    Class v4 = NSClassFromString(&cfstr_Psphotospicker.isa);
    if (v4)
    {
      Class v5 = v4;
      id v6 = +[PSSpecifier groupSpecifierWithName:0];
      [v6 setProperty:@"PHOTOS_PICKER_INFO_GROUP" forKey:@"id"];
      id v7 = +[PSSpecifier preferenceSpecifierNamed:0 target:v2 set:0 get:0 detail:0 cell:-1 edit:0];
      [v7 setProperty:@"PHOTOS_PICKER_INFO_CELL" forKey:@"id"];
      int v8 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43D18]];
      [v7 setProperty:v8 forKey:@"height"];

      [v7 setProperty:v5 forKey:@"cellClass"];
      long long v39 = v7;
      objc_super v40 = v6;
      v47[0] = v6;
      v47[1] = v7;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
      pickerUsageSectionSpecifiers = v2->_pickerUsageSectionSpecifiers;
      v41 = v2;
      v2->_pickerUsageSectionSpecifiers = (NSArray *)v9;

      int v11 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v12 = [getPLPrivacyClass() sharedInstance];
      uint64_t v13 = [v12 photosPickerPresentedLibraryLogsByClient];

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v43 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            uint64_t v20 = getPLPhotosPickerLogClientBundleIdentifierKey();
            v21 = [v19 objectForKeyedSubscript:v20];

            char v22 = getPLPhotosPickerLogPresentedTimestampKey();
            v23 = [v19 objectForKeyedSubscript:v22];

            v24 = [v19 objectForKeyedSubscript:@"pickerUsesOptions"];
            [v23 timeIntervalSinceNow];
            if (v25 <= 0.0 && v25 > -2592000.0 && [v24 BOOLValue]) {
              [v11 addObject:v21];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v16);
      }

      v26 = (void *)[v11 copy];
      unint64_t v3 = 0x1E96BE000uLL;
      dispatch_time_t v2 = v41;
      int v27 = [v26 containsObject:v41->_clientIdentifier];

      if (v27)
      {
        v28 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_PICKER_OPTIONS_CELL_TITLE");
        v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:v41 set:0 get:sel__locationSetting_ detail:objc_opt_class() cell:2 edit:0];

        [v29 setIdentifier:@"PHOTOS_PICKER_OPTIONS_CELL"];
        [v29 setProperty:v41->_clientIdentifier forKey:@"appBundleID"];
        v30 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_PICKER_OPTIONS_CELL_NO_LOCATION");
        v46[0] = v30;
        v31 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_PICKER_OPTIONS_CELL_LOCATION");
        v46[1] = v31;
        long long v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
        [v29 setValues:&unk_1EFB742D0 titles:v32];

        uint64_t v33 = [(NSArray *)v41->_pickerUsageSectionSpecifiers arrayByAddingObject:v29];
        long long v34 = v41->_pickerUsageSectionSpecifiers;
        v41->_pickerUsageSectionSpecifiers = (NSArray *)v33;
      }
    }
  }
  long long v35 = PSPhotosPolicyBundleIdentifiersWithRecentPickerUsage();
  int v36 = [v35 containsObject:*(Class *)((char *)&v2->super.super.super.super.super.super.isa + *(int *)(v3 + 212))];

  if (v36) {
    long long v37 = v2->_pickerUsageSectionSpecifiers;
  }
  else {
    long long v37 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v37;
}

- (id)_limitedLibrarySectionSpecifiers
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (!self->_limitedLibrarySectionSpecifiers)
  {
    unint64_t v3 = +[PSSpecifier emptyGroupSpecifier];
    [v3 setProperty:@"PHOTOS_MANUAL_SELECTION_GROUP" forKey:@"id"];
    Class v4 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_MANUAL_SELECTION_BUTTON");
    Class v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

    id v6 = [NSNumber numberWithBool:1];
    [v5 setProperty:v6 forKey:@"enabled"];

    [v5 setProperty:@"PHOTOS_MANUAL_SELECTION_BUTTON" forKey:@"id"];
    [v5 setButtonAction:sel__presentImagePickerForModifyingSelection];
    v11[0] = v3;
    v11[1] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    limitedLibrarySectionSpecifiers = self->_limitedLibrarySectionSpecifiers;
    self->_limitedLibrarySectionSpecifiers = v7;
  }
  if ([(PSPhotoServicesAuthorizationLevelController *)self _currentTCCAuthorizationRight] == 3)uint64_t v9 = self->_limitedLibrarySectionSpecifiers; {
  else
  }
    uint64_t v9 = (NSArray *)MEMORY[0x1E4F1CBF0];
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(PSListController *)self indexForIndexPath:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [(PSListController *)self specifierAtIndex:v8];
    int v10 = v9;
    if (v9)
    {
      int v11 = [v9 propertyForKey:@"id"];
      int v12 = [v11 isEqual:@"PHOTOS_MANUAL_SELECTION_BUTTON"];

      if (v12)
      {
        [v10 performButtonAction];
        [v6 deselectRowAtIndexPath:v7 animated:1];
      }
      else
      {
        uint64_t v13 = [v10 identifier];
        int v14 = [v13 isEqualToString:@"PHOTOS_PICKER_OPTIONS_CELL"];

        if (v14)
        {
          [v6 deselectRowAtIndexPath:v7 animated:1];
          uint64_t v15 = [(PSListController *)self selectSpecifier:v10];
          if (v15)
          {
            uint64_t v16 = [MEMORY[0x1E4F1CA98] null];

            if (v15 != v16) {
              [(PSListController *)self showController:v15];
            }
          }
        }
        else
        {
          v22.receiver = self;
          v22.super_class = (Class)PSPhotoServicesAuthorizationLevelController;
          [(PSListItemsController *)&v22 tableView:v6 didSelectRowAtIndexPath:v7];
          uint64_t v17 = [v10 values];
          v18 = [v17 firstObject];
          int v19 = [v18 intValue];

          if (v19 == 2)
          {
            [(PSPhotoServicesAuthorizationLevelController *)self _removeLimitedLibrarySectionIfPresent];
            [(PSPhotoServicesAuthorizationLevelController *)self _removePickerUsageSectionIfPresent];
          }
          else if (v19 == 3)
          {
            uint64_t v20 = [(NSArray *)self->_limitedLibrarySectionSpecifiers firstObject];
            BOOL v21 = [(PSListController *)self containsSpecifier:v20];

            if (!v21)
            {
              [(PSPhotoServicesAuthorizationLevelController *)self _addLimitedLibrarySection];
              [(PSPhotoServicesAuthorizationLevelController *)self _addPickerUsageSectionIfNeeded];
              [(PSPhotoServicesAuthorizationLevelController *)self _presentImagePickerForModifyingSelection];
            }
          }
          else
          {
            [(PSPhotoServicesAuthorizationLevelController *)self _removeLimitedLibrarySectionIfPresent];
            [(PSPhotoServicesAuthorizationLevelController *)self _addPickerUsageSectionIfNeeded];
          }
        }
      }
    }
  }
}

- (void)_addLimitedLibrarySection
{
  if ([(NSArray *)self->_pickerUsageSectionSpecifiers count]
    && ([(NSArray *)self->_pickerUsageSectionSpecifiers firstObject],
        unint64_t v3 = objc_claimAutoreleasedReturnValue(),
        BOOL v4 = [(PSListController *)self containsSpecifier:v3],
        v3,
        v4))
  {
    Class v5 = [(NSArray *)self->_pickerUsageSectionSpecifiers firstObject];
    int64_t v6 = [(PSListController *)self indexOfSpecifier:v5];

    limitedLibrarySectionSpecifiers = self->_limitedLibrarySectionSpecifiers;
    [(PSListController *)self insertContiguousSpecifiers:limitedLibrarySectionSpecifiers atIndex:v6 animated:1];
  }
  else
  {
    int64_t v8 = self->_limitedLibrarySectionSpecifiers;
    [(PSListController *)self addSpecifiersFromArray:v8 animated:1];
  }
}

- (void)_removeLimitedLibrarySectionIfPresent
{
  unint64_t v3 = [(NSArray *)self->_limitedLibrarySectionSpecifiers firstObject];
  BOOL v4 = [(PSListController *)self containsSpecifier:v3];

  if (v4)
  {
    limitedLibrarySectionSpecifiers = self->_limitedLibrarySectionSpecifiers;
    [(PSListController *)self removeContiguousSpecifiers:limitedLibrarySectionSpecifiers animated:1];
  }
}

- (void)_addPickerUsageSectionIfNeeded
{
  id v6 = [(NSArray *)self->_pickerUsageSectionSpecifiers firstObject];
  if (-[PSListController containsSpecifier:](self, "containsSpecifier:"))
  {
  }
  else
  {
    unint64_t v3 = PSPhotosPolicyBundleIdentifiersWithRecentPickerUsage();
    int v4 = [v3 containsObject:self->_clientIdentifier];

    if (v4)
    {
      pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
      [(PSListController *)self addSpecifiersFromArray:pickerUsageSectionSpecifiers animated:1];
    }
  }
}

- (void)_removePickerUsageSectionIfPresent
{
  unint64_t v3 = [(NSArray *)self->_pickerUsageSectionSpecifiers firstObject];
  BOOL v4 = [(PSListController *)self containsSpecifier:v3];

  if (v4)
  {
    pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
    [(PSListController *)self removeContiguousSpecifiers:pickerUsageSectionSpecifiers animated:1];
  }
}

- (unint64_t)_currentTCCAuthorizationRight
{
  if (_currentTCCAuthorizationRight_onceToken_0 != -1) {
    dispatch_once(&_currentTCCAuthorizationRight_onceToken_0, &__block_literal_global_5);
  }
  [(NSString *)self->_clientIdentifier cStringUsingEncoding:4];
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 1;
  id v5 = (id)tcc_identity_create();
  tcc_server_message_get_authorization_records_by_identity();
  unint64_t v3 = v7[3];

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __76__PSPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke()
{
  uint64_t v0 = tcc_server_create();
  uint64_t v1 = _currentTCCAuthorizationRight_tccServer_0;
  _currentTCCAuthorizationRight_tccServer_0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __76__PSPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = tcc_authorization_record_get_service();
    id v7 = (void *)[[NSString alloc] initWithCString:tcc_service_get_name() encoding:4];
    if ([v7 isEqualToString:@"kTCCServicePhotos"]) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = tcc_authorization_record_get_authorization_right();
    }
  }
  else
  {
    uint64_t v8 = _PSLoggingFacility();
    uint64_t v6 = v8;
    if (a3)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __76__PSPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1();
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for identity: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (NSDictionary)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSBundle)entityBundle
{
  return self->_entityBundle;
}

- (void)setEntityBundle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityBundle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_limitedLibraryRowSpecifier, 0);
  objc_storeStrong((id *)&self->_pickerUsageSectionSpecifiers, 0);
  objc_storeStrong((id *)&self->_limitedLibrarySectionSpecifiers, 0);
}

void __76__PSPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A6597000, v0, v1, "Error when requesting TCC for identity: %@ error: %@");
}

@end