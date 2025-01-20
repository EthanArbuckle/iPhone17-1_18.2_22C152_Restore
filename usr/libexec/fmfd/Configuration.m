@interface Configuration
+ (BOOL)FMFServiceUseSSL;
+ (id)FMFServiceHost;
+ (id)FMFServiceService;
+ (id)localizedURLMapping;
+ (id)setupURL;
@end

@implementation Configuration

+ (id)setupURL
{
  return @"https://setup.icloud.com/configurations/init";
}

+ (id)FMFServiceHost
{
  return @"fmfmobile.icloud.com";
}

+ (id)FMFServiceService
{
  return @"/fmipservice/friends/fmfd/";
}

+ (BOOL)FMFServiceUseSSL
{
  return 1;
}

+ (id)localizedURLMapping
{
  return @"https://configuration.apple.com/configurations/internetservices/icloud/fmf/localizedURLs-3.0.plist";
}

@end