@interface PUIFileAccessController
- (BOOL)isAccess;
- (FPAccessControlManager)accessManager;
- (PUIFileAccessController)init;
- (id)accesssForSpecifier:(id)a3;
- (id)applicationProxiesDictionary;
- (id)bundleIdentifiersAccessingFiles;
- (id)cameraAccessForSpecifier:(id)a3;
- (id)specifiers;
- (void)provideNavigationDonations;
- (void)setAccess:(id)a3 forSpecifier:(id)a4;
- (void)setAccessManager:(id)a3;
- (void)setCameraAccess:(id)a3 forSpecifier:(id)a4;
- (void)setIsAccess:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PUIFileAccessController

- (PUIFileAccessController)init
{
  v9.receiver = self;
  v9.super_class = (Class)PUIFileAccessController;
  v2 = [(PUIFileAccessController *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(PUIFileAccessController *)v2 setReusesCells:1];
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2050000000;
    v4 = (void *)getFPAccessControlManagerClass_softClass;
    uint64_t v14 = getFPAccessControlManagerClass_softClass;
    if (!getFPAccessControlManagerClass_softClass)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __getFPAccessControlManagerClass_block_invoke;
      v10[3] = &unk_1E6E9C7F8;
      v10[4] = &v11;
      __getFPAccessControlManagerClass_block_invoke((uint64_t)v10);
      v4 = (void *)v12[3];
    }
    v5 = v4;
    _Block_object_dispose(&v11, 8);
    v6 = (FPAccessControlManager *)objc_alloc_init(v5);
    accessManager = v3->_accessManager;
    v3->_accessManager = v6;
  }
  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIFileAccessController;
  [(PUIFileAccessController *)&v4 viewDidAppear:a3];
  [(PUIFileAccessController *)self provideNavigationDonations];
}

- (void)provideNavigationDonations
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = (void *)[v5 initWithKey:@"FILEACCESS" table:@"Privacy" locale:v6 bundleURL:v4];

  id v8 = objc_alloc(MEMORY[0x1E4F292B8]);
  objc_super v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  v10 = (void *)[v8 initWithKey:@"PRIVACY" table:@"Privacy" locale:v9 bundleURL:v4];

  v13[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/FILEACCESS"];
  [(PUIFileAccessController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.privacy" title:v7 localizedNavigationComponents:v11 deepLink:v12];
}

- (id)applicationProxiesDictionary
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = [MEMORY[0x1E4F22438] enumeratorForApplicationProxiesWithOptions:0];
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    id v5 = (void *)v4;
    do
    {
      v6 = [v5 bundleIdentifier];
      v7 = [v6 lowercaseString];
      [v2 setObject:v5 forKey:v7];

      uint64_t v8 = [v3 nextObject];

      id v5 = (void *)v8;
    }
    while (v8);
  }

  return v2;
}

- (id)bundleIdentifiersAccessingFiles
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = [(PUIFileAccessController *)self accessManager];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __58__PUIFileAccessController_bundleIdentifiersAccessingFiles__block_invoke;
  v12 = &unk_1E6E9D500;
  uint64_t v14 = &v15;
  id v5 = v3;
  uint64_t v13 = v5;
  [v4 bundleIdentifiersWithAccessToAnyItemCompletionHandler:&v9];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v9, v10, v11, v12);
  [v6 postNotificationName:@"com.apple.PrivacySettingsUI.FileAccessStateChanged" object:0];

  id v7 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __58__PUIFileAccessController_bundleIdentifiersAccessingFiles__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)specifiers
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (!v3)
  {
    uint64_t v53 = (int)*MEMORY[0x1E4F92F08];
    v71 = [(PUIFileAccessController *)self applicationProxiesDictionary];
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    [(PUIFileAccessController *)self bundleIdentifiersAccessingFiles];
    id v5 = v61 = self;
    v6 = [v4 setWithArray:v5];

    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = [MEMORY[0x1E4F2F320] bundleIdentifiersAccessingExternalMediaDevices];
    v51 = [v7 setWithArray:v8];

    uint64_t v9 = objc_opt_new();
    uint64_t v10 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    [v10 setIdentifier:@"FILE_APP_GROUP"];
    uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"FILEACCESS_FOOTER" value:&stru_1F4072988 table:@"Privacy"];
    [v10 setProperty:v12 forKey:*MEMORY[0x1E4F93170]];

    uint64_t v13 = v61;
    v70 = v9;
    v52 = v10;
    [v9 addObject:v10];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v76 objects:v81 count:16];
    v60 = v14;
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v77;
      uint64_t v58 = *MEMORY[0x1E4F1CC48];
      uint64_t v56 = *MEMORY[0x1E4F1D008];
      uint64_t v66 = *MEMORY[0x1E4F931C0];
      uint64_t v64 = *MEMORY[0x1E4F1CFD0];
      uint64_t v62 = *MEMORY[0x1E4F931D0];
      uint64_t v68 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v77 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          id v20 = [v19 lowercaseString];
          if (([v20 isEqualToString:@"com.apple.documentsapp"] & 1) == 0)
          {
            v21 = [v71 objectForKey:v20];
            v22 = v21;
            if (v21)
            {
              v23 = [v21 bundleIdentifier];
              v24 = [v22 localizedNameForContext:0];
              if (![v24 length])
              {
                BundleWithIdentifier = CFBundleGetBundleWithIdentifier(v23);
                v26 = CFBundleGetInfoDictionary(BundleWithIdentifier);
                v27 = [v26 objectForKeyedSubscript:v58];

                if (![v27 length])
                {
                  v28 = [v26 objectForKeyedSubscript:v56];

                  if ([v28 length])
                  {
                    v27 = v28;
                  }
                  else
                  {
                    CFURLRef v54 = CFBundleCopyBundleURL(BundleWithIdentifier);
                    v29 = [(__CFURL *)v54 lastPathComponent];
                    v27 = [v29 stringByDeletingPathExtension];
                  }
                }

                v24 = v27;
                id v14 = v60;
                uint64_t v13 = v61;
              }
              v30 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v24 target:v13 set:sel_setAccess_forSpecifier_ get:sel_accesssForSpecifier_ detail:0 cell:6 edit:0];
              [v30 setIdentifier:v19];
              [v30 setProperty:v23 forKey:v66];
              [v30 setProperty:v64 forKey:v62];
              [v70 addObject:v30];

              uint64_t v17 = v68;
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v76 objects:v81 count:16];
      }
      while (v16);
    }

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v31 = v51;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v72 objects:v80 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v73;
      uint64_t v59 = *MEMORY[0x1E4F1CC48];
      uint64_t v57 = *MEMORY[0x1E4F1D008];
      uint64_t v69 = *MEMORY[0x1E4F931C0];
      uint64_t v67 = *MEMORY[0x1E4F1CFD0];
      id v63 = v31;
      uint64_t v65 = *MEMORY[0x1E4F931D0];
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v73 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = *(void **)(*((void *)&v72 + 1) + 8 * j);
          if (([v36 isEqualToString:@"com.apple.MobileSlideShow"] & 1) == 0)
          {
            v37 = [v36 lowercaseString];
            v38 = [v71 objectForKey:v37];
            v39 = v38;
            if (v38)
            {
              v40 = [v38 bundleIdentifier];
              v41 = [v39 localizedNameForContext:0];
              if (![v41 length])
              {
                v42 = CFBundleGetBundleWithIdentifier(v40);
                v43 = CFBundleGetInfoDictionary(v42);
                v44 = [v43 objectForKeyedSubscript:v59];

                if (![v44 length])
                {
                  v45 = [v43 objectForKeyedSubscript:v57];

                  if ([v45 length])
                  {
                    v44 = v45;
                  }
                  else
                  {
                    CFURLRef v55 = CFBundleCopyBundleURL(v42);
                    v46 = [(__CFURL *)v55 lastPathComponent];
                    v44 = [v46 stringByDeletingPathExtension];
                  }
                }
                id v31 = v63;

                v41 = v44;
                uint64_t v13 = v61;
              }
              v47 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v41 target:v13 set:sel_setCameraAccess_forSpecifier_ get:sel_cameraAccessForSpecifier_ detail:0 cell:6 edit:0];
              [v47 setIdentifier:v40];
              [v47 setProperty:v40 forKey:v69];
              [v47 setProperty:v67 forKey:v65];
              [v70 addObject:v47];
            }
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v72 objects:v80 count:16];
      }
      while (v33);
    }

    [v70 sortUsingComparator:&__block_literal_global_8];
    uint64_t v48 = [v70 copy];
    v49 = *(Class *)((char *)&v13->super.super.super.super.super.isa + v53);
    *(Class *)((char *)&v13->super.super.super.super.super.isa + v53) = (Class)v48;

    dispatch_semaphore_t v3 = *(Class *)((char *)&v13->super.super.super.super.super.isa + v53);
  }
  return v3;
}

uint64_t __37__PUIFileAccessController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void)setAccess:(id)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  if (([a3 BOOLValue] & 1) == 0)
  {
    uint64_t v7 = [(PUIFileAccessController *)self accessManager];
    uint64_t v8 = [v6 identifier];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__PUIFileAccessController_setAccess_forSpecifier___block_invoke;
    v9[3] = &unk_1E6E9C780;
    v9[4] = self;
    [v7 revokeAccessToAllItemsForBundle:v8 completionHandler:v9];
  }
}

void __50__PUIFileAccessController_setAccess_forSpecifier___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PUIFileAccessController_setAccess_forSpecifier___block_invoke_2;
  block[3] = &unk_1E6E9C758;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __50__PUIFileAccessController_setAccess_forSpecifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)accesssForSpecifier:(id)a3
{
  return (id)[MEMORY[0x1E4F28ED0] numberWithBool:1];
}

- (void)setCameraAccess:(id)a3 forSpecifier:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F2F320];
  id v7 = a3;
  uint64_t v8 = [a4 identifier];
  uint64_t v9 = [v7 BOOLValue];

  [v6 updateBundleIdentifierAccessingExternalMediaDevices:v8 withStatus:v9];
  [(PUIFileAccessController *)self reloadSpecifiers];
}

- (id)cameraAccessForSpecifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [MEMORY[0x1E4F2F320] bundleIdentifiersAccessingExternalMediaDevicesWithStatus];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "objectForKeyedSubscript:", @"bundle_id", (void)v15);
        uint64_t v11 = [v3 identifier];
        char v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          uint64_t v13 = [v9 objectForKeyedSubscript:@"whitelisted"];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
LABEL_11:

  return v13;
}

- (BOOL)isAccess
{
  return self->_isAccess;
}

- (void)setIsAccess:(BOOL)a3
{
  self->_isAccess = a3;
}

- (FPAccessControlManager)accessManager
{
  return self->_accessManager;
}

- (void)setAccessManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end