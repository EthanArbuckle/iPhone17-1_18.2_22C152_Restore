@interface SPDomainManager
+ (id)defaultManager;
+ (void)initialize;
- (BOOL)siriSuggestionsEnabled;
- (id)getBundleIdForDomainNumber:(id)a3;
- (void)_removeAllDomainsForDisplayIdentifier:(id)a3;
- (void)registerApplication:(id)a3 withCategories:(id)a4;
@end

@implementation SPDomainManager

- (void)_removeAllDomainsForDisplayIdentifier:(id)a3
{
  id v9 = a3;
  v3 = [MEMORY[0x263EFF980] arrayWithArray:MEMORY[0x263EFFA68]];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = v4 - 1;
    do
    {
      v6 = [v3 objectAtIndex:v5];
      v7 = [v6 objectForKey:@"SPDisplayIdentifier"];
      int v8 = [v7 isEqualToString:v9];

      if (v8) {
        [v3 removeObjectAtIndex:v5];
      }

      --v5;
    }
    while (v5 != -1);
  }
}

- (id)getBundleIdForDomainNumber:(id)a3
{
  return (id)[(id)__SPNativeSearchDomainToBundleIdMapping objectForKey:a3];
}

- (void)registerApplication:(id)a3 withCategories:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v17 = self;
  [(SPDomainManager *)self _removeAllDomainsForDisplayIdentifier:v6];
  int v8 = [MEMORY[0x263EFF980] arrayWithArray:MEMORY[0x263EFFA68]];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v6, @"SPDisplayIdentifier", *(void *)(*((void *)&v18 + 1) + 8 * v13), @"SPCategory", 0);
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v11);
  }

  v15 = SPLogForSPLogCategoryDefault();
  os_log_type_t v16 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v15, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_21E5D7000, v15, v16, "Installed application domains %@ for %@", buf, 0x16u);
  }

  [(SPDomainManager *)v17 notifyIndexer];
}

- (BOOL)siriSuggestionsEnabled
{
  return __siriSuggestionsEnabled;
}

+ (void)initialize
{
  v10[26] = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    v3 = objc_alloc_init(SPDomainManager);
    uint64_t v4 = (void *)__defaultManager;
    __defaultManager = (uint64_t)v3;

    v9[0] = &unk_26CF8F2A8;
    v9[1] = &unk_26CF8F320;
    v10[0] = @"com.apple.other";
    v10[1] = @"com.apple.MobileAddressBook";
    v9[2] = &unk_26CF8F2C0;
    v9[3] = &unk_26CF8F2D8;
    v10[2] = @"com.apple.mobilemail";
    v10[3] = @"com.apple.application";
    v9[4] = &unk_26CF8F380;
    v9[5] = &unk_26CF8F2F0;
    v10[4] = @"com.apple.mobilenotes";
    v10[5] = @"com.apple.Music";
    v9[6] = &unk_26CF8F338;
    v9[7] = &unk_26CF8F3B0;
    v10[6] = @"com.apple.podcasts";
    v10[7] = @"com.apple.videos";
    v9[8] = &unk_26CF8F308;
    v9[9] = &unk_26CF8F350;
    v10[8] = @"com.apple.ibooks";
    v10[9] = @"com.apple.mobilecal";
    v9[10] = &unk_26CF8F368;
    v9[11] = &unk_26CF8F3C8;
    v10[10] = @"com.apple.bookmarks";
    v10[11] = @"com.apple.VoiceMemos";
    v9[12] = &unk_26CF8F3E0;
    v9[13] = &unk_26CF8F3F8;
    v10[12] = @"com.apple.reminders";
    v10[13] = @"com.apple.document";
    v9[14] = &unk_26CF8F410;
    v9[15] = &unk_26CF8F290;
    v10[14] = @"com.apple.clouddocument";
    v10[15] = @"com.apple.parsec";
    v9[16] = &unk_26CF8F398;
    v9[17] = &unk_26CF8F428;
    v10[16] = @"com.apple.websearch";
    v10[17] = @"com.apple.Preferences";
    v9[18] = &unk_26CF8F440;
    v9[19] = &unk_26CF8F278;
    v10[18] = @"com.apple.psuedocontact";
    v10[19] = @"com.apple.corespotlight";
    v9[20] = &unk_26CF8F458;
    v9[21] = &unk_26CF8F470;
    v10[20] = @"com.apple.Maps";
    v10[21] = @"com.apple.calculation";
    v9[22] = &unk_26CF8F488;
    v9[23] = &unk_26CF8F4A0;
    v10[22] = @"com.apple.conversions";
    v10[23] = @"com.apple.mobilesafari";
    v9[24] = &unk_26CF8F4B8;
    v9[25] = &unk_26CF8F278;
    v10[24] = @"com.apple.MobileSMS";
    v10[25] = @"com.apple.zkws";
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:26];
    id v6 = (void *)__SPNativeSearchDomainToBundleIdMapping;
    __SPNativeSearchDomainToBundleIdMapping = v5;

    id v7 = SPGetDisabledDomainSet();
    __siriSuggestionsEnabled = [v7 containsObject:@"DOMAIN_ZKWS"] ^ 1;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_userPrefsChanged, @"com.apple.spotlightui.prefschanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

+ (id)defaultManager
{
  return (id)__defaultManager;
}

@end