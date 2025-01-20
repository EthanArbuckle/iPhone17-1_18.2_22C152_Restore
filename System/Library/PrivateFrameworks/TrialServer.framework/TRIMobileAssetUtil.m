@interface TRIMobileAssetUtil
+ (id)allTrialAssetTypes;
+ (id)siriTrialAssetTypes;
+ (void)_setAllAssetsToAudience:(id)a3 siriAudience:(id)a4 assetURL:(id)a5 siriAssetURL:(id)a6;
+ (void)configureMobileAssetForTrialEnvironment:(int64_t)a3;
@end

@implementation TRIMobileAssetUtil

+ (id)allTrialAssetTypes
{
  return &unk_1F347B210;
}

+ (id)siriTrialAssetTypes
{
  return &unk_1F347B228;
}

+ (void)configureMobileAssetForTrialEnvironment:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4FB0258] sharedInstance];
  uint64_t v6 = [v5 populationType];

  if (a3 != 3)
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"https://gdmf.apple.com/v2/assets"];
    id v16 = (id)v11;
    if (v6 != 5 && v6 != 4)
    {
      if (v6 != 3)
      {
LABEL_14:

        return;
      }
      if (([MEMORY[0x1E4F93B08] isInternalBuild] & 1) == 0)
      {
        v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"https://gdmf-staging-int.apple.com/v2/assets"];
        [a1 _setAllAssetsToAudience:@"ce9c2203-903b-4fb3-9f03-040dc2202694" siriAudience:0 assetURL:v14 siriAssetURL:0];

        goto LABEL_14;
      }
      v8 = @"ce9c2203-903b-4fb3-9f03-040dc2202694";
      v10 = @"0206c249-b301-46e0-9d6a-23ce9c5d875d";
      id v9 = a1;
      uint64_t v7 = 0;
      id v12 = v16;
LABEL_13:
      [v9 _setAllAssetsToAudience:v8 siriAudience:v10 assetURL:v7 siriAssetURL:v12];
      goto LABEL_14;
    }
    id v9 = a1;
    v8 = 0;
    v10 = 0;
    uint64_t v7 = v11;
LABEL_12:
    id v12 = 0;
    goto LABEL_13;
  }
  if (v6 == 3)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"https://gdmf-staging-int.apple.com/v2/assets"];
    v8 = @"9e2ceb05-96a4-4218-a942-74cdd002ea13";
    id v9 = a1;
    v10 = 0;
    id v16 = (id)v7;
    goto LABEL_12;
  }
  v13 = TRILogCategory_Server();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    if v6 < 6 && ((0x37u >> v6))
    {
      v15 = off_1E6BB8220[(int)v6];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138543362;
    v18 = v15;
    _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Tried to configure MA for UAT environment with unexpected population: %{public}@", buf, 0xCu);
  }
}

+ (void)_setAllAssetsToAudience:(id)a3 siriAudience:(id)a4 assetURL:(id)a5 siriAssetURL:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v24 = a6;
  if (!v24) {
    id v24 = v12;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = a1;
  id obj = [a1 allTrialAssetTypes];
  uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        if (v11
          && ([v13 siriTrialAssetTypes],
              uint64_t v19 = objc_claimAutoreleasedReturnValue(),
              int v20 = [v19 containsObject:v18],
              v19,
              v20))
        {
          v21 = TRILogCategory_Server();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            uint64_t v31 = v18;
            __int16 v32 = 2114;
            id v33 = v11;
            __int16 v34 = 2114;
            id v35 = v24;
            _os_log_impl(&dword_1DA291000, v21, OS_LOG_TYPE_DEFAULT, "Setting Siri-specific audience setting for %{public}@ to %{public}@ with Pallas URL %{public}@", buf, 0x20u);
          }

          MEMORY[0x1E016E200](v24, v18);
          id v22 = v11;
        }
        else
        {
          v23 = TRILogCategory_Server();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            uint64_t v31 = v18;
            __int16 v32 = 2114;
            id v33 = v10;
            __int16 v34 = 2114;
            id v35 = v12;
            _os_log_impl(&dword_1DA291000, v23, OS_LOG_TYPE_DEFAULT, "Setting audience setting for %{public}@ to %{public}@ with Pallas URL %{public}@", buf, 0x20u);
          }

          MEMORY[0x1E016E200](v12, v18);
          id v22 = v10;
        }
        MEMORY[0x1E016E1F0](v22, v18);
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v15);
  }
}

@end