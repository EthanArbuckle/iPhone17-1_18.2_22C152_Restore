@interface LSApplicationRecord
+ (id)csd_applicationRecordForApplicationIdentifier:(id)a3;
+ (id)csd_applicationRecordForBundleIdentifier:(id)a3;
- (BOOL)csd_hasPTTBackgroundMode;
- (BOOL)csd_hasPTTSelfAddEntitlement;
- (BOOL)csd_hasVoIPBackgroundMode;
- (BOOL)csd_hasVoIPNetworkExtensionEntitlement;
@end

@implementation LSApplicationRecord

+ (id)csd_applicationRecordForApplicationIdentifier:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  v4 = +[LSBundleRecord bundleRecordWithApplicationIdentifier:v3 error:&v9];
  id v5 = v9;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v4;
  }
  else
  {
    if (v5)
    {
      v7 = sub_100008DCC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1003ACEE4();
      }
    }
    id v6 = 0;
  }

  return v6;
}

+ (id)csd_applicationRecordForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v8 = 0;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    id v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1003ACF4C();
    }
  }

  return v4;
}

- (BOOL)csd_hasVoIPBackgroundMode
{
  return sub_1001398C8(self, @"voip");
}

- (BOOL)csd_hasPTTBackgroundMode
{
  return sub_1001398C8(self, @"push-to-talk");
}

- (BOOL)csd_hasPTTSelfAddEntitlement
{
  v2 = [(LSApplicationRecord *)self entitlements];
  id v3 = [v2 objectForKey:@"com.apple.developer.push-to-talk" ofClass:objc_opt_class()];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)csd_hasVoIPNetworkExtensionEntitlement
{
  v2 = [(LSApplicationRecord *)self entitlements];
  uint64_t v3 = objc_opt_class();
  unsigned __int8 v4 = [v2 objectForKey:@"com.apple.developer.networking.networkextension" ofClass:v3 valuesOfClass:objc_opt_class()];

  if (v4) {
    unsigned __int8 v5 = [v4 containsObject:@"app-push-provider"];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

@end