@interface RMMDMv1Liaison
+ (BOOL)isEnrolledInMDMv1;
+ (BOOL)isEnrollmentInMDMv1Restricted;
+ (void)_didEnroll:(BOOL)a3;
+ (void)refreshState;
+ (void)remoteManagementDidEnroll;
+ (void)remoteManagementDidUnenroll;
@end

@implementation RMMDMv1Liaison

+ (BOOL)isEnrolledInMDMv1
{
  v2 = +[MCProfileConnection sharedConnection];
  v3 = [v2 installedMDMProfileIdentifier];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (BOOL)isEnrollmentInMDMv1Restricted
{
  v2 = +[MCProfileConnection sharedConnection];
  BOOL v3 = [v2 BOOLRestrictionForFeature:MCFeatureMDMEnrollmentAllowed] == 2;

  return v3;
}

+ (void)remoteManagementDidEnroll
{
}

+ (void)remoteManagementDidUnenroll
{
}

+ (void)_didEnroll:(BOOL)a3
{
  if (a3)
  {
    BOOL v3 = objc_opt_new();
    [v3 MCSetBoolRestriction:MCFeatureMDMEnrollmentAllowed value:0];
  }
  else
  {
    BOOL v3 = 0;
  }
  BOOL v4 = +[MCProfileConnection sharedConnection];
  id v8 = 0;
  unsigned __int8 v5 = [v4 applyRestrictionDictionary:v3 clientType:@"com.apple.remotemanagementd" clientUUID:@"com.apple.RemoteManagement.MDMv1Liaison" localizedClientDescription:0 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0)
  {
    v7 = +[RMLog mdmv1Liaison];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100050C3C((uint64_t)v3, (uint64_t)v6, v7);
    }
  }
}

+ (void)refreshState
{
  v2 = +[RMLog mdmv1Liaison];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100050CC4(v2);
  }

  BOOL v3 = +[RMManagedDevice currentManagedDevice];
  [v3 refreshState];
}

@end