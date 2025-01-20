@interface TRIUserCovariates
- (TRIUserCovariates)initWithContext:(id)a3;
- (id)_applicationRecordForBundleId:(id)a3;
- (id)tri_hasApplicationWithBundleId:(id)a3;
- (id)tri_majorVersionForBundleId:(id)a3;
- (id)tri_minorVersionForBundleId:(id)a3;
- (id)tri_patchVersionForBundleId:(id)a3;
- (id)tri_shortVersionStringForBundleId:(id)a3;
- (id)tri_versionForBundleId:(id)a3;
- (id)tri_versionForBundleId:(id)a3 compareToString:(id)a4;
- (id)tri_versionStringForBundleId:(id)a3;
@end

@implementation TRIUserCovariates

- (TRIUserCovariates)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIUserCovariates;
  v6 = [(TRIUserCovariates *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (id)_applicationRecordForBundleId:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v8 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v10 = v3;
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_debug_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEBUG, "application not found for bundle id {public}%@ -- %{public}@", buf, 0x16u);
    }
  }
  return v4;
}

- (id)tri_hasApplicationWithBundleId:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E016E7F0]();
  v6 = NSNumber;
  v7 = [(TRIUserCovariates *)self _applicationRecordForBundleId:v4];
  id v8 = [v6 numberWithInt:v7 != 0];

  return v8;
}

- (id)tri_shortVersionStringForBundleId:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E016E7F0]();
  v6 = [(TRIUserCovariates *)self _applicationRecordForBundleId:v4];
  uint64_t v7 = [v6 shortVersionString];
  id v8 = (void *)v7;
  objc_super v9 = &stru_1F3455898;
  if (v7) {
    objc_super v9 = (__CFString *)v7;
  }
  id v10 = v9;

  return v10;
}

- (id)tri_versionStringForBundleId:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E016E7F0]();
  v6 = [(TRIUserCovariates *)self _applicationRecordForBundleId:v4];
  uint64_t v7 = [v6 exactBundleVersion];
  id v8 = (void *)v7;
  objc_super v9 = &stru_1F3455898;
  if (v7) {
    objc_super v9 = (__CFString *)v7;
  }
  id v10 = v9;

  return v10;
}

- (id)tri_versionForBundleId:(id)a3
{
  id v3 = [(TRIUserCovariates *)self tri_shortVersionStringForBundleId:a3];
  id v4 = [MEMORY[0x1E4FB0270] parseVersionFromString:v3 withPrefix:0];

  return v4;
}

- (id)tri_majorVersionForBundleId:(id)a3
{
  id v3 = [(TRIUserCovariates *)self tri_versionForBundleId:a3];
  id v4 = [v3 majorVersion];

  return v4;
}

- (id)tri_minorVersionForBundleId:(id)a3
{
  id v3 = [(TRIUserCovariates *)self tri_versionForBundleId:a3];
  id v4 = [v3 minorVersion];

  return v4;
}

- (id)tri_patchVersionForBundleId:(id)a3
{
  id v3 = [(TRIUserCovariates *)self tri_versionForBundleId:a3];
  id v4 = [v3 patchVersion];

  return v4;
}

- (id)tri_versionForBundleId:(id)a3 compareToString:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(TRIUserCovariates *)self tri_versionForBundleId:a3];
  id v8 = [MEMORY[0x1E4FB0270] parseVersionFromString:v6 withPrefix:0];

  objc_super v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "compare:", v8));

  return v9;
}

- (void).cxx_destruct
{
}

@end