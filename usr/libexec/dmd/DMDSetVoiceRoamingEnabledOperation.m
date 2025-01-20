@interface DMDSetVoiceRoamingEnabledOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDSetVoiceRoamingEnabledOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3290;
}

- (void)runWithRequest:(id)a3
{
  id v4 = [a3 enabled];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = MCStringForBool();
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting voice roaming enabled: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  if ((v4 & 1) == 0) {
    +[DMDCoreTelephonyUtilities setDataRoamingEnabled:0];
  }
  +[DMDCoreTelephonyUtilities setVoiceRoamingEnabled:v4];
  [(DMDSetVoiceRoamingEnabledOperation *)self endOperationWithResultObject:0];
}

@end