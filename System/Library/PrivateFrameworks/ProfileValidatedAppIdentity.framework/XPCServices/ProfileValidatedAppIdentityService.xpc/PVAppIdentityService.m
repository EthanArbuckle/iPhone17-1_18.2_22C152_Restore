@interface PVAppIdentityService
- (BOOL)isEntitled;
- (BOOL)isFeatureEnabled;
- (PVAppIdentityService)initWithConnection:(id)a3;
- (void)generateDigest:(id)a3 ppqAppId:(id)a4 withReply:(id)a5;
@end

@implementation PVAppIdentityService

- (PVAppIdentityService)initWithConnection:(id)a3
{
  id v5 = a3;
  v6 = [(PVAppIdentityService *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (BOOL)isFeatureEnabled
{
  return __os_feature_enabled_impl("ProfileValidatedAppIdentity", "enable_generation");
}

- (BOOL)isEntitled
{
  v2 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.private.pvappidentity.spi"];
  uint64_t v3 = isNSNumber(v2);
  if (v3 && (v4 = (void *)v3, unsigned __int8 v5 = [v2 BOOLValue], v4, (v5 & 1) != 0))
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = _PVAppIdentityLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10001902C(v7);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (void)generateDigest:(id)a3 ppqAppId:(id)a4 withReply:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  if ([(PVAppIdentityService *)self isFeatureEnabled]
    && [(PVAppIdentityService *)self isEntitled])
  {
    v10 = [[PVAppIdentityGenerator alloc] initWithApplicationURL:v12 ppqAppId:v8];
    v11 = [(PVAppIdentityGenerator *)v10 generateDigest];
    v9[2](v9, v11);
  }
  else
  {
    v10 = +[PVAppIdentityDigest digestWithErrorCode:-10000];
    v9[2](v9, v10);
  }
}

- (void).cxx_destruct
{
}

@end