@interface TFLaunchScreenBuilder
+ (id)_lockupWithAppName:(id)a3 shortVersionString:(id)a4 bundleVersionString:(id)a5 expirationDate:(id)a6 iconUrlTemplate:(id)a7;
+ (id)buildLaunchScreenFromBetaAppLaunchInfo:(id)a3;
+ (id)buildLaunchScreenWithAppName:(id)a3 shortVersionString:(id)a4 bundleVersionString:(id)a5 expirationDate:(id)a6 iconUrlTemplate:(id)a7 testerNotes:(id)a8;
@end

@implementation TFLaunchScreenBuilder

+ (id)buildLaunchScreenWithAppName:(id)a3 shortVersionString:(id)a4 bundleVersionString:(id)a5 expirationDate:(id)a6 iconUrlTemplate:(id)a7 testerNotes:(id)a8
{
  id v14 = a8;
  v15 = [a1 _lockupWithAppName:a3 shortVersionString:a4 bundleVersionString:a5 expirationDate:a6 iconUrlTemplate:a7];
  v16 = (void *)[objc_alloc(NSURL) initWithString:@"https://developer.apple.com/go/?id=testflight-screenshot"];
  v17 = [[TFLaunchScreen alloc] initWithLockup:v15 testerNotes:v14 howToScreenshotSupportUrl:v16];

  return v17;
}

+ (id)buildLaunchScreenFromBetaAppLaunchInfo:(id)a3
{
  id v3 = a3;
  v4 = [v3 displayNames];
  v24 = +[TFLocale preferredLocalizedDisplayNameFromDisplayNames:v4];

  v5 = [v3 displayNames];
  uint64_t v6 = [v5 primaryLocale];

  v7 = [v3 localizedTestNotes];
  v8 = [v7 allKeys];
  v23 = (void *)v6;
  uint64_t v9 = +[TFLocale preferredLocaleKeyFromAvailableKeys:v8 primaryLocaleKey:v6];

  uint64_t v20 = v9;
  if (v9)
  {
    v10 = objc_msgSend(v3, "localizedTestNotes", v9);
    v11 = [v10 objectForKeyedSubscript:v9];
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_msgSend(v3, "version", v20);
  v13 = [v12 shortVersion];
  id v14 = [v3 version];
  v15 = [v14 bundleVersion];
  v16 = [v3 expirationDate];
  v17 = [v3 iconURLTemplate];
  v18 = [a1 buildLaunchScreenWithAppName:v24 shortVersionString:v13 bundleVersionString:v15 expirationDate:v16 iconUrlTemplate:v17 testerNotes:v11];

  return v18;
}

+ (id)_lockupWithAppName:(id)a3 shortVersionString:(id)a4 bundleVersionString:(id)a5 expirationDate:(id)a6 iconUrlTemplate:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = NSString;
  id v15 = a5;
  id v16 = a4;
  v17 = TFLocalizedString(@"LOCKUP_SUBTITLE_VERSION_PREFIX");
  v18 = [v14 stringWithFormat:@"%@ %@ (%@)", v17, v16, v15];

  [v12 timeIntervalSinceNow];
  if (v19 >= 0.0)
  {
    id v21 = objc_msgSend(v12, "tf_timeFromNow");
    if ([v21 day] < 1)
    {
      uint64_t v20 = TFLocalizedString(@"LOCKUP_SUBTITLE_EXPIRATION_TODAY");
    }
    else
    {
      uint64_t v22 = [v21 minute];
      if ([v21 hour] + v22 >= 1) {
        objc_msgSend(v21, "setDay:", objc_msgSend(v21, "day") + 1);
      }
      v23 = TFLocalizedString(@"LOCKUP_SUBTITLE_EXPIRATION_IN_X");
      v24 = NSString;
      v25 = TFLocalizedString(@"NUMBER_OF_DAYS");
      v26 = objc_msgSend(v24, "stringWithFormat:", v25, objc_msgSend(v21, "day"));

      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", v23, v26);
    }
  }
  else
  {
    uint64_t v20 = TFLocalizedString(@"LOCKUP_SUBTITLE_EXPIRATION_EXPIRED");
  }
  v27 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
  [v27 addObject:v18];
  if (v20) {
    [v27 addObject:v20];
  }
  if (v13) {
    v28 = [[TFIconArtwork alloc] initWithUrlTemplate:v13];
  }
  else {
    v28 = 0;
  }
  id v29 = v11;
  v30 = [[TFAppLockup alloc] initWithTitle:v29 subtitles:v27 iconArtwork:v28];

  return v30;
}

@end