@interface PUITCCAccessController
+ (BOOL)isServiceRestricted:(id)a3;
- (BOOL)supportsClips;
- (NSArray)appSpecifiers;
- (NSString)appClipsCount;
- (NSString)appGroupHeader;
- (NSString)clipsFooter;
- (NSString)explanation;
- (NSString)footer;
- (NSString)header;
- (NSString)serviceKey;
- (PUITCCAccessController)init;
- (id)accesssForSpecifier:(id)a3;
- (id)specifiers;
- (unint64_t)appType;
- (void)provideNavigationDonations;
- (void)setAccess:(id)a3 forSpecifier:(id)a4;
- (void)setAppClipsCount:(id)a3;
- (void)setAppGroupHeader:(id)a3;
- (void)setAppSpecifiers:(id)a3;
- (void)setAppType:(unint64_t)a3;
- (void)setClipsFooter:(id)a3;
- (void)setExplanation:(id)a3;
- (void)setFooter:(id)a3;
- (void)setHeader:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setSupportsClips:(BOOL)a3;
- (void)updateSpecifiersForImposedSettings;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUITCCAccessController

- (PUITCCAccessController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUITCCAccessController;
  v2 = [(PUITCCAccessController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(PUITCCAccessController *)v2 setReusesCells:1];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_updateAppClipsSpecifierCount_ name:@"com.apple.PrivacySettingsUI.AppClipsStateChanged" object:0];
  }
  return v3;
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)PUITCCAccessController;
  [(PUITCCAccessController *)&v56 setSpecifier:v4];
  v5 = [v4 identifier];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F93280]];

  if (v6)
  {
    v7 = (void **)MEMORY[0x1E4FA9A10];
LABEL_7:
    v12 = *v7;
    goto LABEL_8;
  }
  v8 = [v4 identifier];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F932C0]];

  if (v9)
  {
    v7 = (void **)MEMORY[0x1E4FA9AF0];
    goto LABEL_7;
  }
  v10 = [v4 identifier];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F93270]];

  if (v11)
  {
    v7 = (void **)MEMORY[0x1E4FA9A30];
    goto LABEL_7;
  }
  v24 = [v4 identifier];
  int v25 = [v24 isEqualToString:*MEMORY[0x1E4F932B8]];

  if (v25)
  {
    v12 = (void *)*MEMORY[0x1E4FA9AE0];
    [(PUITCCAccessController *)self setHeader:@"PHOTOS_HEADER"];
    goto LABEL_8;
  }
  v26 = [v4 identifier];
  int v27 = [v26 isEqualToString:*MEMORY[0x1E4F93268]];

  if (v27)
  {
    v28 = (void **)MEMORY[0x1E4FA9A28];
LABEL_20:
    v12 = *v28;
    [(PUITCCAccessController *)self setSupportsClips:1];
    goto LABEL_8;
  }
  v29 = [v4 identifier];
  int v30 = [v29 isEqualToString:*MEMORY[0x1E4F932A0]];

  if (v30)
  {
    v28 = (void **)MEMORY[0x1E4FA9AA8];
    goto LABEL_20;
  }
  v31 = [v4 identifier];
  int v32 = [v31 isEqualToString:*MEMORY[0x1E4F932C8]];

  if (v32)
  {
    v7 = (void **)MEMORY[0x1E4FA9B10];
    goto LABEL_7;
  }
  v33 = [v4 identifier];
  int v34 = [v33 isEqualToString:*MEMORY[0x1E4F932D8]];

  if (v34)
  {
    v7 = (void **)MEMORY[0x1E4FA9B40];
    goto LABEL_7;
  }
  v35 = [v4 identifier];
  int v36 = [v35 isEqualToString:*MEMORY[0x1E4F932A8]];

  if (v36)
  {
    v7 = (void **)MEMORY[0x1E4FA9AC8];
    goto LABEL_7;
  }
  v37 = [v4 identifier];
  int v38 = [v37 isEqualToString:*MEMORY[0x1E4F93278]];

  if (v38)
  {
    [(PUITCCAccessController *)self setHeader:@"CAMERA_HEADER"];
    [(PUITCCAccessController *)self setSupportsClips:1];
    v7 = (void **)MEMORY[0x1E4FA9A38];
    goto LABEL_7;
  }
  v39 = [v4 identifier];
  int v40 = [v39 isEqualToString:*MEMORY[0x1E4F93298]];

  if (v40)
  {
    v7 = (void **)MEMORY[0x1E4FA9AA0];
    goto LABEL_7;
  }
  v41 = [v4 identifier];
  int v42 = [v41 isEqualToString:*MEMORY[0x1E4F93290]];

  if (v42)
  {
    v7 = (void **)MEMORY[0x1E4FA9A70];
    goto LABEL_7;
  }
  v43 = [v4 identifier];
  int v44 = [v43 isEqualToString:*MEMORY[0x1E4F932D0]];

  if (v44)
  {
    [(PUITCCAccessController *)self setHeader:@"TRACKING_HEADER"];
    v7 = (void **)MEMORY[0x1E4FA9B20];
    goto LABEL_7;
  }
  v45 = [v4 identifier];
  int v46 = [v45 isEqualToString:*MEMORY[0x1E4F93288]];

  if (v46)
  {
    v12 = (void *)*MEMORY[0x1E4FA9A60];
    v47 = PUI_LocalizedStringForPrivacy(@"EXPOSURE_HEADER");
    [(PUITCCAccessController *)self setAppGroupHeader:v47];
  }
  else
  {
    v48 = [v4 identifier];
    int v49 = [v48 isEqualToString:@"CONTACTLESS_NFC"];

    if (v49)
    {
      v7 = (void **)MEMORY[0x1E4FA9A40];
      goto LABEL_7;
    }
    v50 = [v4 identifier];
    int v51 = [v50 isEqualToString:@"SECURE_ELEMENT"];

    if (v51)
    {
      v7 = (void **)MEMORY[0x1E4FA9AF8];
      goto LABEL_7;
    }
    v52 = [v4 identifier];
    int v53 = [v52 isEqualToString:@"PASSKEYS"];

    if (v53)
    {
      v7 = (void **)MEMORY[0x1E4FA9B30];
      goto LABEL_7;
    }
    v54 = [v4 identifier];
    int v55 = [v54 isEqualToString:*MEMORY[0x1E4F932B0]];

    if (!v55) {
      -[PUITCCAccessController setSpecifier:]();
    }
    v12 = (void *)*MEMORY[0x1E4FA9AD0];
    [(PUITCCAccessController *)self setFooter:@"NEARBY_INTERACTIONS_FOOTER"];
  }
LABEL_8:
  objc_storeStrong((id *)&self->_serviceKey, v12);
  v13 = [v4 propertyForKey:@"PUITCCAccessControllerAppTypeKey"];
  -[PUITCCAccessController setAppType:](self, "setAppType:", (int)[v13 intValue]);

  v14 = [(PUITCCAccessController *)self footer];

  if (!v14)
  {
    unint64_t v15 = [(PUITCCAccessController *)self appType];
    v16 = NSString;
    uint64_t v17 = [v4 identifier];
    v18 = (void *)v17;
    if (v15)
    {
      v19 = [v16 stringWithFormat:@"%@_CLIPS_FOOTER", v17];
      [(PUITCCAccessController *)self setClipsFooter:v19];
    }
    else
    {
      uint64_t v20 = [v16 stringWithFormat:@"%@_FOOTER", v17];

      [(PUITCCAccessController *)self setFooter:v20];
      v18 = (void *)v20;
    }
  }
  v21 = NSString;
  v22 = [v4 identifier];
  v23 = [v21 stringWithFormat:@"%@_EXPLANATION", v22];
  [(PUITCCAccessController *)self setExplanation:v23];
}

- (id)specifiers
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (v3) {
    goto LABEL_67;
  }
  uint64_t v83 = (int)*MEMORY[0x1E4F92F08];
  id v4 = (void *)TCCAccessCopyInformation();
  v99 = objc_opt_new();
  v87 = objc_opt_new();
  v97 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v107 objects:v114 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v108;
    uint64_t v93 = *MEMORY[0x1E4F931D0];
    uint64_t v95 = *MEMORY[0x1E4F931C0];
    uint64_t v89 = *MEMORY[0x1E4F930A8];
    uint64_t v91 = *MEMORY[0x1E4F93250];
    v7 = (void *)MEMORY[0x1E4FA99D8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v108 != v6) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v107 + 1) + 8 * i);
        v10 = (__CFBundle *)[v9 objectForKey:*v7];
        int v11 = v10;
        if (v10)
        {
          v12 = CFBundleGetIdentifier(v10);
          [v99 addObject:v12];
          if (!PUIIsAppClip(v12))
          {
            if ([(PUITCCAccessController *)self appType] == 1) {
              goto LABEL_21;
            }
LABEL_16:
            unint64_t v15 = (void *)MEMORY[0x1E4F92E70];
            v16 = PUIDisplayNameForApp(v11);
            uint64_t v17 = [v15 preferenceSpecifierNamed:v16 target:self set:sel_setAccess_forSpecifier_ get:sel_accesssForSpecifier_ detail:0 cell:6 edit:0];

            [v17 setIdentifier:v12];
            [v17 setProperty:v12 forKey:v95];
            [v17 setProperty:MEMORY[0x1E4F1CC38] forKey:v93];
            v18 = [v9 objectForKey:*MEMORY[0x1E4FA99E8]];
            [v17 setProperty:v18 forKey:v91];

            [v17 setProperty:v12 forKey:@"appBundleID"];
            [v17 setProperty:v12 forKey:@"PUITCCAccessControllerBundleIDKey"];
            v19 = [(PUITCCAccessController *)self specifier];
            uint64_t v20 = [v19 objectForKeyedSubscript:@"PUITCCAccessControllerCellClassKey"];

            if (v20)
            {
              v21 = [(PUITCCAccessController *)self specifier];
              v22 = [v21 objectForKeyedSubscript:@"PUITCCAccessControllerCellClassKey"];
              [v17 setProperty:v22 forKey:v89];
            }
            v23 = [(PUITCCAccessController *)self specifier];
            v24 = [v23 objectForKeyedSubscript:@"PUITCCAccessControllerCellDelegateKey"];

            if (v24)
            {
              int v25 = [(PUITCCAccessController *)self specifier];
              v26 = [v25 objectForKeyedSubscript:@"PUITCCAccessControllerCellDelegateKey"];
              [v17 setProperty:v26 forKey:@"PUITCCAccessControllerCellDelegateKey"];
            }
            [v97 addObject:v17];

            goto LABEL_21;
          }
          v13 = [v9 objectForKey:*MEMORY[0x1E4FA99E8]];
          int v14 = [v13 BOOLValue];

          if (v14) {
            [v87 addObject:v12];
          }
          if ([(PUITCCAccessController *)self appType]) {
            goto LABEL_16;
          }
        }
        else
        {
          v12 = _PUILoggingFacility();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v113 = v9;
            _os_log_impl(&dword_1E4AD5000, v12, OS_LOG_TYPE_DEFAULT, "TCCAccess skipping app with nil bundle: %@", buf, 0xCu);
          }
        }
LABEL_21:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v107 objects:v114 count:16];
    }
    while (v5);
  }

  int v27 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v87, "count"));
  v28 = PUI_LocalizedStringForPrivacy(v27);
  [(PUITCCAccessController *)self setAppClipsCount:v28];

  v84 = PUIGetActivePairedDevice();
  if (![(PUITCCAccessController *)self appType] && v84 && objc_opt_class())
  {
    v29 = (void *)MEMORY[0x1E4F1CAD0];
    int v30 = (void *)TCCAccessCopyBundleIdentifiersForService();
    v94 = [v29 setWithArray:v30];

    v31 = (void *)MEMORY[0x1E4F1CAD0];
    int v32 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();
    v82 = [v31 setWithArray:v32];

    v33 = [v94 setByAddingObjectsFromSet:v82];
    v92 = [MEMORY[0x1E4F79F08] sharedInstance];
    ScreenScale();
    if ((int)v34 == 2) {
      int v35 = 47;
    }
    else {
      int v35 = 48;
    }
    unsigned int v90 = v35;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v96 = v33;
    uint64_t v36 = [v96 countByEnumeratingWithState:&v103 objects:v111 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v104;
      uint64_t v88 = *MEMORY[0x1E4F93190];
      uint64_t v85 = *MEMORY[0x1E4F930A8];
      uint64_t v86 = *MEMORY[0x1E4F93250];
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v104 != v37) {
            objc_enumerationMutation(v96);
          }
          v39 = *(void **)(*((void *)&v103 + 1) + 8 * v38);
          if (([v99 containsObject:v39] & 1) == 0)
          {
            [v99 addObject:v39];
            uint64_t v40 = PUIDisplayNameForWatchApp(v39);
            if (v40)
            {
              uint64_t v41 = v39;
              int v42 = (void *)MEMORY[0x1E4F92E70];
              goto LABEL_37;
            }
            uint64_t v41 = PUIWatchBundleIDForBundleID(v39);
            uint64_t v40 = PUIDisplayNameForWatchApp((void *)v41);
            if (!(v40 | v41)) {
              goto LABEL_43;
            }
            int v42 = (void *)MEMORY[0x1E4F92E70];
            v43 = v39;
            if (v40) {
LABEL_37:
            }
              v43 = (void *)v40;
            int v44 = [v42 preferenceSpecifierNamed:v43 target:self set:sel_setAccess_forSpecifier_ get:sel_accesssForSpecifier_ detail:0 cell:6 edit:0];
            [v44 setIdentifier:v39];
            v45 = PSBlankIconImage();
            [v44 setProperty:v45 forKey:v88];

            int v46 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v94, "containsObject:", v39));
            [v44 setProperty:v46 forKey:v86];

            [v44 setProperty:v39 forKey:@"appBundleID"];
            [v44 setProperty:v39 forKey:@"PUITCCAccessControllerBundleIDKey"];
            v47 = [(PUITCCAccessController *)self specifier];
            v48 = [v47 objectForKeyedSubscript:@"PUITCCAccessControllerCellClassKey"];

            if (v48)
            {
              int v49 = [(PUITCCAccessController *)self specifier];
              v50 = [v49 objectForKeyedSubscript:@"PUITCCAccessControllerCellClassKey"];
              [v44 setProperty:v50 forKey:v85];
            }
            int v51 = [(PUITCCAccessController *)self specifier];
            v52 = [v51 objectForKeyedSubscript:@"PUITCCAccessControllerCellDelegateKey"];

            if (v52)
            {
              int v53 = [(PUITCCAccessController *)self specifier];
              v54 = [v53 objectForKeyedSubscript:@"PUITCCAccessControllerCellDelegateKey"];
              [v44 setProperty:v54 forKey:@"PUITCCAccessControllerCellDelegateKey"];
            }
            objc_initWeak((id *)buf, self);
            v100[0] = MEMORY[0x1E4F143A8];
            v100[1] = 3221225472;
            v100[2] = __36__PUITCCAccessController_specifiers__block_invoke;
            v100[3] = &unk_1E6E9D3E0;
            id v55 = v44;
            id v101 = v55;
            objc_copyWeak(&v102, (id *)buf);
            [v92 getIconForBundleID:v41 iconVariant:v90 block:v100 timeout:-1.0];
            [v97 addObject:v55];
            objc_destroyWeak(&v102);

            objc_destroyWeak((id *)buf);
          }
LABEL_43:
          ++v38;
        }
        while (v36 != v38);
        uint64_t v56 = [v96 countByEnumeratingWithState:&v103 objects:v111 count:16];
        uint64_t v36 = v56;
      }
      while (v56);
    }
  }
  [v97 sortUsingComparator:&__block_literal_global_22];
  v57 = (void *)[v97 copy];
  [(PUITCCAccessController *)self setAppSpecifiers:v57];

  if (_os_feature_enabled_impl())
  {
    v58 = [MEMORY[0x1E4F74230] sharedConnection];
    if ([v58 isAppClipsAllowed] && !-[PUITCCAccessController appType](self, "appType"))
    {
      BOOL v59 = [(PUITCCAccessController *)self supportsClips];

      if (!v59) {
        goto LABEL_58;
      }
      v60 = (void *)MEMORY[0x1E4F92E70];
      v61 = PUI_LocalizedStringForDimSum(@"APP_CLIPS");
      v58 = [v60 preferenceSpecifierNamed:v61 target:self set:0 get:sel_getAppClipsCount_ detail:objc_opt_class() cell:2 edit:0];

      v62 = [(PUITCCAccessController *)self specifier];
      v63 = [v62 identifier];
      [v58 setIdentifier:v63];

      [v58 setObject:&unk_1F4080698 forKeyedSubscript:@"PUITCCAccessControllerAppTypeKey"];
      [v58 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F931D0]];
      [v58 setObject:@"com.apple.graphic-icon.app-clips" forKeyedSubscript:*MEMORY[0x1E4F931A0]];
      v64 = [(PUITCCAccessController *)self specifier];
      v65 = [v64 objectForKeyedSubscript:@"PUITCCAccessControllerCellClassKey"];

      if (v65)
      {
        v66 = [(PUITCCAccessController *)self specifier];
        v67 = [v66 objectForKeyedSubscript:@"PUITCCAccessControllerCellClassKey"];
        [v58 setProperty:v67 forKey:@"PUITCCAccessControllerCellClassKey"];
      }
      [v97 insertObject:v58 atIndex:0];
    }
  }
LABEL_58:
  if ([v97 count]
    || ([(PUITCCAccessController *)self serviceKey],
        v68 = objc_claimAutoreleasedReturnValue(),
        char v69 = [v68 isEqualToString:*MEMORY[0x1E4FA9A60]],
        v68,
        (v69 & 1) == 0))
  {
    NSUInteger v70 = [(NSString *)self->_header length];
    v71 = (void *)MEMORY[0x1E4F93170];
    if (v70)
    {
      v72 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
      v73 = PUI_LocalizedStringForPrivacy(self->_header);
      [v72 setProperty:v73 forKey:*v71];

      [v97 insertObject:v72 atIndex:0];
    }
    v74 = (void *)MEMORY[0x1E4F92E70];
    v75 = [(PUITCCAccessController *)self appGroupHeader];
    v76 = [v74 preferenceSpecifierNamed:v75 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v76 setIdentifier:@"APP_GROUP"];
    v77 = [(PUITCCAccessController *)self clipsFooter];

    if (v77)
    {
      v78 = [(PUITCCAccessController *)self clipsFooter];
      PUI_LocalizedStringForDimSum(v78);
    }
    else
    {
      v78 = [(PUITCCAccessController *)self footer];
      PUI_LocalizedStringForPrivacy(v78);
    v79 = };

    [v76 setProperty:v79 forKey:*v71];
    [v97 insertObject:v76 atIndex:v70 != 0];
  }
  v80 = *(Class *)((char *)&self->super.super.super.super.super.isa + v83);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v83) = (Class)v97;

  [(PUITCCAccessController *)self updateSpecifiersForImposedSettings];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v83);
LABEL_67:
  return v3;
}

void __36__PUITCCAccessController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PUITCCAccessController_specifiers__block_invoke_2;
  block[3] = &unk_1E6E9D3B8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
}

void __36__PUITCCAccessController_specifiers__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setProperty:*(void *)(a1 + 40) forKey:*MEMORY[0x1E4F93190]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

uint64_t __36__PUITCCAccessController_specifiers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUITCCAccessController;
  [(PUITCCAccessController *)&v4 viewWillAppear:a3];
  [(PUITCCAccessController *)self updateSpecifiersForImposedSettings];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUITCCAccessController;
  [(PUITCCAccessController *)&v4 viewDidAppear:a3];
  [(PUITCCAccessController *)self provideNavigationDonations];
}

- (void)provideNavigationDonations
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  id v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v7 = (void *)[v5 initWithKey:@"PRIVACY" table:@"Privacy" locale:v6 bundleURL:v4];

  v29[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  if ([(NSString *)self->_serviceKey isEqualToString:*MEMORY[0x1E4FA9AA0]])
  {
    id v9 = objc_alloc(MEMORY[0x1E4F292B8]);
    v10 = [MEMORY[0x1E4F1CA20] currentLocale];
    int v11 = (void *)[v9 initWithKey:@"MEDIALIBRARY" table:@"Privacy" locale:v10 bundleURL:v4];

    id v12 = objc_alloc(MEMORY[0x1E4F292B8]);
    v13 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v14 = [v12 initWithKey:@"PRIVACY" table:@"Privacy" locale:v13 bundleURL:v4];

    uint64_t v15 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/MEDIALIBRARY"];
    v16 = (void *)v15;
    if (v11 && v15) {
      [(PUITCCAccessController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.privacy" title:v11 localizedNavigationComponents:v8 deepLink:v15];
    }
    uint64_t v7 = (void *)v14;
  }
  else
  {
    if ([(NSString *)self->_serviceKey isEqualToString:*MEMORY[0x1E4FA9A28]])
    {
      id v17 = objc_alloc(MEMORY[0x1E4F292B8]);
      v18 = [MEMORY[0x1E4F1CA20] currentLocale];
      int v11 = (void *)[v17 initWithKey:@"BT_PERIPHERAL" table:@"Privacy" locale:v18 bundleURL:v4];
      v19 = @"com.apple.graphic-icon.bluetooth";
      uint64_t v20 = @"settings-navigation://com.apple.Settings.PrivacyAndSecurity/BT_PERIPHERAL";
    }
    else if ([(NSString *)self->_serviceKey isEqualToString:*MEMORY[0x1E4FA9B40]])
    {
      id v21 = objc_alloc(MEMORY[0x1E4F292B8]);
      v18 = [MEMORY[0x1E4F1CA20] currentLocale];
      int v11 = (void *)[v21 initWithKey:@"WILLOW" table:@"Privacy" locale:v18 bundleURL:v4];
      v19 = @"com.apple.graphic-icon.home";
      uint64_t v20 = @"settings-navigation://com.apple.Settings.PrivacyAndSecurity/WILLOW";
    }
    else if ([(NSString *)self->_serviceKey isEqualToString:*MEMORY[0x1E4FA9B30]])
    {
      id v22 = objc_alloc(MEMORY[0x1E4F292B8]);
      v18 = [MEMORY[0x1E4F1CA20] currentLocale];
      int v11 = (void *)[v22 initWithKey:@"PASSKEYS" table:@"Privacy" locale:v18 bundleURL:v4];
      v19 = @"com.apple.graphic-icon.person-passkey";
      uint64_t v20 = @"settings-navigation://com.apple.Settings.PrivacyAndSecurity/PASSKEYS";
    }
    else if ([(NSString *)self->_serviceKey isEqualToString:*MEMORY[0x1E4FA9AF0]])
    {
      id v23 = objc_alloc(MEMORY[0x1E4F292B8]);
      v18 = [MEMORY[0x1E4F1CA20] currentLocale];
      int v11 = (void *)[v23 initWithKey:@"REMINDERS" table:@"Privacy" locale:v18 bundleURL:v4];
      v19 = @"com.apple.graphic-icon.privacy";
      uint64_t v20 = @"settings-navigation://com.apple.Settings.PrivacyAndSecurity/REMINDERS";
    }
    else if ([(NSString *)self->_serviceKey isEqualToString:*MEMORY[0x1E4FA9A38]])
    {
      id v24 = objc_alloc(MEMORY[0x1E4F292B8]);
      v18 = [MEMORY[0x1E4F1CA20] currentLocale];
      int v11 = (void *)[v24 initWithKey:@"CAMERA" table:@"Privacy" locale:v18 bundleURL:v4];
      v19 = @"com.apple.graphic-icon.camera";
      uint64_t v20 = @"settings-navigation://com.apple.Settings.PrivacyAndSecurity/CAMERA";
    }
    else if ([(NSString *)self->_serviceKey isEqualToString:*MEMORY[0x1E4FA9AA8]])
    {
      id v25 = objc_alloc(MEMORY[0x1E4F292B8]);
      v18 = [MEMORY[0x1E4F1CA20] currentLocale];
      int v11 = (void *)[v25 initWithKey:@"MICROPHONE" table:@"Privacy" locale:v18 bundleURL:v4];
      v19 = @"com.apple.graphic-icon.microphone-access";
      uint64_t v20 = @"settings-navigation://com.apple.Settings.PrivacyAndSecurity/MICROPHONE";
    }
    else if ([(NSString *)self->_serviceKey isEqualToString:*MEMORY[0x1E4FA9AD0]])
    {
      id v26 = objc_alloc(MEMORY[0x1E4F292B8]);
      v18 = [MEMORY[0x1E4F1CA20] currentLocale];
      int v11 = (void *)[v26 initWithKey:@"NEARBY_INTERACTIONS" table:@"Privacy" locale:v18 bundleURL:v4];
      v19 = @"com.apple.graphic-icon.nearby-interactions";
      uint64_t v20 = @"settings-navigation://com.apple.Settings.PrivacyAndSecurity/NEARBY_INTERACTIONS";
    }
    else
    {
      if (![(NSString *)self->_serviceKey isEqualToString:*MEMORY[0x1E4FA9B10]])
      {
        v16 = 0;
        int v11 = 0;
        goto LABEL_25;
      }
      id v27 = objc_alloc(MEMORY[0x1E4F292B8]);
      v18 = [MEMORY[0x1E4F1CA20] currentLocale];
      int v11 = (void *)[v27 initWithKey:@"SPEECH_RECOGNITION" table:@"Privacy" locale:v18 bundleURL:v4];
      v19 = @"com.apple.graphic-icon.waveform";
      uint64_t v20 = @"settings-navigation://com.apple.Settings.PrivacyAndSecurity/SPEECH_RECOGNITION";
    }

    uint64_t v28 = [MEMORY[0x1E4F1CB10] URLWithString:v20];
    v16 = (void *)v28;
    if (v11 && v28) {
      [(PUITCCAccessController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:v19 title:v11 localizedNavigationComponents:v8 deepLink:v28];
    }
  }
LABEL_25:
}

- (void)setAccess:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PUITCCAccessController_setAccess_forSpecifier___block_invoke;
  aBlock[3] = &unk_1E6E9CCB8;
  id v8 = v6;
  id v38 = v8;
  id v9 = v7;
  id v39 = v9;
  uint64_t v40 = self;
  v10 = (void (**)(void))_Block_copy(aBlock);
  if (([v8 BOOLValue] & 1) != 0
    || ([(PUITCCAccessController *)self specifier],
        int v11 = objc_claimAutoreleasedReturnValue(),
        [v11 objectForKeyedSubscript:@"PUITCCAccessControllerPromptTitleKey"],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    v10[2](v10);
  }
  else
  {
    v13 = [(PUITCCAccessController *)self specifier];
    int v32 = [v13 objectForKeyedSubscript:@"PUITCCAccessControllerPromptTitleKey"];

    uint64_t v14 = [(PUITCCAccessController *)self specifier];
    v31 = [v14 objectForKeyedSubscript:@"PUITCCAccessControllerPromptDetailKey"];

    uint64_t v15 = NSString;
    v16 = PUI_LocalizedStringForPrivacy(v32);
    id v17 = [v9 name];
    v18 = objc_msgSend(v15, "stringWithFormat:", v16, v17);

    v19 = NSString;
    uint64_t v20 = PUI_LocalizedStringForPrivacy(v31);
    id v21 = [v9 name];
    id v22 = objc_msgSend(v19, "stringWithFormat:", v20, v21);

    id v23 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v18 message:v22 preferredStyle:1];
    id v24 = (void *)MEMORY[0x1E4FB1410];
    id v25 = PUI_LocalizedStringForPrivacy(@"TCC_ALERT_TURN_OFF");
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __49__PUITCCAccessController_setAccess_forSpecifier___block_invoke_196;
    v35[3] = &unk_1E6E9DE98;
    uint64_t v36 = v10;
    id v26 = [v24 actionWithTitle:v25 style:2 handler:v35];
    [v23 addAction:v26];

    id v27 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v28 = PUI_LocalizedStringForPrivacy(@"TCC_ALERT_CANCEL");
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __49__PUITCCAccessController_setAccess_forSpecifier___block_invoke_2;
    v33[3] = &unk_1E6E9CC68;
    v33[4] = self;
    id v34 = v9;
    v29 = [v27 actionWithTitle:v28 style:1 handler:v33];
    [v23 addAction:v29];

    [(PUITCCAccessController *)self presentViewController:v23 animated:1 completion:0];
  }
  int v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v30 postNotificationName:@"com.apple.PrivacySettingsUI.AppClipsStateChanged" object:0];
}

void __49__PUITCCAccessController_setAccess_forSpecifier___block_invoke(id *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  uint64_t v3 = *MEMORY[0x1E4F93250];
  objc_super v4 = [a1[5] propertyForKey:*MEMORY[0x1E4F93250]];
  LOBYTE(v2) = [v2 isEqual:v4];

  if ((v2 & 1) == 0)
  {
    uint64_t v5 = [a1[5] propertyForKey:@"appBundleID"];
    [a1[4] BOOLValue];
    TCCAccessSetForBundleId();
    [a1[5] setProperty:a1[4] forKey:v3];
    if ([a1[4] BOOLValue]) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 2;
    }
    [MEMORY[0x1E4F9AA08] trackingStateOfRequestForSpecificApp:v6 view:@"PrivacyTracking"];
    id v7 = _PUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "########### Quitting application (%@) in response to privacy settings change.", (uint8_t *)&v10, 0xCu);
    }
  }
  id v8 = [a1[6] serviceKey];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4FA9B20]];

  if (v9) {
    PUIResetIDFAIfNeeded();
  }
}

uint64_t __49__PUITCCAccessController_setAccess_forSpecifier___block_invoke_196(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__PUITCCAccessController_setAccess_forSpecifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

- (id)accesssForSpecifier:(id)a3
{
  return (id)[a3 propertyForKey:*MEMORY[0x1E4F93250]];
}

+ (BOOL)isServiceRestricted:(id)a3
{
  id v3 = a3;
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  objc_super v4 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  uint64_t v5 = v4;
  if (v4) {
    LOBYTE(v6) = [v4 containsObject:v3];
  }
  else {
    LOBYTE(v6) = 0;
  }
  TCCAccessGetOverride();
  if ([v3 isEqualToString:*MEMORY[0x1E4FA9B20]])
  {
    id v7 = objc_opt_new();
    id v8 = v7;
    if (v6) {
      LOBYTE(v6) = 1;
    }
    else {
      int v6 = [v7 crossAppTrackingAllowedSwitchEnabled] ^ 1;
    }
  }
  return v6;
}

- (void)updateSpecifiersForImposedSettings
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend((id)objc_opt_class(), "isServiceRestricted:", self->_serviceKey) ^ 1);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(PUITCCAccessController *)self appSpecifiers];
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    uint64_t v6 = *MEMORY[0x1E4F93130];
    uint64_t v19 = *MEMORY[0x1E4F93250];
    uint64_t v20 = *MEMORY[0x1E4F93220];
    id v7 = (int *)MEMORY[0x1E4F92F28];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(char **)(*((void *)&v23 + 1) + 8 * v8);
        if (*(void *)&v9[*v7] == 6)
        {
          uint64_t v10 = [*(id *)(*((void *)&v23 + 1) + 8 * v8) propertyForKey:v6];
          if (!v10) {
            goto LABEL_9;
          }
          uint64_t v11 = (void *)v10;
          uint64_t v12 = [v9 objectForKeyedSubscript:v6];
          uint64_t v13 = v5;
          uint64_t v14 = v7;
          int v15 = [v12 BOOLValue];
          int v16 = [v22 BOOLValue];

          BOOL v17 = v15 == v16;
          id v7 = v14;
          uint64_t v5 = v13;
          if (!v17)
          {
LABEL_9:
            objc_msgSend(v9, "setProperty:forKey:", v22, v6, v19);
            v18 = [v9 propertyForKey:v20];
            objc_msgSend(v18, "setCellEnabled:", objc_msgSend(v22, "BOOLValue"));

            if (([v22 BOOLValue] & 1) == 0) {
              [v9 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v19];
            }
          }
        }
        ++v8;
      }
      while (v4 != v8);
      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v4);
  }
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
}

- (NSString)serviceKey
{
  return self->_serviceKey;
}

- (NSString)clipsFooter
{
  return self->_clipsFooter;
}

- (void)setClipsFooter:(id)a3
{
}

- (BOOL)supportsClips
{
  return self->_supportsClips;
}

- (void)setSupportsClips:(BOOL)a3
{
  self->_supportsClips = a3;
}

- (NSString)appClipsCount
{
  return self->_appClipsCount;
}

- (void)setAppClipsCount:(id)a3
{
  self->_appClipsCount = (NSString *)a3;
}

- (unint64_t)appType
{
  return self->_appType;
}

- (void)setAppType:(unint64_t)a3
{
  self->_appType = a3;
}

- (NSString)appGroupHeader
{
  return self->_appGroupHeader;
}

- (void)setAppGroupHeader:(id)a3
{
}

- (NSArray)appSpecifiers
{
  return self->_appSpecifiers;
}

- (void)setAppSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_appGroupHeader, 0);
  objc_storeStrong((id *)&self->_clipsFooter, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_serviceKey, 0);
}

- (void)setSpecifier:.cold.1()
{
}

@end