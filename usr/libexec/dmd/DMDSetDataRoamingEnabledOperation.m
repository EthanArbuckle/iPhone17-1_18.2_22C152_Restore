@interface DMDSetDataRoamingEnabledOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDSetDataRoamingEnabledOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D31B8;
}

- (void)runWithRequest:(id)a3
{
  id v4 = [a3 enabled];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = MCStringForBool();
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting data roaming enabled: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  if (v4) {
    +[DMDCoreTelephonyUtilities setVoiceRoamingEnabled:1];
  }
  +[DMDCoreTelephonyUtilities setDataRoamingEnabled:v4];
  [(DMDSetDataRoamingEnabledOperation *)self endOperationWithResultObject:0];
}

@end