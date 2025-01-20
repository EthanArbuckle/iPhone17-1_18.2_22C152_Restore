@interface COSClassicPrivacySplashController
+ (BOOL)controllerNeedsToRun;
@end

@implementation COSClassicPrivacySplashController

+ (BOOL)controllerNeedsToRun
{
  v2 = +[UIDevice currentDevice];
  unsigned int v3 = [v2 sf_isChinaRegionCellularDevice];

  v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    v7 = (void *)v6;
    CFStringRef v8 = @"Skip for non-GT";
    if (v3) {
      CFStringRef v8 = @"Show for GT";
    }
    int v10 = 138412546;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    CFStringRef v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ ~ Privacy Splash: %@ Device", (uint8_t *)&v10, 0x16u);
  }
  return v3;
}

@end