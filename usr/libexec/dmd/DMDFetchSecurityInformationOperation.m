@interface DMDFetchSecurityInformationOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchSecurityInformationOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2E28;
}

- (void)runWithRequest:(id)a3
{
  id v17 = +[MCDeviceCapabilities currentDevice];
  v3 = +[MCProfileConnection sharedConnection];
  id v4 = objc_alloc((Class)DMFSecurityInformation);
  id v5 = [v17 supportsBlockLevelEncryption];
  id v6 = [v17 supportsFileLevelEncryption];
  id v7 = [v3 isPasscodeSet];
  id v8 = [v3 currentPasscodeIsCompliantWithGlobalRestrictionsOutError:0];
  id v9 = [v3 currentPasscodeIsCompliantWithProfileRestrictionsOutError:0];
  uint64_t v10 = MCFeaturePasscodeLockGraceTime;
  v11 = [v3 effectiveValueForSetting:MCFeaturePasscodeLockGraceTime];
  id v12 = [v11 unsignedIntegerValue];
  v13 = [v3 userValueForSetting:v10];
  id v14 = [v4 initWithSupportsBlockLevelEncryption:v5 supportsFileLevelEncryption:v6 passcodeIsSet:v7 passcodeIsCompliantWithGlobalRestrictions:v8 passcodeIsCompliantWithProfileRestrictions:v9 passcodeLockGracePeriodEnforced:v12 passcodeLockGracePeriod:[v13 unsignedIntegerValue]];

  id v15 = [objc_alloc((Class)DMFFetchSecurityInformationResultObject) initWithSecurityInformation:v14];
  [(DMDFetchSecurityInformationOperation *)self endOperationWithResultObject:v15];
}

@end