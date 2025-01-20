@interface DMDSetBluetoothEnabledOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)runOnMainThread;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDSetBluetoothEnabledOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D31A0;
}

- (BOOL)runOnMainThread
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v4 = [a3 enabled];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = MCStringForBool();
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting Bluetooth enabled: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  v6 = +[DMDBluetoothManager sharedManager];
  [v6 setEnabled:v4];
  [(DMDSetBluetoothEnabledOperation *)self endOperationWithResultObject:0];
}

@end