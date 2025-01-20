@interface PPInternalRequestHandler
- (void)assetDefaultBundleOverridePathForAssetIdentifier:(id)a3 completion:(id)a4;
- (void)assetMetadataRefreshIntervalSecondsWithCompletion:(id)a3;
- (void)assetVersionsWithCompletion:(id)a3;
- (void)clearAssetMetadataRefreshIntervalSecondsWithCompletion:(id)a3;
- (void)setAssetDefaultBundleOverridePath:(id)a3 assetIdentifier:(id)a4 completion:(id)a5;
- (void)setAssetMetadataRefreshIntervalSeconds:(double)a3 completion:(id)a4;
- (void)setTrialUseDefaultFiles:(BOOL)a3 completion:(id)a4;
- (void)sysdiagnoseInformationWithCompletion:(id)a3;
- (void)trialOverridePath:(id)a3 namespaceName:(id)a4 factorName:(id)a5 completion:(id)a6;
@end

@implementation PPInternalRequestHandler

- (void)sysdiagnoseInformationWithCompletion:(id)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, void *, id))a3;
  v4 = objc_opt_new();
  v5 = +[PPSQLDatabase nonMigratingToolsInstance];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 stats];
    id v25 = 0;
    v8 = [v6 checkWithError:&v25];
    id v9 = v25;
    if (v9)
    {
      v10 = (void *)[[NSString alloc] initWithFormat:@"%@", v9];
      [v4 setObject:v10 forKeyedSubscript:@"dbCheck-error"];
    }
    v11 = +[PPConfiguration sharedInstance];
    v12 = [v11 portraitVariantName];

    v32[0] = @"stats";
    v32[1] = @"check";
    v33[0] = v7;
    v33[1] = v8;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    [v4 setObject:v13 forKeyedSubscript:@"database"];

    v30 = @"variantName";
    v31 = v12;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    [v4 setObject:v14 forKeyedSubscript:@"configuration"];
  }
  else
  {
    v28[0] = @"stats";
    v15 = [MEMORY[0x1E4F1CA98] null];
    v28[1] = @"check";
    v29[0] = v15;
    v16 = [MEMORY[0x1E4F1CA98] null];
    v29[1] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    [v4 setObject:v17 forKeyedSubscript:@"database"];

    v26 = @"variantName";
    v7 = [MEMORY[0x1E4F1CA98] null];
    v27 = v7;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [v4 setObject:v9 forKeyedSubscript:@"configuration"];
  }

  v18 = objc_opt_new();
  [v4 setObject:v18 forKeyedSubscript:@"assets"];

  v19 = [v4 objectForKeyedSubscript:@"assets"];
  [v19 setObject:&unk_1F256B0F0 forKeyedSubscript:@"common"];

  v20 = [v4 objectForKeyedSubscript:@"assets"];
  [v20 setObject:&unk_1F256B118 forKeyedSubscript:@"non-watch"];

  id v24 = 0;
  v21 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:3 error:&v24];
  id v22 = v24;
  if (v21)
  {
    v23 = (void *)[[NSString alloc] initWithData:v21 encoding:4];
    v3[2](v3, v23, v22);
  }
  else
  {
    v3[2](v3, 0, v22);
  }
}

- (void)setTrialUseDefaultFiles:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v8 = (void (**)(id, uint64_t, void))a4;
  v5 = +[PPSettings sharedInstance];
  [v5 setTrialUseDefaultFiles:v4];

  v6 = +[PPTrialWrapper sharedInstance];
  [v6 setUseDefaultFiles:v4];

  v7 = +[PPTrialWrapper sharedInstance];
  [v7 callRegisteredUpdateHandlers];

  v8[2](v8, 1, 0);
}

- (void)trialOverridePath:(id)a3 namespaceName:(id)a4 factorName:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(id, uint64_t, void))a6;
  v12 = +[PPTrialWrapper sharedInstance];
  v13 = v12;
  if (v16) {
    [v12 overrideFilepathForFileFactor:v10 namespaceName:v9 path:v16];
  }
  else {
    [v12 clearOverrideFilepathForFileFactor:v10 namespaceName:v9];
  }

  v14 = +[PPSettings sharedInstance];
  [v14 setTrialPathOverrideForNamespaceName:v9 factorName:v10 path:v16];

  v15 = +[PPTrialWrapper sharedInstance];
  [v15 callRegisteredUpdateHandlersForNamespaceName:v9];

  v11[2](v11, 1, 0);
}

- (void)assetVersionsWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void *, void))a3 + 2))(a3, &unk_1F256B0C8, 0);
  }
}

- (void)assetDefaultBundleOverridePathForAssetIdentifier:(id)a3 completion:(id)a4
{
  if (a4) {
    id v4 = a4;
  }
  else {
    id v4 = &__block_literal_global_142_19625;
  }
  id v5 = a3;
  v8 = (void (**)(id, void *, void))_Block_copy(v4);
  v6 = +[PPSettings sharedInstance];
  v7 = [v6 assetDefaultBundleOverridePathForAssetIdentifier:v5];

  v8[2](v8, v7, 0);
}

- (void)setAssetDefaultBundleOverridePath:(id)a3 assetIdentifier:(id)a4 completion:(id)a5
{
  if (a5) {
    id v5 = a5;
  }
  else {
    id v5 = &__block_literal_global_139;
  }
  v6 = (void (**)(id, void))_Block_copy(v5);
  v6[2](v6, 0);
}

- (void)assetMetadataRefreshIntervalSecondsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[PPSettings sharedInstance];
  [v5 assetMetadataRefreshIntervalSeconds];
  (*((void (**)(id, uint64_t, void))a3 + 2))(v4, 1, 0);
}

- (void)clearAssetMetadataRefreshIntervalSecondsWithCompletion:(id)a3
{
  id v5 = a3;
  v3 = +[PPSettings sharedInstance];
  [v3 clearAssetMetadataRefreshIntervalSeconds];

  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    id v4 = v5;
  }
}

- (void)setAssetMetadataRefreshIntervalSeconds:(double)a3 completion:(id)a4
{
  id v7 = a4;
  id v5 = +[PPSettings sharedInstance];
  [v5 setAssetMetadataRefreshIntervalSeconds:a3];

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
    v6 = v7;
  }
}

@end