@interface ULServerEntitlements
+ (BOOL)_checkEntitlement:(id)a3 forConnection:(id)a4;
+ (BOOL)allowConnection:(id)a3;
+ (BOOL)allowPrivateDataAccess:(id)a3;
@end

@implementation ULServerEntitlements

+ (BOOL)allowConnection:(id)a3
{
  return [a1 _checkEntitlement:@"com.apple.microlocation.connection" forConnection:a3];
}

+ (BOOL)allowPrivateDataAccess:(id)a3
{
  return [a1 _checkEntitlement:@"com.apple.microlocation.private_info" forConnection:a3];
}

+ (BOOL)_checkEntitlement:(id)a3 forConnection:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  char v7 = [v6 hasBooleanEntitlement:v5];
  if ((v7 & 1) == 0)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_72);
    }
    v8 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      v10 = [v6 signingIdentity];
      int v12 = 138412546;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_ERROR, "Missing entitlement: %@ is missing required entitlement: %@, rejecting connection.", (uint8_t *)&v12, 0x16u);
    }
  }

  return v7;
}

@end