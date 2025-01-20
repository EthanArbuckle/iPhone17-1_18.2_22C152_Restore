@interface STXPCStoreServerRequestHandlingPolicy
- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3;
@end

@implementation STXPCStoreServerRequestHandlingPolicy

- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 entitlements];
  v5 = [v4 objectForKeyedSubscript:@"com.apple.private.screen-time.persistence"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v5 BOOLValue])
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = +[STLog persistence];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100268F64((uint64_t)v3, v7);
    }

    BOOL v6 = 0;
  }
  if (_os_feature_enabled_impl()
    && !+[Migration isReady])
  {
    v8 = +[STLog persistence];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100268EEC((uint64_t)v3, v8);
    }

    BOOL v6 = 0;
  }

  return v6;
}

@end