@interface MSDProvisioningProfilePrepareOperation
- (BOOL)_determineAppInstallNecessity;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDProvisioningProfilePrepareOperation

- (id)methodSelectors
{
  if (+[MSDOperationContext downloadOnly])
  {
    v2 = objc_opt_new();
  }
  else
  {
    v3 = +[NSValue valueWithPointer:"_determineAppInstallNecessity"];
    v4 = +[NSValue valueWithPointer:"_prepareStagingArea"];
    v2 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v4, 0);
  }

  return v2;
}

- (int64_t)type
{
  return 1;
}

- (BOOL)_determineAppInstallNecessity
{
  v3 = [(MSDOperation *)self context];
  v4 = [v3 identifier];

  if (+[MSDProvisioningProfileUtils isProvisioningProfileInstalled:v4])
  {
    v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Provisioning profile with UUID already installed: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    [(MSDOperation *)self setSkipped:1];
  }

  return 1;
}

@end