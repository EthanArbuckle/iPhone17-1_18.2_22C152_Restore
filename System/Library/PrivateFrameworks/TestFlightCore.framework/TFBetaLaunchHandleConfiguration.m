@interface TFBetaLaunchHandleConfiguration
+ (id)configurationFromUserInfo:(id)a3;
- (ASDBetaAppLaunchInfo)launchInfo;
- (NSString)bundleIdentifier;
- (TFBetaLaunchHandleConfiguration)initWithBundleIdentifier:(id)a3;
- (TFBetaLaunchHandleConfiguration)initWithBundleIdentifier:(id)a3 preloadingLaunchInfo:(id)a4;
- (TFBetaLaunchHandleConfiguration)initWithBundleURL:(id)a3;
- (TFBetaLaunchHandleConfiguration)initWithBundleURL:(id)a3 preloadingLaunchInfo:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodedAsUserInfo;
@end

@implementation TFBetaLaunchHandleConfiguration

- (TFBetaLaunchHandleConfiguration)initWithBundleURL:(id)a3 preloadingLaunchInfo:(id)a4
{
  id v6 = a4;
  v7 = +[TFBundle bundleIdentifierForBundleURL:a3];
  v8 = (void *)[v7 copy];

  v9 = [(TFBetaLaunchHandleConfiguration *)self initWithBundleIdentifier:v8 preloadingLaunchInfo:v6];
  return v9;
}

- (TFBetaLaunchHandleConfiguration)initWithBundleURL:(id)a3
{
  return [(TFBetaLaunchHandleConfiguration *)self initWithBundleURL:a3 preloadingLaunchInfo:0];
}

- (TFBetaLaunchHandleConfiguration)initWithBundleIdentifier:(id)a3 preloadingLaunchInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TFBetaLaunchHandleConfiguration;
  v8 = [(TFBetaLaunchHandleConfiguration *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_launchInfo, a4);
  }

  return v8;
}

- (TFBetaLaunchHandleConfiguration)initWithBundleIdentifier:(id)a3
{
  return [(TFBetaLaunchHandleConfiguration *)self initWithBundleIdentifier:a3 preloadingLaunchInfo:0];
}

- (id)encodedAsUserInfo
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
  v4 = [(TFBetaLaunchHandleConfiguration *)self bundleIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"CONFIG_BUNDLE_ID"];

  v5 = [(TFBetaLaunchHandleConfiguration *)self launchInfo];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263F08910];
    id v7 = [(TFBetaLaunchHandleConfiguration *)self launchInfo];
    id v17 = 0;
    v8 = [v6 archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v17];
    id v9 = v17;

    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"CONFIG_LAUNCH_INFO_DATA"];
    }
    else
    {
      v10 = +[TFLogConfiguration defaultConfiguration];
      v11 = [v10 generatedLogger];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_super v12 = objc_opt_class();
        id v13 = v12;
        v14 = [(TFBetaLaunchHandleConfiguration *)self bundleIdentifier];
        v15 = [v9 localizedDescription];
        *(_DWORD *)buf = 138543874;
        v19 = v12;
        __int16 v20 = 2114;
        v21 = v14;
        __int16 v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_223064000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode launch info. error = %@", buf, 0x20u);
      }
    }
  }

  return v3;
}

+ (id)configurationFromUserInfo:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"CONFIG_BUNDLE_ID"];
  if (v4)
  {
    v5 = [v3 objectForKeyedSubscript:@"CONFIG_LAUNCH_INFO_DATA"];
    if (v5)
    {
      id v15 = 0;
      id v6 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v15];
      id v7 = v15;
      if (v7)
      {
        v8 = +[TFLogConfiguration defaultConfiguration];
        id v9 = [v8 generatedLogger];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = objc_opt_class();
          id v11 = v10;
          objc_super v12 = [v7 localizedDescription];
          *(_DWORD *)buf = 138543874;
          id v17 = v10;
          __int16 v18 = 2114;
          v19 = v4;
          __int16 v20 = 2112;
          v21 = v12;
          _os_log_impl(&dword_223064000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode launch info. error = %@", buf, 0x20u);
        }
      }
    }
    else
    {
      id v6 = 0;
    }
    id v13 = [[TFBetaLaunchHandleConfiguration alloc] initWithBundleIdentifier:v4 preloadingLaunchInfo:v6];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [TFBetaLaunchHandleConfiguration alloc];
  v5 = [(TFBetaLaunchHandleConfiguration *)self bundleIdentifier];
  id v6 = [(TFBetaLaunchHandleConfiguration *)v4 initWithBundleIdentifier:v5];

  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (ASDBetaAppLaunchInfo)launchInfo
{
  return self->_launchInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchInfo, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end