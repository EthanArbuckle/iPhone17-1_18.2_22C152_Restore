@interface SDBetaManager
+ (BOOL)_isEnrolledInBetaProgram;
+ (BOOL)canFileFeedbackOnThisDevice:(id *)a3;
+ (BOOL)isBuildPrefix:(id)a3 greaterThanOrEqualToBuild:(id)a4;
+ (id)_currentBetaProgram;
+ (id)sharedManager;
+ (void)_currentBetaProgram;
+ (void)canFileFeedbackOnThisDeviceWithCompletion:(id)a3;
- (BOOL)_canCurrentDeviceEnrollInBetaUpdates;
- (BOOL)_hasMigratedProfiles;
- (BOOL)_isEnrolledInBetaProgram;
- (BOOL)_isEnrollmentAllowedByDeviceManagement_legacy;
- (BOOL)_isUsingSeedingAppleID;
- (BOOL)_unenrollFromBetaProgramWithUserIdentifier:(id)a3;
- (BOOL)canCurrentDeviceEnrollInBetaUpdates;
- (BOOL)canToggleFBAVisibility;
- (BOOL)isCacheValidForPlatforms:(unint64_t)a3;
- (BOOL)isCurrentDeviceUsingSeedingAppleID;
- (BOOL)isMigratingFromProfiles;
- (NSArray)cachedPrograms;
- (NSDate)lastCached;
- (NSMutableArray)postMigrationTasks;
- (id)_assetServerURLString;
- (id)_brainServerURLString;
- (id)_deviceAppleIDUsername;
- (id)_seedingAppleIDUsername;
- (id)availableBetaProgramsForPlatforms:(unint64_t)a3;
- (id)deviceAppleIDUsernameForCurrentDevice;
- (id)enrolledBetaProgramForCurrentDevice;
- (id)enrollmentMetadataForCurrentDevice;
- (id)membershipURL;
- (id)membershipURLForPlatforms:(unint64_t)a3;
- (id)migrateURLForAssetAudience:(id)a3;
- (id)saveResponse:(id)a3 platforms:(unint64_t)a4;
- (id)seedingAppleIDUsernameForCurrentDevice;
- (id)serverURLWithPath:(id)a3 arguments:(id)a4;
- (id)verifyURLForAssetAudience:(id)a3 programID:(int64_t)a4;
- (id)verifyURLForCatalog:(id)a3;
- (unint64_t)cachedPlatform;
- (void)_changeFBAVisibilityWithUserIdentifier:(id)a3 isVisible:(BOOL)a4;
- (void)_deleteBetaProgram;
- (void)_deleteSeedingAppleAccountWithCompletion:(id)a3;
- (void)_enrollUsingSeedingConfiguration:(id)a3;
- (void)_enrollUsingSeedingConfiguration:(id)a3 userIdentifier:(id)a4;
- (void)_finallyQueryProgramsForSystemAccountsWithPlatforms:(unint64_t)a3 credentials:(id)a4 betaEnrollmentTokens:(id)a5 completion:(id)a6;
- (void)_markMigrationComplete;
- (void)_migrateFromProfilesIfNeeded;
- (void)_queryProgramsForSystemAccountsWithPlatforms:(unint64_t)a3 completion:(id)a4;
- (void)_resetAssetAudience;
- (void)_saveAppleAccountIdentifier:(id)a3;
- (void)_saveAppleAccountIdentifierWithAlternateDSID:(id)a3 completion:(id)a4;
- (void)_saveBetaProgram:(id)a3;
- (void)_setAssetAudienceString:(id)a3;
- (void)_setAssetServerURLString:(id)a3;
- (void)_setBrainServerURLString:(id)a3;
- (void)_setMemberEnrolled:(BOOL)a3;
- (void)_synchronizeCFPreferences;
- (void)canFileFeedbackOnDevice:(id)a3 completion:(id)a4;
- (void)deleteSeedingAppleAccountForCurrentDeviceWithCompletion:(id)a3;
- (void)enrollCurrentDeviceWithEnrollmentMetadata:(id)a3 completion:(id)a4;
- (void)enrollDevice:(id)a3 inBetaProgram:(id)a4 completion:(id)a5;
- (void)enrollDevice:(id)a3 withEnrollmentMetadata:(id)a4 completion:(id)a5;
- (void)enrollInProgramWithToken:(id)a3 userIdentifier:(id)a4 completion:(id)a5;
- (void)enrollInProgramWithToken:(id)a3 userIdentifier:(id)a4 shouldSaveToken:(BOOL)a5 completion:(id)a6;
- (void)enrolledBetaProgramForDevice:(id)a3 completion:(id)a4;
- (void)enrollmentMetadataForCurrentDeviceWithCompletion:(id)a3;
- (void)enrollmentMetadataForDevice:(id)a3 completion:(id)a4;
- (void)ensureThisRunsAfterMigration:(id)a3;
- (void)getAppleIDAuthenticationAccountForAlternateDSID:(id)a3 attempt:(int64_t)a4 completion:(id)a5;
- (void)getMigrationProgramForAssetAudience:(id)a3 completion:(id)a4;
- (void)invalidateCache;
- (void)invalidateCacheWithCompletion:(id)a3;
- (void)isDeviceEnrolledInBetaProgram:(id)a3 completion:(id)a4;
- (void)queryProgramsForSystemAccountsWithPlatforms:(unint64_t)a3 completion:(id)a4;
- (void)saveAppleAccountIdentifierWithAlternateDSIDForCurrentDevice:(id)a3 completion:(id)a4;
- (void)savePrograms:(id)a3 forPlatforms:(unint64_t)a4;
- (void)seedingAppleIDUsernameForCurrentDeviceWithCompletion:(id)a3;
- (void)setCachedPlatform:(unint64_t)a3;
- (void)setCachedPrograms:(id)a3;
- (void)setIsMigratingFromProfiles:(BOOL)a3;
- (void)setLastCached:(id)a3;
- (void)setPostMigrationTasks:(id)a3;
- (void)setProfilesEnabledFromHeaderInResponse:(id)a3;
- (void)unenrollDevice:(id)a3 completion:(id)a4;
- (void)verifyAssetAudience:(id)a3 programID:(int64_t)a4 accountID:(id)a5 skipEnrollmentCheck:(BOOL)a6 withCompletion:(id)a7;
- (void)verifyAssetAudience:(id)a3 programID:(int64_t)a4 accountID:(id)a5 withCompletion:(id)a6;
- (void)verifyAssetAudience:(id)a3 programID:(int64_t)a4 withCompletion:(id)a5;
- (void)verifyCatalog:(id)a3 withCompletion:(id)a4;
@end

@implementation SDBetaManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedManager__self;
  return v2;
}

uint64_t __30__SDBetaManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(SDBetaManager);
  v1 = (void *)sharedManager__self;
  sharedManager__self = (uint64_t)v0;

  v2 = (void *)sharedManager__self;
  return [v2 setIsMigratingFromProfiles:0];
}

- (id)verifyURLForCatalog:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"catalog_url";
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v7 = [(SDBetaManager *)self serverURLWithPath:@"/catalog/verify" arguments:v6];

  return v7;
}

- (id)verifyURLForAssetAudience:(id)a3 programID:(int64_t)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"asset_audience";
  v13[1] = @"id";
  v14[0] = a3;
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithInteger:a4];
  v9 = [v8 stringValue];
  v14[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  v11 = [(SDBetaManager *)self serverURLWithPath:@"/catalog/verify" arguments:v10];

  return v11;
}

- (id)migrateURLForAssetAudience:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"asset_audience";
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [(SDBetaManager *)self serverURLWithPath:@"/catalog/migrate" arguments:v6];

  return v7;
}

- (id)membershipURL
{
  return [(SDBetaManager *)self membershipURLForPlatforms:4];
}

- (id)membershipURLForPlatforms:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"platforms";
  v4 = SDStringArrayFromPlatforms(a3);
  id v5 = [v4 componentsJoinedByString:@","];
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [(SDBetaManager *)self serverURLWithPath:@"/membership/programs" arguments:v6];

  return v7;
}

- (id)serverURLWithPath:(id)a3 arguments:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SDHTTPClient sharedInstance];
  v8 = [v7 baseURL];

  v9 = [MEMORY[0x1E4F29088] componentsWithURL:v8 resolvingAgainstBaseURL:1];
  v10 = [v9 path];
  v11 = [@"/api/v4" stringByAppendingPathComponent:v10];

  if (v11)
  {
    v12 = [v11 stringByAppendingPathComponent:v5];
    [v9 setPath:v12];

    if (!v6) {
      goto LABEL_13;
    }
  }
  else
  {
    [v9 setPath:v5];
    if (!v6) {
      goto LABEL_13;
    }
  }
  v28 = v9;
  id v29 = v5;
  v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count", v11));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v14 = [v6 allKeys];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x1E4F290C8];
        v21 = [v6 objectForKeyedSubscript:v19];
        v22 = [v20 queryItemWithName:v19 value:v21];

        [v13 addObject:v22];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v16);
  }

  v23 = [MEMORY[0x1E4F1C978] arrayWithArray:v13];
  v9 = v28;
  [v28 setQueryItems:v23];

  id v5 = v29;
  v11 = v27;
LABEL_13:
  v24 = [v9 URL];
  v25 = (void *)[v24 copy];

  return v25;
}

- (void)invalidateCache
{
  v3 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DD702000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating program cache", v4, 2u);
  }

  [(SDBetaManager *)self setCachedPrograms:0];
  [(SDBetaManager *)self setCachedPlatform:0];
  [(SDBetaManager *)self setLastCached:0];
}

- (void)invalidateCacheWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[SDBetaManager invalidateCacheWithCompletion:]";
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  [(SDBetaManager *)self invalidateCache];
  id v6 = +[SDDaemonClient sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__SDBetaManager_invalidateCacheWithCompletion___block_invoke;
  v8[3] = &unk_1E6CD7F38;
  id v9 = v4;
  id v7 = v4;
  [v6 invalidateCacheWithCompletion:v8];
}

uint64_t __47__SDBetaManager_invalidateCacheWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isCacheValidForPlatforms:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = [(SDBetaManager *)self cachedPrograms];
  if (v5)
  {
    id v6 = [(SDBetaManager *)self cachedPrograms];
    BOOL v7 = [v6 count] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  unint64_t v8 = [(SDBetaManager *)self cachedPlatform];
  id v9 = [(SDBetaManager *)self lastCached];
  if (v9)
  {
    v10 = [MEMORY[0x1E4F1C9C8] now];
    v11 = [(SDBetaManager *)self lastCached];
    [v10 timeIntervalSinceDate:v11];
    BOOL v13 = v12 < 300.0;
  }
  else
  {
    BOOL v13 = 0;
  }

  v14 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = @"false";
    if (v7) {
      uint64_t v16 = @"true";
    }
    else {
      uint64_t v16 = @"false";
    }
    if (v8 == a3) {
      uint64_t v17 = @"true";
    }
    else {
      uint64_t v17 = @"false";
    }
    int v20 = 138543874;
    v21 = v16;
    __int16 v22 = 2114;
    v23 = v17;
    if (v13) {
      uint64_t v15 = @"true";
    }
    __int16 v24 = 2114;
    v25 = v15;
    _os_log_impl(&dword_1DD702000, v14, OS_LOG_TYPE_DEFAULT, "IsCacheValid: hasPrograms [%{public}@], hasMatchingPlatform [%{public}@], isWithinTimeout: [%{public}@]", (uint8_t *)&v20, 0x20u);
  }

  BOOL v18 = v8 == a3 && v7;
  return v18 && v13;
}

- (BOOL)canCurrentDeviceEnrollInBetaUpdates
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v6 = 136446210;
    BOOL v7 = "-[SDBetaManager canCurrentDeviceEnrollInBetaUpdates]";
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  v3 = +[SDDaemonClient sharedInstance];
  char v4 = [v3 canCurrentDeviceEnrollInBetaProgram];

  return v4;
}

- (BOOL)_canCurrentDeviceEnrollInBetaUpdates
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = SeedingDefaults();
  int v4 = [v3 BOOLForKey:@"AlwaysShowBetaUpdates"];

  id v5 = +[SDDevice _currentDevice];
  int v6 = -[SDBetaManager availableBetaProgramsForPlatforms:](self, "availableBetaProgramsForPlatforms:", [v5 platform]);
  uint64_t v7 = [v6 count];

  BOOL v8 = [(SDBetaManager *)self _isEnrolledInBetaProgram];
  BOOL v9 = [(SDBetaManager *)self _isEnrollmentAllowedByDeviceManagement_legacy];
  v10 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = @"NO";
    if (v4) {
      double v12 = @"YES";
    }
    else {
      double v12 = @"NO";
    }
    if (v8) {
      BOOL v13 = @"YES";
    }
    else {
      BOOL v13 = @"NO";
    }
    int v19 = 138544130;
    int v20 = v12;
    if (v7) {
      v14 = @"YES";
    }
    else {
      v14 = @"NO";
    }
    __int16 v21 = 2114;
    __int16 v22 = v13;
    __int16 v23 = 2114;
    __int16 v24 = v14;
    if (v9) {
      v11 = @"YES";
    }
    __int16 v25 = 2114;
    uint64_t v26 = v11;
    _os_log_impl(&dword_1DD702000, v10, OS_LOG_TYPE_INFO, "Can Enroll? Override: %{public}@ || Enrolled: %{public}@ || HasPrograms: %{public}@ && isMDMAllowed: %{public}@", (uint8_t *)&v19, 0x2Au);
  }

  if (v7) {
    BOOL v15 = v9;
  }
  else {
    BOOL v15 = 0;
  }
  BOOL v16 = v8 || v15;
  BOOL v17 = (v4 & 1) != 0 || v16;

  return v17;
}

- (BOOL)_isEnrollmentAllowedByDeviceManagement_legacy
{
  v2 = SeedingDefaults();
  char v3 = [v2 BOOLForKey:@"RestrictEnrollment"];

  if (v3) {
    return 0;
  }
  return +[SDProfileUtilities isProfileInstallationAllowed];
}

- (void)queryProgramsForSystemAccountsWithPlatforms:(unint64_t)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v6 = (void (**)(id, void *, void))a4;
  uint64_t v7 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    BOOL v15 = "-[SDBetaManager queryProgramsForSystemAccountsWithPlatforms:completion:]";
    _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  if ([(SDBetaManager *)self isCacheValidForPlatforms:a3])
  {
    BOOL v8 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD702000, v8, OS_LOG_TYPE_DEFAULT, "Returning cached programs.", buf, 2u);
    }

    BOOL v9 = [(SDBetaManager *)self cachedPrograms];
    v6[2](v6, v9, 0);
  }
  else
  {
    v10 = +[SDDaemonClient sharedInstance];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__SDBetaManager_queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke;
    v11[3] = &unk_1E6CD8548;
    v11[4] = self;
    unint64_t v13 = a3;
    double v12 = v6;
    [v10 queryProgramsForSystemAccountsWithPlatforms:a3 completion:v11];
  }
}

void __72__SDBetaManager_queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 description];
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "programs returned: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(a1 + 32) savePrograms:v3 forPlatforms:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_queryProgramsForSystemAccountsWithPlatforms:(unint64_t)a3 completion:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v39 = (void (**)(id, void, uint64_t))a4;
  int v4 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "-[SDBetaManager _queryProgramsForSystemAccountsWithPlatforms:completion:]";
    _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&buf, 0xCu);
  }

  BOOL v5 = [(SDBetaManager *)self isCacheValidForPlatforms:a3];
  int v6 = +[SDSeedingLogging betaHandle];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a3;
      _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_DEFAULT, "Fetching new program list from server for platform [%ld] (resetting cache).", (uint8_t *)&buf, 0xCu);
    }

    [(SDBetaManager *)self setCachedPlatform:0];
    [(SDBetaManager *)self setLastCached:0];
    context = (void *)MEMORY[0x1E01BDAC0]([(SDBetaManager *)self setCachedPrograms:MEMORY[0x1E4F1CBF0]]);
    group = dispatch_group_create();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__1;
    v65 = __Block_byref_object_dispose__1;
    id v66 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
    BOOL v9 = +[SDPersistence loadMDMConfigurationWithError:0];
    v37 = v9;
    if (v9)
    {
      int v36 = [v9 restrictUserPrograms];
    }
    else
    {
      v10 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v60 = 0;
        _os_log_impl(&dword_1DD702000, v10, OS_LOG_TYPE_INFO, "No MDM configuration found", v60, 2u);
      }

      int v36 = 0;
    }
    v11 = [v37 tokens];
    uint64_t v35 = v11;
    if (v11) {
      BOOL v34 = [v11 count] != 0;
    }
    else {
      BOOL v34 = 0;
    }
    if (v36)
    {
      double v12 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[SDBetaManager _queryProgramsForSystemAccountsWithPlatforms:completion:]();
      }

      unint64_t v13 = group;
      dispatch_group_enter(group);
      dispatch_group_leave(group);
    }
    else
    {
      v14 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[SDBetaManager _queryProgramsForSystemAccountsWithPlatforms:completion:]();
      }

      BOOL v15 = [MEMORY[0x1E4F179C8] defaultStore];
      long long v32 = objc_msgSend(v15, "aida_accountForPrimaryiCloudAccount");
      v42 = v15;
      uint64_t v16 = SeedingDefaults();
      uint64_t v29 = [v16 stringForKey:@"AppleAccountIdentifier"];

      if (v29)
      {
        long long v31 = objc_msgSend(v42, "accountWithIdentifier:");
      }
      else
      {
        long long v31 = 0;
      }
      BOOL v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 2, v29);
      if (v32)
      {
        BOOL v18 = +[SDSeedingLogging betaHandle];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v60 = 0;
          _os_log_impl(&dword_1DD702000, v18, OS_LOG_TYPE_DEFAULT, "Will use iCloud account", v60, 2u);
        }

        [v17 addObject:v32];
      }
      if (v31)
      {
        int v19 = +[SDSeedingLogging betaHandle];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v60 = 0;
          _os_log_impl(&dword_1DD702000, v19, OS_LOG_TYPE_DEFAULT, "Will use Seeding account", v60, 2u);
        }

        [v17 addObject:v31];
      }
      int v20 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v17 count];
        *(_DWORD *)v60 = 134217984;
        uint64_t v61 = v21;
        _os_log_impl(&dword_1DD702000, v20, OS_LOG_TYPE_DEFAULT, "Fetched accounts [%lu]", v60, 0xCu);
      }

      if (![v17 count] && !v34)
      {
        __int16 v22 = +[SDSeedingLogging betaHandle];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[SDBetaManager _queryProgramsForSystemAccountsWithPlatforms:completion:]();
        }

        v39[2](v39, 0, 1);
        __int16 v23 = v42;
        goto LABEL_50;
      }
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id obj = v17;
      uint64_t v24 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v56 != v25) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            v28 = (void *)MEMORY[0x1E01BDAC0]();
            dispatch_group_enter(group);
            v51[0] = MEMORY[0x1E4F143A8];
            v51[1] = 3221225472;
            v51[2] = __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke;
            v51[3] = &unk_1E6CD8570;
            v51[4] = v27;
            v52 = group;
            id v53 = v42;
            p_long long buf = &buf;
            [v27 fetchCredentialTokenWithCompletion:v51];
          }
          uint64_t v24 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
        }
        while (v24);
      }

      unint64_t v13 = group;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke_343;
    block[3] = &unk_1E6CD8598;
    v47 = &buf;
    char v49 = v36;
    BOOL v50 = v34;
    v46 = v39;
    block[4] = self;
    unint64_t v48 = a3;
    id v45 = v35;
    dispatch_group_notify(v13, MEMORY[0x1E4F14428], block);

    __int16 v23 = v46;
LABEL_50:

    _Block_object_dispose(&buf, 8);
    goto LABEL_51;
  }
  if (v7)
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_DEFAULT, "Query for platforms [%ld] was cached, reusing answer.", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v8 = [(SDBetaManager *)self cachedPrograms];
  ((void (**)(id, void *, uint64_t))v39)[2](v39, v8, 0);

LABEL_51:
}

void __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = [*(id *)(a1 + 48) credentialForAccount:*(void *)(a1 + 32) serviceID:@"com.apple.gs.beta.auth"];
    BOOL v5 = objc_msgSend(*(id *)(a1 + 32), "aida_alternateDSID");
    int v6 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v21 = (uint64_t)v5;
      _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_INFO, "altDSID:     %@", buf, 0xCu);
    }

    BOOL v7 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [*(id *)(a1 + 32) username];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v21 = (uint64_t)v8;
      _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_INFO, "username:    %@", buf, 0xCu);
    }
    BOOL v9 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = [v4 keysForCredentialItems];
      uint64_t v11 = [v10 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v21 = v11;
      _os_log_impl(&dword_1DD702000, v9, OS_LOG_TYPE_INFO, "credentials: %ld", buf, 0xCu);
    }
    double v12 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      unint64_t v13 = [v4 token];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v21 = (uint64_t)v13;
      _os_log_impl(&dword_1DD702000, v12, OS_LOG_TYPE_INFO, "cred token:  %@", buf, 0xCu);
    }
    if (v5)
    {
      v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v18[0] = @"credential_token";
      v18[1] = @"adsid_token";
      v19[0] = v3;
      v19[1] = v5;
      BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
      [v14 addObject:v15];
    }
    else
    {
      BOOL v15 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke_cold_1((id *)(a1 + 32), v15);
      }
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    uint64_t v16 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v21 = v17;
      _os_log_impl(&dword_1DD702000, v16, OS_LOG_TYPE_DEFAULT, "No credential token for account %@", buf, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

uint64_t __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke_343(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count]) {
    return [*(id *)(a1 + 32) _finallyQueryProgramsForSystemAccountsWithPlatforms:*(void *)(a1 + 64) credentials:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) betaEnrollmentTokens:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  if (*(unsigned char *)(a1 + 72))
  {
    v2 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_DEFAULT, "Not using AppleID accounts to query for programs.", buf, 2u);
    }

    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    int v4 = *(NSObject **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
LABEL_6:

    return [*(id *)(a1 + 32) _finallyQueryProgramsForSystemAccountsWithPlatforms:*(void *)(a1 + 64) credentials:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) betaEnrollmentTokens:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  int v6 = *(unsigned __int8 *)(a1 + 73);
  BOOL v7 = +[SDSeedingLogging betaHandle];
  int v4 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "Proceeding without account info.", v8, 2u);
    }
    goto LABEL_6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke_343_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_finallyQueryProgramsForSystemAccountsWithPlatforms:(unint64_t)a3 credentials:(id)a4 betaEnrollmentTokens:(id)a5 completion:(id)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v48 = a4;
  id v50 = a5;
  id v42 = a6;
  uint64_t v8 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446210;
    v64 = "-[SDBetaManager _finallyQueryProgramsForSystemAccountsWithPlatforms:credentials:betaEnrollmentTokens:completion:]";
    _os_log_impl(&dword_1DD702000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}s", buf, 0xCu);
  }

  BOOL v9 = [v50 count] == 0;
  v10 = +[SDSeedingLogging betaHandle];
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1DD702000, v10, OS_LOG_TYPE_DEFAULT, "Querying programs", buf, 2u);
    }
  }
  else
  {
    if (v11)
    {
      uint64_t v12 = [v50 count];
      *(_DWORD *)long long buf = 134217984;
      v64 = (const char *)v12;
      _os_log_impl(&dword_1DD702000, v10, OS_LOG_TYPE_DEFAULT, "Querying programs with [%ld] Beta Enrollment Tokens", buf, 0xCu);
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v10 = v50;
    uint64_t v13 = [v10 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v59 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(const char **)(*((void *)&v58 + 1) + 8 * i);
          uint64_t v17 = +[SDSeedingLogging betaHandle];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            v64 = v16;
            _os_log_impl(&dword_1DD702000, v17, OS_LOG_TYPE_DEFAULT, "Will use BET: [%{public}@]", buf, 0xCu);
          }
        }
        uint64_t v13 = [v10 countByEnumeratingWithState:&v58 objects:v62 count:16];
      }
      while (v13);
    }
  }

  v51 = [MEMORY[0x1E4F4F010] currentDevice];
  v46 = [v51 uniqueDeviceIdentifier];
  v44 = [v51 serverFriendlyDescription];
  BOOL v18 = (void *)MEMORY[0x1E4F28E88];
  int v19 = [(SDBetaManager *)self membershipURLForPlatforms:a3];
  int v20 = [v18 requestWithURL:v19];

  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F4EF78]) initWithIdentifier:@"com.apple.gs.beta.auth"];
  id v45 = [v21 appleIDHeadersForRequest:v20];
  uint64_t v22 = (void *)MEMORY[0x1E4F1CA60];
  __int16 v23 = [v20 allHTTPHeaderFields];
  uint64_t v24 = [v22 dictionaryWithDictionary:v23];

  [v24 addEntriesFromDictionary:v45];
  [v24 setValue:@"application/json" forKey:@"Content-Type"];
  [v24 setValue:@"application/json" forKey:@"Accept"];
  [v24 setValue:v46 forKey:@"X-Mme-Device-Id"];
  [v24 setValue:@"AAAABQAAABAxmM8oXLJsHORxxxxxxxxxAAAAAw==" forKey:@"X-Apple-I-MD"];
  [v24 setValue:v44 forKey:@"X-MMe-Client-Info"];
  [v20 setAllHTTPHeaderFields:v24];
  uint64_t v25 = +[SDHTTPClient sharedInstance];
  v43 = [v25 urlSession];

  uint64_t v26 = [v43 configuration];
  objc_msgSend(v26, "set_appleIDContext:", v21);
  uint64_t v27 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    v64 = (const char *)v24;
    _os_log_impl(&dword_1DD702000, v27, OS_LOG_TYPE_INFO, "headers: %@", buf, 0xCu);
  }

  v28 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = [v26 HTTPAdditionalHeaders];
    *(_DWORD *)long long buf = 138543362;
    v64 = v29;
    _os_log_impl(&dword_1DD702000, v28, OS_LOG_TYPE_INFO, "Additional Headers: %{public}@", buf, 0xCu);
  }
  long long v30 = (void *)MEMORY[0x1E4F290E0];
  long long v31 = +[SDHTTPClient sharedInstance];
  long long v32 = [v30 sessionWithConfiguration:v26 delegate:v31 delegateQueue:0];

  long long v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  if (v50)
  {
    BOOL v34 = [v50 allObjects];
    [v33 setObject:v34 forKeyedSubscript:@"beta_enrollment_tokens"];
  }
  if (v48) {
    [v33 setObject:v48 forKeyedSubscript:@"tokens"];
  }
  uint64_t v35 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    -[SDBetaManager _finallyQueryProgramsForSystemAccountsWithPlatforms:credentials:betaEnrollmentTokens:completion:](v20, v35);
  }

  int v36 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
    -[SDBetaManager _finallyQueryProgramsForSystemAccountsWithPlatforms:credentials:betaEnrollmentTokens:completion:]();
  }

  v37 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v33 options:1 error:0];
  [v20 setHTTPBody:v37];
  [v20 setHTTPMethod:@"POST"];
  objc_initWeak((id *)buf, self);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke;
  v52[3] = &unk_1E6CD85C0;
  id v38 = v21;
  id v53 = v38;
  id v39 = v20;
  id v54 = v39;
  id v40 = v42;
  long long v55 = self;
  id v56 = v40;
  objc_copyWeak(v57, (id *)buf);
  v57[1] = (id)a3;
  v41 = [v32 dataTaskWithRequest:v39 completionHandler:v52];
  [v41 resume];

  objc_destroyWeak(v57);
  objc_destroyWeak((id *)buf);
}

void __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  char v58 = 1;
  id v10 = v8;
  BOOL v11 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 allHeaderFields];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"X-Request-Id"];
    *(_DWORD *)long long buf = 138543362;
    long long v61 = v13;
    _os_log_impl(&dword_1DD702000, v11, OS_LOG_TYPE_DEFAULT, "/programs X-Request-Id: %{public}@", buf, 0xCu);
  }
  [*(id *)(a1 + 32) handleResponse:v10 forRequest:*(void *)(a1 + 40) shouldRetry:&v58];
  if (v9)
  {
    uint64_t v14 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke_cold_3();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    [*(id *)(a1 + 48) setProfilesEnabledFromHeaderInResponse:v10];
    id v57 = 0;
    BOOL v15 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v57];
    id v16 = v57;
    if (v15)
    {
      uint64_t v17 = [v15 objectForKey:@"programs"];
      if (v17)
      {
        id v43 = v16;
        v44 = v15;
        id v46 = v10;
        id v47 = v7;
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        uint64_t v45 = a1;
        int v19 = [WeakRetained saveResponse:v17 platforms:*(void *)(a1 + 72)];

        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id obj = v19;
        uint64_t v20 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v54 != v22) {
                objc_enumerationMutation(obj);
              }
              uint64_t v24 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              uint64_t v25 = +[SDSeedingLogging betaHandle];
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v26 = [v24 title];
                uint64_t v27 = [v24 programID];
                v28 = [v24 assetAudience];
                *(_DWORD *)long long buf = 138543874;
                long long v61 = v26;
                __int16 v62 = 2048;
                uint64_t v63 = v27;
                __int16 v64 = 2114;
                uint64_t v65 = v28;
                _os_log_impl(&dword_1DD702000, v25, OS_LOG_TYPE_DEFAULT, "Loaded program [%{public}@ - %lu] assetAudience: [%{public}@]", buf, 0x20u);
              }
            }
            uint64_t v21 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
          }
          while (v21);
        }

        uint64_t v29 = [(id)objc_opt_class() _currentBetaProgram];
        if (v29)
        {
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v30 = obj;
          uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v59 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v50;
            while (2)
            {
              for (uint64_t j = 0; j != v32; ++j)
              {
                if (*(void *)v50 != v33) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v35 = *(void **)(*((void *)&v49 + 1) + 8 * j);
                uint64_t v36 = [v35 programID];
                if (v36 == [v29 programID])
                {
                  id v39 = +[SDSeedingLogging betaHandle];
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                  {
                    id v40 = [v29 description];
                    v41 = [v35 description];
                    *(_DWORD *)long long buf = 138543618;
                    long long v61 = v40;
                    __int16 v62 = 2114;
                    uint64_t v63 = (uint64_t)v41;
                    _os_log_impl(&dword_1DD702000, v39, OS_LOG_TYPE_DEFAULT, "Replacing current program %{public}@ with new program %{public}@", buf, 0x16u);
                  }
                  [*(id *)(v45 + 48) _saveBetaProgram:v35];
                  goto LABEL_37;
                }
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v49 objects:v59 count:16];
              if (v32) {
                continue;
              }
              break;
            }
          }
LABEL_37:
        }
        id v42 = +[SDSeedingLogging betaHandle];
        id v9 = 0;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138477827;
          long long v61 = v17;
          _os_log_impl(&dword_1DD702000, v42, OS_LOG_TYPE_DEFAULT, "JSON response: %{private}@", buf, 0xCu);
        }

        (*(void (**)(void))(*(void *)(v45 + 56) + 16))();
        id v7 = v47;
        id v10 = v46;
        id v16 = v43;
        BOOL v15 = v44;
      }
      else
      {
        id v38 = +[SDSeedingLogging betaHandle];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke_cold_2();
        }

        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
    else
    {
      v37 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke_cold_1();
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

- (void)savePrograms:(id)a3 forPlatforms:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    unint64_t v10 = a4;
    _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, "Saving programs to cache for platforms [%ld].", (uint8_t *)&v9, 0xCu);
  }

  id v8 = [MEMORY[0x1E4F1C9C8] now];
  [(SDBetaManager *)self setLastCached:v8];

  [(SDBetaManager *)self setCachedPlatform:a4];
  [(SDBetaManager *)self setCachedPrograms:v6];
}

- (id)saveResponse:(id)a3 platforms:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = +[SDDevice osBuild];
    id v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    uint64_t v29 = v7;
    unint64_t v27 = a4;
    if (SDIsInternalInstall())
    {
      id v8 = SeedingDefaults();
      int v9 = [v8 BOOLForKey:@"DisableBuildFiltering"];

      if (v9)
      {
        unint64_t v10 = +[SDSeedingLogging betaHandle];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1DD702000, v10, OS_LOG_TYPE_DEFAULT, "Skipping build prefix filtering", buf, 2u);
        }

        char v11 = 1;
      }
      else
      {
        char v11 = 0;
      }
      id v7 = v29;
    }
    else
    {
      char v11 = 0;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v28 = v6;
    id obj = v6;
    uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      unint64_t v16 = 0x1E6CD7000uLL;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(obj);
          }
          BOOL v18 = objc_msgSend(*(id *)(v16 + 3064), "betaProgramWithJSON:", *(void *)(*((void *)&v32 + 1) + 8 * i), v27);
          if (v18)
          {
            if ((v11 & 1) != 0
              || (int v19 = objc_opt_class(),
                  [v18 buildPrefix],
                  unint64_t v20 = v16,
                  uint64_t v21 = objc_claimAutoreleasedReturnValue(),
                  LODWORD(v19) = [v19 isBuildPrefix:v21 greaterThanOrEqualToBuild:v7],
                  v21,
                  unint64_t v16 = v20,
                  v19))
            {
              [v30 addObject:v18];
            }
            else
            {
              uint64_t v22 = +[SDSeedingLogging betaHandle];
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v23 = [v18 description];
                [v18 buildPrefix];
                v25 = uint64_t v24 = self;
                *(_DWORD *)long long buf = 138543618;
                v37 = v23;
                __int16 v38 = 2114;
                id v39 = v25;
                _os_log_impl(&dword_1DD702000, v22, OS_LOG_TYPE_DEFAULT, "Skipping beta program %{public}@ because build prefix %{public}@ doesn't match device build.", buf, 0x16u);

                self = v24;
                id v7 = v29;

                unint64_t v16 = v20;
              }
            }
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v14);
    }

    [(SDBetaManager *)self savePrograms:v30 forPlatforms:v27];
    uint64_t v12 = [(SDBetaManager *)self cachedPrograms];

    id v6 = v28;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

+ (BOOL)isBuildPrefix:(id)a3 greaterThanOrEqualToBuild:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  BOOL v8 = 1;
  if (v5 && v6)
  {
    unint64_t v9 = [v5 length];
    if (v9 > [v7 length])
    {
      unint64_t v10 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[SDBetaManager isBuildPrefix:greaterThanOrEqualToBuild:]();
      }
      BOOL v8 = 1;
LABEL_26:

      goto LABEL_27;
    }
    if (([v7 hasPrefix:v5] & 1) == 0)
    {
      id v34 = 0;
      char v11 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(\\d+)([A-Za-z])?" options:1 error:&v34];
      unint64_t v10 = v34;
      if (v10)
      {
        uint64_t v12 = +[SDSeedingLogging betaHandle];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          +[SDBetaManager isBuildPrefix:greaterThanOrEqualToBuild:](v10, v12);
        }
        BOOL v8 = 1;
      }
      else
      {
        uint64_t v13 = objc_msgSend(v11, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
        uint64_t v12 = [v13 firstObject];

        uint64_t v14 = objc_msgSend(v11, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
        uint64_t v15 = [v14 firstObject];

        if (v12
          && v15
          && [v12 numberOfRanges] == 3
          && [v15 numberOfRanges] == 3)
        {
          BOOL v8 = 1;
          uint64_t v16 = [v12 rangeAtIndex:1];
          BOOL v18 = objc_msgSend(v7, "substringWithRange:", v16, v17);
          uint64_t v19 = [v18 integerValue];

          uint64_t v20 = [v15 rangeAtIndex:1];
          uint64_t v22 = objc_msgSend(v5, "substringWithRange:", v20, v21);
          uint64_t v23 = [v22 integerValue];

          if (v23 <= v19)
          {
            if ([v15 rangeAtIndex:2] == 0x7FFFFFFFFFFFFFFFLL
              || [v12 rangeAtIndex:2] == 0x7FFFFFFFFFFFFFFFLL)
            {
              BOOL v8 = v23 == v19;
            }
            else if (v23 == v19)
            {
              uint64_t v26 = [v12 rangeAtIndex:2];
              id v28 = objc_msgSend(v7, "substringWithRange:", v26, v27);
              uint64_t v29 = [v28 uppercaseString];

              uint64_t v30 = [v15 rangeAtIndex:2];
              long long v32 = objc_msgSend(v7, "substringWithRange:", v30, v31);
              long long v33 = [v32 uppercaseString];

              BOOL v8 = [v33 compare:v29] != 1;
            }
            else
            {
              BOOL v8 = 0;
            }
          }
        }
        else
        {
          uint64_t v24 = +[SDSeedingLogging betaHandle];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            +[SDBetaManager isBuildPrefix:greaterThanOrEqualToBuild:]();
          }

          BOOL v8 = 1;
        }
      }
      goto LABEL_26;
    }
    BOOL v8 = 1;
  }
LABEL_27:

  return v8;
}

- (id)availableBetaProgramsForPlatforms:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136446210;
    uint64_t v20 = "-[SDBetaManager availableBetaProgramsForPlatforms:]";
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  id v6 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(SDBetaManager *)self cachedPrograms];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v12 platform] & a3) != 0) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)enrollDevice:(id)a3 inBetaProgram:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *))a5;
  uint64_t v10 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446210;
    uint64_t v24 = "-[SDBetaManager enrollDevice:inBetaProgram:completion:]";
    _os_log_impl(&dword_1DD702000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  if ([v7 isErrorDevice])
  {
    char v11 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SDBetaManager enrollDevice:inBetaProgram:completion:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.seeding.beta-manager" code:14 userInfo:0];
    v9[2](v9, v19);
  }
  else
  {
    uint64_t v20 = +[SDDaemonClient sharedInstance];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __55__SDBetaManager_enrollDevice_inBetaProgram_completion___block_invoke;
    v21[3] = &unk_1E6CD7F38;
    uint64_t v22 = v9;
    [v20 enrollDevice:v7 inProgram:v8 completion:v21];

    uint64_t v19 = v22;
  }
}

uint64_t __55__SDBetaManager_enrollDevice_inBetaProgram_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enrollDevice:(id)a3 withEnrollmentMetadata:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *))a5;
  id v10 = a4;
  char v11 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DD702000, v11, OS_LOG_TYPE_DEFAULT, "Enrolling device with metadata", buf, 2u);
  }

  uint64_t v12 = [v10 objectForKeyedSubscript:@"AssetAudience"];
  uint64_t v13 = [v10 objectForKeyedSubscript:@"ProgramID"];

  if ([v8 isErrorDevice])
  {
    uint64_t v14 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SDBetaManager enrollDevice:withEnrollmentMetadata:completion:](v14, v15, v16, v17, v18, v19, v20, v21);
    }

    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = 14;
    goto LABEL_13;
  }
  if (!v12)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = 4;
LABEL_13:
    uint64_t v27 = [v22 errorWithDomain:@"com.apple.seeding.beta-manager" code:v23 userInfo:0];
    v9[2](v9, v27);

    goto LABEL_18;
  }
  if (v13)
  {
    uint64_t v24 = [v13 integerValue];
    uint64_t v25 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v36 = v13;
      _os_log_impl(&dword_1DD702000, v25, OS_LOG_TYPE_DEFAULT, "Metadata has catalog ID %{public}@, will verify", buf, 0xCu);
    }

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __64__SDBetaManager_enrollDevice_withEnrollmentMetadata_completion___block_invoke_393;
    v29[3] = &unk_1E6CD82C0;
    v29[4] = self;
    uint64_t v30 = (void (**)(id, void *))v8;
    uint64_t v31 = v9;
    [(SDBetaManager *)self verifyAssetAudience:v12 programID:v24 accountID:0 skipEnrollmentCheck:1 withCompletion:v29];

    uint64_t v26 = v30;
  }
  else
  {
    id v28 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1DD702000, v28, OS_LOG_TYPE_DEFAULT, "Metadata has no catalog ID, will migrate", buf, 2u);
    }

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __64__SDBetaManager_enrollDevice_withEnrollmentMetadata_completion___block_invoke;
    v32[3] = &unk_1E6CD85E8;
    id v34 = v9;
    v32[4] = self;
    id v33 = v8;
    [(SDBetaManager *)self getMigrationProgramForAssetAudience:v12 completion:v32];

    uint64_t v26 = v34;
  }

LABEL_18:
}

void __64__SDBetaManager_enrollDevice_withEnrollmentMetadata_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_DEFAULT, "Metadata enroll via migration returned %{public}@", (uint8_t *)&v9, 0xCu);
  }

  if (a3)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.seeding.beta-manager" code:7 userInfo:0];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    [*(id *)(a1 + 32) enrollDevice:*(void *)(a1 + 40) inBetaProgram:v5 completion:*(void *)(a1 + 48)];
  }
}

void __64__SDBetaManager_enrollDevice_withEnrollmentMetadata_completion___block_invoke_393(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_DEFAULT, "Metadata enroll via verify returned %{public}@", (uint8_t *)&v9, 0xCu);
  }

  if (v5 && a2)
  {
    [*(id *)(a1 + 32) enrollDevice:*(void *)(a1 + 40) inBetaProgram:v5 completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.seeding.beta-manager" code:7 userInfo:0];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

- (void)enrollCurrentDeviceWithEnrollmentMetadata:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446210;
    uint64_t v15 = "-[SDBetaManager enrollCurrentDeviceWithEnrollmentMetadata:completion:]";
    _os_log_impl(&dword_1DD702000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__SDBetaManager_enrollCurrentDeviceWithEnrollmentMetadata_completion___block_invoke;
  v11[3] = &unk_1E6CD8610;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  +[SDDevice getCurrentDevice:v11];
}

void __70__SDBetaManager_enrollCurrentDeviceWithEnrollmentMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isErrorDevice])
  {
    int v4 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__SDBetaManager_enrollCurrentDeviceWithEnrollmentMetadata_completion___block_invoke_cold_1();
    }

    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.seeding.beta-manager" code:14 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) enrollDevice:v3 withEnrollmentMetadata:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

- (void)enrollmentMetadataForDevice:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136446210;
    uint64_t v24 = "-[SDBetaManager enrollmentMetadataForDevice:completion:]";
    _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v23, 0xCu);
  }

  if ([v5 isErrorDevice])
  {
    id v8 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SDBetaManager enrollmentMetadataForDevice:completion:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  uint64_t v16 = [v5 currentConfiguration];
  uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  uint64_t v18 = [v16 assetAudience];
  [v17 setObject:v18 forKeyedSubscript:@"AssetAudience"];

  uint64_t v19 = [v16 seedProgramID];
  uint64_t v20 = [v19 stringValue];
  [v17 setObject:v20 forKeyedSubscript:@"ProgramID"];

  uint64_t v21 = +[SDSeedProgramManager stringForSeedProgram:](SDSeedProgramManager, "stringForSeedProgram:", [v16 seedProgram]);
  [v17 setObject:v21 forKeyedSubscript:@"SeedProgram"];

  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v17];
  v6[2](v6, v22);
}

- (id)enrollmentMetadataForCurrentDevice
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v8 = 136446210;
    uint64_t v9 = "-[SDBetaManager enrollmentMetadataForCurrentDevice]";
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  id v3 = +[SDDaemonClient sharedInstance];
  int v4 = [v3 getCurrentDeviceSynchronously];

  id v5 = [v4 currentConfiguration];
  id v6 = [v5 enrollmentMetadata];

  return v6;
}

- (void)enrollmentMetadataForCurrentDeviceWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136446210;
    uint64_t v10 = "-[SDBetaManager enrollmentMetadataForCurrentDeviceWithCompletion:]";
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__SDBetaManager_enrollmentMetadataForCurrentDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E6CD8638;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[SDDevice getCurrentDevice:v7];
}

uint64_t __66__SDBetaManager_enrollmentMetadataForCurrentDeviceWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) enrollmentMetadataForDevice:a2 completion:*(void *)(a1 + 40)];
}

- (void)_enrollUsingSeedingConfiguration:(id)a3
{
}

- (void)_enrollUsingSeedingConfiguration:(id)a3 userIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1DD702000, v8, OS_LOG_TYPE_DEFAULT, "Enrolling [%{public}@]", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v9 = [v6 assetAudience];
  [(SDBetaManager *)self _setAssetAudienceString:v9];

  uint64_t v10 = [v6 catalog];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    uint64_t v12 = [v6 catalog];
    char v13 = [v12 isEqualToString:&stru_1F38E69D8];

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = [v6 catalog];
      [(SDBetaManager *)self _setAssetServerURLString:v14];
    }
  }
  +[SDSeedProgramManager _setSeedProgramPref:](SDSeedProgramManager, "_setSeedProgramPref:", [v6 seedProgram]);
  [(SDBetaManager *)self _setMemberEnrolled:1];
  if ([v6 seedProgram] != 4) {
    [(SDBetaManager *)self _changeFBAVisibilityWithUserIdentifier:v7 isVisible:1];
  }
  [(SDBetaManager *)self _synchronizeCFPreferences];
}

- (void)_saveBetaProgram:(id)a3
{
  id v3 = a3;
  id v8 = 0;
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v8];
  id v5 = v8;
  id v6 = +[SDSeedingLogging betaHandle];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(SDBetaManager *)v3 _saveBetaProgram:v7];
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SDBetaManager _saveBetaProgram:]();
    }

    CFPreferencesSetValue(@"BetaProgramObject", v4, @"com.apple.seeding", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  }
}

- (void)_deleteBetaProgram
{
}

+ (id)_currentBetaProgram
{
  v2 = (void *)CFPreferencesCopyValue(@"BetaProgramObject", @"com.apple.seeding", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v2)
  {
    id v8 = 0;
    id v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v8];
    id v4 = v8;
    if (v4)
    {
      id v5 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[SDBetaManager _currentBetaProgram];
      }

      id v6 = 0;
    }
    else
    {
      id v6 = v3;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)enrolledBetaProgramForDevice:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 identifier];
    *(_DWORD *)long long buf = 138543362;
    uint64_t v21 = v8;
    _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, "Getting current program for device %{public}@", buf, 0xCu);
  }
  if ([v5 isErrorDevice])
  {
    uint64_t v9 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SDBetaManager enrolledBetaProgramForDevice:completion:](v9, v10, v11, v12, v13, v14, v15, v16);
    }

    v6[2](v6, 0);
  }
  else
  {
    uint64_t v17 = +[SDDaemonClient sharedInstance];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __57__SDBetaManager_enrolledBetaProgramForDevice_completion___block_invoke;
    v18[3] = &unk_1E6CD8660;
    uint64_t v19 = v6;
    [v17 enrolledBetaProgramForDevice:v5 completion:v18];
  }
}

uint64_t __57__SDBetaManager_enrolledBetaProgramForDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)enrolledBetaProgramForCurrentDevice
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v6 = 136446210;
    id v7 = "-[SDBetaManager enrolledBetaProgramForCurrentDevice]";
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  id v3 = +[SDDaemonClient sharedInstance];
  id v4 = [v3 getCurrentDeviceEnrolledBetaProgramSynchronously];

  return v4;
}

- (void)verifyCatalog:(id)a3 withCompletion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_1DD702000, v8, OS_LOG_TYPE_DEFAULT, "Verifying %@", buf, 0xCu);
  }

  uint64_t v9 = (void *)MEMORY[0x1E4F28E88];
  uint64_t v10 = [(SDBetaManager *)self verifyURLForCatalog:v6];
  uint64_t v11 = [v9 requestWithURL:v10 cachePolicy:1 timeoutInterval:15.0];

  uint64_t v12 = +[SDHTTPClient sharedInstance];
  uint64_t v13 = [v12 urlSession];

  [v11 setHTTPMethod:@"GET"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke;
  v16[3] = &unk_1E6CD8688;
  id v17 = v7;
  id v14 = v7;
  uint64_t v15 = [v13 dataTaskWithRequest:v11 completionHandler:v16];
  [v15 resume];
}

void __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_3();
    }

    goto LABEL_5;
  }
  if ([v8 statusCode] != 200)
  {
    if ([v8 statusCode] == 204)
    {
      uint64_t v15 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_2();
      }

      uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      goto LABEL_6;
    }
LABEL_5:
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_6:
    v11();
    goto LABEL_7;
  }
  uint64_t v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:0];
  uint64_t v13 = [v12 objectForKey:@"catalog"];

  if (v13)
  {
    id v14 = +[SDBetaProgram betaProgramWithJSON:v12];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v16 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

LABEL_7:
}

- (void)verifyAssetAudience:(id)a3 programID:(int64_t)a4 withCompletion:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 136446210;
    uint64_t v12 = "-[SDBetaManager verifyAssetAudience:programID:withCompletion:]";
    _os_log_impl(&dword_1DD702000, v10, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v11, 0xCu);
  }

  [(SDBetaManager *)self verifyAssetAudience:v9 programID:a4 accountID:0 skipEnrollmentCheck:0 withCompletion:v8];
}

- (void)verifyAssetAudience:(id)a3 programID:(int64_t)a4 accountID:(id)a5 withCompletion:(id)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = 136446210;
    uint64_t v15 = "-[SDBetaManager verifyAssetAudience:programID:accountID:withCompletion:]";
    _os_log_impl(&dword_1DD702000, v13, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v14, 0xCu);
  }

  [(SDBetaManager *)self verifyAssetAudience:v12 programID:a4 accountID:v11 skipEnrollmentCheck:0 withCompletion:v10];
}

- (void)verifyAssetAudience:(id)a3 programID:(int64_t)a4 accountID:(id)a5 skipEnrollmentCheck:(BOOL)a6 withCompletion:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  if (a6 || [(SDBetaManager *)self _isEnrolledInBetaProgram])
  {
    uint64_t v15 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v32 = v12;
      _os_log_impl(&dword_1DD702000, v15, OS_LOG_TYPE_DEFAULT, "Verifying asset audience %@", buf, 0xCu);
    }

    uint64_t v16 = (void *)MEMORY[0x1E4F28E88];
    id v17 = [(SDBetaManager *)self verifyURLForAssetAudience:v12 programID:a4];
    uint64_t v18 = [v16 requestWithURL:v17 cachePolicy:1 timeoutInterval:15.0];

    id v19 = +[SDHTTPClient sharedInstance];
    uint64_t v20 = [v19 urlSession];

    [v18 setHTTPMethod:@"GET"];
    if (v13)
    {
      uint64_t v21 = [v13 stringValue];
      [v18 setValue:v21 forHTTPHeaderField:@"Seeding-Account-Id"];
    }
    uint64_t v22 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v32 = v13;
      _os_log_impl(&dword_1DD702000, v22, OS_LOG_TYPE_INFO, "[VERIFY] Seeding-Account-Id: %@", buf, 0xCu);
    }

    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __92__SDBetaManager_verifyAssetAudience_programID_accountID_skipEnrollmentCheck_withCompletion___block_invoke;
    id v28 = &unk_1E6CD80D8;
    uint64_t v29 = self;
    id v30 = v14;
    int v23 = [v20 dataTaskWithRequest:v18 completionHandler:&v25];
    objc_msgSend(v23, "resume", v25, v26, v27, v28);
  }
  else
  {
    uint64_t v24 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1DD702000, v24, OS_LOG_TYPE_DEFAULT, "Device is not enrolled in a beta program, will not verify.", buf, 2u);
    }

    (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
  }
}

void __92__SDBetaManager_verifyAssetAudience_programID_accountID_skipEnrollmentCheck_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = v8;
  if (a4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v9 allHeaderFields];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"X-Request-Id"];
      id v12 = (void *)v11;
      id v13 = @"(null)";
      if (v11) {
        id v13 = (__CFString *)v11;
      }
      id v14 = v13;
    }
    else
    {
      id v14 = @"(non-HTTP response)";
    }
    uint64_t v24 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138543362;
      uint64_t v29 = v14;
      _os_log_impl(&dword_1DD702000, v24, OS_LOG_TYPE_DEFAULT, "/verify X-Request-Id: %{public}@", (uint8_t *)&v28, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v14 = (__CFString *)v8;
    uint64_t v15 = [(__CFString *)v14 allHeaderFields];
    uint64_t v16 = [v15 objectForKeyedSubscript:@"X-Request-Id"];
    id v17 = (void *)v16;
    uint64_t v18 = @"(null)";
    if (v16) {
      uint64_t v18 = (__CFString *)v16;
    }
    id v19 = v18;

    uint64_t v20 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138543362;
      uint64_t v29 = v19;
      _os_log_impl(&dword_1DD702000, v20, OS_LOG_TYPE_DEFAULT, "/verify X-Request-Id: %{public}@", (uint8_t *)&v28, 0xCu);
    }

    if ([(__CFString *)v14 statusCode] == 200)
    {
      [*(id *)(a1 + 32) setProfilesEnabledFromHeaderInResponse:v14];
      uint64_t v21 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:0];
      uint64_t v22 = [v21 objectForKey:@"catalog"];

      if (v22)
      {
        int v23 = +[SDBetaProgram betaProgramWithJSON:v21];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        uint64_t v27 = +[SDSeedingLogging betaHandle];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_1();
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      if ([(__CFString *)v14 statusCode] == 204)
      {
        uint64_t v25 = +[SDSeedingLogging betaHandle];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_2();
        }

        [*(id *)(a1 + 32) setProfilesEnabledFromHeaderInResponse:v14];
        uint64_t v26 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      }
      else
      {
        uint64_t v26 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      }
      v26();
    }
  }
}

- (void)unenrollDevice:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446210;
    uint64_t v20 = "-[SDBetaManager unenrollDevice:completion:]";
    _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  if ([v5 isErrorDevice])
  {
    id v8 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SDBetaManager unenrollDevice:completion:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    v6[2](v6, 0);
  }
  else
  {
    uint64_t v16 = +[SDDaemonClient sharedInstance];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __43__SDBetaManager_unenrollDevice_completion___block_invoke;
    v17[3] = &unk_1E6CD86B0;
    uint64_t v18 = v6;
    [v16 unenrollDevice:v5 completion:v17];
  }
}

uint64_t __43__SDBetaManager_unenrollDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_unenrollFromBetaProgramWithUserIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v13 = 136446210;
    uint64_t v14 = "-[SDBetaManager _unenrollFromBetaProgramWithUserIdentifier:]";
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v13, 0xCu);
  }

  if ([(SDBetaManager *)self _isEnrolledInBetaProgram])
  {
    CFPreferencesAppSynchronize(@"com.apple.seeding");
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    id v8 = CFPreferencesCopyValue(@"OriginalSoftwareUpdate", @"com.apple.seeding", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    uint64_t v9 = (void *)CFPreferencesCopyValue(@"OriginalUpdateBrain", @"com.apple.seeding", v6, v7);
    uint64_t v10 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[SDBetaManager _unenrollFromBetaProgramWithUserIdentifier:]();
    }

    [(SDBetaManager *)self _setAssetServerURLString:v8];
    [(SDBetaManager *)self _setBrainServerURLString:v9];
    CFPreferencesAppSynchronize(@"com.apple.seeding");
    CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFPreferencesSetValue(@"OriginalSoftwareUpdate", 0, @"com.apple.seeding", (CFStringRef)*MEMORY[0x1E4F1D3F0], v7);
    CFPreferencesSetValue(@"OriginalUpdateBrain", 0, @"com.apple.seeding", v11, v7);
    [(SDBetaManager *)self _setMemberEnrolled:0];
    [(SDBetaManager *)self _deleteBetaProgram];
    [(SDBetaManager *)self _changeFBAVisibilityWithUserIdentifier:v4 isVisible:0];
    [(SDBetaManager *)self _synchronizeCFPreferences];
    [(SDBetaManager *)self _resetAssetAudience];
    +[SDAnalytics deviceDidUnenrollFromSeeding];
  }
  else
  {
    id v8 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1DD702000, v8, OS_LOG_TYPE_DEFAULT, "Unenrolling device that is already unenrolled.", (uint8_t *)&v13, 2u);
    }
  }

  return 1;
}

- (void)isDeviceEnrolledInBetaProgram:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CFStringRef v6 = (void (**)(id, void))a4;
  CFStringRef v7 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136446210;
    uint64_t v20 = "-[SDBetaManager isDeviceEnrolledInBetaProgram:completion:]";
    _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  if ([v5 isErrorDevice])
  {
    id v8 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SDBetaManager isDeviceEnrolledInBetaProgram:completion:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    v6[2](v6, 0);
  }
  else
  {
    uint64_t v16 = +[SDDaemonClient sharedInstance];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__SDBetaManager_isDeviceEnrolledInBetaProgram_completion___block_invoke;
    v17[3] = &unk_1E6CD86B0;
    uint64_t v18 = v6;
    [v16 isDeviceEnrolledInBetaProgram:v5 completion:v17];
  }
}

uint64_t __58__SDBetaManager_isDeviceEnrolledInBetaProgram_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_isEnrolledInBetaProgram
{
  v2 = objc_opt_class();
  return [v2 _isEnrolledInBetaProgram];
}

+ (BOOL)_isEnrolledInBetaProgram
{
  v2 = [a1 _currentBetaProgram];
  if (v2)
  {
    BOOL v3 = 1;
  }
  else
  {
    CFPropertyListRef v4 = CFPreferencesCopyValue(@"MemberEnrolled", @"com.apple.seeding", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    BOOL v3 = v4 == (CFPropertyListRef)*MEMORY[0x1E4F1CFD0];
    if (v4) {
      CFRelease(v4);
    }
  }

  return v3;
}

- (void)_setMemberEnrolled:(BOOL)a3
{
  if (a3) {
    BOOL v3 = (const void *)*MEMORY[0x1E4F1CFD0];
  }
  else {
    BOOL v3 = 0;
  }
  CFPreferencesSetValue(@"MemberEnrolled", v3, @"com.apple.seeding", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
}

- (void)_synchronizeCFPreferences
{
}

- (id)_assetServerURLString
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = ASServerURLForAssetType();
  id v3 = 0;
  if (v3)
  {
    CFPropertyListRef v4 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v8 = @"com.apple.MobileAsset.SoftwareUpdate";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_INFO, "Failed to get asset URL for type:%@ [%@]", buf, 0x16u);
    }
  }
  id v5 = [v2 absoluteString];

  return v5;
}

- (void)_setAssetServerURLString:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = (__CFString *)a3;
  CFPropertyListRef v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  if (v4 || ![(__CFString *)v3 length])
  {
    id v5 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_INFO, "Setting asset server to %@", (uint8_t *)&v7, 0xCu);
    }

    ASSetAssetServerURLForAssetType();
  }
  else
  {
    CFStringRef v6 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = @"com.apple.MobileAsset.SoftwareUpdate";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_INFO, "Failed to set asset URL for type:%@ (bad URL string %@)", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (id)_brainServerURLString
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = ASServerURLForAssetType();
  id v3 = 0;
  if (v3)
  {
    CFPropertyListRef v4 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v8 = @"com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_INFO, "Failed to get brain URL for type:%@ [%@]", buf, 0x16u);
    }
  }
  id v5 = [v2 absoluteString];

  return v5;
}

- (void)_setBrainServerURLString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CFPropertyListRef v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  if (v4 || ![v3 length])
  {
    ASSetAssetServerURLForAssetType();
  }
  else
  {
    id v5 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412546;
      int v7 = @"com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_INFO, "Failed to set brain URL for type:%@ (bad URL string %@)", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_setAssetAudienceString:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CFPropertyListRef v4 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    uint64_t v12 = (uint64_t)v3;
    _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "will set mobile asset audience [%{public}@]", (uint8_t *)&v11, 0xCu);
  }

  if ([v3 length])
  {
    uint64_t v5 = MASetPallasAudience();
    int v6 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      uint64_t v12 = v5;
      int v7 = "did set mobile asset audience with result [%lld]";
      __int16 v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 12;
LABEL_8:
      _os_log_impl(&dword_1DD702000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else
  {
    int v6 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      int v7 = "Failed to set audience: given value is nil";
      __int16 v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      uint32_t v10 = 2;
      goto LABEL_8;
    }
  }
}

- (void)_resetAssetAudience
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_DEFAULT, "will reset mobile asset audience", (uint8_t *)&v5, 2u);
  }

  uint64_t v3 = MASetPallasAudience();
  CFPropertyListRef v4 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "did reset mobile asset audience with result [%lld]", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_changeFBAVisibilityWithUserIdentifier:(id)a3 isVisible:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(SDBetaManager *)self canToggleFBAVisibility])
  {
    unsigned int v7 = [v6 longValue];
    if (!v7) {
      goto LABEL_6;
    }
    __int16 v8 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v17 = 134217984;
      uint64_t v18 = (__CFString *)v7;
      _os_log_impl(&dword_1DD702000, v8, OS_LOG_TYPE_INFO, "Fetching user for uid: [%lu]", (uint8_t *)&v17, 0xCu);
    }

    _CFPreferencesGetUserIdentifierForUID();
    os_log_type_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_6:
      uint32_t v10 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1DD702000, v10, OS_LOG_TYPE_INFO, "Falling back to default user", (uint8_t *)&v17, 2u);
      }

      os_log_type_t v9 = @"mobile";
    }
    int v11 = +[SDSeedingLogging betaHandle];
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v12)
      {
        int v17 = 138477827;
        uint64_t v18 = v9;
        uint64_t v13 = "Making FBA visible for user: [%{private}@]";
LABEL_16:
        _os_log_impl(&dword_1DD702000, v11, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v17, 0xCu);
      }
    }
    else if (v12)
    {
      int v17 = 138477827;
      uint64_t v18 = v9;
      uint64_t v13 = "Hiding FBA for user: [%{private}@]";
      goto LABEL_16;
    }

    if (v4) {
      uint64_t v14 = (const void *)*MEMORY[0x1E4F1CFD0];
    }
    else {
      uint64_t v14 = 0;
    }
    CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    CFPreferencesSetValue(@"SBIconVisibility", v14, @"com.apple.appleseed.FeedbackAssistant", v9, (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    CFPreferencesSynchronize(@"com.apple.appleseed.FeedbackAssistant", (CFStringRef)*MEMORY[0x1E4F1D3D0], v15);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.appIconVisibilityPreferencesChanged", 0, 0, 1u);
    goto LABEL_21;
  }
  os_log_type_t v9 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1DD702000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Device cannot file feedback. Cannot change FBA visibility", (uint8_t *)&v17, 2u);
  }
LABEL_21:
}

- (BOOL)canToggleFBAVisibility
{
  return +[SDBuildInfo isFeedbackAssistantAvailable];
}

- (void)canFileFeedbackOnDevice:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  unsigned int v7 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136446210;
    uint64_t v20 = "-[SDBetaManager canFileFeedbackOnDevice:completion:]";
    _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  if ([v5 isErrorDevice])
  {
    __int16 v8 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SDBetaManager canFileFeedbackOnDevice:completion:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    v6[2](v6, 0);
  }
  else
  {
    uint64_t v16 = +[SDDaemonClient sharedInstance];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__SDBetaManager_canFileFeedbackOnDevice_completion___block_invoke;
    v17[3] = &unk_1E6CD86B0;
    uint64_t v18 = v6;
    [v16 canFileFeedbackOnDevice:v5 completion:v17];
  }
}

uint64_t __52__SDBetaManager_canFileFeedbackOnDevice_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3) {
    a2 = 0;
  }
  else {
    a2 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

+ (BOOL)canFileFeedbackOnThisDevice:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BOOL v4 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "+[SDBetaManager canFileFeedbackOnThisDevice:]";
    _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__1;
  uint64_t v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __45__SDBetaManager_canFileFeedbackOnThisDevice___block_invoke;
  v24[3] = &unk_1E6CD86D8;
  p_long long buf = &buf;
  id v6 = v5;
  uint64_t v25 = v6;
  +[SDDevice getCurrentDevice:v24];
  dispatch_time_t v7 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.seeding.beta-manager" code:6 userInfo:0];
      BOOL v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);

    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    uint64_t v10 = +[SDBetaManager sharedManager];
    uint64_t v11 = *(void *)(*((void *)&buf + 1) + 40);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __45__SDBetaManager_canFileFeedbackOnThisDevice___block_invoke_2;
    int v17 = &unk_1E6CD8700;
    uint64_t v19 = &v20;
    id v6 = v9;
    uint64_t v18 = v6;
    [v10 canFileFeedbackOnDevice:v11 completion:&v14];

    dispatch_time_t v12 = dispatch_time(0, 15000000000);
    if (dispatch_semaphore_wait(v6, v12))
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.seeding.beta-manager", 6, 0, v14, v15, v16, v17);
        BOOL v8 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = *((unsigned char *)v21 + 24) != 0;
    }

    _Block_object_dispose(&v20, 8);
  }

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __45__SDBetaManager_canFileFeedbackOnThisDevice___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __45__SDBetaManager_canFileFeedbackOnThisDevice___block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)canFileFeedbackOnThisDeviceWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(0, 0);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke;
  v12[3] = &unk_1E6CD8778;
  dispatch_semaphore_t v5 = v4;
  uint64_t v13 = v5;
  uint64_t v15 = v16;
  id v6 = v3;
  id v14 = v6;
  +[SDDevice getCurrentDevice:v12];
  dispatch_time_t v7 = dispatch_time(0, 15000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke_4;
  block[3] = &unk_1E6CD87A0;
  id v10 = v6;
  uint64_t v11 = v16;
  id v8 = v6;
  dispatch_after(v7, v5, block);

  _Block_object_dispose(v16, 8);
}

void __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SDBetaManager sharedManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6CD8750;
  id v8 = *(id *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v6;
  long long v9 = v6;
  [v4 canFileFeedbackOnDevice:v3 completion:v7];
}

void __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  id v3 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke_3;
  block[3] = &unk_1E6CD8728;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  char v8 = a2;
  dispatch_async(v3, block);
}

uint64_t __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), 0);
}

void __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke_4(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v1 = *(void *)(a1 + 32);
    id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.seeding.beta-manager" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

- (void)enrollInProgramWithToken:(id)a3 userIdentifier:(id)a4 completion:(id)a5
{
}

- (void)enrollInProgramWithToken:(id)a3 userIdentifier:(id)a4 shouldSaveToken:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136446210;
    uint64_t v21 = "-[SDBetaManager enrollInProgramWithToken:userIdentifier:shouldSaveToken:completion:]";
    _os_log_impl(&dword_1DD702000, v11, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  if (v7)
  {
    dispatch_time_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    +[SDPersistence saveBetaEnrollmentTokens:v12];
  }
  unint64_t v13 = +[SDDevice devicePlatform];
  id v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke;
  v17[3] = &unk_1E6CD87C8;
  id v18 = v9;
  id v19 = v10;
  id v15 = v10;
  id v16 = v9;
  [(SDBetaManager *)self _finallyQueryProgramsForSystemAccountsWithPlatforms:v13 credentials:0 betaEnrollmentTokens:v14 completion:v17];
}

void __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    if ((unint64_t)[v3 count] >= 2)
    {
      id v4 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke_cold_3();
      }
    }
    long long v5 = [v3 firstObject];
    uint64_t v6 = [v5 platform];
    if (v6 == +[SDDevice devicePlatform])
    {
      BOOL v7 = +[SDDevice _currentDevice];
      [v7 _enrollInBetaProgram:v5];

      char v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      id v10 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke_cold_2(v5, a1, v10);
      }

      char v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v8();
  }
  else
  {
    id v9 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_migrateFromProfilesIfNeeded
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD702000, a2, v4, "Migration failed: Could not read Asset Audience ID with error [%{public}@]", v5);
}

void __45__SDBetaManager__migrateFromProfilesIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    BOOL v7 = +[SDSeedingLogging betaHandle];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        id v9 = [v5 description];
        int v10 = 138543362;
        uint64_t v11 = v9;
        _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, "Migrating into program %{public}@", (uint8_t *)&v10, 0xCu);
      }
      +[SDProfileUtilities forceRemoveSeedingProfile];
      BOOL v7 = +[SDDevice _currentDevice];
      [v7 _enrollInBetaProgram:v5 userIdentifier:0];
    }
    else if (v8)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, "Profile migration returned no program and no error, setting complete flag.", (uint8_t *)&v10, 2u);
    }

    [*(id *)(a1 + 32) _markMigrationComplete];
  }
  [*(id *)(a1 + 32) setIsMigratingFromProfiles:0];
}

- (BOOL)_hasMigratedProfiles
{
  id v2 = SeedingDefaults();
  char v3 = [v2 BOOLForKey:@"HasRunMigration"];

  return v3;
}

- (void)_markMigrationComplete
{
  SeedingDefaults();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setBool:1 forKey:@"HasRunMigration"];
}

- (void)getMigrationProgramForAssetAudience:(id)a3 completion:(id)a4
{
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1E4F28E88];
  BOOL v8 = [(SDBetaManager *)self migrateURLForAssetAudience:a3];
  id v9 = [v7 requestWithURL:v8 cachePolicy:1 timeoutInterval:15.0];

  int v10 = +[SDHTTPClient sharedInstance];
  uint64_t v11 = [v10 urlSession];

  [v9 setHTTPMethod:@"GET"];
  uint64_t v12 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[SDBetaManager getMigrationProgramForAssetAudience:completion:](v9, v12);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke;
  void v16[3] = &unk_1E6CD8818;
  id v18 = self;
  id v19 = v6;
  id v17 = v9;
  id v13 = v6;
  id v14 = v9;
  id v15 = [v11 dataTaskWithRequest:v14 completionHandler:v16];
  [v15 resume];
}

void __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  uint64_t v11 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 allHeaderFields];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"X-Request-Id"];
    id v14 = (void *)v13;
    id v15 = @"(null)";
    if (v13) {
      id v15 = (__CFString *)v13;
    }
    *(_DWORD *)long long buf = 138543362;
    uint64_t v32 = (uint64_t)v15;
    _os_log_impl(&dword_1DD702000, v11, OS_LOG_TYPE_DEFAULT, "/migrate X-Request-Id: %{public}@", buf, 0xCu);
  }
  id v16 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_5(a1, v10, v16);
  }

  if (!v9)
  {
    if ([v10 statusCode] > 499 || objc_msgSend(v10, "statusCode") == 403)
    {
      id v18 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_1(v10, v18);
      }

      uint64_t v19 = *(void *)(a1 + 48);
      uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.seeding.beta-manager" code:3 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v21 = [v10 statusCode];
    [*(id *)(a1 + 40) setProfilesEnabledFromHeaderInResponse:v10];
    if (v21 != 200)
    {
      id v17 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = [v10 statusCode];
        *(_DWORD *)long long buf = 134217984;
        uint64_t v32 = v26;
        _os_log_impl(&dword_1DD702000, v17, OS_LOG_TYPE_DEFAULT, "Received code [%lu]. Considering migration successful.", buf, 0xCu);
      }
      goto LABEL_10;
    }
    id v30 = 0;
    uint64_t v20 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v30];
    id v22 = v30;
    if (v22)
    {
      char v23 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_3();
      }
    }
    else
    {
      uint64_t v27 = [v20 objectForKey:@"catalog"];

      if (v27)
      {
        uint64_t v28 = +[SDBetaProgram betaProgramWithJSON:v20];
        uint64_t v29 = +[SDSeedingLogging betaHandle];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          uint64_t v32 = (uint64_t)v28;
          _os_log_impl(&dword_1DD702000, v29, OS_LOG_TYPE_DEFAULT, "Received program %{public}@ for migration", buf, 0xCu);
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_16;
      }
      char v23 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_2();
      }
    }

    uint64_t v24 = *(void *)(a1 + 48);
    uint64_t v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.seeding.beta-manager" code:8 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0, v25);

    goto LABEL_17;
  }
  id v17 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_4(v9, v17);
  }
LABEL_10:

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_17:
}

- (BOOL)isMigratingFromProfiles
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL isMigratingFromProfiles = v2->_isMigratingFromProfiles;
  objc_sync_exit(v2);

  return isMigratingFromProfiles;
}

- (void)setIsMigratingFromProfiles:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  BOOL isMigratingFromProfiles = v4->_isMigratingFromProfiles;
  v4->_BOOL isMigratingFromProfiles = v3;
  if (v3)
  {
    id v6 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_DEFAULT, "Migrating from profiles", buf, 2u);
    }
LABEL_18:

    goto LABEL_19;
  }
  if (isMigratingFromProfiles)
  {
    id v7 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, "Profile migration finished", buf, 2u);
    }

    id v8 = [(SDBetaManager *)v4 postMigrationTasks];
    BOOL v9 = [v8 count] == 0;

    if (!v9)
    {
      id v10 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1DD702000, v10, OS_LOG_TYPE_DEFAULT, "Found pending tasks. Executing now", buf, 2u);
      }

      id v6 = dispatch_get_global_queue(25, 0);
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v11 = [(SDBetaManager *)v4 postMigrationTasks];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __44__SDBetaManager_setIsMigratingFromProfiles___block_invoke;
            block[3] = &unk_1E6CD7E48;
            void block[4] = v15;
            dispatch_async(v6, block);
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v12);
      }

      id v16 = [(SDBetaManager *)v4 postMigrationTasks];
      [v16 removeAllObjects];

      goto LABEL_18;
    }
  }
LABEL_19:
  objc_sync_exit(v4);
}

uint64_t __44__SDBetaManager_setIsMigratingFromProfiles___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ensureThisRunsAfterMigration:(id)a3
{
  id v8 = (void (**)(void))a3;
  if ([(SDBetaManager *)self isMigratingFromProfiles])
  {
    uint64_t v4 = [(SDBetaManager *)self postMigrationTasks];

    if (!v4)
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
      [(SDBetaManager *)self setPostMigrationTasks:v5];
    }
    id v6 = [(SDBetaManager *)self postMigrationTasks];
    id v7 = (void *)MEMORY[0x1E01BDCA0](v8);
    [v6 addObject:v7];
  }
  else
  {
    v8[2]();
  }
}

- (void)setProfilesEnabledFromHeaderInResponse:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = _os_feature_enabled_impl();
  if (v3 && v4)
  {
    id v5 = [v3 valueForHTTPHeaderField:@"Disable-Profile"];
    id v6 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = @"(null)";
      if (v5) {
        id v7 = v5;
      }
      int v18 = 138543362;
      long long v19 = v7;
      _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_DEFAULT, "Disable-Profile: %{public}@", (uint8_t *)&v18, 0xCu);
    }

    if (v5)
    {
      uint64_t v8 = SDPlatformsFromCommaSeparatedString(v5);
      BOOL v9 = SeedingDefaults();
      int v10 = [v9 BOOLForKey:@"EnableProfiles"];

      unint64_t v11 = +[SDDevice devicePlatform] & v8;
      if (v10 && v11)
      {
        uint64_t v12 = +[SDSeedingLogging betaHandle];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_1DD702000, v12, OS_LOG_TYPE_DEFAULT, "Profiles are no longer allowed on this platform, disabling and removing.", (uint8_t *)&v18, 2u);
        }

        uint64_t v13 = SeedingDefaults();
        [v13 setBool:0 forKey:@"EnableProfiles"];

        +[SDProfileUtilities removeSeedProfileIfRestricted];
      }
      else
      {
        if (v11) {
          char v15 = 1;
        }
        else {
          char v15 = v10;
        }
        if ((v15 & 1) == 0)
        {
          id v16 = +[SDSeedingLogging betaHandle];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v18) = 0;
            _os_log_impl(&dword_1DD702000, v16, OS_LOG_TYPE_DEFAULT, "Profiles are now enabled on this platform.", (uint8_t *)&v18, 2u);
          }

          id v17 = SeedingDefaults();
          [v17 setBool:1 forKey:@"EnableProfiles"];
        }
      }
    }
    else
    {
      id v14 = SeedingDefaults();
      [v14 removeObjectForKey:@"EnableProfiles"];
    }
  }
}

- (id)seedingAppleIDUsernameForCurrentDevice
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v6 = 136446210;
    id v7 = "-[SDBetaManager seedingAppleIDUsernameForCurrentDevice]";
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  id v3 = +[SDDaemonClient sharedInstance];
  int v4 = [v3 seedingAppleIDUsernameForCurrentDevice];

  return v4;
}

- (void)seedingAppleIDUsernameForCurrentDeviceWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136446210;
    int v10 = "-[SDBetaManager seedingAppleIDUsernameForCurrentDeviceWithCompletion:]";
    _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  id v5 = +[SDDaemonClient sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SDBetaManager_seedingAppleIDUsernameForCurrentDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E6CD8428;
  id v8 = v3;
  id v6 = v3;
  [v5 seedingAppleIDUsernameForCurrentDevice:v7];
}

uint64_t __70__SDBetaManager_seedingAppleIDUsernameForCurrentDeviceWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_seedingAppleIDUsername
{
  id v2 = SeedingDefaults();
  id v3 = [v2 stringForKey:@"AppleAccountIdentifier"];
  int v4 = [MEMORY[0x1E4F179C8] defaultStore];
  id v5 = v4;
  if (v3)
  {
    id v6 = [v4 accountWithIdentifier:v3];
    if (v6)
    {
LABEL_6:
      id v7 = [v6 username];

      goto LABEL_8;
    }
  }
  else
  {
    [v2 removeObjectForKey:@"AppleAccountIdentifier"];
  }
  id v6 = objc_msgSend(v5, "aida_accountForPrimaryiCloudAccount");
  if (v6) {
    goto LABEL_6;
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (id)deviceAppleIDUsernameForCurrentDevice
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v6 = 136446210;
    id v7 = "-[SDBetaManager deviceAppleIDUsernameForCurrentDevice]";
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  id v3 = +[SDDaemonClient sharedInstance];
  int v4 = [v3 deviceAppleIDUsernameForCurrentDevice];

  return v4;
}

- (id)_deviceAppleIDUsername
{
  id v2 = [MEMORY[0x1E4F179C8] defaultStore];
  id v3 = objc_msgSend(v2, "aida_accountForPrimaryiCloudAccount");
  int v4 = [v3 username];

  return v4;
}

- (BOOL)isCurrentDeviceUsingSeedingAppleID
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v6 = 136446210;
    id v7 = "-[SDBetaManager isCurrentDeviceUsingSeedingAppleID]";
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  id v3 = +[SDDaemonClient sharedInstance];
  char v4 = [v3 isCurrentDeviceUsingSeedingAppleID];

  return v4;
}

- (BOOL)_isUsingSeedingAppleID
{
  id v2 = SeedingDefaults();
  id v3 = [v2 stringForKey:@"AppleAccountIdentifier"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)saveAppleAccountIdentifierWithAlternateDSIDForCurrentDevice:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136446210;
    id v14 = "-[SDBetaManager saveAppleAccountIdentifierWithAlternateDSIDForCurrentDevice:completion:]";
    _os_log_impl(&dword_1DD702000, v8, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  BOOL v9 = +[SDDaemonClient sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__SDBetaManager_saveAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke;
  v11[3] = &unk_1E6CD8840;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice:v7 completion:v11];
}

void __88__SDBetaManager_saveAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidateCache];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_saveAppleAccountIdentifierWithAlternateDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SeedingDefaults();
  BOOL v9 = [v8 stringForKey:@"AppleAccountIdentifier"];

  id v10 = [MEMORY[0x1E4F179C8] defaultStore];
  uint64_t v11 = objc_msgSend(v10, "aida_accountForPrimaryiCloudAccount");

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke;
  void v16[3] = &unk_1E6CD8890;
  uint64_t v20 = self;
  id v21 = v7;
  id v17 = v6;
  id v18 = v9;
  id v19 = v11;
  id v12 = v11;
  id v13 = v9;
  id v14 = v7;
  id v15 = v6;
  [(SDBetaManager *)self getAppleIDAuthenticationAccountForAlternateDSID:v15 attempt:0 completion:v16];
}

void __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3)
  {
    id v6 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = 11;
    goto LABEL_7;
  }
  id v5 = [v3 identifier];
  if (![v5 isEqualToString:*(void *)(a1 + 40)])
  {
    uint64_t v11 = [v4 identifier];
    id v12 = [*(id *)(a1 + 48) identifier];
    int v13 = [v11 isEqualToString:v12];

    if (v13) {
      goto LABEL_10;
    }
    id v15 = [v4 username];
    id v16 = [*(id *)(a1 + 48) username];
    int v17 = [v15 isEqualToString:v16];

    if (!v17)
    {
      id v10 = [v4 identifier];
      if (*(void *)(a1 + 40))
      {
        uint64_t v20 = +[SDSeedingLogging betaHandle];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_4();
        }

        id v21 = *(void **)(a1 + 56);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_442;
        v22[3] = &unk_1E6CD8868;
        v22[4] = v21;
        id v23 = v10;
        id v24 = *(id *)(a1 + 64);
        [v21 _deleteSeedingAppleAccountWithCompletion:v22];
      }
      else
      {
        [*(id *)(a1 + 56) _saveAppleAccountIdentifier:v10];
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
      [*(id *)(a1 + 56) invalidateCache];
      goto LABEL_8;
    }
    id v18 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_3();
    }

    id v19 = SeedingDefaults();
    [v19 removeObjectForKey:@"AppleAccountIdentifier"];

    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = 12;
LABEL_7:
    id v10 = [v8 errorWithDomain:@"com.apple.seeding.beta-manager" code:v9 userInfo:0];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);
LABEL_8:

    goto LABEL_13;
  }

LABEL_10:
  id v14 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_2(v4, v14);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_13:
}

void __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_442(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  [v3 _saveAppleAccountIdentifier:v4];
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)getAppleIDAuthenticationAccountForAlternateDSID:(id)a3 attempt:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void (**)(void, void))v9;
  if (a4 < 8)
  {
    uint64_t v11 = [MEMORY[0x1E4F179C8] defaultStore];
    id v12 = objc_msgSend(v11, "aida_accountForAltDSID:", v8);
    if (v12)
    {
      ((void (**)(void, void *))v10)[2](v10, v12);
    }
    else
    {
      dispatch_time_t v13 = dispatch_time(0, 250000000);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __84__SDBetaManager_getAppleIDAuthenticationAccountForAlternateDSID_attempt_completion___block_invoke;
      void v14[3] = &unk_1E6CD88B8;
      v14[4] = self;
      id v15 = v8;
      int64_t v17 = a4;
      id v16 = v10;
      dispatch_after(v13, MEMORY[0x1E4F14428], v14);
    }
  }
  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

uint64_t __84__SDBetaManager_getAppleIDAuthenticationAccountForAlternateDSID_attempt_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) getAppleIDAuthenticationAccountForAlternateDSID:*(void *)(a1 + 40) attempt:*(void *)(a1 + 56) + 1 completion:*(void *)(a1 + 48)];
}

- (void)_saveAppleAccountIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[SDSeedingLogging betaHandle];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "Saving new Seeding account %@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v4 = SeedingDefaults();
    [v4 setObject:v3 forKey:@"AppleAccountIdentifier"];
  }
  else if (v5)
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "Attempted to save a nil account identifier.", (uint8_t *)&v6, 2u);
  }
}

- (void)deleteSeedingAppleAccountForCurrentDeviceWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136446210;
    uint64_t v11 = "-[SDBetaManager deleteSeedingAppleAccountForCurrentDeviceWithCompletion:]";
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  int v6 = +[SDDaemonClient sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__SDBetaManager_deleteSeedingAppleAccountForCurrentDeviceWithCompletion___block_invoke;
  v8[3] = &unk_1E6CD8840;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 deleteSeedingAppleAccountWithCompletion:v8];
}

void __73__SDBetaManager_deleteSeedingAppleAccountForCurrentDeviceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidateCache];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_deleteSeedingAppleAccountWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  BOOL v5 = SeedingDefaults();
  int v6 = [v5 stringForKey:@"AppleAccountIdentifier"];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F179C8] defaultStore];
    uint64_t v8 = [v7 accountWithIdentifier:v6];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 username];
      uint64_t v11 = objc_msgSend(v7, "aida_accountForPrimaryiCloudAccount");
      uint64_t v12 = [v11 username];
      int v13 = [v10 isEqualToString:v12];

      if (v13)
      {
        id v14 = +[SDSeedingLogging betaHandle];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          -[SDBetaManager _deleteSeedingAppleAccountWithCompletion:]();
        }

        id v15 = SeedingDefaults();
        [v15 removeObjectForKey:@"AppleAccountIdentifier"];

        [(SDBetaManager *)self invalidateCache];
        id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.seeding.beta-manager" code:12 userInfo:0];
        v4[2](v4, v16);
      }
      else
      {
        [(SDBetaManager *)self invalidateCache];
        uint64_t v20 = +[SDSeedingLogging betaHandle];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v24 = v6;
          _os_log_impl(&dword_1DD702000, v20, OS_LOG_TYPE_DEFAULT, "Removing Seeding account %@ from account store", buf, 0xCu);
        }

        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __58__SDBetaManager__deleteSeedingAppleAccountWithCompletion___block_invoke;
        v21[3] = &unk_1E6CD86B0;
        id v22 = v4;
        [v7 removeAccount:v9 withCompletionHandler:v21];
      }
    }
    else
    {
      id v18 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SDBetaManager _deleteSeedingAppleAccountWithCompletion:]();
      }

      id v19 = SeedingDefaults();
      [v19 removeObjectForKey:@"AppleAccountIdentifier"];

      [(SDBetaManager *)self invalidateCache];
      v4[2](v4, 0);
    }
  }
  else
  {
    int64_t v17 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SDBetaManager _deleteSeedingAppleAccountWithCompletion:]();
    }

    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.seeding.beta-manager" code:10 userInfo:0];
    v4[2](v4, v7);
  }
}

void __58__SDBetaManager__deleteSeedingAppleAccountWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = +[SDSeedingLogging betaHandle];
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, "Seeding account deleted successfully", v10, 2u);
    }

    uint64_t v8 = SeedingDefaults();
    [v8 removeObjectForKey:@"AppleAccountIdentifier"];

    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __58__SDBetaManager__deleteSeedingAppleAccountWithCompletion___block_invoke_cold_1(v5, v7);
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v9();
}

- (NSArray)cachedPrograms
{
  return self->_cachedPrograms;
}

- (void)setCachedPrograms:(id)a3
{
}

- (NSDate)lastCached
{
  return self->_lastCached;
}

- (void)setLastCached:(id)a3
{
}

- (unint64_t)cachedPlatform
{
  return self->_cachedPlatform;
}

- (void)setCachedPlatform:(unint64_t)a3
{
  self->_cachedPlatform = a3;
}

- (NSMutableArray)postMigrationTasks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPostMigrationTasks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postMigrationTasks, 0);
  objc_storeStrong((id *)&self->_lastCached, 0);
  objc_storeStrong((id *)&self->_cachedPrograms, 0);
}

- (void)_queryProgramsForSystemAccountsWithPlatforms:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6(&dword_1DD702000, v0, v1, "Skipping credential fetch", v2, v3, v4, v5, v6);
}

- (void)_queryProgramsForSystemAccountsWithPlatforms:completion:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_0(&dword_1DD702000, v0, v1, "No accounts available. Cannot proceed", v2, v3, v4, v5, v6);
}

- (void)_queryProgramsForSystemAccountsWithPlatforms:completion:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6(&dword_1DD702000, v0, v1, "Will fetch accounts", v2, v3, v4, v5, v6);
}

void __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 username];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD702000, a2, v4, "ADSID token not available for account %@", v5);
}

void __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke_343_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_0(&dword_1DD702000, v0, v1, "No credential tokens available. Cannot proceed", v2, v3, v4, v5, v6);
}

- (void)_finallyQueryProgramsForSystemAccountsWithPlatforms:credentials:betaEnrollmentTokens:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1DD702000, v0, v1, "Body:\n%@", v2, v3, v4, v5, v6);
}

- (void)_finallyQueryProgramsForSystemAccountsWithPlatforms:(void *)a1 credentials:(NSObject *)a2 betaEnrollmentTokens:completion:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 URL];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1DD702000, a2, OS_LOG_TYPE_DEBUG, "URL: %@", v4, 0xCu);
}

void __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1DD702000, v0, v1, "Failed to parse JSON, got response %{public}@ with error %{public}@.\n");
}

void __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1DD702000, v0, v1, "No 'programs' dictionary from the server. Response: %{public}@", v2, v3, v4, v5, v6);
}

void __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1DD702000, v0, v1, "Got response %{public}@ with error %{public}@.\n");
}

+ (void)isBuildPrefix:greaterThanOrEqualToBuild:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1DD702000, v0, v1, "Prefix %{public}@ is longer than device build. This is a configuration error, but allowing.", v2, v3, v4, v5, v6);
}

+ (void)isBuildPrefix:greaterThanOrEqualToBuild:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1DD702000, v0, v1, "Malformed build %{public}@ or prefix %{public}@, could not match.");
}

+ (void)isBuildPrefix:(void *)a1 greaterThanOrEqualToBuild:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD702000, a2, v4, "Failed to compile regex with error %{public}@}", v5);
}

- (void)enrollDevice:(uint64_t)a3 inBetaProgram:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)enrollDevice:(uint64_t)a3 withEnrollmentMetadata:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__SDBetaManager_enrollCurrentDeviceWithEnrollmentMetadata_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_0(&dword_1DD702000, v0, v1, "Error device passed into -[SDBetaManager enrollCurrentDeviceWithEnrollmentMetadata:]", v2, v3, v4, v5, v6);
}

- (void)enrollmentMetadataForDevice:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_saveBetaProgram:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1DD702000, v0, v1, "Saving beta program object %{public}@.", v2, v3, v4, v5, v6);
}

- (void)_saveBetaProgram:(NSObject *)a3 .cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a1 programID];
  uint64_t v5 = [a2 description];
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1DD702000, a3, OS_LOG_TYPE_ERROR, "Failed to serialize beta program object for catalog %ld - %{public}@.", v6, 0x16u);
}

+ (void)_currentBetaProgram
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD702000, a2, v4, "Failed to deserialize beta program object - %{public}@.", v5);
}

- (void)enrolledBetaProgramForDevice:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1DD702000, v0, v1, "No 'catalog' value in the verify response. Response: %@", v2, v3, v4, v5, v6);
}

void __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6(&dword_1DD702000, v0, v1, "Beta Program API returned no content, catalog is inactive.", v2, v3, v4, v5, v6);
}

void __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1DD702000, v0, v1, "Catalog verify error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)unenrollDevice:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_unenrollFromBetaProgramWithUserIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1DD702000, v0, OS_LOG_TYPE_DEBUG, "Original asset server [%{public}@] original brain server [%{public}@]", v1, 0x16u);
}

- (void)isDeviceEnrolledInBetaProgram:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)canFileFeedbackOnDevice:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1DD702000, v0, v1, "No programs found for token [%{private}@]", v2, v3, v4, v5, v6);
}

void __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 programID];
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = SDStringForPlatform([a1 platform]);
  int v9 = 134218499;
  uint64_t v10 = v6;
  __int16 v11 = 2113;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  id v14 = v8;
  _os_log_error_impl(&dword_1DD702000, a3, OS_LOG_TYPE_ERROR, "Catalog [%lu] for token [%{private}@] has platform [%{public}@] and does not match this device. Will not enroll", (uint8_t *)&v9, 0x20u);
}

void __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1DD702000, v0, v1, "More than one program retuned for token [%{private}@]. Will use first", v2, v3, v4, v5, v6);
}

- (void)getMigrationProgramForAssetAudience:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 HTTPMethod];
  uint64_t v5 = [a1 URL];
  uint8_t v6 = [v5 path];
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_1DD702000, a2, OS_LOG_TYPE_DEBUG, "-> %{public}@ %{public}@", v7, 0x16u);
}

void __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 statusCode];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD702000, a2, v3, "HTTP Error: Received status code [%lu].", v4);
}

void __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1DD702000, v0, v1, "Data Error: No 'catalog' value in the migrate response. Response: [%{public}@]", v2, v3, v4, v5, v6);
}

void __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1DD702000, v0, v1, "Parse Error: Failed to parse response with Error [%{public}@]", v2, v3, v4, v5, v6);
}

void __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_4(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD702000, a2, v4, "HTTP Session Error: %{public}@", v5);
}

void __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_5(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*(id *)(a1 + 32) HTTPMethod];
  uint64_t v7 = [*(id *)(a1 + 32) URL];
  uint64_t v8 = [v7 path];
  int v9 = 138543874;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v8;
  __int16 v13 = 2048;
  uint64_t v14 = [a2 statusCode];
  _os_log_debug_impl(&dword_1DD702000, a3, OS_LOG_TYPE_DEBUG, "<- %{public}@ %{public}@ %li", (uint8_t *)&v9, 0x20u);
}

void __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1DD702000, v0, v1, "Failed to find account for ADSID [%@]", v2, v3, v4, v5, v6);
}

void __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD702000, a2, v4, "A second auth request for an existing account [%@] came in, assuming success.", v5);
}

void __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_0(&dword_1DD702000, v0, v1, "Attempted to save same account as device iCloud account, this is not allowed.", v2, v3, v4, v5, v6);
}

void __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1DD702000, v0, v1, "A Seeding account [%@] already exists, deleting before continuing.", v2, v3, v4, v5, v6);
}

- (void)_deleteSeedingAppleAccountWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_0(&dword_1DD702000, v0, v1, "Attempted to delete the Seeding account, but Seeding is not tracking an account", v2, v3, v4, v5, v6);
}

- (void)_deleteSeedingAppleAccountWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_0(&dword_1DD702000, v0, v1, "Seeding account is no longer in the account store.", v2, v3, v4, v5, v6);
}

- (void)_deleteSeedingAppleAccountWithCompletion:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_1DD702000, v0, OS_LOG_TYPE_FAULT, "Attempted to delete the system iCloud account.", v1, 2u);
}

void __58__SDBetaManager__deleteSeedingAppleAccountWithCompletion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD702000, a2, v4, "Error deleting Seeding account: %{public}@", v5);
}

@end