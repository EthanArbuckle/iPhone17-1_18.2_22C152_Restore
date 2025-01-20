@interface TCCDPlatformIOSFamily
- (BOOL)isChinaSKUDevice;
- (BOOL)isNonAppBundleIdentifierValid:(id)a3;
- (BOOL)removalOfAppBundleIdentifierRequiresPruning:(id)a3;
- (id)homeRelativePathToStateDirectory;
- (id)prefixOfBundleIdentifiersToResetAfterResetOfAppBundleIdentifier:(id)a3;
- (void)prepareForAbort;
@end

@implementation TCCDPlatformIOSFamily

- (BOOL)isChinaSKUDevice
{
  if (qword_1000AC628 != -1) {
    dispatch_once(&qword_1000AC628, &stru_100095DD8);
  }
  return byte_1000AC620;
}

- (id)homeRelativePathToStateDirectory
{
  return @"Library/TCC";
}

- (void)prepareForAbort
{
  v2 = +[TCCDPlatform currentPlatform];
  v3 = [v2 syncController];

  if (v3)
  {
    id v5 = +[TCCDPlatform currentPlatform];
    v4 = [v5 syncController];
    [v4 willShutdown];
  }
}

- (BOOL)isNonAppBundleIdentifierValid:(id)a3
{
  id v4 = a3;
  id v5 = [(TCCDPlatform *)self server];
  if ([v5 allowsInternalSecurityPolicies])
  {
    unsigned int v6 = [v4 hasPrefix:@"com.appleinternal.health.Lime."];

    if (v6)
    {
      CFStringRef v7 = @"com.appleinternal.health.Lime";
      goto LABEL_7;
    }
  }
  else
  {
  }
  if (![v4 hasPrefix:@"com.apple.Research.study."])
  {
    unsigned __int8 v11 = 0;
    goto LABEL_12;
  }
  CFStringRef v7 = @"com.apple.Research";
LABEL_7:
  v8 = +[LSApplicationProxy applicationProxyForIdentifier:v7];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 appState];
    unsigned __int8 v11 = [v10 isInstalled];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

LABEL_12:
  return v11;
}

- (BOOL)removalOfAppBundleIdentifierRequiresPruning:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.Research"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned int v6 = [(TCCDPlatform *)self server];
    if ([v6 allowsInternalSecurityPolicies]) {
      unsigned __int8 v5 = [v4 isEqualToString:@"com.appleinternal.health.Lime"];
    }
    else {
      unsigned __int8 v5 = 0;
    }
  }
  return v5;
}

- (id)prefixOfBundleIdentifiersToResetAfterResetOfAppBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.Research"]) {
    goto LABEL_4;
  }
  unsigned __int8 v5 = [(TCCDPlatform *)self server];
  if (([v5 allowsInternalSecurityPolicies] & 1) == 0)
  {

    goto LABEL_6;
  }
  unsigned int v6 = [v4 isEqualToString:@"com.appleinternal.health.Lime"];

  if (!v6)
  {
LABEL_6:
    CFStringRef v7 = 0;
    goto LABEL_7;
  }
LABEL_4:
  CFStringRef v7 = @"com.apple.Research.study.";
LABEL_7:

  return (id)v7;
}

@end