@interface FudUtilities
+ (BOOL)isFirstLaunchSinceBoot;
+ (BOOL)logFudAggd:(id)a3 status:(id)a4 info:(id)a5 value:(int64_t)a6;
+ (BOOL)postNotification:(id)a3;
+ (BOOL)shouldDefaultModalClientBeEnabled;
+ (id)copyPluginAtURL:(id)a3 forFilter:(id)a4 delegate:(id)a5 info:(id *)a6 options:(id)a7 bundleVersion:(id *)a8;
+ (id)getLocalizedString:(id)a3 withBundle:(id)a4 defaultValue:(id)a5;
+ (id)getStringFromBundleLocalizationTable:(id)a3 withBundle:(id)a4 inLocalization:(id)a5 fromTable:(id)a6;
+ (id)getURLForServiceIdentifier:(id)a3;
@end

@implementation FudUtilities

+ (id)copyPluginAtURL:(id)a3 forFilter:(id)a4 delegate:(id)a5 info:(id *)a6 options:(id)a7 bundleVersion:(id *)a8
{
  if (a3)
  {
    v13 = +[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:");
    id v14 = [a7 mutableCopy];
    v15 = [(NSBundle *)v13 bundleIdentifier];
    FudLog();
    FudLog();
    objc_msgSend(v14, "setObject:forKey:", v15, @"AUServiceName", a4, a5, a7);
    FudLog();
    v16 = -[AUServiceShim initWithDeviceClass:delegate:info:options:]([AUServiceShim alloc], "initWithDeviceClass:delegate:info:options:", a4, a5, a6, v14, v15, a4, a5, a7);
    if (!v16)
    {
      if (([0 conformsToProtocol:&OBJC_PROTOCOL___FudPlugin] & 1) == 0)
      {
        FudLog();
        v16 = 0;
        goto LABEL_7;
      }
      v16 = (AUServiceShim *)[[0 alloc] initWithDeviceClass:a4 delegate:a5 info:a6 options:a7];
      if (!v16)
      {
        FudLog();
        goto LABEL_7;
      }
    }
    if (a8) {
      *a8 = [(NSDictionary *)[(NSBundle *)v13 infoDictionary] objectForKey:kCFBundleVersionKey];
    }
  }
  else
  {
    v16 = 0;
    id v14 = 0;
  }
LABEL_7:

  return v16;
}

+ (id)getURLForServiceIdentifier:(id)a3
{
  v4 = +[NSURL fileURLWithPath:@"/System/Library/PrivateFrameworks/MobileAccessoryUpdater.framework/XPCServices/"];
  if (!v4) {
    return 0;
  }
  v5 = [+[NSFileManager defaultManager] enumeratorAtURL:v4 includingPropertiesForKeys:0 options:1 errorHandler:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(NSDirectoryEnumerator *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6)
  {
LABEL_10:
    FudLog();
    return 0;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_4:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(v5);
    }
    v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if ([(NSString *)[+[NSBundle bundleWithURL:v10] bundleIdentifier] isEqualToString:a3])
    {
      break;
    }
    if (v7 == (id)++v9)
    {
      id v7 = [(NSDirectoryEnumerator *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  if (!v10) {
    goto LABEL_10;
  }
  return v10;
}

+ (BOOL)postNotification:(id)a3
{
  FudLog();
  uint32_t v4 = notify_post((const char *)objc_msgSend(a3, "cStringUsingEncoding:", 4, a3));
  if (v4) {
    FudLog();
  }
  return v4 == 0;
}

+ (BOOL)shouldDefaultModalClientBeEnabled
{
  return 1;
}

+ (BOOL)logFudAggd:(id)a3 status:(id)a4 info:(id)a5 value:(int64_t)a6
{
  if (a5) {
    CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"com.apple.MobileAccessoryUpdater.%@.%@.%@", a4, a3, a5);
  }
  else {
    CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"com.apple.MobileAccessoryUpdater.%@.%@", a4, a3);
  }
  CFStringRef v7 = v6;
  if (v6)
  {
    ADClientAddValueForScalarKey();
    CFRelease(v7);
  }
  return 1;
}

+ (BOOL)isFirstLaunchSinceBoot
{
  if (qword_100096380 != -1) {
    dispatch_once(&qword_100096380, &stru_10007D8B0);
  }
  return byte_100096378;
}

+ (id)getStringFromBundleLocalizationTable:(id)a3 withBundle:(id)a4 inLocalization:(id)a5 fromTable:(id)a6
{
  id result = +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", [a4 pathForResource:a6 ofType:@"strings" inDirectory:0 forLocalization:a5]);
  if (result)
  {
    return [result objectForKey:a3];
  }
  return result;
}

+ (id)getLocalizedString:(id)a3 withBundle:(id)a4 defaultValue:(id)a5
{
  id v5 = [a4 localizedStringForKey:a3 value:a5 table:@"Localizable"];
  [v5 UTF8String];
  FudLog();
  return v5;
}

@end