@interface LSApplicationWorkspace
+ (void)crl_openICloudPreferencePane;
+ (void)crl_openSoftwareUpdatePane;
@end

@implementation LSApplicationWorkspace

+ (void)crl_openICloudPreferencePane
{
  +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

+ (void)crl_openSoftwareUpdatePane
{
  +[NSURL URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

@end