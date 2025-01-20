@interface TonesUsageBundleStorageReporter
- (BOOL)allowDeletionForCategory:(id)a3;
- (BOOL)deleteDataForCategory:(id)a3 withError:(id *)a4;
- (Class)usageDetailControllerClassForUsageBundleApp:(id)a3;
- (float)sizeForCategory:(id)a3;
- (id)_localizedStringWithIdentifier:(id)a3;
- (id)usageBundleApps;
- (void)usageBundleApp:(id)a3 willDisplaySpecifier:(id *)a4;
@end

@implementation TonesUsageBundleStorageReporter

- (id)_localizedStringWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:v3 value:&stru_41C0 table:@"ToneSettingsUsage"];

  return v5;
}

- (id)usageBundleApps
{
  id v3 = +[TLToneManager sharedToneManager];
  *(float *)&double v4 = (float)(unint64_t)[v3 _installedTonesSize];
  v5 = +[PSUsageBundleApp usageBundleAppForBundleWithIdentifier:@"com.apple.ToneSettingsUsage" withTotalSize:v4];
  v6 = [(TonesUsageBundleStorageReporter *)self _localizedStringWithIdentifier:@"SOUNDS"];
  [v5 setName:v6];

  v7 = [(TonesUsageBundleStorageReporter *)self _localizedStringWithIdentifier:@"DOWNLOADED_TONES"];
  v8 = +[PSUsageBundleCategory categoryNamed:v7 withIdentifier:@"CATEGORY_DOWNLOADED_TONES" forUsageBundleApp:v5];

  v9 = +[NSArray arrayWithObject:v8];
  [v5 setCategories:v9];

  v10 = +[NSArray arrayWithObject:v5];

  return v10;
}

- (BOOL)allowDeletionForCategory:(id)a3
{
  return 0;
}

- (Class)usageDetailControllerClassForUsageBundleApp:(id)a3
{
  return (Class)objc_opt_class();
}

- (float)sizeForCategory:(id)a3
{
  id v3 = +[TLToneManager sharedToneManager];
  float v4 = (float)(unint64_t)[v3 _installedTonesSize];

  return v4;
}

- (BOOL)deleteDataForCategory:(id)a3 withError:(id *)a4
{
  return 0;
}

- (void)usageBundleApp:(id)a3 willDisplaySpecifier:(id *)a4
{
  v5 = [a3 bundleIdentifier];
  unsigned int v6 = [v5 isEqualToString:@"com.apple.ToneSettingsUsage"];

  if (v6)
  {
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v7 resourcePath];

    v8 = [v10 stringByAppendingPathComponent:@"Settings-Sound"];
    v9 = [v8 stringByAppendingPathExtension:@"png"];

    [*a4 setProperty:v9 forKey:PSBundleIconPathKey];
    [*a4 setupIconImageWithPath:v10];
  }
}

@end