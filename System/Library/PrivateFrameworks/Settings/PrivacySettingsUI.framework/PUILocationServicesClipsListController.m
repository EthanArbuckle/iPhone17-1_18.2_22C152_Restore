@interface PUILocationServicesClipsListController
+ (int)clipsLocationUsage;
- (id)specifiers;
@end

@implementation PUILocationServicesClipsListController

+ (int)clipsLocationUsage
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PUILocationServicesClipsListController);
  [(PUILocationServicesClipsListController *)v2 specifiers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "identifier", (void)v13);
        int v10 = [(PUILocationServicesListController *)v2 locationUsageForEntity:v9];

        if (v10 == 4)
        {
          int v6 = 4;
        }
        else
        {
          if (v10 == 3)
          {
            int v6 = 3;
            goto LABEL_20;
          }
          if (v6 != 4 && v10 == 2) {
            int v6 = 2;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v6 = 0;
  }
LABEL_20:

  return v6;
}

- (id)specifiers
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    int v6 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"CONFIRM_LOCATION_GROUP"];
    uint64_t v7 = PUI_LocalizedStringForDimSum(@"CONFIRM_LOCATION_FOOTER");
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F93170]];

    [v5 addObject:v6];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    v8 = (uint64_t (*)(void))getCLCopyAppsUsingLocationSymbolLoc_ptr;
    v23 = getCLCopyAppsUsingLocationSymbolLoc_ptr;
    if (!getCLCopyAppsUsingLocationSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v25 = __getCLCopyAppsUsingLocationSymbolLoc_block_invoke;
      v26 = &unk_1E6E9C7F8;
      v27 = &v20;
      __getCLCopyAppsUsingLocationSymbolLoc_block_invoke((uint64_t)&buf);
      v8 = (uint64_t (*)(void))v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v8)
    {
      -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
      __break(1u);
    }
    v9 = (NSDictionary *)v8();
    int v10 = _PUILoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1E4AD5000, v10, OS_LOG_TYPE_DEFAULT, "specifiers -- CLCopyAppsUsingLocation:\n%@", (uint8_t *)&buf, 0xCu);
    }

    locationEntitiesDetails = self->super._locationEntitiesDetails;
    self->super._locationEntitiesDetails = v9;
    v12 = v9;

    long long v13 = (void *)MEMORY[0x1E4F92E70];
    long long v14 = PUI_LocalizedStringForDimSum(@"CONFIRM_LOCATION");
    long long v15 = [v13 preferenceSpecifierNamed:v14 target:self set:sel_setEntityAuthorized_specifier_ get:sel_isEntityAuthorized_ detail:0 cell:6 edit:0];

    [v15 setProperty:@"/System/Library/LocationBundles/ClipServicesLocation.bundle" forKey:*MEMORY[0x1E4F93188]];
    long long v16 = [(PUILocationServicesListController *)self isEntityAuthorized:v15];
    [v15 setProperty:v16 forKey:*MEMORY[0x1E4F93110]];

    [v15 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
    [v5 addObject:v15];
    v17 = [(PUILocationServicesListController *)self locationDetailSpecifiersWithDetailsMatching:&__block_literal_global_9];
    [v5 addObjectsFromArray:v17];

    uint64_t v18 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    [(PUILocationServicesListController *)self updateSpecifiersForImposedSettingsWithReload:0];
    uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

BOOL __52__PUILocationServicesClipsListController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"BundleId"];
  BOOL v3 = PUIIsAppClip(v2);

  return v3;
}

@end