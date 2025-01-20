@interface SDPommesFeature
+ (BOOL)isCalendarBundle:(id)a3;
+ (BOOL)isEventsBundle:(id)a3;
+ (BOOL)isMailBundle:(id)a3;
+ (BOOL)isMessagesBundle:(id)a3;
+ (BOOL)isPhotosBundle:(id)a3;
+ (BOOL)isRemindersBundle:(id)a3;
+ (BOOL)isSafariBundle:(id)a3;
+ (BOOL)isSearchCLIBundle:(id)a3;
+ (BOOL)isSearchToolClientBundle:(id)a3;
+ (BOOL)purePommesL2RankingAllowedWithSectionBundle:(id)a3 clientBundle:(id)a4;
+ (BOOL)usingPommesRankingForClientBundle:(id)a3;
+ (BOOL)usingRewritesForContextBundleIDs:(id)a3 clientBundleID:(id)a4 userQuery:(id)a5 indexSupportsRewrites:(BOOL)a6 isCounting:(BOOL)a7 embeddingsEnabled:(BOOL)a8;
+ (id)allBundleIDsUsingPommesRankingSearchTool;
+ (id)baseBundleIDs;
@end

@implementation SDPommesFeature

+ (BOOL)isSearchCLIBundle:(id)a3
{
  return [a3 isEqualToString:@"com.apple.search"];
}

+ (BOOL)isMailBundle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.mobilemail"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"com.apple.pommesctl"];
  }

  return v4;
}

+ (BOOL)isPhotosBundle:(id)a3
{
  return [a3 isEqualToString:@"com.apple.mobileslideshow"];
}

+ (BOOL)isSafariBundle:(id)a3
{
  return [a3 isEqualToString:@"com.apple.mobilesafari"];
}

+ (BOOL)isCalendarBundle:(id)a3
{
  return [a3 isEqualToString:@"com.apple.mobilecal"];
}

+ (BOOL)isMessagesBundle:(id)a3
{
  return [a3 isEqualToString:@"com.apple.MobileSMS"];
}

+ (BOOL)isRemindersBundle:(id)a3
{
  return [a3 isEqualToString:@"com.apple.reminders"];
}

+ (BOOL)isEventsBundle:(id)a3
{
  return [a3 isEqualToString:@"com.apple.spotlight.events"];
}

+ (BOOL)isSearchToolClientBundle:(id)a3
{
  id v3 = a3;
  if (isSearchToolClientBundle__onceToken != -1) {
    dispatch_once(&isSearchToolClientBundle__onceToken, &__block_literal_global_8);
  }
  if (isSearchToolClientBundle__isSearchToolRanking)
  {
    if (([v3 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
      || ([v3 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
    {
      char v4 = 1;
    }
    else
    {
      char v4 = [v3 hasPrefix:@"com.apple.ondeviceeval"];
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

uint64_t __44__SDPommesFeature_isSearchToolClientBundle___block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  isSearchToolClientBundle__isSearchToolRanking = result;
  return result;
}

+ (BOOL)usingPommesRankingForClientBundle:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.mobilemail"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.pommesctl"] & 1) != 0)
  {
    goto LABEL_3;
  }
  if (([v3 isEqualToString:@"com.apple.mobilesafari"] & 1) != 0
    || ([v3 isEqualToString:@"com.argos.BlendABApp2"] & 1) != 0)
  {
LABEL_7:
    char v4 = _os_feature_enabled_impl();
    goto LABEL_4;
  }
  if (([v3 isEqualToString:@"com.apple.mobileslideshow"] & 1) == 0
    && ([v3 isEqualToString:@"com.apple.mobilecal"] & 1) == 0
    && ([v3 isEqualToString:@"com.apple.MobileSMS"] & 1) == 0)
  {
    if (([v3 isEqualToString:@"com.apple.mobilenotes"] & 1) == 0
      && ![v3 isEqualToString:@"com.apple.reminders"])
    {
      char v4 = 0;
      goto LABEL_4;
    }
    goto LABEL_7;
  }
LABEL_3:
  char v4 = 1;
LABEL_4:

  return v4;
}

+ (BOOL)usingRewritesForContextBundleIDs:(id)a3 clientBundleID:(id)a4 userQuery:(id)a5 indexSupportsRewrites:(BOOL)a6 isCounting:(BOOL)a7 embeddingsEnabled:(BOOL)a8
{
  BOOL v8 = a8;
  int v9 = a7;
  BOOL v10 = a6;
  id v13 = a3;
  id v14 = a5;
  BOOL v15 = +[SDPommesFeature isMailBundle:a4];
  BOOL v16 = v15;
  if (v8 && !v15 || (unint64_t)[v14 length] > 0x1D) {
    goto LABEL_8;
  }
  if (![v13 count]) {
    goto LABEL_10;
  }
  v17 = [v13 objectAtIndexedSubscript:0];
  if ([v17 isEqualToString:@"com.apple.mobileslideshow"])
  {
    LOBYTE(v18) = 0;
LABEL_12:

    goto LABEL_9;
  }
  v19 = [v13 objectAtIndexedSubscript:0];
  char v20 = [v19 isEqualToString:@"com.apple.mobilesafari"];

  if (v20)
  {
LABEL_8:
    LOBYTE(v18) = 0;
  }
  else
  {
LABEL_10:
    int v18 = v10 & ~v9;
    if ((v18 & v16) == 1)
    {
      v17 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
      LOBYTE(v18) = [v14 rangeOfCharacterFromSet:v17] == 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_12;
    }
  }
LABEL_9:

  return v18;
}

+ (BOOL)purePommesL2RankingAllowedWithSectionBundle:(id)a3 clientBundle:(id)a4
{
  return 0;
}

+ (id)baseBundleIDs
{
  if (baseBundleIDs_onceToken != -1) {
    dispatch_once(&baseBundleIDs_onceToken, &__block_literal_global_74);
  }
  v2 = (void *)baseBundleIDs_pommesBundles;

  return v2;
}

void __32__SDPommesFeature_baseBundleIDs__block_invoke()
{
  v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", @"com.apple.mobilemail", @"com.apple.pommesctl", @"com.apple.mobilecal", @"com.apple.mobileslideshow", @"com.apple.mobilenotes", @"com.apple.MobileSMS", 0);
  if (_os_feature_enabled_impl())
  {
    [v2 addObject:@"com.apple.mobilesafari"];
    [v2 addObject:@"com.argos.BlendABApp2"];
  }
  if (_os_feature_enabled_impl()) {
    [v2 addObject:@"com.apple.reminders"];
  }
  if (_os_feature_enabled_impl()) {
    [v2 addObject:@"com.apple.spotlight.events"];
  }
  [v2 addObject:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
  [v2 addObject:@"com.apple.CloudDocs.iCloudDriveFileProvider"];
  [v2 addObject:@"com.apple.FileProvider.LocalStorage"];
  uint64_t v0 = [v2 copy];
  v1 = (void *)baseBundleIDs_pommesBundles;
  baseBundleIDs_pommesBundles = v0;
}

+ (id)allBundleIDsUsingPommesRankingSearchTool
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SDPommesFeature_allBundleIDsUsingPommesRankingSearchTool__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allBundleIDsUsingPommesRankingSearchTool_onceToken != -1) {
    dispatch_once(&allBundleIDsUsingPommesRankingSearchTool_onceToken, block);
  }
  v2 = (void *)allBundleIDsUsingPommesRankingSearchTool_pommesBundlesSearchTool;

  return v2;
}

void __59__SDPommesFeature_allBundleIDsUsingPommesRankingSearchTool__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) baseBundleIDs];
  id v4 = (id)[v1 mutableCopy];

  [v4 addObject:@"com.apple.Passbook"];
  [v4 addObject:@"com.apple.VoiceMemos"];
  [v4 addObject:@"com.apple.mobilephone"];
  [v4 addObject:@"com.apple.freeform"];
  [v4 addObject:@"com.apple.journal"];
  uint64_t v2 = [v4 copy];
  id v3 = (void *)allBundleIDsUsingPommesRankingSearchTool_pommesBundlesSearchTool;
  allBundleIDsUsingPommesRankingSearchTool_pommesBundlesSearchTool = v2;
}

@end