@interface PUIPhotoServicesAuthorizationLevelController
- (NSBundle)entityBundle;
- (NSDictionary)details;
- (NSString)displayName;
- (NSString)serviceKey;
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
- (void)setServiceKey:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PUIPhotoServicesAuthorizationLevelController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUIPhotoServicesAuthorizationLevelController;
  [(PSListItemsController *)&v4 viewDidLoad];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleUpgradePromptNotification_ name:@"PUIPhotosPrivacyUpgradePromptCompletedNotification" object:0];
}

- (void)_handleUpgradePromptNotification:(id)a3
{
  objc_super v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"PUIPhotosPrivacyUpgradePromptAppIdentifierKey"];
  v6 = [(PUIPhotoServicesAuthorizationLevelController *)self serviceKey];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__PUIPhotoServicesAuthorizationLevelController__handleUpgradePromptNotification___block_invoke;
    block[3] = &unk_1E6E9C758;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __81__PUIPhotoServicesAuthorizationLevelController__handleUpgradePromptNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)_parentTCCSpecifiers
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)PUIPhotoServicesAuthorizationLevelController;
  v2 = [(PSListItemsController *)&v43 specifiers];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
  v6 = (int *)MEMORY[0x1E4F92F28];
  if (v5)
  {
    uint64_t v7 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(char **)(*((void *)&v39 + 1) + 8 * i);
        if (*(void *)&v9[*v6] == 3)
        {
          v10 = [v9 identifier];
          int v11 = [v10 intValue];

          if (v11 == 5)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (!v13) {
    goto LABEL_45;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v36;
  uint64_t v34 = *MEMORY[0x1E4F930A8];
  uint64_t v33 = *MEMORY[0x1E4F930A0];
  char v16 = v5 ^ 1;
  v31 = v3;
  do
  {
    for (uint64_t j = 0; j != v14; ++j)
    {
      if (*(void *)v36 != v15) {
        objc_enumerationMutation(v12);
      }
      v18 = *(char **)(*((void *)&v35 + 1) + 8 * j);
      v19 = [v18 identifier];
      int v20 = [v19 intValue];

      uint64_t v21 = *(void *)&v18[*v6];
      if (v21 != 3 || v20 != 5)
      {
        if (v21 == 3) {
          char v23 = v16;
        }
        else {
          char v23 = 1;
        }
        if ((v23 & 1) == 0 && !v20)
        {
          limitedLibraryRowSpecifier = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
          [v18 setIdentifier:limitedLibraryRowSpecifier];
          goto LABEL_27;
        }
        if (v21 == 3 && (v20 & 0xFFFFFFFE) == 2)
        {
          [v18 setProperty:objc_opt_class() forKey:v34];
          if (v20 == 3)
          {
            if (!PhotosUICoreLibraryCore() || !getPXTCCSettingsLimitedAccessSubtitleSymbolLoc()) {
              goto LABEL_42;
            }
            v27 = PSPXTCCSettingsLimitedAccessSubtitle(self->_serviceKey);
            [v18 setProperty:v27 forKey:v33];

            v28 = v18;
            limitedLibraryRowSpecifier = self->_limitedLibraryRowSpecifier;
            self->_limitedLibraryRowSpecifier = v28;
            v3 = v31;
          }
          else
          {
            if (v20 != 2 || !PhotosUICoreLibraryCore() || !getPXTCCSettingsFullAccessSubtitleSymbolLoc()) {
              goto LABEL_42;
            }
            PXTCCSettingsFullAccessSubtitleSymbolLoc = (void (*)(void))getPXTCCSettingsFullAccessSubtitleSymbolLoc();
            if (!PXTCCSettingsFullAccessSubtitleSymbolLoc) {
              -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
            }
            limitedLibraryRowSpecifier = PXTCCSettingsFullAccessSubtitleSymbolLoc();
            [v18 setProperty:limitedLibraryRowSpecifier forKey:v33];
          }
LABEL_27:
        }
LABEL_42:
        [v3 addObject:v18];
        continue;
      }
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
  }
  while (v14);
LABEL_45:

  v29 = (void *)[v3 copy];
  return v29;
}

- (void)setSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUIPhotoServicesAuthorizationLevelController;
  id v4 = a3;
  [(PUIPhotoServicesAuthorizationLevelController *)&v7 setSpecifier:v4];
  objc_msgSend(v4, "identifier", v7.receiver, v7.super_class);
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  serviceKey = self->_serviceKey;
  self->_serviceKey = v5;
}

- (id)specifiers
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  if (!*(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3))
  {
    uint64_t v4 = [(PUIPhotoServicesAuthorizationLevelController *)v2 _currentTCCAuthorizationRight];
    uint64_t v5 = [(PUIPhotoServicesAuthorizationLevelController *)v2 specifier];
    v6 = [v5 propertyForKey:@"hasPickerInfo"];
    int v7 = [v6 BOOLValue];
    if (v4 == 2) {
      int v8 = 0;
    }
    else {
      int v8 = v7;
    }

    v9 = [(PUIPhotoServicesAuthorizationLevelController *)v2 specifier];
    v10 = [v9 propertyForKey:@"hasTCCOptions"];
    int v11 = [v10 BOOLValue];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v11)
    {
      uint64_t v13 = [(PUIPhotoServicesAuthorizationLevelController *)v2 _parentTCCSpecifiers];
      [v12 addObjectsFromArray:v13];
      uint64_t v14 = [v13 firstObject];
      uint64_t v15 = [(PUIPhotoServicesAuthorizationLevelController *)v2 footerStringForSpecifiers:v12];
      if (v15) {
        [v14 setProperty:v15 forKey:*MEMORY[0x1E4F93170]];
      }
      char v16 = [(PUIPhotoServicesAuthorizationLevelController *)v2 _limitedLibrarySectionSpecifiers];
      [v12 addObjectsFromArray:v16];
    }
    v17 = [(PUIPhotoServicesAuthorizationLevelController *)v2 _pickerUsageSectionSpecifiers];
    v18 = v17;
    if (v8)
    {
      if ((v11 & 1) == 0)
      {
        v19 = [v17 firstObject];
        int v20 = PUI_LocalizedStringForPrivacy(@"PHOTOS_AUTH_ONGOING_HEADER");
        [v19 setName:v20];
      }
      [v12 addObjectsFromArray:v18];
    }
    uint64_t v21 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3) = (Class)v12;
  }
  objc_sync_exit(v2);

  v22 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3);
  return v22;
}

- (id)footerStringForSpecifiers:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "values", (void)v17);
        v10 = [v9 firstObject];
        char v11 = [v10 isEqual:&unk_1F4080440];

        id v12 = [v8 values];
        uint64_t v13 = [v12 firstObject];
        int v14 = [v13 isEqual:&unk_1F4080458];

        if ((v11 & 1) != 0 || v14)
        {

          uint64_t v15 = PUI_LocalizedStringForPrivacy(@"PHOTOS_AUTH_PHOTOKIT_FOOTER");
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = 0;
LABEL_12:

  return v15;
}

- (void)_presentImagePickerForModifyingSelection
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = *MEMORY[0x1E4F399C8];
  id v3 = [(PUIPhotoServicesAuthorizationLevelController *)self serviceKey];
  v18[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = self->_limitedLibraryRowSpecifier;
    uint64_t v6 = self->_serviceKey;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __88__PUIPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke;
    uint64_t v13 = &unk_1E6E9D9C0;
    int v14 = v5;
    uint64_t v15 = v6;
    char v16 = self;
    int v7 = v6;
    int v8 = v5;
    v9 = _Block_copy(&v10);
    objc_msgSend(MEMORY[0x1E4F39920], "presentLimitedLibraryPickerFromViewController:options:completionHandler:", self, v4, v9, v10, v11, v12, v13);
  }
  else
  {
    [MEMORY[0x1E4F39920] presentLimitedLibraryPickerFromViewController:self options:v4];
  }
}

void __88__PUIPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PUIPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke_2;
  block[3] = &unk_1E6E9CCB8;
  id v6 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __88__PUIPhotoServicesAuthorizationLevelController__presentImagePickerForModifyingSelection__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  id v3 = PSPXTCCSettingsLimitedAccessSubtitle(*(void **)(a1 + 40));
  [v2 setProperty:v3 forKey:*MEMORY[0x1E4F930A0]];

  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  return [v4 reloadSpecifier:v5];
}

- (id)_pickerUsageSectionSpecifiers
{
  dispatch_time_t v2 = self;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1EAE89000;
  if (!self->_pickerUsageSectionSpecifiers)
  {
    Class v4 = NSClassFromString(&cfstr_Psphotospicker.isa);
    if (v4)
    {
      Class v5 = v4;
      id v6 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:0];
      uint64_t v7 = *MEMORY[0x1E4F93188];
      [v6 setProperty:@"PHOTOS_PICKER_INFO_GROUP" forKey:*MEMORY[0x1E4F93188]];
      uint64_t v8 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:v2 set:0 get:0 detail:0 cell:-1 edit:0];
      [v8 setProperty:@"PHOTOS_PICKER_INFO_CELL" forKey:v7];
      v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB2F28]];
      [v8 setProperty:v9 forKey:*MEMORY[0x1E4F93218]];

      [v8 setProperty:v5 forKey:*MEMORY[0x1E4F930A8]];
      v50[0] = v6;
      v50[1] = v8;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
      pickerUsageSectionSpecifiers = v2->_pickerUsageSectionSpecifiers;
      v2->_pickerUsageSectionSpecifiers = (NSArray *)v10;

      Class v12 = NSClassFromString(&cfstr_Psphotospicker_0.isa);
      if (v12)
      {
        Class v41 = v12;
        long long v42 = v6;
        objc_super v43 = v2;
        v44 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v13 = [MEMORY[0x1E4F8B998] sharedInstance];
        int v14 = [v13 photosPickerPresentedLibraryLogsByClient];

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v51 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v46;
          uint64_t v19 = *MEMORY[0x1E4F8C508];
          uint64_t v20 = *MEMORY[0x1E4F8C510];
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v46 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              char v23 = [v22 objectForKeyedSubscript:v19];
              v24 = [v22 objectForKeyedSubscript:v20];
              v25 = [v22 objectForKeyedSubscript:@"pickerUsesOptions"];
              [v24 timeIntervalSinceNow];
              if (v26 <= 0.0 && v26 > -2592000.0 && [v25 BOOLValue]) {
                [v44 addObject:v23];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v45 objects:v51 count:16];
          }
          while (v17);
        }

        v27 = (void *)[v44 copy];
        unint64_t v3 = 0x1EAE89000uLL;
        dispatch_time_t v2 = v43;
        int v28 = [v27 containsObject:v43->_serviceKey];

        id v6 = v42;
        if (v28)
        {
          v29 = (void *)MEMORY[0x1E4F92E70];
          v30 = PUI_LocalizedStringForPrivacy(@"PHOTOS_PICKER_OPTIONS_CELL_TITLE");
          v31 = [v29 preferenceSpecifierNamed:v30 target:v43 set:0 get:sel__locationSetting_ detail:v41 cell:2 edit:0];

          [v31 setIdentifier:@"PHOTOS_PICKER_OPTIONS_CELL"];
          [v31 setProperty:v43->_serviceKey forKey:@"appBundleID"];
          v32 = PUI_LocalizedStringForPrivacy(@"PHOTOS_PICKER_OPTIONS_CELL_NO_LOCATION");
          v49[0] = v32;
          uint64_t v33 = PUI_LocalizedStringForPrivacy(@"PHOTOS_PICKER_OPTIONS_CELL_LOCATION");
          v49[1] = v33;
          uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
          [v31 setValues:&unk_1F4080788 titles:v34];

          uint64_t v35 = [(NSArray *)v43->_pickerUsageSectionSpecifiers arrayByAddingObject:v31];
          long long v36 = v43->_pickerUsageSectionSpecifiers;
          v43->_pickerUsageSectionSpecifiers = (NSArray *)v35;
        }
      }
    }
  }
  long long v37 = PUIPhotosPolicyBundleIdentifiersWithRecentPickerUsage();
  int v38 = [v37 containsObject:*(Class *)((char *)&v2->super.super.super.super.super.super.isa + *(int *)(v3 + 2684))];

  if (v38) {
    long long v39 = v2->_pickerUsageSectionSpecifiers;
  }
  else {
    long long v39 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v39;
}

- (id)_limitedLibrarySectionSpecifiers
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (!self->_limitedLibrarySectionSpecifiers)
  {
    unint64_t v3 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    uint64_t v4 = *MEMORY[0x1E4F93188];
    [v3 setProperty:@"PHOTOS_MANUAL_SELECTION_GROUP" forKey:*MEMORY[0x1E4F93188]];
    Class v5 = (void *)MEMORY[0x1E4F92E70];
    id v6 = PUI_LocalizedStringForPrivacy(@"PHOTOS_MANUAL_SELECTION_BUTTON");
    uint64_t v7 = [v5 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];

    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v7 setProperty:v8 forKey:*MEMORY[0x1E4F93130]];

    [v7 setProperty:@"PHOTOS_MANUAL_SELECTION_BUTTON" forKey:v4];
    [v7 setButtonAction:sel__presentImagePickerForModifyingSelection];
    v13[0] = v3;
    v13[1] = v7;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    limitedLibrarySectionSpecifiers = self->_limitedLibrarySectionSpecifiers;
    self->_limitedLibrarySectionSpecifiers = v9;
  }
  if ([(PUIPhotoServicesAuthorizationLevelController *)self _currentTCCAuthorizationRight] == 3)uint64_t v11 = self->_limitedLibrarySectionSpecifiers; {
  else
  }
    uint64_t v11 = (NSArray *)MEMORY[0x1E4F1CBF0];
  return v11;
}

- (id)_locationSetting:(id)a3
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.photos.picker"];
  Class v5 = [v4 dictionaryForKey:@"metadata"];
  id v6 = [v5 objectForKeyedSubscript:self->_serviceKey];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"pickerShouldStripLocation"];
  int v8 = [v7 BOOLValue];

  v9 = [MEMORY[0x1E4F28ED0] numberWithInt:v8 ^ 1u];

  return v9;
}

- (unint64_t)_currentTCCAuthorizationRight
{
  if (_currentTCCAuthorizationRight_onceToken_0 != -1) {
    dispatch_once(&_currentTCCAuthorizationRight_onceToken_0, &__block_literal_global_13);
  }
  [(NSString *)self->_serviceKey cStringUsingEncoding:4];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 1;
  id v5 = (id)tcc_identity_create();
  tcc_server_message_get_authorization_records_by_identity();
  unint64_t v3 = v7[3];

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __77__PUIPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke()
{
  uint64_t v0 = tcc_server_create();
  uint64_t v1 = _currentTCCAuthorizationRight_tccServer_0;
  _currentTCCAuthorizationRight_tccServer_0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __77__PUIPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = tcc_authorization_record_get_service();
    uint64_t v7 = (void *)[[NSString alloc] initWithCString:tcc_service_get_name() encoding:4];
    if ([v7 isEqualToString:@"kTCCServicePhotos"]) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = tcc_authorization_record_get_authorization_right();
    }
  }
  else
  {
    uint64_t v8 = _PUILoggingFacility();
    uint64_t v6 = v8;
    if (a3)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __77__PUIPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1();
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1E4AD5000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for identity: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PUIPhotoServicesAuthorizationLevelController *)self indexForIndexPath:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [(PUIPhotoServicesAuthorizationLevelController *)self specifierAtIndex:v8];
    int v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 propertyForKey:*MEMORY[0x1E4F93188]];
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
          id v15 = [(PUIPhotoServicesAuthorizationLevelController *)self selectSpecifier:v10];
          if (v15)
          {
            uint64_t v16 = [MEMORY[0x1E4F1CA98] null];

            if (v15 != v16) {
              [(PUIPhotoServicesAuthorizationLevelController *)self showController:v15];
            }
          }
        }
        else
        {
          v22.receiver = self;
          v22.super_class = (Class)PUIPhotoServicesAuthorizationLevelController;
          [(PSListItemsController *)&v22 tableView:v6 didSelectRowAtIndexPath:v7];
          uint64_t v17 = [v10 values];
          uint64_t v18 = [v17 firstObject];
          int v19 = [v18 intValue];

          if (v19 == 2)
          {
            [(PUIPhotoServicesAuthorizationLevelController *)self _removeLimitedLibrarySectionIfPresent];
            [(PUIPhotoServicesAuthorizationLevelController *)self _removePickerUsageSectionIfPresent];
          }
          else if (v19 == 3)
          {
            uint64_t v20 = [(NSArray *)self->_limitedLibrarySectionSpecifiers firstObject];
            char v21 = [(PUIPhotoServicesAuthorizationLevelController *)self containsSpecifier:v20];

            if ((v21 & 1) == 0)
            {
              [(PUIPhotoServicesAuthorizationLevelController *)self _addLimitedLibrarySection];
              [(PUIPhotoServicesAuthorizationLevelController *)self _addPickerUsageSectionIfNeeded];
              [(PUIPhotoServicesAuthorizationLevelController *)self _presentImagePickerForModifyingSelection];
            }
          }
          else
          {
            [(PUIPhotoServicesAuthorizationLevelController *)self _removeLimitedLibrarySectionIfPresent];
            [(PUIPhotoServicesAuthorizationLevelController *)self _addPickerUsageSectionIfNeeded];
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
        int v4 = [(PUIPhotoServicesAuthorizationLevelController *)self containsSpecifier:v3],
        v3,
        v4))
  {
    id v5 = [(NSArray *)self->_pickerUsageSectionSpecifiers firstObject];
    uint64_t v6 = [(PUIPhotoServicesAuthorizationLevelController *)self indexOfSpecifier:v5];

    limitedLibrarySectionSpecifiers = self->_limitedLibrarySectionSpecifiers;
    [(PUIPhotoServicesAuthorizationLevelController *)self insertContiguousSpecifiers:limitedLibrarySectionSpecifiers atIndex:v6 animated:1];
  }
  else
  {
    uint64_t v8 = self->_limitedLibrarySectionSpecifiers;
    [(PUIPhotoServicesAuthorizationLevelController *)self addSpecifiersFromArray:v8 animated:1];
  }
}

- (void)_removeLimitedLibrarySectionIfPresent
{
  unint64_t v3 = [(NSArray *)self->_limitedLibrarySectionSpecifiers firstObject];
  int v4 = [(PUIPhotoServicesAuthorizationLevelController *)self containsSpecifier:v3];

  if (v4)
  {
    limitedLibrarySectionSpecifiers = self->_limitedLibrarySectionSpecifiers;
    [(PUIPhotoServicesAuthorizationLevelController *)self removeContiguousSpecifiers:limitedLibrarySectionSpecifiers animated:1];
  }
}

- (void)_addPickerUsageSectionIfNeeded
{
  id v6 = [(NSArray *)self->_pickerUsageSectionSpecifiers firstObject];
  if (-[PUIPhotoServicesAuthorizationLevelController containsSpecifier:](self, "containsSpecifier:"))
  {
  }
  else
  {
    unint64_t v3 = PUIPhotosPolicyBundleIdentifiersWithRecentPickerUsage();
    int v4 = [v3 containsObject:self->_serviceKey];

    if (v4)
    {
      pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
      [(PUIPhotoServicesAuthorizationLevelController *)self addSpecifiersFromArray:pickerUsageSectionSpecifiers animated:1];
    }
  }
}

- (void)_removePickerUsageSectionIfPresent
{
  unint64_t v3 = [(NSArray *)self->_pickerUsageSectionSpecifiers firstObject];
  int v4 = [(PUIPhotoServicesAuthorizationLevelController *)self containsSpecifier:v3];

  if (v4)
  {
    pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
    [(PUIPhotoServicesAuthorizationLevelController *)self removeContiguousSpecifiers:pickerUsageSectionSpecifiers animated:1];
  }
}

- (NSString)serviceKey
{
  return self->_serviceKey;
}

- (void)setServiceKey:(id)a3
{
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
  objc_storeStrong((id *)&self->_serviceKey, 0);
  objc_storeStrong((id *)&self->_limitedLibraryRowSpecifier, 0);
  objc_storeStrong((id *)&self->_pickerUsageSectionSpecifiers, 0);
  objc_storeStrong((id *)&self->_limitedLibrarySectionSpecifiers, 0);
}

void __77__PUIPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1E4AD5000, v0, v1, "Error when requesting TCC for identity: %@ error: %@");
}

@end