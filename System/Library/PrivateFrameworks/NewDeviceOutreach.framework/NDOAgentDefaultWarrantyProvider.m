@interface NDOAgentDefaultWarrantyProvider
- (BOOL)isSignedInToiCloud;
- (NDOAgentDefaultWarrantyProvider)initWithCallingProcessBundleID:(id)a3;
- (double)cachedWarrantyValidityDurationForSerialNumber:(id)a3;
- (id)cachedWarrantyForSerialNumber:(id)a3;
- (id)cachedWarrantyLocaleForSerialNumber:(id)a3;
- (id)cachedWarrantyVersionForSerialNumber:(id)a3;
- (id)lastUpdatedDateForSerialNumber:(id)a3;
- (id)migrateLegacyCachedWarrantyIfNeededForSerialNumber:(id)a3;
- (id)refreshAllFollowupsWithDeviceInfos:(id)a3;
- (id)refreshFollowupWithDeviceInfo:(id)a3 andForcePostFollowup:(BOOL)a4;
- (id)refreshFollowupWithDeviceInfos:(id)a3;
- (int)migrationVersion;
- (void)dismissFollowUpForSerialNumber:(id)a3;
- (void)dismissNotificationForSerialNumber:(id)a3;
- (void)downloadWarrantyForSerialNumber:(id)a3 sessionID:(id)a4 params:(id)a5 completionHandler:(id)a6;
- (void)migrateLegacyFollowUpIfNeededWithDeviceInfo:(id)a3;
- (void)setMigrationVersion:(int)a3;
@end

@implementation NDOAgentDefaultWarrantyProvider

- (NDOAgentDefaultWarrantyProvider)initWithCallingProcessBundleID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NDOAgentDefaultWarrantyProvider;
  v6 = [(NDOAgentDefaultWarrantyProvider *)&v9 init];
  if (v6)
  {
    v7 = _NDOLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10001203C((uint64_t)v5, v7);
    }

    objc_storeStrong((id *)&v6->_callingProcessBundleID, a3);
  }

  return v6;
}

- (id)cachedWarrantyForSerialNumber:(id)a3
{
  return +[NDOWarranty cachedWarrantyForSerialNumber:a3];
}

- (void)downloadWarrantyForSerialNumber:(id)a3 sessionID:(id)a4 params:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[NDOWarrantyDownloader alloc] initWithCallingProcessBundleID:self->_callingProcessBundleID];
  [(NDOWarrantyDownloader *)v14 downloadWarrantyForSerialNumber:v13 sessionID:v12 params:v11 completionHandler:v10];
}

- (id)refreshFollowupWithDeviceInfos:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = [v4 refreshFollowupWithDeviceInfos:v3 andForcePostFollowup:0];

  return v5;
}

- (id)refreshAllFollowupsWithDeviceInfos:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = [v4 refreshALLFollowupsWithDeviceInfos:v3 andForcePostFollowup:0];

  return v5;
}

- (id)refreshFollowupWithDeviceInfo:(id)a3 andForcePostFollowup:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = [v6 refreshFollowupWithDeviceInfo:v5 andForcePostFollowup:v4];

  return v7;
}

- (void)dismissFollowUpForSerialNumber:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_opt_new();
  [v4 dismissFollowUpForSerialNumber:v3];
}

- (void)dismissNotificationForSerialNumber:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_opt_new();
  [v4 dismissNotificationForSerialNumber:v3];
}

- (id)lastUpdatedDateForSerialNumber:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v3 sha256Hash];

  v6 = +[NSString stringWithFormat:@"%@_CachedWarrantyLastUpdatedDate", v5];
  v7 = [v4 objectForKey:v6];

  return v7;
}

- (id)cachedWarrantyLocaleForSerialNumber:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v3 sha256Hash];

  v6 = +[NSString stringWithFormat:@"%@_CachedWarrantyLocale", v5];
  v7 = [v4 objectForKey:v6];

  return v7;
}

- (id)cachedWarrantyVersionForSerialNumber:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v3 sha256Hash];

  v6 = +[NSString stringWithFormat:@"%@_CachedWarrantyVersion", v5];
  v7 = [v4 objectForKey:v6];

  return v7;
}

- (double)cachedWarrantyValidityDurationForSerialNumber:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v3 sha256Hash];

  v6 = +[NSString stringWithFormat:@"%@_CachedWarrantyValidityDuration", v5];
  v7 = [v4 objectForKey:v6];
  [v7 doubleValue];
  double v9 = v8;

  double result = 86400.0;
  if (v9 > 0.0) {
    return v9;
  }
  return result;
}

- (BOOL)isSignedInToiCloud
{
  v2 = objc_opt_new();
  id v3 = objc_msgSend(v2, "aida_accountForPrimaryiCloudAccount");
  BOOL v4 = v3 != 0;

  return v4;
}

- (int)migrationVersion
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"NDOMigrationVersion"];
  int v4 = [v3 intValue];

  return v4;
}

- (void)setMigrationVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  int v4 = +[NSNumber numberWithInt:v3];
  [v5 setObject:v4 forKey:@"NDOMigrationVersion"];
}

- (id)migrateLegacyCachedWarrantyIfNeededForSerialNumber:(id)a3
{
  return +[NDOWarranty migrateLegacyCachedWarrantyIfNeededForSerialNumber:a3];
}

- (void)migrateLegacyFollowUpIfNeededWithDeviceInfo:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_opt_new();
  [v4 migrateLegacyFollowUpIfNeededWithDeviceInfo:v3];
}

- (void).cxx_destruct
{
}

@end