@interface PUILocationServicesAuthorizationLevelController
- (NSArray)correctiveCompensationSpecifiersGroup;
- (NSBundle)authEntityBundle;
- (NSDictionary)details;
- (NSString)displayName;
- (NSString)serviceKey;
- (PUILocationServicesAuthorizationLevelController)init;
- (id)_constructFooterForAuthorizationLevel:(unint64_t)a3;
- (id)_preciseLocationStatus:(id)a3;
- (id)_purposeStringForAuthorizationLevel:(unint64_t)a3;
- (id)_usageTextForAuthorizationLevel:(unint64_t)a3;
- (id)specifiers;
- (void)_setLocationAuthorizationLevelForSpecifier:(id)a3;
- (void)_setLocationAuthorizationLevelMaskForAssociatedFramework:(unint64_t)a3 withCorrectiveCompensation:(int)a4;
- (void)_setPreciseLocationEnabled:(id)a3 specifier:(id)a4;
- (void)_synchronizeLocationDetails;
- (void)_updatePreciseLocationCell;
- (void)dealloc;
- (void)profileSettingsChanged:(id)a3;
- (void)setAuthEntityBundle:(id)a3;
- (void)setCorrectiveCompensationSpecifiersGroup:(id)a3;
- (void)setDetails:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setServiceKey:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUILocationServicesAuthorizationLevelController

- (PUILocationServicesAuthorizationLevelController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PUILocationServicesAuthorizationLevelController;
  v2 = [(PUILocationServicesListController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_profileSettingsChanged_ name:@"PSProfileConnectionEffectiveSettingsChangedNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUILocationServicesAuthorizationLevelController;
  [(PUILocationServicesListController *)&v4 dealloc];
}

- (void)profileSettingsChanged:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v10 = [v4 objectForKey:*MEMORY[0x1E4F741F8]];

  LODWORD(v4) = [v10 intValue];
  if (v4 != getpid())
  {
    objc_super v5 = [(PUILocationServicesAuthorizationLevelController *)self navigationController];
    v6 = [v5 topViewController];
    if (v6 == self)
    {
      v7 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) identifier];
      char v8 = isModificationAllowedForID(v7);

      if (v8) {
        goto LABEL_7;
      }
      objc_super v5 = [(PUILocationServicesAuthorizationLevelController *)self navigationController];
      id v9 = (id)[v5 popViewControllerAnimated:1];
    }
    else
    {
    }
  }
LABEL_7:
}

- (void)setSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUILocationServicesAuthorizationLevelController;
  id v4 = a3;
  [(PUILocationServicesAuthorizationLevelController *)&v7 setSpecifier:v4];
  objc_msgSend(v4, "identifier", v7.receiver, v7.super_class);
  objc_super v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  serviceKey = self->_serviceKey;
  self->_serviceKey = v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUILocationServicesAuthorizationLevelController;
  [(PUILocationServicesListController *)&v4 viewWillAppear:a3];
  [(PUILocationServicesAuthorizationLevelController *)self _updatePreciseLocationCell];
}

- (void)_updatePreciseLocationCell
{
  if (self->_authMask)
  {
    id v6 = [(PUILocationServicesAuthorizationLevelController *)self correctiveCompensationSpecifiersGroup];
    [(PUILocationServicesAuthorizationLevelController *)self removeContiguousSpecifiers:v6 animated:1];
  }
  else
  {
    v3 = [(PUILocationServicesAuthorizationLevelController *)self specifierForID:self->_serviceKey];
    if (v3) {
      goto LABEL_6;
    }
    id v6 = 0;
    objc_super v4 = [(PUILocationServicesAuthorizationLevelController *)self correctiveCompensationSpecifiersGroup];
    objc_super v5 = [(PUILocationServicesAuthorizationLevelController *)self specifiers];
    -[PUILocationServicesAuthorizationLevelController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v4, [v5 count], 1);
  }
  v3 = v6;
LABEL_6:
}

- (void)_synchronizeLocationDetails
{
  v3 = (NSDictionary *)PSUICLCopyAppsUsingLocation();
  details = self->_details;
  self->_details = v3;
  MEMORY[0x1F41817F8](v3, details);
}

- (id)specifiers
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  if (*(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3))
  {
LABEL_55:
    objc_sync_exit(v2);

    id v22 = *(id *)((char *)&v2->super.super.super.super.super.super.isa + v3);
    goto LABEL_56;
  }
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(PUILocationServicesAuthorizationLevelController *)v2 _synchronizeLocationDetails];
  if (v2->_serviceKey)
  {
    id CLLocationManagerClass = getCLLocationManagerClass();
    objc_super v5 = [(NSDictionary *)v2->_details objectForKey:v2->_serviceKey];
    char v6 = [CLLocationManagerClass allowableAuthorizationForLocationDictionary:v5];

    objc_super v7 = [(NSDictionary *)v2->_details objectForKey:v2->_serviceKey];
    uint64_t v8 = [v7 objectForKey:@"BundleId"];
    id v9 = _PUILoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v61 = "-[PUILocationServicesAuthorizationLevelController specifiers]";
      __int16 v62 = 2112;
      uint64_t v63 = v8;
      _os_log_impl(&dword_1E4AD5000, v9, OS_LOG_TYPE_DEFAULT, "%s: entity bundle ID: %@", buf, 0x16u);
    }
    id obj = (id)v8;

    int v59 = 0;
    [getCLLocationManagerClass() getIncidentalUseMode:&v59 forBundleIdentifier:v8];
    id v10 = (void *)MEMORY[0x1E4F92E70];
    v11 = PUI_LocalizedStringForLocationServicesPrivacy(@"ALLOW_LOCATION_SERVICES_HEADER");
    v12 = [v10 groupSpecifierWithName:v11];

    [v12 setIdentifier:@"LOCATION_SERVICES_AUTH_GROUP"];
    [v12 setProperty:@"LOCATION_SERVICES_AUTH_GROUP" forKey:*MEMORY[0x1E4F93188]];
    v13 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v12 setProperty:v13 forKey:*MEMORY[0x1E4F931A8]];

    [v58 addObject:v12];
    v14 = (void *)MEMORY[0x1E4F92E70];
    v15 = PUI_LocalizedStringForLocationServicesPrivacy(@"NEVER_AUTHORIZATION");
    v57 = [v14 preferenceSpecifierNamed:v15 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

    [v57 setIdentifier:@"LOCATION_SERVICES_AUTH_NEVER"];
    if ((v6 & 6) != 0) {
      v16 = @"NOT_DETERMINED_AUTHORIZATION";
    }
    else {
      v16 = @"NOT_DETERMINED_AUTHORIZATION_NO_AUTH";
    }
    v52 = PUI_LocalizedStringForLocationServicesPrivacy(v16);
    v17 = objc_msgSend(MEMORY[0x1E4F92E70], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    [v17 setIdentifier:@"LOCATION_SERVICES_AUTH_NOT_DETERMINED"];
    uint64_t v18 = *MEMORY[0x1E4F93068];
    [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93068]];
    v53 = v17;
    v19 = [(PUILocationServicesAuthorizationLevelController *)v2 specifier];
    v20 = [v19 identifier];
    LODWORD(v17) = PUIIsAppClip(v20);

    if (v17) {
      PUI_LocalizedStringForDimSum(@"WHILE_USING_TODAY");
    }
    else {
    v54 = PUI_LocalizedStringForLocationServicesPrivacy(@"WHEN_IN_USE_AUTHORIZATION");
    }
    v23 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v54 target:v2 set:0 get:0 detail:0 cell:3 edit:0];
    [v23 setIdentifier:@"LOCATION_SERVICES_AUTH_WHEN_IN_USE"];
    v24 = (void *)MEMORY[0x1E4F92E70];
    v25 = PUI_LocalizedStringForLocationServicesPrivacy(@"WHEN_IN_USE_APP_OR_WIDGET_AUTHORIZATION");
    v26 = [v24 preferenceSpecifierNamed:v25 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

    [v26 setIdentifier:@"LOCATION_SERVICES_AUTH_WHEN_IN_USE_APP_OR_WIDGET"];
    [v26 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v18];
    v27 = (void *)MEMORY[0x1E4F92E70];
    v28 = PUI_LocalizedStringForLocationServicesPrivacy(@"ALWAYS_AUTHORIZATION");
    v29 = [v27 preferenceSpecifierNamed:v28 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

    [v29 setIdentifier:@"LOCATION_SERVICES_AUTH_ALWAYS"];
    [v58 addObject:v57];
    if (![(NSString *)v2->_serviceKey isEqualToString:@"/System/Library/PrivateFrameworks/AssistantServices.framework"]|| _os_feature_enabled_impl())
    {
      [v58 addObject:v53];
    }
    if ((v6 & 2) != 0)
    {
      [v58 addObject:v23];
      if (v59) {
        [v58 addObject:v26];
      }
    }
    if ((v6 & 4) != 0) {
      [v58 addObject:v29];
    }
    if (!v2->_details || !v7) {
      goto LABEL_52;
    }
    uint64_t v30 = [getCLLocationManagerClass() primaryEntityClassForLocationDictionary:v7];
    if (v30 == 1)
    {
      v40 = [MEMORY[0x1E4F223B8] bundleProxyForIdentifier:obj];
      v41 = [v40 bundleURL];
      v55 = [v41 path];

      if (v55)
      {
        uint64_t v42 = [objc_alloc(MEMORY[0x1E4F28B50]) initWithPath:v55];
        authEntityBundle = v2->_authEntityBundle;
        v2->_authEntityBundle = (NSBundle *)v42;
      }
      if (obj)
      {
        uint64_t v44 = -[PUILocationServicesListController localizedDisplayNameForBundleID:](v2, "localizedDisplayNameForBundleID:");
        displayName = v2->_displayName;
        v2->_displayName = (NSString *)v44;

        if ([(NSString *)v2->_displayName length])
        {
LABEL_42:

LABEL_43:
          uint64_t v46 = [getCLLocationManagerClass() entityAuthorizationForLocationDictionary:v7];
          v2->_authMask = v46;
          if (v46)
          {
            if (v46)
            {
              v47 = [v58 specifierForID:@"LOCATION_SERVICES_AUTH_NEVER"];
              [v12 setProperty:v47 forKey:*MEMORY[0x1E4F931D8]];
            }
            else if ((v46 & 2) != 0)
            {
              if (v59 == 3) {
                [v58 specifierForID:@"LOCATION_SERVICES_AUTH_WHEN_IN_USE_APP_OR_WIDGET"];
              }
              else {
              v47 = [v58 specifierForID:@"LOCATION_SERVICES_AUTH_WHEN_IN_USE"];
              }
              [v12 setProperty:v47 forKey:*MEMORY[0x1E4F931D8]];
            }
            else
            {
              if ((v46 & 4) == 0)
              {
LABEL_51:
                v48 = [(PUILocationServicesAuthorizationLevelController *)v2 _constructFooterForAuthorizationLevel:v2->_authMask];
                [v12 setProperty:v48 forKey:*MEMORY[0x1E4F93170]];

LABEL_52:
                v2->_correctiveCompensationState = [getCLLocationManagerClass() correctiveCompensationStatusForLocationDictionary:v7];
                if ((v2->_authMask & 1) == 0)
                {
                  v49 = [(PUILocationServicesAuthorizationLevelController *)v2 correctiveCompensationSpecifiersGroup];
                  [v58 addObjectsFromArray:v49];
                }
                v50 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3);
                *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3) = (Class)v58;

                goto LABEL_55;
              }
              v47 = [v58 specifierForID:@"LOCATION_SERVICES_AUTH_ALWAYS"];
              [v12 setProperty:v47 forKey:*MEMORY[0x1E4F931D8]];
            }
          }
          else
          {
            v47 = [v58 specifierForID:@"LOCATION_SERVICES_AUTH_NOT_DETERMINED"];
            [v12 setProperty:v47 forKey:*MEMORY[0x1E4F931D8]];
          }

          goto LABEL_51;
        }
        objc_storeStrong((id *)&v2->_displayName, obj);
        v39 = _PUILoggingFacility();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v61 = (const char *)obj;
          __int16 v62 = 2112;
          uint64_t v63 = (uint64_t)v7;
          _os_log_impl(&dword_1E4AD5000, v39, OS_LOG_TYPE_DEFAULT, "No display name found for application: %@, dict: %@", buf, 0x16u);
        }
      }
      else
      {
        v39 = _PUILoggingFacility();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          -[PUILocationServicesAuthorizationLevelController specifiers]();
        }
      }
    }
    else
    {
      if (v30 != 2) {
        goto LABEL_43;
      }
      v55 = [v7 objectForKey:@"BundlePath"];
      if (v55)
      {
        uint64_t v31 = [objc_alloc(MEMORY[0x1E4F28B50]) initWithPath:v55];
        v32 = v2->_authEntityBundle;
        v2->_authEntityBundle = (NSBundle *)v31;

        v33 = v2->_authEntityBundle;
        if (!v33) {
          goto LABEL_42;
        }
        v34 = [(NSBundle *)v33 objectForInfoDictionaryKey:*MEMORY[0x1E4F1CC48]];
        uint64_t v35 = [v34 copy];
        v36 = v2->_displayName;
        v2->_displayName = (NSString *)v35;

        if ([(NSString *)v2->_displayName length]) {
          goto LABEL_42;
        }
        uint64_t v37 = [v55 lastPathComponent];
        v38 = v2->_displayName;
        v2->_displayName = (NSString *)v37;

        v39 = _PUILoggingFacility();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          [(PUILocationServicesAuthorizationLevelController *)(uint64_t)v55 specifiers];
        }
      }
      else
      {
        v39 = _PUILoggingFacility();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          -[PUILocationServicesAuthorizationLevelController specifiers]();
        }
      }
    }

    goto LABEL_42;
  }
  v21 = _PUILoggingFacility();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v61 = "-[PUILocationServicesAuthorizationLevelController specifiers]";
    _os_log_impl(&dword_1E4AD5000, v21, OS_LOG_TYPE_DEFAULT, "%s: _serviceKey is nil", buf, 0xCu);
  }

  id v22 = *(id *)((char *)&v2->super.super.super.super.super.super.isa + v3);
  objc_sync_exit(v2);

LABEL_56:
  return v22;
}

- (NSArray)correctiveCompensationSpecifiersGroup
{
  correctiveCompensationSpecifiersGroup = self->_correctiveCompensationSpecifiersGroup;
  if (!correctiveCompensationSpecifiersGroup)
  {
    objc_super v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_super v5 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    char v6 = [(PUILocationServicesAuthorizationLevelController *)self specifier];
    objc_super v7 = [v6 identifier];
    BOOL v8 = PUIIsAppClip(v7);

    if (v8) {
      PUI_LocalizedStringForDimSum(@"PRECISE_LOCATION_APP_CLIP_FOOTER");
    }
    else {
    id v9 = PUI_LocalizedStringForLocationServicesPrivacy(@"PRECISE_LOCATION_FOOTER");
    }
    [v5 setProperty:v9 forKey:*MEMORY[0x1E4F93170]];
    id v10 = (void *)MEMORY[0x1E4F92E70];
    v11 = PUI_LocalizedStringForLocationServicesPrivacy(@"PRECISE_LOCATION");
    v12 = [v10 preferenceSpecifierNamed:v11 target:self set:sel__setPreciseLocationEnabled_specifier_ get:sel__preciseLocationStatus_ detail:0 cell:6 edit:0];

    [v12 setProperty:self->_serviceKey forKey:*MEMORY[0x1E4F93188]];
    v13 = [(PUILocationServicesAuthorizationLevelController *)self _preciseLocationStatus:v12];
    [v12 setProperty:v13 forKey:*MEMORY[0x1E4F93110]];

    [(NSArray *)v4 addObject:v5];
    [(NSArray *)v4 addObject:v12];
    v14 = self->_correctiveCompensationSpecifiersGroup;
    self->_correctiveCompensationSpecifiersGroup = v4;

    correctiveCompensationSpecifiersGroup = self->_correctiveCompensationSpecifiersGroup;
  }
  return correctiveCompensationSpecifiersGroup;
}

- (void)_setPreciseLocationEnabled:(id)a3 specifier:(id)a4
{
  details = self->_details;
  id v7 = a3;
  uint64_t v8 = [a4 identifier];
  id v10 = [(NSDictionary *)details objectForKey:v8];

  LODWORD(v8) = [v7 BOOLValue];
  self->_correctiveCompensationState = v8 ^ 1;
  if (v8) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  [getCLLocationManagerClass() setEntityAuthorization:self->_authMask withCorrectiveCompensationType:v9 forLocationDictionary:v10];
  [(PUILocationServicesAuthorizationLevelController *)self _setLocationAuthorizationLevelMaskForAssociatedFramework:self->_authMask withCorrectiveCompensation:v9];
}

- (id)_preciseLocationStatus:(id)a3
{
  return (id)[MEMORY[0x1E4F28ED0] numberWithBool:!self->_correctiveCompensationState];
}

- (id)_constructFooterForAuthorizationLevel:(unint64_t)a3
{
  objc_super v4 = objc_msgSend(NSString, "string", a3);
  id CLLocationManagerClass = getCLLocationManagerClass();
  char v6 = [(NSDictionary *)self->_details objectForKey:self->_serviceKey];
  char v7 = [CLLocationManagerClass allowableAuthorizationForLocationDictionary:v6];

  if ((v7 & 4) == 0)
  {
    if ((v7 & 2) == 0)
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      id v10 = 0;
LABEL_4:
      v11 = 0;
      goto LABEL_16;
    }
    uint64_t v12 = 2;
    goto LABEL_8;
  }
  if ((v7 & 2) == 0)
  {
    uint64_t v12 = 4;
LABEL_8:
    v11 = [(PUILocationServicesAuthorizationLevelController *)self _purposeStringForAuthorizationLevel:v12];
    goto LABEL_10;
  }
  v11 = [(PUILocationServicesAuthorizationLevelController *)self _purposeStringForAuthorizationLevel:6];
  if (!v11)
  {
    uint64_t v8 = [(PUILocationServicesAuthorizationLevelController *)self _purposeStringForAuthorizationLevel:0];
    id v10 = [(PUILocationServicesAuthorizationLevelController *)self _purposeStringForAuthorizationLevel:4];
    uint64_t v19 = [(PUILocationServicesAuthorizationLevelController *)self _purposeStringForAuthorizationLevel:2];
    uint64_t v9 = (void *)v19;
    if (!self->_displayName || !v10) {
      goto LABEL_4;
    }
    v20 = NSString;
    if (v19)
    {
      v14 = PUI_LocalizedStringForLocationServicesPrivacy(@"PURPOSE_STRING_COMBINED");
      objc_msgSend(v20, "stringWithFormat:", v14, v10, v9);
    }
    else
    {
      v14 = PUI_LocalizedStringForLocationServicesPrivacy(@"PURPOSE_STRING_REDUCED");
      objc_msgSend(v20, "stringWithFormat:", v14, v10, v21);
    v15 = };
    v11 = 0;
    goto LABEL_13;
  }
LABEL_10:
  if (!self->_displayName || !v11)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    id v10 = 0;
    goto LABEL_16;
  }
  v13 = NSString;
  v14 = PUI_LocalizedStringForLocationServicesPrivacy(@"PURPOSE_STRING");
  v15 = objc_msgSend(v13, "stringWithFormat:", v14, v11);
  id v10 = 0;
  uint64_t v9 = 0;
  uint64_t v8 = 0;
LABEL_13:

  if (v15)
  {
    v16 = [NSString stringWithFormat:@"%@", v15];
    uint64_t v17 = [v4 stringByAppendingString:v16];

    objc_super v4 = (void *)v17;
  }
LABEL_16:

  return v4;
}

- (id)_purposeStringForAuthorizationLevel:(unint64_t)a3
{
  uint64_t v3 = 1616;
  authEntityBundle = self->_authEntityBundle;
  if (!authEntityBundle) {
    goto LABEL_15;
  }
  p_class_meths = (char *)self;
  if (!self->_displayName) {
    goto LABEL_10;
  }
  if ((~(_BYTE)a3 & 6) == 0)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    p_class_meths = (char *)&OBJC_PROTOCOL___PSHeaderFooterView.class_meths;
    uint64_t v3 = getkCLCommonLocationAlwaysAndWhenInUseUsageDescriptionKeySymbolLoc_ptr;
    uint64_t v19 = getkCLCommonLocationAlwaysAndWhenInUseUsageDescriptionKeySymbolLoc_ptr;
    if (!getkCLCommonLocationAlwaysAndWhenInUseUsageDescriptionKeySymbolLoc_ptr)
    {
      char v6 = (void *)CoreLocationLibrary();
      v17[3] = (uint64_t)dlsym(v6, "kCLCommonLocationAlwaysAndWhenInUseUsageDescriptionKey");
      getkCLCommonLocationAlwaysAndWhenInUseUsageDescriptionKeySymbolLoc_ptr = v17[3];
      uint64_t v3 = v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (v3)
    {
LABEL_14:
      authEntityBundle = [authEntityBundle objectForInfoDictionaryKey:*(void *)v3];
      goto LABEL_15;
    }
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
  }
  if ((a3 & 2) != 0)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v3 = getkCLCommonLocationWhenInUseUsageDescriptionKeySymbolLoc_ptr;
    uint64_t v19 = getkCLCommonLocationWhenInUseUsageDescriptionKeySymbolLoc_ptr;
    if (!getkCLCommonLocationWhenInUseUsageDescriptionKeySymbolLoc_ptr)
    {
      char v7 = (void *)CoreLocationLibrary();
      v17[3] = (uint64_t)dlsym(v7, "kCLCommonLocationWhenInUseUsageDescriptionKey");
      getkCLCommonLocationWhenInUseUsageDescriptionKeySymbolLoc_ptr = v17[3];
      uint64_t v3 = v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v3) {
      goto LABEL_27;
    }
    goto LABEL_14;
  }
  if ((a3 & 4) == 0)
  {
LABEL_10:
    authEntityBundle = 0;
    goto LABEL_15;
  }
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  v11 = (void *)getkCLCommonLocationAlwaysUsageDescriptionKeySymbolLoc_ptr;
  uint64_t v19 = getkCLCommonLocationAlwaysUsageDescriptionKeySymbolLoc_ptr;
  if (!getkCLCommonLocationAlwaysUsageDescriptionKeySymbolLoc_ptr)
  {
    uint64_t v12 = (void *)CoreLocationLibrary();
    v17[3] = (uint64_t)dlsym(v12, "kCLCommonLocationAlwaysUsageDescriptionKey");
    getkCLCommonLocationAlwaysUsageDescriptionKeySymbolLoc_ptr = v17[3];
    v11 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v11)
  {
LABEL_28:
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    v15 = v14;
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v15);
  }
  authEntityBundle = [authEntityBundle objectForInfoDictionaryKey:*v11];
  if (!authEntityBundle)
  {
    authEntityBundle = *(void **)&p_class_meths[v3];
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v3 = getkCLCommonLocationUsageDescriptionKeySymbolLoc_ptr;
    uint64_t v19 = getkCLCommonLocationUsageDescriptionKeySymbolLoc_ptr;
    if (!getkCLCommonLocationUsageDescriptionKeySymbolLoc_ptr)
    {
      v13 = (void *)CoreLocationLibrary();
      v17[3] = (uint64_t)dlsym(v13, "kCLCommonLocationUsageDescriptionKey");
      getkCLCommonLocationUsageDescriptionKeySymbolLoc_ptr = v17[3];
      uint64_t v3 = v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v3)
    {
      -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
LABEL_27:
      -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
      goto LABEL_28;
    }
    goto LABEL_14;
  }
LABEL_15:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = authEntityBundle;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (id)_usageTextForAuthorizationLevel:(unint64_t)a3
{
  if (a3)
  {
    if ((a3 & 2) != 0)
    {
      char v6 = @"WHEN_IN_USE_AUTHORIZATION_EXPLANATION";
    }
    else
    {
      if ((a3 & 4) == 0)
      {
        objc_super v4 = 0;
        return v4;
      }
      char v6 = @"ALWAYS_AUTHORIZATION_EXPLANATION";
    }
  }
  else
  {
    char v6 = @"NOT_DETERMINED_AUTHORIZATION_EXPLANATION";
  }
  objc_super v4 = PUI_LocalizedStringForLocationServicesPrivacy(v6);
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PUILocationServicesAuthorizationLevelController;
  id v6 = a4;
  [(PUILocationServicesAuthorizationLevelController *)&v9 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[PUILocationServicesAuthorizationLevelController indexForIndexPath:](self, "indexForIndexPath:", v6, v9.receiver, v9.super_class);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [(PUILocationServicesAuthorizationLevelController *)self specifierAtIndex:v7];
    if (v8) {
      [(PUILocationServicesAuthorizationLevelController *)self _setLocationAuthorizationLevelForSpecifier:v8];
    }
  }
  [(PUILocationServicesAuthorizationLevelController *)self reloadSpecifierID:@"LOCATION_SERVICES_AUTH_GROUP" animated:1];
}

- (void)_setLocationAuthorizationLevelForSpecifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(NSDictionary *)self->_details objectForKey:self->_serviceKey];
  id v6 = [v5 objectForKeyedSubscript:@"BundleId"];
  self->_authMask = 0;
  uint64_t v7 = [v4 identifier];
  int v8 = [v7 isEqualToString:@"LOCATION_SERVICES_AUTH_NOT_DETERMINED"];

  if (v8)
  {
    uint64_t v9 = 0;
    self->_authMask = 0;
  }
  else
  {
    v11 = [v4 identifier];
    int v12 = [v11 isEqualToString:@"LOCATION_SERVICES_AUTH_NEVER"];

    if (v12)
    {
      uint64_t v9 = 0;
      char v10 = 1;
      self->_authMask = 1;
      goto LABEL_10;
    }
    v13 = [v4 identifier];
    int v14 = [v13 isEqualToString:@"LOCATION_SERVICES_AUTH_WHEN_IN_USE"];

    if (v14)
    {
      char v10 = 0;
      uint64_t v9 = 2;
      self->_authMask = 2;
      goto LABEL_10;
    }
    v15 = [v4 identifier];
    int v16 = [v15 isEqualToString:@"LOCATION_SERVICES_AUTH_WHEN_IN_USE_APP_OR_WIDGET"];

    if (v16)
    {
      char v10 = 0;
      self->_authMask = 2;
      uint64_t v9 = 3;
      goto LABEL_10;
    }
    v25 = [v4 identifier];
    int v26 = [v25 isEqualToString:@"LOCATION_SERVICES_AUTH_ALWAYS"];

    if (v26)
    {
      uint64_t v9 = 0;
      self->_authMask = 4;
    }
    else
    {
      v27 = _PUILoggingFacility();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4AD5000, v27, OS_LOG_TYPE_DEFAULT, "Setting an unknown state for location services auth level.", buf, 2u);
      }

      uint64_t v9 = 0;
    }
  }
  char v10 = 1;
LABEL_10:
  uint64_t v17 = [(PUILocationServicesAuthorizationLevelController *)self specifierForID:@"LOCATION_SERVICES_AUTH_GROUP"];
  uint64_t v18 = [(PUILocationServicesAuthorizationLevelController *)self _constructFooterForAuthorizationLevel:self->_authMask];
  [v17 setProperty:v18 forKey:*MEMORY[0x1E4F93170]];

  [getCLLocationManagerClass() setEntityAuthorization:self->_authMask withCorrectiveCompensationType:0 forLocationDictionary:v5];
  [(PUILocationServicesAuthorizationLevelController *)self _setLocationAuthorizationLevelMaskForAssociatedFramework:self->_authMask withCorrectiveCompensation:0];
  if ((v10 & 1) == 0)
  {
    int v28 = 0;
    [getCLLocationManagerClass() getIncidentalUseMode:&v28 forBundleIdentifier:v6];
    if (v28)
    {
      uint64_t v19 = _PUILoggingFacility();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v30 = v9;
        _os_log_impl(&dword_1E4AD5000, v19, OS_LOG_TYPE_DEFAULT, "Setting incidental mode %d", buf, 8u);
      }

      [getCLLocationManagerClass() setIncidentalUseMode:v9 forBundleIdentifier:v6];
    }
  }
  v20 = [v5 objectForKeyedSubscript:@"BundleId"];
  int v21 = [v20 isEqualToString:@"com.apple.Maps"];

  if (v21)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.Maps.LocationAuthorizationChangedNotification", 0, 0, 1u);
  }
  v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v23 postNotificationName:@"com.apple.PrivacySettingsUI.LocationServicesStateChanged" object:0];

  if (PUIIsAppClip(v6))
  {
    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 postNotificationName:@"com.apple.PrivacySettingsUI.LocationAppClipsStateChanged" object:0];
  }
  [(PUILocationServicesAuthorizationLevelController *)self _updatePreciseLocationCell];
}

- (void)_setLocationAuthorizationLevelMaskForAssociatedFramework:(unint64_t)a3 withCorrectiveCompensation:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = [(PUILocationServicesAuthorizationLevelController *)self specifier];
  id v14 = [v7 userInfo];

  int v8 = v14;
  if (v14)
  {
    uint64_t v9 = [v14 objectForKey:@"frameworkBundlePath"];
    if (!v9) {
      goto LABEL_10;
    }
    serviceKey = self->_serviceKey;
    v11 = [v14 objectForKey:@"appBundleID"];
    LODWORD(serviceKey) = [(NSString *)serviceKey isEqualToString:v11];

    if (!serviceKey) {
      goto LABEL_10;
    }
    int v12 = [(NSDictionary *)self->_details objectForKey:v9];
    uint64_t v13 = [getCLLocationManagerClass() allowableAuthorizationForLocationDictionary:v12];
    if ((v13 & a3) == 0)
    {
      if ((a3 & 4) == 0 || (v13 & 2) == 0) {
        goto LABEL_9;
      }
      a3 = 2;
    }
    [getCLLocationManagerClass() setEntityAuthorization:a3 withCorrectiveCompensationType:v4 forLocationDictionary:v12];
LABEL_9:

LABEL_10:
    int v8 = v14;
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

- (NSBundle)authEntityBundle
{
  return self->_authEntityBundle;
}

- (void)setAuthEntityBundle:(id)a3
{
}

- (void)setCorrectiveCompensationSpecifiersGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctiveCompensationSpecifiersGroup, 0);
  objc_storeStrong((id *)&self->_authEntityBundle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_serviceKey, 0);
}

- (void)specifiers
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1E4AD5000, log, OS_LOG_TYPE_ERROR, "No display name found for bundle: %@, dict: %@", (uint8_t *)&v3, 0x16u);
}

@end