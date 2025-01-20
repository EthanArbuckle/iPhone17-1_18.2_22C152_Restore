@interface SDProfileUtilities
+ (BOOL)isProfileInstallationAllowed;
+ (BOOL)removeSeedingProfile;
+ (id)getAssetAudienceIDForInstalledProfile:(id *)a3;
+ (id)getInstalledSeedProfile;
+ (void)forceRemoveSeedingProfile;
+ (void)installProfileWithData:(id)a3 error:(id *)a4;
+ (void)removeSeedProfileIfRestricted;
@end

@implementation SDProfileUtilities

+ (void)removeSeedProfileIfRestricted
{
  if (_os_feature_enabled_impl())
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.seeding"];
    if ([v3 BOOLForKey:@"EnableProfiles"])
    {
      v4 = +[SDSeedingLogging profileHandle];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "Profiles are currently allowed, they will not be removed.", v5, 2u);
      }
    }
    else
    {
      [a1 removeSeedingProfile];
    }
  }
}

+ (void)installProfileWithData:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[SDSeedingLogging profileHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = [v5 length];
    _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_DEFAULT, "Will install profile with data.length [%lu]", buf, 0xCu);
  }

  uint64_t v20 = *MEMORY[0x1E4F74278];
  v21 = &unk_1F38EAF60;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id v19 = 0;
  v8 = [MEMORY[0x1E4F74220] profileWithData:v5 outError:&v19];
  id v9 = v19;
  if (v9)
  {
    id v10 = v9;
    if (a4) {
      *a4 = v9;
    }
    v11 = +[SDSeedingLogging profileHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[SDProfileUtilities installProfileWithData:error:](v10);
    }
LABEL_8:

    goto LABEL_21;
  }
  v12 = [v8 identifier];
  char v13 = SDIsSeedProfileIdentifier(v12);

  if (v13)
  {
    v14 = [MEMORY[0x1E4F74230] sharedConnection];
    id v18 = 0;
    id v15 = (id)[v14 installProfileData:v5 options:v7 outError:&v18];
    id v10 = v18;

    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      v11 = +[SDSeedingLogging profileHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[SDProfileUtilities installProfileWithData:error:](v10);
      }
      goto LABEL_8;
    }
    v17 = +[SDSeedingLogging profileHandle];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD702000, v17, OS_LOG_TYPE_DEFAULT, "Beta profile installation complete.", buf, 2u);
    }
  }
  else
  {
    v16 = +[SDSeedingLogging profileHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[SDProfileUtilities installProfileWithData:error:](v16);
    }

    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.seeding.profile-utils" code:1 userInfo:0];
  }
LABEL_21:
}

+ (BOOL)removeSeedingProfile
{
  v3 = +[SDSeedingLogging profileHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD702000, v3, OS_LOG_TYPE_DEFAULT, "Removing seeding profile", buf, 2u);
  }

  *(void *)buf = 0;
  v27 = buf;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v4 = [a1 getInstalledSeedProfile];
  if (v4)
  {
    id v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v6 = [MEMORY[0x1E4F74230] sharedConnection];
    v7 = [v4 identifier];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __42__SDProfileUtilities_removeSeedingProfile__block_invoke;
    v21[3] = &unk_1E6CD8068;
    uint64_t v24 = buf;
    id v8 = v4;
    id v22 = v8;
    id v9 = v5;
    uint64_t v23 = v9;
    [v6 removeProfileAsyncWithIdentifier:v7 installationType:1 completion:v21];

    dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    id v10 = [a1 getInstalledSeedProfile];

    if (v10)
    {
      v11 = +[SDSeedingLogging profileHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_1DD702000, v11, OS_LOG_TYPE_DEFAULT, "Deleted one profile, but detected another, deleting again.", v25, 2u);
      }

      v12 = dispatch_group_create();
      dispatch_group_enter(v12);
      char v13 = [MEMORY[0x1E4F74230] sharedConnection];
      v14 = [v10 identifier];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __42__SDProfileUtilities_removeSeedingProfile__block_invoke_10;
      v17[3] = &unk_1E6CD8068;
      uint64_t v20 = buf;
      id v18 = v10;
      id v9 = v12;
      id v19 = v9;
      [v13 removeProfileAsyncWithIdentifier:v14 installationType:1 completion:v17];

      dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    }
    BOOL v15 = v27[24] != 0;
  }
  else
  {
    id v10 = +[SDSeedingLogging profileHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1DD702000, v10, OS_LOG_TYPE_DEFAULT, "No seed profile exists.", v25, 2u);
    }
    BOOL v15 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v15;
}

void __42__SDProfileUtilities_removeSeedingProfile__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = +[SDSeedingLogging profileHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__SDProfileUtilities_removeSeedingProfile__block_invoke_cold_1(v3);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v4 = +[SDSeedingLogging profileHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) identifier];
      int v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "Deleted profile %@", (uint8_t *)&v6, 0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __42__SDProfileUtilities_removeSeedingProfile__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = +[SDSeedingLogging profileHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__SDProfileUtilities_removeSeedingProfile__block_invoke_10_cold_1(v3);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v4 = +[SDSeedingLogging profileHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) identifier];
      int v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "Deleted second profile %@", (uint8_t *)&v6, 0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (BOOL)isProfileInstallationAllowed
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isProfileUIInstallationAllowed];

  return v3;
}

+ (id)getAssetAudienceIDForInstalledProfile:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = [a1 getInstalledSeedProfile];
  id v5 = v4;
  if (!v4)
  {
    id v18 = +[SDSeedingLogging profileHandle];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD702000, v18, OS_LOG_TYPE_INFO, "No beta profile found", buf, 2u);
    }

LABEL_25:
    id v9 = 0;
    goto LABEL_26;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v6 = [v4 payloads];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (!v7)
  {

    goto LABEL_21;
  }
  uint64_t v8 = v7;
  v21 = a3;
  id v22 = v5;
  id v9 = 0;
  uint64_t v10 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v6);
      }
      v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        v14 = [v13 defaultsForDomain:@"com.apple.MobileAsset"];
        BOOL v15 = v14;
        if (v14)
        {
          uint64_t v16 = [v14 objectForKeyedSubscript:@"MobileAssetAssetAudience"];

          id v9 = (void *)v16;
        }
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
  }
  while (v8);

  a3 = v21;
  if (!v9)
  {
LABEL_21:
    id v19 = +[SDSeedingLogging profileHandle];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[SDProfileUtilities getAssetAudienceIDForInstalledProfile:](v19);
    }

    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.seeding.profile-utils" code:0 userInfo:0];
      id v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  v17 = +[SDSeedingLogging profileHandle];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v28 = v9;
    _os_log_impl(&dword_1DD702000, v17, OS_LOG_TYPE_INFO, "Found beta profile with Asset Audience ID [%{public}@]", buf, 0xCu);
  }

LABEL_26:
  return v9;
}

+ (void)forceRemoveSeedingProfile
{
  v2 = +[SDSeedingLogging profileHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_INFO, "Removing seeding profile", v5, 2u);
  }

  char v3 = [MEMORY[0x1E4F74230] sharedConnection];
  [v3 removeProfileWithIdentifier:@"com.apple.applebetasoftware"];

  v4 = [MEMORY[0x1E4F74230] sharedConnection];
  [v4 removeProfileWithIdentifier:@"com.apple.appleseedsoftware"];
}

+ (id)getInstalledSeedProfile
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 installedProfileWithIdentifier:@"com.apple.appleseedsoftware"];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 installedProfileWithIdentifier:@"com.apple.applebetasoftware"];
  }
  int v6 = v5;

  return v6;
}

+ (void)installProfileWithData:(void *)a1 error:.cold.1(void *a1)
{
  v1 = [a1 MCVerboseDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DD702000, v2, v3, "Installation failed. Error: [%{public}@]", v4, v5, v6, v7, v8);
}

+ (void)installProfileWithData:(os_log_t)log error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD702000, log, OS_LOG_TYPE_ERROR, "Profile is not an Apple Beta Software profile, cancelling installation.", v1, 2u);
}

+ (void)installProfileWithData:(void *)a1 error:.cold.3(void *a1)
{
  v1 = [a1 MCVerboseDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DD702000, v2, v3, "Can't parse profile. Error: [%{public}@]", v4, v5, v6, v7, v8);
}

void __42__SDProfileUtilities_removeSeedingProfile__block_invoke_cold_1(void *a1)
{
  v1 = [a1 MCVerboseDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DD702000, v2, v3, "Removal of beta profile failed. Error: [%{public}@]", v4, v5, v6, v7, v8);
}

void __42__SDProfileUtilities_removeSeedingProfile__block_invoke_10_cold_1(void *a1)
{
  v1 = [a1 MCVerboseDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DD702000, v2, v3, "Removal of second beta profile failed. Error: [%{public}@]", v4, v5, v6, v7, v8);
}

+ (void)getAssetAudienceIDForInstalledProfile:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD702000, log, OS_LOG_TYPE_ERROR, "Found beta profile but could not parse Asset Audience ID", v1, 2u);
}

@end