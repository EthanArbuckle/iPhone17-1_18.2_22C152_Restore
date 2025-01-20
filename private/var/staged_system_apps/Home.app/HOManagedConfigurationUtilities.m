@interface HOManagedConfigurationUtilities
+ (BOOL)isProfileInstallationUIAllowed;
+ (id)popProfileDataFromHeadOfInstallationQueue;
@end

@implementation HOManagedConfigurationUtilities

+ (BOOL)isProfileInstallationUIAllowed
{
  v2 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v3 = [v2 isProfileUIInstallationAllowed];

  if ((v3 & 1) == 0)
  {
    v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "+[HOManagedConfigurationUtilities isProfileInstallationUIAllowed]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%s) profile UI Installation is not allowed", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

+ (id)popProfileDataFromHeadOfInstallationQueue
{
  v2 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v3 = [v2 popProfileDataFromHeadOfInstallationQueue];

  if (!v3)
  {
    v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000837A4(v4);
    }
  }

  return v3;
}

@end