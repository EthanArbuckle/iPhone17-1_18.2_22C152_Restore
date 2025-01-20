@interface ICQMLBiomePublisher
+ (id)_createEventWithMlServerScore:(id)a3 totalQuota:(id)a4 totalUsed:(id)a5 totalAvailable:(id)a6 bundleQuotaInBytes:(id)a7 commerceQuotaInBytes:(id)a8 iCloudSubscriptionEventType:(int)a9 displayEntry:(int)a10;
+ (id)_createEventWithQuotaInfoFrom:(id)a3 withType:(int)a4;
+ (void)_publishEvent:(id)a3;
+ (void)publishEventWithFetchOffersResponse:(id)a3;
+ (void)publishEventWithPushNotification:(id)a3;
+ (void)publishEventWithRefreshOfferDetailsResponse:(id)a3;
+ (void)publishOfferBuyActionEvent;
+ (void)publishOfferDisplayActionEvent;
+ (void)publishOfferDisplayActionEventWithBundleId:(id)a3;
@end

@implementation ICQMLBiomePublisher

+ (id)_createEventWithMlServerScore:(id)a3 totalQuota:(id)a4 totalUsed:(id)a5 totalAvailable:(id)a6 bundleQuotaInBytes:(id)a7 commerceQuotaInBytes:(id)a8 iCloudSubscriptionEventType:(int)a9 displayEntry:(int)a10
{
  v15 = (objc_class *)MEMORY[0x1E4F501A0];
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = [v15 alloc];
  char v23 = objc_opt_respondsToSelector();

  v24 = _ICQGetLogSystem();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (v25)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v24, OS_LOG_TYPE_DEFAULT, "[SUBD] New BiomeLibrary detected. Adding displayEntry parameter.", buf, 2u);
    }

    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F501A0]) initWithMlServerScore:v21 totalQuota:v20 totalUsed:v19 totalAvailable:v18 bundleQuotaInBytes:v17 commerceQuotaInBytes:v16 iCloudSubscriptionEventType:__PAIR64__(a10 displayEntry:a9)];
  }
  else
  {
    if (v25)
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_1D5851000, v24, OS_LOG_TYPE_DEFAULT, "[SUBD] Old BiomeLibrary detected. Using the deprecated init function.", v30, 2u);
    }

    LODWORD(v29) = a9;
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F501A0]) initWithMlServerScore:v21 totalQuota:v20 totalUsed:v19 totalAvailable:v18 bundleQuotaInBytes:v17 commerceQuotaInBytes:v16 iCloudSubscriptionEventType:v29];
  }
  v27 = (void *)v26;

  return v27;
}

+ (id)_createEventWithQuotaInfoFrom:(id)a3 withType:(int)a4
{
  uint64_t v6 = +[_ICQHelperFunctions dictionaryForKey:@"quotaInfo" from:a3];
  if (v6) {
    v7 = (void *)v6;
  }
  else {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  v8 = +[_ICQHelperFunctions numberForKey:@"totalQuota" from:v7];
  v9 = +[_ICQHelperFunctions numberForKey:@"totalUsed" from:v7];
  v10 = +[_ICQHelperFunctions numberForKey:@"totalAvailable" from:v7];
  v11 = +[_ICQHelperFunctions numberForKey:@"bundleQuotaInBytes" from:v7];
  v12 = +[_ICQHelperFunctions numberForKey:@"commerceQuotaInBytes" from:v7];
  v13 = objc_msgSend(a1, "_createEventWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:", 0, v8, v9, v10, v11, v12, a4);

  return v13;
}

+ (void)_publishEvent:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "[SUBD] About to publish Biome event=[%@].", (uint8_t *)&v10, 0xCu);
  }

  v5 = BiomeLibrary();
  uint64_t v6 = [v5 iCloud];
  v7 = [v6 Subscription];

  v8 = [v7 source];
  [v8 sendEvent:v3];
  v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "[SUBD] Successfully published Biome event=[%@].", (uint8_t *)&v10, 0xCu);
  }
}

+ (void)publishEventWithFetchOffersResponse:(id)a3
{
  id v3 = a3;
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "[SUBD] Biome publishing Fetch Offers response event.", v6, 2u);
  }

  v5 = +[ICQMLBiomePublisher _createEventWithQuotaInfoFrom:v3 withType:1];

  +[ICQMLBiomePublisher _publishEvent:v5];
}

+ (void)publishEventWithRefreshOfferDetailsResponse:(id)a3
{
  id v3 = a3;
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "[SUBD] Biome publishing Refresh Offer Details response event.", v6, 2u);
  }

  v5 = +[ICQMLBiomePublisher _createEventWithQuotaInfoFrom:v3 withType:2];

  +[ICQMLBiomePublisher _publishEvent:v5];
}

+ (void)publishEventWithPushNotification:(id)a3
{
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "[SUBD] Biome publishing Push Notification event.", buf, 2u);
  }

  uint64_t v6 = +[_ICQHelperFunctions numberForKey:@"mlServerScore" from:v4];

  v7 = objc_msgSend(a1, "_createEventWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:", v6, 0, 0, 0, 0, 0, 5);

  +[ICQMLBiomePublisher _publishEvent:v7];
}

+ (void)publishOfferDisplayActionEvent
{
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "[SUBD] Biome publishing offer displayed to user.", buf, 2u);
  }

  id v4 = objc_msgSend(a1, "_createEventWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:", 0, 0, 0, 0, 0, 0, 3);
  +[ICQMLBiomePublisher _publishEvent:v4];
}

+ (void)publishOfferDisplayActionEventWithBundleId:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.iCloudQuota.ICQFollowup"])
  {
    int v5 = 1;
  }
  else if ([v4 isEqualToString:@"com.apple.mobileslideshow"])
  {
    int v5 = 2;
  }
  else if ([v4 isEqualToString:@"com.apple.mobilemail"])
  {
    int v5 = 3;
  }
  else if ([v4 isEqualToString:@"com.apple.DocumentsApp"])
  {
    int v5 = 4;
  }
  else
  {
    int v5 = 0;
  }
  LODWORD(v8) = 3;
  HIDWORD(v8) = v5;
  uint64_t v6 = objc_msgSend(a1, "_createEventWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:", 0, 0, 0, 0, 0, 0, v8);
  v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "[SUBD] Biome publishing offer displayed to user. BundleID=[%@] event=[%@]", buf, 0x16u);
  }

  +[ICQMLBiomePublisher _publishEvent:v6];
}

+ (void)publishOfferBuyActionEvent
{
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "[SUBD] Biome publishing user clicked 'buy offer'.", buf, 2u);
  }

  id v4 = objc_msgSend(a1, "_createEventWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:", 0, 0, 0, 0, 0, 0, 4);
  +[ICQMLBiomePublisher _publishEvent:v4];
}

@end