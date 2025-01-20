@interface TPSUserTypeChecker
+ (id)_previousBuildVersion;
+ (int)_majorVersionForBuildVersion:(id)a3;
+ (int64_t)userType;
+ (int64_t)userTypeFromCloudDataWithKey:(id)a3;
+ (int64_t)userTypeFromMigratorData;
+ (int64_t)userTypeOverride;
+ (void)_previousBuildVersion;
@end

@implementation TPSUserTypeChecker

+ (int64_t)userType
{
  int64_t v3 = [(id)objc_opt_class() userTypeOverride];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v3 = [a1 userTypeFromMigratorData];
    if (!v3)
    {
      v4 = (void *)MGGetStringAnswer();
      if ([v4 isEqualToString:@"iPod"]) {
        int64_t v3 = 0;
      }
      else {
        int64_t v3 = [a1 userTypeFromCloudDataWithKey:v4];
      }
    }
  }
  return v3;
}

+ (int64_t)userTypeFromMigratorData
{
  int64_t v3 = (void *)MGCopyAnswer();
  int v4 = [(id)objc_opt_class() _majorVersionForBuildVersion:v3];
  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v6 = [v5 objectForKey:@"MigratedFromAndroidToiOSVersion"];

  if (v6
    && ((int v7 = [(id)objc_opt_class() _majorVersionForBuildVersion:v6], v7 >= 1)
      ? (BOOL v8 = v7 == v4)
      : (BOOL v8 = 0),
        v8))
  {
    int64_t v14 = 2;
  }
  else
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    v9 = (uint64_t (*)(void))getDMGetUserDataDispositionSymbolLoc_ptr;
    v21 = getDMGetUserDataDispositionSymbolLoc_ptr;
    if (!getDMGetUserDataDispositionSymbolLoc_ptr)
    {
      v10 = (void *)DataMigrationLibrary();
      v19[3] = (uint64_t)dlsym(v10, "DMGetUserDataDisposition");
      getDMGetUserDataDispositionSymbolLoc_ptr = (_UNKNOWN *)v19[3];
      v9 = (uint64_t (*)(void))v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v9)
    {
      +[TPSUserTypeChecker _previousBuildVersion]();
      v17 = v16;
      _Block_object_dispose(&v18, 8);
      _Unwind_Resume(v17);
    }
    if ((v9() & 4) != 0)
    {
      int64_t v14 = 1;
    }
    else
    {
      v11 = [a1 _previousBuildVersion];
      if (v11)
      {
        int v12 = [(id)objc_opt_class() _majorVersionForBuildVersion:v11];
        int64_t v14 = v12 > 0 && v12 < v4;
      }
      else
      {
        int64_t v14 = 0;
      }
    }
  }

  return v14;
}

+ (int64_t)userTypeFromCloudDataWithKey:(id)a3
{
  id v3 = a3;
  int v4 = (void *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.tips"];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 1;
  v5 = [v4 accounts];
  int v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_15);

  if (v6)
  {
    v15[3] = 0;
    int v7 = [v4 devices];
    BOOL v8 = (void *)[v7 copy];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__TPSUserTypeChecker_userTypeFromCloudDataWithKey___block_invoke_2;
    v11[3] = &unk_1E5907C48;
    id v12 = v3;
    v13 = &v14;
    [v8 enumerateObjectsUsingBlock:v11];
  }
  int64_t v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

+ (id)_previousBuildVersion
{
  uint64_t v8 = 0;
  int64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void (*)(void))getDMGetPreviousBuildVersionSymbolLoc_ptr;
  v11 = getDMGetPreviousBuildVersionSymbolLoc_ptr;
  if (!getDMGetPreviousBuildVersionSymbolLoc_ptr)
  {
    id v3 = (void *)DataMigrationLibrary();
    v9[3] = (uint64_t)dlsym(v3, "DMGetPreviousBuildVersion");
    getDMGetPreviousBuildVersionSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    v2 = (void (*)(void))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    +[TPSUserTypeChecker _previousBuildVersion]();
    int v7 = v6;
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  int v4 = v2();
  return v4;
}

+ (int)_majorVersionForBuildVersion:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  v5 = [v3 letterCharacterSet];
  int v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  int v7 = [v6 firstObject];
  LODWORD(v4) = [v7 intValue];

  return (int)v4;
}

+ (int64_t)userTypeOverride
{
  v2 = +[TPSDefaultsManager userType];
  id v3 = v2;
  if (v2 && (unsigned int v4 = [v2 intValue], v4 < 3)) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

BOOL __51__TPSUserTypeChecker_userTypeFromCloudDataWithKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 accountType] == 1;
}

void __51__TPSUserTypeChecker_userTypeFromCloudDataWithKey___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v6 = [a2 modelIdentifier];
  int v7 = [v6 lowercaseString];
  uint64_t v8 = [*(id *)(a1 + 32) lowercaseString];
  int v9 = [v7 containsString:v8];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (void)_previousBuildVersion
{
}

@end