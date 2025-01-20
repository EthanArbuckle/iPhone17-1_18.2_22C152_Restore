@interface PBFInitialPosterHelper
+ (id)hostConfigurationForRole:(id)a3;
+ (id)incomingPosterConfigurationForRole:(id)a3 templatePath:(id)a4 userInfo:(id)a5;
+ (id)initialPosterConfigurationsWithModelCoordinatorProvider:(id)a3 role:(id)a4;
@end

@implementation PBFInitialPosterHelper

+ (id)initialPosterConfigurationsWithModelCoordinatorProvider:(id)a3 role:(id)a4
{
  v78[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PBFInitialPosterHelper_initialPosterConfigurationsWithModelCoordinatorProvider_role___block_invoke;
  aBlock[3] = &unk_1E6984270;
  id v7 = v5;
  id v65 = v7;
  id v8 = v6;
  id v66 = v8;
  v55 = (void (**)(void *, void *, void *, id *))_Block_copy(aBlock);
  v9 = PBFLogPosterContents();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_DEFAULT, "(PBFInitialPosterHelper) Setting up default wallpaper(s)", buf, 2u);
  }

  if (![v8 isEqual:*MEMORY[0x1E4F92790]])
  {
    uint64_t v21 = *MEMORY[0x1E4F92740];
    if (![v8 isEqual:*MEMORY[0x1E4F92740]])
    {
      v15 = 0;
      id v19 = 0;
      v20 = (void *)MEMORY[0x1E4F1CC08];
      goto LABEL_53;
    }
    v22 = PBFLogPosterContents();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_DEFAULT, "(PBFInitialPosterHelper) No configuration path yet... let's see what our defaults are.", buf, 2u);
    }

    v23 = [MEMORY[0x1E4F927A8] sharedHostConfigurationManager];
    v24 = [v23 hostConfigurationForRole:v21];

    if (v24)
    {
      v25 = [v24 entries];
    }
    else
    {
      v31 = PBFLogPosterContents();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D31CE000, v31, OS_LOG_TYPE_DEFAULT, "(PBFInitialPosterHelper) No host-provided default posters for ambient role. Using hardwired defaults.", buf, 2u);
      }

      v32 = (void *)[objc_alloc(MEMORY[0x1E4F922D0]) initWithExtensionID:@"com.apple.ambient.AmbientUI.InfographPoster" descriptorID:@"InfographPoster"];
      v74 = v32;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
    }
    v49 = v24;
    id v50 = v7;
    id v52 = v8;
    v51 = objc_opt_new();
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v29 = v25;
    uint64_t v33 = [v29 countByEnumeratingWithState:&v57 objects:v73 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      v15 = 0;
      uint64_t v35 = *(void *)v58;
      obj = v29;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          v37 = v15;
          if (*(void *)v58 != v35) {
            objc_enumerationMutation(obj);
          }
          v38 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          v39 = objc_msgSend(v38, "extensionID", v49, v50);
          v40 = [v38 descriptorID];
          id v56 = 0;
          v15 = v55[2](v55, v39, v40, &v56);
          id v41 = v56;

          v42 = PBFLogPosterContents();
          BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
          if (v41)
          {
            if (v43)
            {
              v44 = [v38 extensionID];
              v45 = [v38 descriptorID];
              *(_DWORD *)buf = 138412802;
              id v68 = v44;
              __int16 v69 = 2112;
              v70 = v45;
              __int16 v71 = 2112;
              id v72 = v41;
              _os_log_impl(&dword_1D31CE000, v42, OS_LOG_TYPE_DEFAULT, "(PBFInitialPosterHelper) Failed setting up extension %@, descriptor: %@, error: %@", buf, 0x20u);
            }
          }
          else
          {
            if (v43)
            {
              v46 = [v38 extensionID];
              v47 = [v38 descriptorID];
              *(_DWORD *)buf = 138412546;
              id v68 = v46;
              __int16 v69 = 2112;
              v70 = v47;
              _os_log_impl(&dword_1D31CE000, v42, OS_LOG_TYPE_DEFAULT, "(PBFInitialPosterHelper) Generated poster for extension %@, descriptor: %@", buf, 0x16u);
            }
            v42 = [a1 incomingPosterConfigurationForRole:v52 templatePath:v15 userInfo:0];
            [v51 addObject:v42];
          }
        }
        v29 = obj;
        uint64_t v34 = [obj countByEnumeratingWithState:&v57 objects:v73 count:16];
      }
      while (v34);
    }
    else
    {
      v15 = 0;
    }

    if ([v51 count]) {
      id v19 = v51;
    }
    else {
      id v19 = 0;
    }
    id v27 = v49;
    id v7 = v50;
    id v8 = v52;

    v20 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_52;
  }
  v10 = +[PBFWallpaperKitBridge defaultBridge];
  int v11 = [v10 shouldInstallHeroPosterAsDefaultLockScreenWallpaper];

  if (!v11)
  {
    id v19 = 0;
    v20 = (void *)MEMORY[0x1E4F1CC08];
LABEL_22:
    v26 = PBFLogPosterContents();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "(PBFInitialPosterHelper) No configuration path yet... let's setup a legacy poster.", buf, 2u);
    }

    id v61 = 0;
    v15 = v55[2](v55, @"com.apple.PaperBoard.LegacyPoster", @"LegacyPoster", &v61);
    id v27 = v61;
    v28 = PBFLogPosterContents();
    v29 = v28;
    if (v27)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        +[PBFInitialPosterHelper initialPosterConfigurationsWithModelCoordinatorProvider:role:]((uint64_t)v27, v29);
      }
    }
    else
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_DEFAULT, "(PBFInitialPosterHelper) Generated legacy poster successfully.", buf, 2u);
      }

      v29 = [a1 incomingPosterConfigurationForRole:v8 templatePath:v15 userInfo:v20];
      v75 = v29;
      uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];

      id v19 = (id)v30;
    }
LABEL_52:

    goto LABEL_53;
  }
  id v63 = 0;
  v12 = defaultLockScreenWallpaperExtensionIdentifier(&v63);
  id v13 = v63;
  v14 = PBFLogPosterContents();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v68 = v12;
    _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "(PBFInitialPosterHelper) No wallpaper set before, and a valid wallpaper identifier is set: %{public}@", buf, 0xCu);
  }

  id v62 = 0;
  v15 = v55[2](v55, v12, v13, &v62);
  id v16 = v62;
  v17 = PBFLogPosterContents();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[PBFInitialPosterHelper initialPosterConfigurationsWithModelCoordinatorProvider:role:]((uint64_t)v16, v18);
    }
    id v19 = 0;
    v20 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v68 = v13;
      _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_DEFAULT, "(PBFInitialPosterHelper) Hero Poster default wallpaper was setup: %{public}@", buf, 0xCu);
    }

    v77 = @"wallpaperRepresentingIdentifier";
    v78[0] = v13;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v77 count:1];
    v18 = [a1 incomingPosterConfigurationForRole:v8 templatePath:v15 userInfo:v20];
    v76 = v18;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
  }

  if (!v15) {
    goto LABEL_22;
  }
LABEL_53:

  return v19;
}

id __87__PBFInitialPosterHelper_initialPosterConfigurationsWithModelCoordinatorProvider_role___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = objc_msgSend(*(id *)(a1 + 32), "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", a2, a4);
  v9 = v8;
  if (v8)
  {
    v10 = [v8 staticDescriptorStoreCoordinatorForIdentifier:v7];
    if ([v10 hasKnownVersions])
    {
      int v11 = [v10 pathOfLatestVersion];
    }
    else
    {
      uint64_t v12 = [v9 dynamicDescriptorStoreCoordinatorForIdentifier:v7];
      if (v12)
      {
        id v13 = (void *)v12;
        id v14 = 0;
      }
      else
      {
        uint64_t v15 = *(void *)(a1 + 40);
        id v19 = 0;
        id v13 = [v9 createDynamicDescriptorStoreCoordinatorForIdentifier:v7 role:v15 error:&v19];
        id v14 = v19;
        if (!v14)
        {
          id v18 = 0;
          id v16 = (id)[v13 addNewVersionWithContents:0 error:&v18];
          id v14 = v18;
        }
        if (a4 && v14)
        {
          id v14 = v14;
          *a4 = v14;
        }
      }
      int v11 = [v13 pathOfLatestVersion];
    }
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

+ (id)incomingPosterConfigurationForRole:(id)a3 templatePath:(id)a4 userInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F925D8] mutableConfigurationWithRole:v7];
  [v10 copyContentsOfPath:v8 error:0];
  int v11 = [MEMORY[0x1E4F92640] defaultConfiguredPropertiesForRole:v7];
  uint64_t v12 = (void *)[v11 mutableCopy];

  if ([v7 isEqual:*MEMORY[0x1E4F92790]])
  {
    id v34 = v8;
    uint64_t v13 = [MEMORY[0x1E4F926E0] defaultConfiguration];
    id v14 = objc_alloc(MEMORY[0x1E4F926E8]);
    uint64_t v15 = [MEMORY[0x1E4F926E8] defaultTitleColor];
    [MEMORY[0x1E4F926E8] defaultContentsLuminance];
    LOBYTE(v31) = 1;
    uint64_t v33 = (void *)v13;
    uint64_t v16 = objc_msgSend(v14, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v13, 0, 0, v15, 0, 0, v31, 0);

    v32 = (void *)v16;
    [v12 setTitleStyleConfiguration:v16];
    v17 = +[PBFWallpaperKitBridge defaultBridge];
    uint64_t v18 = [v17 shouldDefaultWallpaperDisableModifyingLegibilityBlur] ^ 1;

    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F92690]) initWithLegibilityBlurEnabled:0 allowsModifyingLegibilityBlur:v18];
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F92678]) initWithLegibilityBlurEnabled:0 allowsModifyingLegibilityBlur:v18];
    id v21 = objc_alloc_init(MEMORY[0x1E4F926D0]);
    id v22 = objc_alloc_init(MEMORY[0x1E4F92670]);
    id v23 = objc_alloc_init(MEMORY[0x1E4F92688]);
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F92680]) initWithSelectedAppearanceType:0 lockPosterAppearance:v19 solidColorAppearance:v21 gradientAppearance:v22 homePosterAppearance:v20 customizationConfiguration:v23];
    [v12 setHomeScreenConfiguration:v24];
    if ([v9 count]) {
      [v10 storeUserInfo:v9 error:0];
    }

    v25 = v33;
    id v8 = v34;
  }
  else
  {
    if (![v7 isEqual:*MEMORY[0x1E4F92740]]) {
      goto LABEL_8;
    }
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F92608]) initWithSupportedDataLayout:2 creationBehavior:0 editingBehavior:1 deletionBehavior:2];
    [v12 setAmbientConfiguration:v25];
  }

LABEL_8:
  id v26 = objc_alloc(MEMORY[0x1E4F925C0]);
  id v27 = [v10 _path];
  v28 = [v8 serverIdentity];
  v29 = (void *)[v26 initWithNewPath:v27 destinationPosterUUID:0 sourceIdentity:v28 configuredProperties:v12 attributes:0];

  [v29 trackTemporaryState:v10];
  return v29;
}

+ (id)hostConfigurationForRole:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F927A8] sharedHostConfigurationManager];
  id v5 = [v4 hostConfigurationForRole:v3];

  if (v5)
  {
    id v6 = v5;
    goto LABEL_14;
  }
  if ([v3 isEqual:*MEMORY[0x1E4F92740]])
  {
    id v7 = (void *)MEMORY[0x1E4F922C8];
    id v8 = [MEMORY[0x1E4F922D0] entryWithExtensionID:@"com.apple.ambient.AmbientUI.InfographPoster" descriptorID:@"InfographPoster"];
    v20[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v6 = [v7 hostConfigurationWithConfigurationEntries:v9];

    goto LABEL_14;
  }
  if (![v3 isEqual:*MEMORY[0x1E4F92790]]) {
    goto LABEL_13;
  }
  v10 = +[PBFWallpaperKitBridge defaultBridge];
  int v11 = [v10 shouldInstallHeroPosterAsDefaultLockScreenWallpaper];

  if (v11)
  {
    id v18 = 0;
    defaultLockScreenWallpaperExtensionIdentifier(&v18);
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = (__CFString *)v18;
    if (!v12) {
      goto LABEL_12;
    }
LABEL_10:
    if (v13)
    {
      id v14 = (void *)MEMORY[0x1E4F922C8];
      uint64_t v15 = [MEMORY[0x1E4F922D0] entryWithExtensionID:v12 descriptorID:v13];
      id v19 = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      id v6 = [v14 hostConfigurationWithConfigurationEntries:v16];

      goto LABEL_14;
    }
    goto LABEL_12;
  }
  uint64_t v13 = @"LegacyPoster";
  uint64_t v12 = @"com.apple.PaperBoard.LegacyPoster";
  if (@"com.apple.PaperBoard.LegacyPoster") {
    goto LABEL_10;
  }
LABEL_12:

LABEL_13:
  id v6 = 0;
LABEL_14:

  return v6;
}

+ (void)initialPosterConfigurationsWithModelCoordinatorProvider:(uint64_t)a1 role:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "(PBFInitialPosterHelper) Error setting up legacy extension: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)initialPosterConfigurationsWithModelCoordinatorProvider:(uint64_t)a1 role:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "(PBFInitialPosterHelper) Error setting up collection extension: %@", (uint8_t *)&v2, 0xCu);
}

@end