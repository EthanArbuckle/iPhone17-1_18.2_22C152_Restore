@interface FCPaidBundleConfiguration
+ (id)defaultConfigurationForStorefrontID:(id)a3;
+ (id)defaultEndOfPurchaseFamilySharingSetupArticleIDByLocalizedStorefrontID;
+ (id)defaultEndOfPurchaseNoFamilySharingSetupArticleIDByLocalizedStorefrontID;
+ (id)defaultFamilySharingLandingPageByLocalizedStorefrontID;
+ (id)defaultLandingPageByLocalizedStorefrontID;
+ (id)defaultPaidFeedIDByLocalizedStorefrontID;
+ (id)defaultServicesBundleLandingPageByLocalizedStorefrontID;
+ (id)defaultTagListIDByLocalizedStorefrontID;
+ (id)defaultVanityURLMappingResourceIDByLocalizedStorefrontID;
+ (id)renewalLandingPageByLocalizedStorefrontID;
- (BOOL)appLaunchUpsellLastSeenDateSyncEnabled;
- (BOOL)appLaunchUpsellLastShownCampaignIDSyncEnabled;
- (BOOL)areMagazinesEnabled;
- (BOOL)arePaywallConfigsEqualToOtherPaidBundleConfig:(id)a3;
- (BOOL)audioRefreshForceWakeEnabled;
- (BOOL)forYouIncludePaidSectionFeedsForFreeUsers;
- (BOOL)forYouIncludePaidSectionFeedsForPaidUsers;
- (BOOL)isCategoriesDownloadButtonEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFamilySharingSetupEnabled;
- (BOOL)isFreeBadgeEnabledForNonSubscribers;
- (BOOL)isFreeBadgeEnabledForSubscribers;
- (BOOL)isNarrativeAudioEnabled;
- (BOOL)isPaidBadgeEnabledForNonSubscribers;
- (BOOL)isPaidBadgeEnabledForSubscribers;
- (BOOL)isPaidBundleVisible;
- (BOOL)isSharingIssuesEnabled;
- (BOOL)isTemporaryAccessEnabled;
- (BOOL)requiresHardPaywallForIssuesToC;
- (BOOL)widgetUpsellFeaturesEnabled;
- (FCPaidBundleConfiguration)init;
- (FCPaidBundleConfiguration)initWithConfigDictionary:(id)a3;
- (FCPaidBundleConfiguration)initWithConfigDictionary:(id)a3 storefrontID:(id)a4;
- (FCPaidBundleConfiguration)initWithConfigDictionary:(id)a3 storefrontID:(id)a4 localizedStorefrontID:(id)a5 defaultSupportedStoreFronts:(id)a6;
- (NFUnfairLock)lock;
- (NSArray)audioChannelPaywallOverrideAllowedTagIDs;
- (NSArray)audioFeedPaywallPositions;
- (NSArray)defaultSupportedStoreFronts;
- (NSArray)groupWhitelistedTagIds;
- (NSArray)offeredBundlePurchaseIDs;
- (NSArray)restorableBundlePurchaseIDs;
- (NSDate)appLaunchUpsellCampaignEndDate;
- (NSDate)appLaunchUpsellCampaignStartDate;
- (NSDictionary)audioPaywallConfigurationsByType;
- (NSDictionary)audioServicesBundlePaywallConfigurationsByType;
- (NSDictionary)audioUpsellConfigurationsByID;
- (NSDictionary)bundleViaOfferSubscriptionButtonConfigurationsByType;
- (NSDictionary)carrierServicesBundleSubscriptionButtonConfigurationsByType;
- (NSDictionary)configDict;
- (NSDictionary)flexiblePaywallConfig;
- (NSDictionary)magazineGenresByGenre;
- (NSDictionary)offeredBundlePurchaseIDsMap;
- (NSDictionary)paywallConfigurationsByType;
- (NSDictionary)postPurchaseOnboardingConfigurationsByType;
- (NSDictionary)servicesBundlePaywallConfigurationsByType;
- (NSDictionary)servicesBundleSubscriptionButtonConfigurationsByType;
- (NSDictionary)subscriptionButtonConfigurationsByType;
- (NSMutableDictionary)keyedPaywallConfigurationsByType;
- (NSMutableDictionary)keyedPostPurchaseOnboardingConfigurationsByType;
- (NSMutableDictionary)keyedSubscriptionButtonConfigurationsByType;
- (NSString)appLaunchUpsellArticleID;
- (NSString)appLaunchUpsellCampaignID;
- (NSString)appLaunchUpsellInstanceID;
- (NSString)audioArticlesChannelId;
- (NSString)audioDailyBriefingFeatureName;
- (NSString)audioUpsellArticleID;
- (NSString)audioUpsellInstanceID;
- (NSString)defaultLandingPageArticleID;
- (NSString)defaultServicesBundleLandingPageArticleID;
- (NSString)endOfPurchaseFamilySharingSetupArticleID;
- (NSString)endOfPurchaseNoFamilySharingSetupArticleID;
- (NSString)endOfPurchaseServicesBundleFamilySharingSetupArticleID;
- (NSString)endOfPurchaseServicesBundleNoFamilySharingSetupArticleID;
- (NSString)expirationAlertDescription;
- (NSString)familySharingLandingPageArticleID;
- (NSString)featuredArticlesTagList;
- (NSString)freeBadgeTitle;
- (NSString)globalFeedIDForFreeUsers;
- (NSString)globalFeedIDForPaidUsers;
- (NSString)localizedStorefrontID;
- (NSString)osloAbandonmentUpsellArticleID;
- (NSString)osloAbandonmentUpsellInstanceID;
- (NSString)paidBadgeTitle;
- (NSString)recommendableIssuesTagList;
- (NSString)renewalLandingPageArticleID;
- (NSString)servicesBundleMetricsTopicName;
- (NSString)storefrontID;
- (NSString)todayMastheadPaywallConfiguration;
- (NSString)vanityURLMappingResourceID;
- (double)maxPriceDeltaThreshold;
- (id)defaultAudioPaywallConfigs;
- (id)defaultMagazineGenres;
- (id)defaultPaywallConfigs;
- (id)defaultServicesBundleSubscriptionButtonConfigs;
- (id)defaultSubscriptionButtonConfigs;
- (id)paywallConfigurationsByTypeForKey:(id)a3;
- (id)postPurchaseOnboardingConfigurationsByTypeForKey:(id)a3;
- (id)subscriptionButtonConfigurationsByTypeForKey:(id)a3;
- (int64_t)appLaunchUpsellBehaviorFlags;
- (int64_t)appLaunchUpsellNewSessionBackgroundTimeInterval;
- (int64_t)appLaunchUpsellPresentationDelay;
- (int64_t)appLaunchUpsellQuiescenceInterval;
- (int64_t)appLaunchUpsellRequiredAppLaunchCount;
- (int64_t)audioCloseIdlePlayerAfterTime;
- (int64_t)audioFinishedAtTimeFromEnd;
- (int64_t)audioOfflineArticlesMaxCountCriticalStorage;
- (int64_t)audioOfflineArticlesMaxCountLowStorage;
- (int64_t)audioOfflineArticlesMaxCountNormalStorage;
- (int64_t)audioRecentlyPlayedMaxCount;
- (int64_t)audioRefreshForceWakeRandomizationWindow;
- (int64_t)audioRefreshTimeGMT;
- (int64_t)audioRewindToParagraphStartAfterTime;
- (int64_t)audioSuggestionsHighlyPersonalizedCount;
- (int64_t)audioSuggestionsMaxAge;
- (int64_t)audioSuggestionsMaxCount;
- (int64_t)audioSuggestionsMaxIgnoreCount;
- (int64_t)audioSuggestionsRecycleAfterTime;
- (int64_t)audioUpsellMaxDisplayCount;
- (int64_t)bundleSubscriptionsGlobalMeteredCount;
- (int64_t)criticalStorageAutomaticIssueDownloadTTL;
- (int64_t)criticalStorageManualIssueDownloadTTL;
- (int64_t)entitlementsCacheExpiredGracePeriodInSeconds;
- (int64_t)entitlementsGracePeriodInSeconds;
- (int64_t)featuredArticlesFetchLimit;
- (int64_t)feedAutoRefreshMinimumInterval;
- (int64_t)forYouMaxDailyPaidArticlesForFreeUsers;
- (int64_t)forYouMaxMagazineGroupsForFreeUsers;
- (int64_t)forYouMaxMagazineGroupsForPaidUsers;
- (int64_t)forYouMaxMagazineGroupsForTrialUsers;
- (int64_t)lowStorageAutomaticIssueDownloadTTL;
- (int64_t)lowStorageManualIssueDownloadTTL;
- (int64_t)maxAllowedSubscriptionDetectionTime;
- (int64_t)maximumArticlesWithSoftPaywallPerSession;
- (int64_t)minFollowedMagazinesToHideSuggestionsCompact;
- (int64_t)minFollowedMagazinesToHideSuggestionsRegular;
- (int64_t)minimumArticlesBeforeArticleSoftPaywall;
- (int64_t)minimumArticlesInANFIssueBeforeRead;
- (int64_t)minimumPagesInPDFIssueBeforeRead;
- (int64_t)minimumReadIssuesInMyMagazines;
- (int64_t)newIssuesCheckLocalTime;
- (int64_t)newIssuesNotificationDeliveryLocalTime;
- (int64_t)normalStorageAutomaticIssueDownloadTTL;
- (int64_t)normalStorageManualIssueDownloadTTL;
- (int64_t)osloAbandonmentUpsellMaxPresentationCount;
- (int64_t)osloAbandonmentUpsellQuiescenceInterval;
- (int64_t)recentIssuesMaxAge;
- (int64_t)vanityURLMappingRefreshRate;
- (unint64_t)aLaCarteArticleSoftPaywallPosition;
- (unint64_t)appLaunchUpsellBundleTrialVisibility;
- (unint64_t)appLaunchUpsellPaidVisibility;
- (unint64_t)articleHardPaywallType;
- (unint64_t)articleSoftPaywallPosition;
- (unint64_t)audioFeedPaywallSubtype;
- (unint64_t)hash;
- (unint64_t)magazineFeedPaywallSubtype;
- (unint64_t)paywallConfigsOfferType;
- (unint64_t)subscriptionLinkTargetType;
- (void)setAudioUpsellConfigurationsByID:(id)a3;
- (void)setConfigDict:(id)a3;
- (void)setKeyedPaywallConfigurationsByType:(id)a3;
- (void)setKeyedPostPurchaseOnboardingConfigurationsByType:(id)a3;
- (void)setKeyedSubscriptionButtonConfigurationsByType:(id)a3;
- (void)setMagazineGenresByGenre:(id)a3;
@end

@implementation FCPaidBundleConfiguration

- (FCPaidBundleConfiguration)initWithConfigDictionary:(id)a3 storefrontID:(id)a4 localizedStorefrontID:(id)a5 defaultSupportedStoreFronts:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)FCPaidBundleConfiguration;
  v14 = [(FCPaidBundleConfiguration *)&v34 init];
  if (!v14) {
    goto LABEL_17;
  }
  uint64_t v15 = [v10 copy];
  configDict = v14->_configDict;
  v14->_configDict = (NSDictionary *)v15;

  uint64_t v17 = [v11 copy];
  storefrontID = v14->_storefrontID;
  v14->_storefrontID = (NSString *)v17;

  uint64_t v19 = [v12 copy];
  localizedStorefrontID = v14->_localizedStorefrontID;
  v14->_localizedStorefrontID = (NSString *)v19;

  objc_storeStrong((id *)&v14->_defaultSupportedStoreFronts, a6);
  uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
  keyedPaywallConfigurationsByType = v14->_keyedPaywallConfigurationsByType;
  v14->_keyedPaywallConfigurationsByType = (NSMutableDictionary *)v21;

  uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
  keyedSubscriptionButtonConfigurationsByType = v14->_keyedSubscriptionButtonConfigurationsByType;
  v14->_keyedSubscriptionButtonConfigurationsByType = (NSMutableDictionary *)v23;

  uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
  keyedPostPurchaseOnboardingConfigurationsByType = v14->_keyedPostPurchaseOnboardingConfigurationsByType;
  v14->_keyedPostPurchaseOnboardingConfigurationsByType = (NSMutableDictionary *)v25;

  uint64_t v27 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
  lock = v14->_lock;
  v14->_lock = (NFUnfairLock *)v27;

  v29 = FCAppConfigurationStringValue(v10, @"articleSoftPaywallPosition", @"top");
  if (![v29 isEqualToString:@"top"])
  {
    if ([v29 isEqualToString:@"both"])
    {
      uint64_t v30 = 2;
      goto LABEL_10;
    }
    if ([v29 isEqualToString:@"bottom"])
    {
      uint64_t v30 = 4;
      goto LABEL_10;
    }
    if ([v29 isEqualToString:@"none"])
    {
      uint64_t v30 = 1;
      goto LABEL_10;
    }
  }
  uint64_t v30 = 3;
LABEL_10:
  v14->_articleSoftPaywallPosition = v30;
  v31 = FCAppConfigurationStringValue(v10, @"aLaCarteArticleSoftPaywallPosition", @"bottom");
  if ([v31 isEqualToString:@"top"])
  {
    uint64_t v32 = 2;
  }
  else if ([v31 isEqualToString:@"bottom"] {
         || ![v31 isEqualToString:@"none"])
  }
  {
    uint64_t v32 = 3;
  }
  else
  {
    uint64_t v32 = 1;
  }
  v14->_aLaCarteArticleSoftPaywallPosition = v32;

LABEL_17:
  return v14;
}

- (BOOL)isPaidBadgeEnabledForNonSubscribers
{
  v2 = [(FCPaidBundleConfiguration *)self configDict];
  char v3 = FCAppConfigurationBoolValue(v2, @"paidBadgeEnabled", 1);

  return v3;
}

- (BOOL)isFreeBadgeEnabledForNonSubscribers
{
  v2 = [(FCPaidBundleConfiguration *)self configDict];
  char v3 = FCAppConfigurationBoolValue(v2, @"freeBadgeEnabled", 0);

  return v3;
}

- (BOOL)areMagazinesEnabled
{
  if (qword_1EB5D18D8 != -1) {
    dispatch_once(&qword_1EB5D18D8, &__block_literal_global_98);
  }
  if (_MergedGlobals_199) {
    return 1;
  }
  v4 = +[FCAppleAccount sharedAccount];
  int v5 = [v4 isContentStoreFrontSupported];

  if (!v5) {
    return 0;
  }
  v6 = [(FCPaidBundleConfiguration *)self defaultSupportedStoreFronts];
  v7 = [(FCPaidBundleConfiguration *)self storefrontID];
  if ([v6 containsObject:v7]) {
    uint64_t v8 = 7;
  }
  else {
    uint64_t v8 = 0;
  }

  v9 = [(FCPaidBundleConfiguration *)self configDict];
  char v10 = FCAppConfigurationIntegerValueWithDefaultValueIfMissing(v9, @"enabledLevel", v8, 0);

  return v10 & 1;
}

- (NSDictionary)configDict
{
  return self->_configDict;
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (NSArray)defaultSupportedStoreFronts
{
  return self->_defaultSupportedStoreFronts;
}

void __48__FCPaidBundleConfiguration_areMagazinesEnabled__block_invoke()
{
  if (NFInternalBuild())
  {
    v0 = NSString;
    id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v1 = [v2 stringForKey:@"news.features.magazines"];
    _MergedGlobals_199 = objc_msgSend(v0, "fc_string:isEqualToString:", @"enabled", v1);
  }
  else
  {
    _MergedGlobals_199 = 0;
  }
}

- (BOOL)arePaywallConfigsEqualToOtherPaidBundleConfig:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [(FCPaidBundleConfiguration *)self paywallConfigsOfferType];
    if (v5 == [v4 paywallConfigsOfferType])
    {
      v6 = [(FCPaidBundleConfiguration *)self configDict];
      v7 = FCAppConfigurationArrayValueWithDefaultValue(v6, @"paywallConfigs", 0);

      uint64_t v8 = [v4 configDict];
      v9 = FCAppConfigurationArrayValueWithDefaultValue(v8, @"paywallConfigs", 0);

      if ((objc_msgSend(MEMORY[0x1E4FBA8A8], "nf_object:isEqualToObject:", v7, v9) & 1) == 0)
      {
        v33 = FCPaywallLog;
        char v26 = 0;
        if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A460D000, v33, OS_LOG_TYPE_DEFAULT, "PaywallConfigs are not equal: 'paywallConfigs' have changed", buf, 2u);
          char v26 = 0;
        }
        goto LABEL_30;
      }
      char v10 = [(FCPaidBundleConfiguration *)self configDict];
      id v11 = FCAppConfigurationArrayValueWithDefaultValue(v10, @"audioPaywallConfigs", 0);

      id v12 = [v4 configDict];
      id v13 = FCAppConfigurationArrayValueWithDefaultValue(v12, @"audioPaywallConfigs", 0);

      if ((objc_msgSend(MEMORY[0x1E4FBA8A8], "nf_object:isEqualToObject:", v11, v13) & 1) == 0)
      {
        objc_super v34 = FCPaywallLog;
        char v26 = 0;
        if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A460D000, v34, OS_LOG_TYPE_DEFAULT, "PaywallConfigs are not equal: 'audioPaywallConfigs' have changed", buf, 2u);
          char v26 = 0;
        }
        goto LABEL_29;
      }
      v43 = v11;
      v14 = [(FCPaidBundleConfiguration *)self configDict];
      uint64_t v15 = FCAppConfigurationArrayValueWithDefaultValue(v14, @"sbPaywallConfigs", 0);

      v16 = [v4 configDict];
      uint64_t v17 = FCAppConfigurationArrayValueWithDefaultValue(v16, @"sbPaywallConfigs", 0);

      if ((objc_msgSend(MEMORY[0x1E4FBA8A8], "nf_object:isEqualToObject:", v15, v17) & 1) == 0)
      {
        v35 = FCPaywallLog;
        char v26 = 0;
        id v11 = v43;
        if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A460D000, v35, OS_LOG_TYPE_DEFAULT, "PaywallConfigs are not equal: 'sbPaywallConfigs' have changed", buf, 2u);
          char v26 = 0;
        }
        goto LABEL_28;
      }
      v42 = v15;
      v18 = [(FCPaidBundleConfiguration *)self configDict];
      uint64_t v19 = FCAppConfigurationArrayValueWithDefaultValue(v18, @"audioSbPaywallConfigs", 0);

      v20 = [v4 configDict];
      uint64_t v21 = FCAppConfigurationArrayValueWithDefaultValue(v20, @"audioSbPaywallConfigs", 0);

      v40 = v21;
      v41 = (void *)v19;
      if ((objc_msgSend(MEMORY[0x1E4FBA8A8], "nf_object:isEqualToObject:", v19, v21) & 1) == 0)
      {
        v36 = FCPaywallLog;
        char v26 = 0;
        v29 = (void *)v19;
        uint64_t v15 = v42;
        if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A460D000, v36, OS_LOG_TYPE_DEFAULT, "PaywallConfigs are not equal: 'audioSbPaywallConfigs' have changed", buf, 2u);
          char v26 = 0;
        }
        goto LABEL_27;
      }
      v22 = [(FCPaidBundleConfiguration *)self configDict];
      uint64_t v23 = FCAppConfigurationArrayValueWithDefaultValue(v22, @"flexiblePaywallConfig", 0);

      v24 = [v4 configDict];
      uint64_t v25 = FCAppConfigurationArrayValueWithDefaultValue(v24, @"flexiblePaywallConfig", 0);

      char v26 = objc_msgSend(MEMORY[0x1E4FBA8A8], "nf_object:isEqualToObject:", v23, v25);
      uint64_t v27 = FCPaywallLog;
      BOOL v28 = os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT);
      v38 = (void *)v25;
      v39 = (void *)v23;
      if (v26)
      {
        v29 = v41;
        uint64_t v15 = v42;
        uint64_t v21 = v40;
        if (v28)
        {
          *(_WORD *)buf = 0;
          uint64_t v30 = "PaywallConfigs are equal";
LABEL_25:
          _os_log_impl(&dword_1A460D000, v27, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
        }
      }
      else
      {
        v29 = v41;
        uint64_t v15 = v42;
        uint64_t v21 = v40;
        if (v28)
        {
          *(_WORD *)buf = 0;
          uint64_t v30 = "PaywallConfigs are not equal: 'flexiblePaywallConfig' have changed";
          goto LABEL_25;
        }
      }

LABEL_27:
      id v11 = v43;
LABEL_28:

LABEL_29:
LABEL_30:

      goto LABEL_31;
    }
    v31 = FCPaywallLog;
    char v26 = 0;
    if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v32 = "PaywallConfigs are not equal: the offer type has changed";
      goto LABEL_14;
    }
  }
  else
  {
    v31 = FCPaywallLog;
    char v26 = 0;
    if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v32 = "PaywallConfigs are not equal: the other object is nil";
LABEL_14:
      _os_log_impl(&dword_1A460D000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 2u);
      char v26 = 0;
    }
  }
LABEL_31:

  return v26;
}

- (unint64_t)paywallConfigsOfferType
{
  char v3 = NewsCoreUserDefaults();
  unint64_t v4 = [v3 integerForKey:@"newssubscription.paywall_configs.config_overrides.config_type"];

  if (!v4)
  {
    unint64_t v5 = [(FCPaidBundleConfiguration *)self configDict];
    unint64_t v4 = FCAppConfigurationIntegerValue(v5, @"paywallConfigsOfferType", 0);
  }
  return v4;
}

- (NSArray)restorableBundlePurchaseIDs
{
  char v3 = NewsCoreUserDefaults();
  unint64_t v4 = [v3 arrayForKey:@"newssubscription.bundle_subscriptions.restorable_purchase_ids"];

  if (v4)
  {
    uint64_t v5 = [v4 firstObject];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 firstObject];
      if ([v7 length])
      {
        int v8 = NFInternalBuild();

        if (v8)
        {
          id v9 = v4;
          goto LABEL_8;
        }
      }
      else
      {
      }
    }
  }
  char v10 = [(FCPaidBundleConfiguration *)self configDict];
  FCAppConfigurationArrayValueWithDefaultValue(v10, @"restorablePurchaseIds", &unk_1EF8D8BF8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return (NSArray *)v9;
}

- (NSString)vanityURLMappingResourceID
{
  char v3 = +[FCPaidBundleConfiguration defaultVanityURLMappingResourceIDByLocalizedStorefrontID];
  unint64_t v4 = [(FCPaidBundleConfiguration *)self localizedStorefrontID];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  v6 = [(FCPaidBundleConfiguration *)self configDict];
  v7 = FCAppConfigurationStringValue(v6, @"vanityUrlMappingResourceId", v5);

  return (NSString *)v7;
}

- (int64_t)vanityURLMappingRefreshRate
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"vanityUrlMappingRefreshRate", 3600);

  return v3;
}

- (NSString)localizedStorefrontID
{
  return self->_localizedStorefrontID;
}

+ (id)defaultVanityURLMappingResourceIDByLocalizedStorefrontID
{
  if (qword_1EB5D1958 != -1) {
    dispatch_once(&qword_1EB5D1958, &__block_literal_global_563);
  }
  id v2 = (void *)qword_1EB5D1950;
  return v2;
}

- (NSArray)offeredBundlePurchaseIDs
{
  int64_t v3 = NewsCoreUserDefaults();
  unint64_t v4 = [v3 arrayForKey:@"newssubscription.bundle_subscriptions.offered_purchase_ids"];

  if (v4)
  {
    uint64_t v5 = [v4 firstObject];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 firstObject];
      if ([v7 length])
      {
        int v8 = NFInternalBuild();

        if (v8)
        {
          id v9 = v4;
          goto LABEL_8;
        }
      }
      else
      {
      }
    }
  }
  char v10 = [(FCPaidBundleConfiguration *)self configDict];
  FCAppConfigurationArrayValueWithDefaultValue(v10, @"offeredPurchaseIds", &unk_1EF8D8C10);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return (NSArray *)v9;
}

- (FCPaidBundleConfiguration)initWithConfigDictionary:(id)a3
{
  return [(FCPaidBundleConfiguration *)self initWithConfigDictionary:a3 storefrontID:@"143441" localizedStorefrontID:@"143441" defaultSupportedStoreFronts:MEMORY[0x1E4F1CBF0]];
}

- (int64_t)minimumArticlesBeforeArticleSoftPaywall
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"minimumArticlesBeforeArticleSoftPaywall", 0);

  return v3;
}

- (int64_t)maximumArticlesWithSoftPaywallPerSession
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maximumArticlesWithSoftPaywallPerSession", 10000);

  return v3;
}

- (int64_t)bundleSubscriptionsGlobalMeteredCount
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"bundleSubscriptionsGlobalMeteredCount2", 15);

  return v3;
}

- (NSString)appLaunchUpsellArticleID
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"appLaunchUpsellArticleID", 0);

  return (NSString *)v3;
}

- (BOOL)isNarrativeAudioEnabled
{
  int64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  unint64_t v4 = [v3 stringForKey:@"news.features.audio"];

  if (objc_msgSend(NSString, "fc_string:isEqualToString:", v4, @"enabled"))
  {
    BOOL v5 = 1;
  }
  else if (objc_msgSend(NSString, "fc_string:isEqualToString:", v4, @"disabled"))
  {
    BOOL v5 = 0;
  }
  else
  {
    if (NFInternalBuild())
    {
      uint64_t v6 = 1;
    }
    else if (NFSeedBuild())
    {
      uint64_t v6 = 2;
    }
    else
    {
      uint64_t v6 = 4;
    }
    v7 = +[FCAppleAccount sharedAccount];
    if ([v7 isContentStoreFrontSupported])
    {
      int v8 = [(FCPaidBundleConfiguration *)self storefrontID];
      int v9 = [v8 isEqualToString:@"143441"];

      if (v9) {
        uint64_t v10 = 7;
      }
      else {
        uint64_t v10 = 0;
      }
    }
    else
    {

      uint64_t v10 = 0;
    }
    id v11 = [(FCPaidBundleConfiguration *)self configDict];
    uint64_t v12 = FCAppConfigurationIntegerValue(v11, @"audioEnabledLevel", v10);

    BOOL v5 = (v12 & v6) != 0;
  }

  return v5;
}

void __85__FCPaidBundleConfiguration_defaultVanityURLMappingResourceIDByLocalizedStorefrontID__block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"143441";
  v0 = [NSString stringWithFormat:@"%@-%@-en", @"VUM", @"143441"];
  v8[0] = v0;
  v7[1] = @"143455";
  v1 = [NSString stringWithFormat:@"%@-%@-en", @"VUM", @"143455"];
  v8[1] = v1;
  v7[2] = @"143455-fr-ca";
  id v2 = [NSString stringWithFormat:@"%@-%@-fr", @"VUM", @"143455"];
  v8[2] = v2;
  v7[3] = @"143444";
  int64_t v3 = [NSString stringWithFormat:@"%@-%@-en", @"VUM", @"143444"];
  v8[3] = v3;
  v7[4] = @"143460";
  unint64_t v4 = [NSString stringWithFormat:@"%@-%@-en", @"VUM", @"143460"];
  v8[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  uint64_t v6 = (void *)qword_1EB5D1950;
  qword_1EB5D1950 = v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_keyedPostPurchaseOnboardingConfigurationsByType, 0);
  objc_storeStrong((id *)&self->_keyedSubscriptionButtonConfigurationsByType, 0);
  objc_storeStrong((id *)&self->_keyedPaywallConfigurationsByType, 0);
  objc_storeStrong((id *)&self->_defaultSupportedStoreFronts, 0);
  objc_storeStrong((id *)&self->_localizedStorefrontID, 0);
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_configDict, 0);
  objc_storeStrong((id *)&self->_audioUpsellConfigurationsByID, 0);
  objc_storeStrong((id *)&self->_magazineGenresByGenre, 0);
}

- (FCPaidBundleConfiguration)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    int v8 = "-[FCPaidBundleConfiguration init]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCPaidBundleConfiguration.m";
    __int16 v11 = 1024;
    int v12 = 67;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  int64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPaidBundleConfiguration init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCPaidBundleConfiguration)initWithConfigDictionary:(id)a3 storefrontID:(id)a4
{
  return [(FCPaidBundleConfiguration *)self initWithConfigDictionary:a3 storefrontID:a4 localizedStorefrontID:a4 defaultSupportedStoreFronts:MEMORY[0x1E4F1CBF0]];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4FBA8A8];
    int v8 = [(FCPaidBundleConfiguration *)self configDict];
    __int16 v9 = [v6 configDict];
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBA8A8];
      __int16 v11 = [(FCPaidBundleConfiguration *)self storefrontID];
      int v12 = [v6 storefrontID];
      if (objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12))
      {
        __int16 v13 = (void *)MEMORY[0x1E4FBA8A8];
        v14 = [(FCPaidBundleConfiguration *)self localizedStorefrontID];
        uint64_t v15 = [v6 localizedStorefrontID];
        char v16 = objc_msgSend(v13, "nf_object:isEqualToObject:", v14, v15);
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  int64_t v3 = [(FCPaidBundleConfiguration *)self configDict];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(FCPaidBundleConfiguration *)self storefrontID];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(FCPaidBundleConfiguration *)self localizedStorefrontID];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)paywallConfigurationsByTypeForKey:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(FCPaidBundleConfiguration *)self lock];
  [v5 lock];

  uint64_t v6 = [(NSMutableDictionary *)self->_keyedPaywallConfigurationsByType objectForKeyedSubscript:v4];
  v7 = [(FCPaidBundleConfiguration *)self lock];
  [v7 unlock];

  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    __int16 v9 = [(FCPaidBundleConfiguration *)self configDict];
    uint64_t v10 = FCAppConfigurationArrayValueWithDefaultValue(v9, (uint64_t)v4, 0);

    if (v10)
    {
      id v8 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            char v16 = [[FCPaywallConfiguration alloc] initWithConfigDictionary:*(void *)(*((void *)&v23 + 1) + 8 * i)];
            uint64_t v17 = [(FCPaywallConfiguration *)v16 paywallType];
            if (v16) {
              BOOL v18 = v17 == 0;
            }
            else {
              BOOL v18 = 1;
            }
            if (!v18)
            {
              uint64_t v19 = [NSNumber numberWithUnsignedInteger:v17];
              objc_msgSend(v8, "fc_safelySetObject:forKey:", v16, v19);
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v13);
      }

      v20 = [(FCPaidBundleConfiguration *)self lock];
      [v20 lock];

      [(NSMutableDictionary *)self->_keyedPaywallConfigurationsByType fc_safelySetObject:v8 forKey:v4];
      uint64_t v21 = [(FCPaidBundleConfiguration *)self lock];
      [v21 unlock];

      uint64_t v6 = 0;
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (id)subscriptionButtonConfigurationsByTypeForKey:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(FCPaidBundleConfiguration *)self lock];
  [v5 lock];

  uint64_t v6 = [(NSMutableDictionary *)self->_keyedSubscriptionButtonConfigurationsByType objectForKeyedSubscript:v4];
  v7 = [(FCPaidBundleConfiguration *)self lock];
  [v7 unlock];

  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    __int16 v9 = [(FCPaidBundleConfiguration *)self configDict];
    uint64_t v10 = FCAppConfigurationArrayValueWithDefaultValue(v9, (uint64_t)v4, 0);

    if (v10)
    {
      id v8 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            char v16 = [[FCSubscriptionButtonConfiguration alloc] initWithConfigDictionary:*(void *)(*((void *)&v23 + 1) + 8 * i)];
            uint64_t v17 = [(FCSubscriptionButtonConfiguration *)v16 subscriptionButtonType];
            if (v16) {
              BOOL v18 = v17 == 0;
            }
            else {
              BOOL v18 = 1;
            }
            if (!v18)
            {
              uint64_t v19 = [NSNumber numberWithUnsignedInteger:v17];
              objc_msgSend(v8, "fc_safelySetObject:forKey:", v16, v19);
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v13);
      }

      v20 = [(FCPaidBundleConfiguration *)self lock];
      [v20 lock];

      [(NSMutableDictionary *)self->_keyedSubscriptionButtonConfigurationsByType fc_safelySetObject:v8 forKey:v4];
      uint64_t v21 = [(FCPaidBundleConfiguration *)self lock];
      [v21 unlock];

      uint64_t v6 = 0;
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (id)postPurchaseOnboardingConfigurationsByTypeForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FCPaidBundleConfiguration *)self lock];
  [v5 lock];

  uint64_t v6 = [(NSMutableDictionary *)self->_keyedPostPurchaseOnboardingConfigurationsByType objectForKeyedSubscript:v4];
  v7 = [(FCPaidBundleConfiguration *)self lock];
  [v7 unlock];

  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    __int16 v9 = [(FCPaidBundleConfiguration *)self configDict];
    uint64_t v10 = FCAppConfigurationDictionaryValueWithDefaultValue(v9, (uint64_t)v4, 0);

    if (v10)
    {
      id v11 = [MEMORY[0x1E4F1CA60] dictionary];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __78__FCPaidBundleConfiguration_postPurchaseOnboardingConfigurationsByTypeForKey___block_invoke;
      v17[3] = &unk_1E5B54648;
      id v12 = v11;
      id v18 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v17];
      uint64_t v13 = [(FCPaidBundleConfiguration *)self lock];
      [v13 lock];

      [(NSMutableDictionary *)self->_keyedPostPurchaseOnboardingConfigurationsByType fc_safelySetObject:v12 forKey:v4];
      uint64_t v14 = [(FCPaidBundleConfiguration *)self lock];
      [v14 unlock];

      uint64_t v15 = v18;
      id v8 = v12;
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

void __78__FCPaidBundleConfiguration_postPurchaseOnboardingConfigurationsByTypeForKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = FCPostPurchaseOnboardingConfigurationTypeWithValue(v5);
    id v8 = [MEMORY[0x1E4F1CA48] array];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__FCPaidBundleConfiguration_postPurchaseOnboardingConfigurationsByTypeForKey___block_invoke_2;
    v14[3] = &unk_1E5B56B28;
    id v15 = v8;
    id v9 = v8;
    [v6 enumerateObjectsUsingBlock:v14];
    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = [NSNumber numberWithUnsignedInteger:v7];
    objc_msgSend(v10, "fc_safelySetObject:forKey:", v9, v11);
  }
  else
  {
    id v12 = FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_error_impl(&dword_1A460D000, v12, OS_LOG_TYPE_ERROR, "Incorrect json structure received for onboarding steps. Expected a JSON array of onboarding steps.", v13, 2u);
    }
  }
}

uint64_t __78__FCPaidBundleConfiguration_postPurchaseOnboardingConfigurationsByTypeForKey___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = [[FCPostPurchaseOnboardingConfiguration alloc] initWithConfigDictionary:v3];

  uint64_t v4 = [(FCPostPurchaseOnboardingConfiguration *)v8 postPurchaseOnboardingStep];
  id v5 = v8;
  if (v8) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v4 = [*(id *)(a1 + 32) addObject:v8];
    id v5 = v8;
  }
  return MEMORY[0x1F41817F8](v4, v5);
}

- (NSDictionary)flexiblePaywallConfig
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  id v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"flexiblePaywallConfig", 0);

  return (NSDictionary *)v3;
}

- (unint64_t)subscriptionLinkTargetType
{
  id v3 = NewsCoreUserDefaults();
  unint64_t v4 = [v3 integerForKey:@"newssubscription.subscriptionlink.target_type"];

  if (!v4)
  {
    id v5 = [(FCPaidBundleConfiguration *)self configDict];
    unint64_t v4 = FCAppConfigurationIntegerValue(v5, @"subscriptionLinkTargetType", 0);
  }
  return v4;
}

- (double)maxPriceDeltaThreshold
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  double v3 = FCAppConfigurationDoubleValue(v2, @"maxDeltaThreshold", 0.0);

  return v3;
}

- (NSDictionary)paywallConfigurationsByType
{
  double v3 = [(FCPaidBundleConfiguration *)self paywallConfigurationsByTypeForKey:@"paywallConfigs"];
  unint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FCPaidBundleConfiguration *)self defaultPaywallConfigs];
  }
  BOOL v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)servicesBundlePaywallConfigurationsByType
{
  double v3 = [(FCPaidBundleConfiguration *)self paywallConfigurationsByTypeForKey:@"sbPaywallConfigs"];
  unint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FCPaidBundleConfiguration *)self defaultPaywallConfigs];
  }
  BOOL v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)audioPaywallConfigurationsByType
{
  double v3 = [(FCPaidBundleConfiguration *)self paywallConfigurationsByTypeForKey:@"audioPaywallConfigs"];
  unint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FCPaidBundleConfiguration *)self defaultAudioPaywallConfigs];
  }
  BOOL v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)audioServicesBundlePaywallConfigurationsByType
{
  double v3 = [(FCPaidBundleConfiguration *)self paywallConfigurationsByTypeForKey:@"audioSbPaywallConfigs"];
  unint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FCPaidBundleConfiguration *)self defaultAudioPaywallConfigs];
  }
  BOOL v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)subscriptionButtonConfigurationsByType
{
  double v3 = [(FCPaidBundleConfiguration *)self subscriptionButtonConfigurationsByTypeForKey:@"subscriptionButtonConfigs"];
  unint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FCPaidBundleConfiguration *)self defaultSubscriptionButtonConfigs];
  }
  BOOL v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)servicesBundleSubscriptionButtonConfigurationsByType
{
  double v3 = [(FCPaidBundleConfiguration *)self subscriptionButtonConfigurationsByTypeForKey:@"sbSubscriptionButtonConfigs"];
  unint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FCPaidBundleConfiguration *)self defaultServicesBundleSubscriptionButtonConfigs];
  }
  BOOL v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)carrierServicesBundleSubscriptionButtonConfigurationsByType
{
  double v3 = [(FCPaidBundleConfiguration *)self subscriptionButtonConfigurationsByTypeForKey:@"carrierServicesBundleSubscriptionButtonConfigs"];
  unint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FCPaidBundleConfiguration *)self defaultServicesBundleSubscriptionButtonConfigs];
  }
  BOOL v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)bundleViaOfferSubscriptionButtonConfigurationsByType
{
  double v3 = [(FCPaidBundleConfiguration *)self subscriptionButtonConfigurationsByTypeForKey:@"bundleViaOfferSubscriptionButtonConfigs"];
  unint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FCPaidBundleConfiguration *)self defaultServicesBundleSubscriptionButtonConfigs];
  }
  BOOL v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)postPurchaseOnboardingConfigurationsByType
{
  return (NSDictionary *)[(FCPaidBundleConfiguration *)self postPurchaseOnboardingConfigurationsByTypeForKey:@"postPurchaseOnboardingConfig"];
}

- (unint64_t)articleHardPaywallType
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  unint64_t v3 = FCAppConfigurationIntegerValue(v2, @"articleHardPaywallType", 0);

  return v3;
}

- (unint64_t)audioFeedPaywallSubtype
{
  unint64_t v3 = [(FCPaidBundleConfiguration *)self configDict];
  unint64_t v4 = FCAppConfigurationIntegerValue(v3, @"audioFeedPaywallType", 0);

  if (v4 == 2)
  {
    id v5 = [(FCPaidBundleConfiguration *)self audioPaywallConfigurationsByType];
    BOOL v6 = [NSNumber numberWithInteger:14];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];

    if (v7)
    {
      id v8 = [(FCPaidBundleConfiguration *)self audioPaywallConfigurationsByType];
      id v9 = [NSNumber numberWithInteger:15];
      uint64_t v10 = [v8 objectForKeyedSubscript:v9];

      if (v10) {
        return 2;
      }
      id v11 = FCPaywallLog;
      if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = 0;
        id v12 = "Missing 'Large' configuration data for Video Audio Feed Paywall! Defaulting to Regular Audio Feed Paywall type!";
        uint64_t v13 = (uint8_t *)&v15;
        goto LABEL_9;
      }
    }
    else
    {
      id v11 = FCPaywallLog;
      if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = 0;
        id v12 = "Missing 'Small' configuration data for Video Audio Feed Paywall! Defaulting to Regular Audio Feed Paywall type!";
        uint64_t v13 = (uint8_t *)&v16;
LABEL_9:
        _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      }
    }
    return 1;
  }
  return v4;
}

- (unint64_t)magazineFeedPaywallSubtype
{
  unint64_t v3 = [(FCPaidBundleConfiguration *)self configDict];
  unint64_t v4 = FCAppConfigurationIntegerValue(v3, @"magazineFeedPaywallType", 0);

  if (v4 == 2)
  {
    id v5 = [(FCPaidBundleConfiguration *)self paywallConfigurationsByType];
    BOOL v6 = [NSNumber numberWithInteger:9];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];

    if (v7)
    {
      id v8 = [(FCPaidBundleConfiguration *)self paywallConfigurationsByType];
      id v9 = [NSNumber numberWithInteger:10];
      uint64_t v10 = [v8 objectForKeyedSubscript:v9];

      if (v10) {
        return 2;
      }
      id v11 = FCPaywallLog;
      if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = 0;
        id v12 = "Missing 'Large' configuration data for Video Magazine Feed Paywall! Defaulting to Regular Magazine Feed Paywall type!";
        uint64_t v13 = (uint8_t *)&v15;
        goto LABEL_9;
      }
    }
    else
    {
      id v11 = FCPaywallLog;
      if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = 0;
        id v12 = "Missing 'Small' configuration data for Video Magazine Feed Paywall! Defaulting to Regular Magazine Feed Paywall type!";
        uint64_t v13 = (uint8_t *)&v16;
LABEL_9:
        _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      }
    }
    return 1;
  }
  return v4;
}

- (NSDictionary)magazineGenresByGenre
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  magazineGenresByGenre = self->_magazineGenresByGenre;
  if (!magazineGenresByGenre)
  {
    unint64_t v4 = [(FCPaidBundleConfiguration *)self configDict];
    id v5 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"magazineGenres", 0);

    if (v5)
    {
      BOOL v6 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v21;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
            uint64_t v13 = [FCMagazineGenre alloc];
            uint64_t v14 = -[FCMagazineGenre initWithConfigDictionary:](v13, "initWithConfigDictionary:", v12, (void)v20);
            __int16 v15 = [(FCMagazineGenre *)v14 genre];

            if (v15)
            {
              __int16 v16 = [(FCMagazineGenre *)v14 genre];
              [(NSDictionary *)v6 fc_safelySetObject:v14 forKey:v16];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v9);
      }

      uint64_t v17 = self->_magazineGenresByGenre;
      self->_magazineGenresByGenre = v6;
    }
    else
    {
      id v18 = [(FCPaidBundleConfiguration *)self defaultMagazineGenres];
      uint64_t v17 = self->_magazineGenresByGenre;
      self->_magazineGenresByGenre = v18;
    }

    magazineGenresByGenre = self->_magazineGenresByGenre;
  }
  return magazineGenresByGenre;
}

- (BOOL)isPaidBundleVisible
{
  return 1;
}

- (BOOL)isTemporaryAccessEnabled
{
  return 0;
}

- (BOOL)isSharingIssuesEnabled
{
  return 1;
}

- (BOOL)isFamilySharingSetupEnabled
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  char v3 = FCAppConfigurationBoolValue(v2, @"familySharingSetupEnabled", 0);

  return v3;
}

- (NSString)servicesBundleMetricsTopicName
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  char v3 = FCAppConfigurationStringValue(v2, @"sbFigaroTopic", 0);

  return (NSString *)v3;
}

- (NSString)defaultLandingPageArticleID
{
  char v3 = +[FCPaidBundleConfiguration defaultLandingPageByLocalizedStorefrontID];
  unint64_t v4 = [(FCPaidBundleConfiguration *)self localizedStorefrontID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  BOOL v6 = [(FCPaidBundleConfiguration *)self configDict];
  id v7 = FCAppConfigurationStringValue(v6, @"deArticleID", v5);

  return (NSString *)v7;
}

- (NSString)defaultServicesBundleLandingPageArticleID
{
  char v3 = +[FCPaidBundleConfiguration defaultServicesBundleLandingPageByLocalizedStorefrontID];
  unint64_t v4 = [(FCPaidBundleConfiguration *)self localizedStorefrontID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  BOOL v6 = [(FCPaidBundleConfiguration *)self configDict];
  id v7 = FCAppConfigurationStringValue(v6, @"sbArticleID", v5);

  return (NSString *)v7;
}

- (NSString)familySharingLandingPageArticleID
{
  char v3 = +[FCPaidBundleConfiguration defaultFamilySharingLandingPageByLocalizedStorefrontID];
  unint64_t v4 = [(FCPaidBundleConfiguration *)self localizedStorefrontID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  BOOL v6 = [(FCPaidBundleConfiguration *)self configDict];
  id v7 = FCAppConfigurationStringValue(v6, @"shArticleID", v5);

  return (NSString *)v7;
}

- (NSString)endOfPurchaseFamilySharingSetupArticleID
{
  char v3 = +[FCPaidBundleConfiguration defaultEndOfPurchaseFamilySharingSetupArticleIDByLocalizedStorefrontID];
  unint64_t v4 = [(FCPaidBundleConfiguration *)self localizedStorefrontID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  BOOL v6 = [(FCPaidBundleConfiguration *)self configDict];
  id v7 = FCAppConfigurationStringValue(v6, @"endOfPurchaseFamilySharingSetupArticleID", v5);

  return (NSString *)v7;
}

- (NSString)endOfPurchaseNoFamilySharingSetupArticleID
{
  char v3 = +[FCPaidBundleConfiguration defaultEndOfPurchaseNoFamilySharingSetupArticleIDByLocalizedStorefrontID];
  unint64_t v4 = [(FCPaidBundleConfiguration *)self localizedStorefrontID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  BOOL v6 = [(FCPaidBundleConfiguration *)self configDict];
  id v7 = FCAppConfigurationStringValue(v6, @"endOfPurchaseNoFamilySharingSetupArticleID", v5);

  return (NSString *)v7;
}

- (NSString)endOfPurchaseServicesBundleFamilySharingSetupArticleID
{
  char v3 = +[FCPaidBundleConfiguration defaultEndOfPurchaseFamilySharingSetupArticleIDByLocalizedStorefrontID];
  unint64_t v4 = [(FCPaidBundleConfiguration *)self localizedStorefrontID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  BOOL v6 = [(FCPaidBundleConfiguration *)self configDict];
  id v7 = FCAppConfigurationStringValue(v6, @"endOfPurchaseServicesBundleFamilySharingSetupArticleID", v5);

  return (NSString *)v7;
}

- (NSString)endOfPurchaseServicesBundleNoFamilySharingSetupArticleID
{
  char v3 = +[FCPaidBundleConfiguration defaultEndOfPurchaseNoFamilySharingSetupArticleIDByLocalizedStorefrontID];
  unint64_t v4 = [(FCPaidBundleConfiguration *)self localizedStorefrontID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  BOOL v6 = [(FCPaidBundleConfiguration *)self configDict];
  id v7 = FCAppConfigurationStringValue(v6, @"endOfPurchaseServicesBundleNoFamilySharingSetupArticleID", v5);

  return (NSString *)v7;
}

- (NSString)renewalLandingPageArticleID
{
  char v3 = +[FCPaidBundleConfiguration renewalLandingPageByLocalizedStorefrontID];
  unint64_t v4 = [(FCPaidBundleConfiguration *)self localizedStorefrontID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  BOOL v6 = [(FCPaidBundleConfiguration *)self configDict];
  id v7 = FCAppConfigurationStringValue(v6, @"reArticleID", v5);

  return (NSString *)v7;
}

- (NSDictionary)offeredBundlePurchaseIDsMap
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  char v3 = FCAppConfigurationDictionaryValueWithDefaultValue(v2, @"offeredBundlePurchaseIDsMap", 0);

  return (NSDictionary *)v3;
}

- (int64_t)newIssuesCheckLocalTime
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"newIssuesCheckLocalTime", 10800);

  return v3;
}

- (int64_t)newIssuesNotificationDeliveryLocalTime
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"newIssuesNotificationDeliveryLocalTime", 68400);

  return v3;
}

- (int64_t)maxAllowedSubscriptionDetectionTime
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"maxAllowedSubscriptionDetectionTime", 2592000);

  return v3;
}

- (NSString)featuredArticlesTagList
{
  int64_t v3 = +[FCPaidBundleConfiguration defaultTagListIDByLocalizedStorefrontID];
  unint64_t v4 = [(FCPaidBundleConfiguration *)self localizedStorefrontID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  BOOL v6 = [(FCPaidBundleConfiguration *)self configDict];
  id v7 = FCAppConfigurationStringValue(v6, @"featuredArticlesTagList", v5);

  return (NSString *)v7;
}

- (int64_t)featuredArticlesFetchLimit
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"featuredArticlesFetchLimit", 250);

  return v3;
}

- (NSString)recommendableIssuesTagList
{
  int64_t v3 = +[FCPaidBundleConfiguration defaultTagListIDByLocalizedStorefrontID];
  unint64_t v4 = [(FCPaidBundleConfiguration *)self localizedStorefrontID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  BOOL v6 = [(FCPaidBundleConfiguration *)self configDict];
  id v7 = FCAppConfigurationStringValue(v6, @"recommendableIssuesTagList", v5);

  return (NSString *)v7;
}

- (NSString)globalFeedIDForFreeUsers
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"paidFeedIdForFreeUsers", 0);

  return (NSString *)v3;
}

- (NSString)globalFeedIDForPaidUsers
{
  int64_t v3 = +[FCPaidBundleConfiguration defaultPaidFeedIDByLocalizedStorefrontID];
  unint64_t v4 = [(FCPaidBundleConfiguration *)self localizedStorefrontID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  BOOL v6 = [(FCPaidBundleConfiguration *)self configDict];
  id v7 = FCAppConfigurationStringValue(v6, @"paidFeedId", v5);

  return (NSString *)v7;
}

- (BOOL)forYouIncludePaidSectionFeedsForFreeUsers
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  char v3 = FCAppConfigurationBoolValue(v2, @"forYouIncludePaidSectionFeedsForFreeUsers", 0);

  return v3;
}

- (BOOL)forYouIncludePaidSectionFeedsForPaidUsers
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  char v3 = FCAppConfigurationBoolValue(v2, @"forYouIncludePaidSectionFeedsForPaidUsers", 0);

  return v3;
}

- (NSString)expirationAlertDescription
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  char v3 = FCAppConfigurationStringValue(v2, @"expirationAlertDescription", 0);

  return (NSString *)v3;
}

- (int64_t)forYouMaxDailyPaidArticlesForFreeUsers
{
  char v3 = [(FCPaidBundleConfiguration *)self configDict];
  uint64_t v4 = FCAppConfigurationIntegerValue(v3, @"forYouMaxDailyPaidArticlesForFreeUsers", 10);

  id v5 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v6 = FCAppConfigurationIntegerValue(v5, @"forYouMaxDailyPaidArticlesForFreeUsers2", v4);

  return v6;
}

- (int64_t)forYouMaxMagazineGroupsForFreeUsers
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"forYouMaxMagazineGroupsForAUsers", 1);

  return v3;
}

- (int64_t)forYouMaxMagazineGroupsForTrialUsers
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"forYouMaxMagazineGroupsForBUsers", 3);

  return v3;
}

- (int64_t)forYouMaxMagazineGroupsForPaidUsers
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"forYouMaxMagazineGroupsForCUsers", 3);

  return v3;
}

- (BOOL)isFreeBadgeEnabledForSubscribers
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  char v3 = FCAppConfigurationBoolValue(v2, @"freeBadgeEnabledForPaidUsers", 0);

  return v3;
}

- (BOOL)isPaidBadgeEnabledForSubscribers
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  char v3 = FCAppConfigurationBoolValue(v2, @"paidBadgeEnabledForPaidUsers", 0);

  return v3;
}

- (NSString)freeBadgeTitle
{
  char v3 = FCBundle();
  uint64_t v4 = [v3 localizedStringForKey:@"Free" value:&stru_1EF8299B8 table:0];

  id v5 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v6 = FCAppConfigurationStringValue(v5, @"freeBadgeTitle", v4);

  return (NSString *)v6;
}

- (NSString)paidBadgeTitle
{
  char v3 = FCBundle();
  uint64_t v4 = [v3 localizedStringForKey:@" News+" value:&stru_1EF8299B8 table:0];

  id v5 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v6 = FCAppConfigurationStringValue(v5, @"paidBadgeTitle", v4);

  return (NSString *)v6;
}

- (int64_t)feedAutoRefreshMinimumInterval
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"feedAutoRefreshMinimumInterval", 43200);

  return v3;
}

- (int64_t)normalStorageManualIssueDownloadTTL
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v4 = FCAppConfigurationIntegerValue(v2, @"normalStorageManualIssueDownloadTTL", v3);

  return v4;
}

- (int64_t)normalStorageAutomaticIssueDownloadTTL
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"normalStorageAutomaticIssueDownloadTTL", 2592000);

  return v3;
}

- (int64_t)lowStorageManualIssueDownloadTTL
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"lowStorageManualIssueDownloadTTL", 2592000);

  return v3;
}

- (int64_t)lowStorageAutomaticIssueDownloadTTL
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"lowStorageAutomaticIssueDownloadTTL", 2592000);

  return v3;
}

- (int64_t)criticalStorageManualIssueDownloadTTL
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"criticalStorageManualIssueDownloadTTL", 2592000);

  return v3;
}

- (int64_t)criticalStorageAutomaticIssueDownloadTTL
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"criticalStorageAutomaticIssueDownloadTTL", 0);

  return v3;
}

- (NSArray)groupWhitelistedTagIds
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"groupWhitelistedTagIds", 0);

  return (NSArray *)v3;
}

- (int64_t)entitlementsGracePeriodInSeconds
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"entitlementsGracePeriodInSeconds", 604800);

  return v3;
}

- (int64_t)entitlementsCacheExpiredGracePeriodInSeconds
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"entitlementsCacheExpiredGracePeriodInSeconds", 172800);

  return v3;
}

- (BOOL)isCategoriesDownloadButtonEnabled
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  char v3 = FCAppConfigurationBoolValue(v2, @"categoriesDownloadButtonEnabled", 0);

  return v3;
}

- (int64_t)recentIssuesMaxAge
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"recentIssuesMaxAge", 604800);

  return v3;
}

- (int64_t)minimumReadIssuesInMyMagazines
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"minimumReadIssuesInMyMagazines", 3);

  return v3;
}

- (int64_t)minimumArticlesInANFIssueBeforeRead
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"minimumArticlesInANFIssueBeforeRead", 1);

  return v3;
}

- (int64_t)minimumPagesInPDFIssueBeforeRead
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"minimumPagesInPDFIssueBeforeRead", 4);

  return v3;
}

- (NSString)todayMastheadPaywallConfiguration
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"todayMastheadPaywallConfiguration", 0);

  return (NSString *)v3;
}

- (int64_t)minFollowedMagazinesToHideSuggestionsCompact
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"minFollowedMagazinesToHideSuggestionsCompact", 5);

  return v3;
}

- (int64_t)minFollowedMagazinesToHideSuggestionsRegular
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"minFollowedMagazinesToHideSuggestionsRegular", 8);

  return v3;
}

- (unint64_t)appLaunchUpsellPaidVisibility
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  unint64_t v3 = FCAppConfigurationIntegerValue(v2, @"appLaunchUpsellPaidVisibility", 0);

  return v3;
}

- (unint64_t)appLaunchUpsellBundleTrialVisibility
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  unint64_t v3 = FCAppConfigurationIntegerValue(v2, @"appLaunchUpsellBundleTrialVisibility", 0);

  return v3;
}

- (NSString)appLaunchUpsellInstanceID
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  unint64_t v3 = FCAppConfigurationStringValue(v2, @"appLaunchUpsellInstanceID", 0);

  return (NSString *)v3;
}

- (NSString)appLaunchUpsellCampaignID
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  unint64_t v3 = FCAppConfigurationStringValue(v2, @"appLaunchUpsellCampaignID", 0);

  return (NSString *)v3;
}

- (NSDate)appLaunchUpsellCampaignStartDate
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  unint64_t v3 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v4 = [v2 dateWithTimeIntervalSince1970:(double)FCAppConfigurationIntegerValue(v3, @"appLaunchUpsellCampaignStartDate", 0)];

  return (NSDate *)v4;
}

- (NSDate)appLaunchUpsellCampaignEndDate
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  uint64_t v3 = FCAppConfigurationIntegerValueWithDefaultValueIfMissing(v2, @"appLaunchUpsellCampaignEndDate", -1, -1);

  if (v3 == -1)
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v3];
  }
  return (NSDate *)v4;
}

- (int64_t)appLaunchUpsellRequiredAppLaunchCount
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"appLaunchUpsellRequiredAppLaunchCount", 4);

  return v3;
}

- (int64_t)appLaunchUpsellQuiescenceInterval
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"appLaunchUpsellQuiescenceInterval", 172800);

  return v3;
}

- (int64_t)appLaunchUpsellNewSessionBackgroundTimeInterval
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"appLaunchUpsellNewSessionBackgroundTimeInterval", 600);

  return v3;
}

- (BOOL)appLaunchUpsellLastSeenDateSyncEnabled
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  char v3 = FCAppConfigurationBoolValue(v2, @"appLaunchUpsellLastSeenDateSyncEnabled", 0);

  return v3;
}

- (BOOL)appLaunchUpsellLastShownCampaignIDSyncEnabled
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  char v3 = FCAppConfigurationBoolValue(v2, @"appLaunchUpsellLastShownCampaignIDSyncEnabled", 0);

  return v3;
}

- (int64_t)appLaunchUpsellBehaviorFlags
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"appLaunchUpsellBehaviorFlags", 0);

  return v3;
}

- (int64_t)audioSuggestionsMaxCount
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioSuggestionsMaxCount", 6);

  return v3;
}

- (int64_t)audioSuggestionsHighlyPersonalizedCount
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioSuggestionsHighlyPersonalizedCount", 5);

  return v3;
}

- (int64_t)audioSuggestionsMaxAge
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioSuggestionsMaxAge", 604800);

  return v3;
}

- (int64_t)audioSuggestionsRecycleAfterTime
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioSuggestionsRecycleAfterTime", 345600);

  return v3;
}

- (int64_t)audioSuggestionsMaxIgnoreCount
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioSuggestionsMaxIgnoreCount", 2);

  return v3;
}

- (int64_t)audioOfflineArticlesMaxCountNormalStorage
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioOfflineArticlesMaxCountNormalStorage", 25);

  return v3;
}

- (int64_t)audioOfflineArticlesMaxCountLowStorage
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioOfflineArticlesMaxCountLowStorage", 2);

  return v3;
}

- (int64_t)audioOfflineArticlesMaxCountCriticalStorage
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioOfflineArticlesMaxCountCriticalStorage", 0);

  return v3;
}

- (NSString)audioUpsellArticleID
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"audioUpsellArticleID", 0);

  return (NSString *)v3;
}

- (int64_t)audioUpsellMaxDisplayCount
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioUpsellMaxDisplayCount", -1);

  return v3;
}

- (NSString)audioUpsellInstanceID
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"audioUpsellInstanceID", 0);

  return (NSString *)v3;
}

- (int64_t)audioRecentlyPlayedMaxCount
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioRecentlyPlayedMaxCount", 100);

  return v3;
}

- (int64_t)audioFinishedAtTimeFromEnd
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioFinishedAtTimeFromEnd", 10);

  return v3;
}

- (NSString)audioDailyBriefingFeatureName
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCBundle();
  int64_t v4 = [v3 localizedStringForKey:@"Apple News Today" value:&stru_1EF8299B8 table:0];
  id v5 = FCAppConfigurationStringValue(v2, @"audioDailyBriefingFeatureName", v4);

  return (NSString *)v5;
}

- (int64_t)audioRefreshTimeGMT
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioRefreshTimeGMT", 39600);

  return v3;
}

- (BOOL)audioRefreshForceWakeEnabled
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  char v3 = FCAppConfigurationBoolValue(v2, @"audioRefreshShouldForceWake", 0);

  return v3;
}

- (int64_t)audioRefreshForceWakeRandomizationWindow
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioRefreshForceWakeRandomizationWindow", 600);

  return v3;
}

- (int64_t)audioRewindToParagraphStartAfterTime
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioRewindToParagraphStartAfterTime", 180);

  return v3;
}

- (int64_t)audioCloseIdlePlayerAfterTime
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"audioCloseIdlePlayerAfterTime", 300);

  return v3;
}

- (NSArray)audioFeedPaywallPositions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"audioFeedPaywallPositions", 0);

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = [NSNumber numberWithUnsignedInt:2];
    v7[0] = v5;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  return (NSArray *)v4;
}

- (NSArray)audioChannelPaywallOverrideAllowedTagIDs
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationArrayValueWithDefaultValue(v2, @"audioChannelPaywallOverrideAllowedTagIDs", 0);

  return (NSArray *)v3;
}

- (NSString)audioArticlesChannelId
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"audioArticlesChannelId", 0);

  return (NSString *)v3;
}

- (NSDictionary)audioUpsellConfigurationsByID
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  audioUpsellConfigurationsByID = self->_audioUpsellConfigurationsByID;
  if (!audioUpsellConfigurationsByID)
  {
    id v4 = [(FCPaidBundleConfiguration *)self configDict];
    id v5 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"audioUpsellConfigs", 0);

    if (v5)
    {
      int64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
            uint64_t v13 = [FCAudioUpsellConfig alloc];
            uint64_t v14 = -[FCAudioUpsellConfig initWithConfigDictionary:](v13, "initWithConfigDictionary:", v12, (void)v18);
            __int16 v15 = [(FCAudioUpsellConfig *)v14 identifier];
            [(NSDictionary *)v6 fc_safelySetObject:v14 forKey:v15];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v9);
      }

      __int16 v16 = self->_audioUpsellConfigurationsByID;
      self->_audioUpsellConfigurationsByID = v6;
    }
    audioUpsellConfigurationsByID = self->_audioUpsellConfigurationsByID;
  }
  return audioUpsellConfigurationsByID;
}

- (BOOL)requiresHardPaywallForIssuesToC
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  char v3 = FCAppConfigurationBoolValue(v2, @"requiresHardPaywallForIssuesToC", 1);

  return v3;
}

- (int64_t)appLaunchUpsellPresentationDelay
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"appLaunchUpsellPresentationDelay", 0);

  return v3;
}

- (BOOL)widgetUpsellFeaturesEnabled
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  BOOL v3 = +[FCFeatureEnablementChecker enabledInConfig:v2 forKey:@"widgetUpsellFeaturesEnabled" withDefaultLevel:0];

  return v3;
}

- (NSString)osloAbandonmentUpsellArticleID
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  BOOL v3 = FCAppConfigurationStringValue(v2, @"osloAbandonmentUpsellArticleID", 0);

  return (NSString *)v3;
}

- (int64_t)osloAbandonmentUpsellQuiescenceInterval
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"osloAbandonmentUpsellQuiescenceInterval", 0);

  return v3;
}

- (int64_t)osloAbandonmentUpsellMaxPresentationCount
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationIntegerValue(v2, @"osloAbandonmentUpsellMaxPresentationCount", 0);

  return v3;
}

- (NSString)osloAbandonmentUpsellInstanceID
{
  id v2 = [(FCPaidBundleConfiguration *)self configDict];
  int64_t v3 = FCAppConfigurationStringValue(v2, @"osloAbandonmentUpsellInstanceID", &stru_1EF8299B8);

  return (NSString *)v3;
}

+ (id)defaultConfigurationForStorefrontID:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [FCPaidBundleConfiguration alloc];
  v8[0] = @"143441";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  int64_t v6 = [(FCPaidBundleConfiguration *)v4 initWithConfigDictionary:0 storefrontID:v3 localizedStorefrontID:v3 defaultSupportedStoreFronts:v5];

  return v6;
}

+ (id)renewalLandingPageByLocalizedStorefrontID
{
  if (qword_1EB5D18E8 != -1) {
    dispatch_once(&qword_1EB5D18E8, &__block_literal_global_449);
  }
  id v2 = (void *)qword_1EB5D18E0;
  return v2;
}

void __70__FCPaidBundleConfiguration_renewalLandingPageByLocalizedStorefrontID__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"143441";
  v2[1] = @"143455";
  v3[0] = @"ApD6XdJJuQ9Kr_QCk9ivPDQ";
  v3[1] = @"AVtXQTyGvT4OsKHgxZ05M1A";
  v2[2] = @"143455-fr-ca";
  v2[3] = @"143444";
  v3[2] = @"Apnn-WUtwSc2wEXaXYwuUWA";
  v3[3] = @"AXu1vfWkQTGCTyH2EjVUFwQ";
  v2[4] = @"143460";
  v3[4] = @"AfRcHZ0YIQbC4GCJ2KwZYxw";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)qword_1EB5D18E0;
  qword_1EB5D18E0 = v0;
}

+ (id)defaultLandingPageByLocalizedStorefrontID
{
  if (qword_1EB5D18F8 != -1) {
    dispatch_once(&qword_1EB5D18F8, &__block_literal_global_467_0);
  }
  id v2 = (void *)qword_1EB5D18F0;
  return v2;
}

void __70__FCPaidBundleConfiguration_defaultLandingPageByLocalizedStorefrontID__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"143441";
  v2[1] = @"143455";
  v3[0] = @"A53eyrvagTQO5cri5DWwDnw";
  v3[1] = @"AvPUnt7dQSmGX_KaIUHC5kQ";
  v2[2] = @"143455-fr-ca";
  v2[3] = @"143444";
  v3[2] = @"AfEzIPkyQTxC9g7atKJeVKw";
  v3[3] = @"A1fFFI_OFTuWOCZBiz3nBkw";
  v2[4] = @"143460";
  v3[4] = @"ATV43D73KTPyTlJ-hlICZmA";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)qword_1EB5D18F0;
  qword_1EB5D18F0 = v0;
}

+ (id)defaultServicesBundleLandingPageByLocalizedStorefrontID
{
  if (qword_1EB5D1908 != -1) {
    dispatch_once(&qword_1EB5D1908, &__block_literal_global_484);
  }
  id v2 = (void *)qword_1EB5D1900;
  return v2;
}

void __84__FCPaidBundleConfiguration_defaultServicesBundleLandingPageByLocalizedStorefrontID__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"143441";
  v2[1] = @"143455";
  v3[0] = @"AdgSCAdtlS0P9UQhWGbPVRA";
  v3[1] = @"AMNrflzD8TRirzxx_2tdqdA";
  v2[2] = @"143455-fr-ca";
  v2[3] = @"143444";
  v3[2] = @"AM3SM6D1cSHG6iB9O-deE_A";
  v3[3] = @"ASKOyErGaR3vAe6iqsxkekQ";
  v2[4] = @"143460";
  v3[4] = @"AiLdUCfKuR2C9hsKAryYVQw";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)qword_1EB5D1900;
  qword_1EB5D1900 = v0;
}

+ (id)defaultFamilySharingLandingPageByLocalizedStorefrontID
{
  if (qword_1EB5D1918 != -1) {
    dispatch_once(&qword_1EB5D1918, &__block_literal_global_501);
  }
  id v2 = (void *)qword_1EB5D1910;
  return v2;
}

void __83__FCPaidBundleConfiguration_defaultFamilySharingLandingPageByLocalizedStorefrontID__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"143441";
  v2[1] = @"143455";
  v3[0] = @"ATHi8wuYqRw6_2XiqVdBmRQ";
  v3[1] = @"ABnZHWwYzQAOG4srVl6oJPw";
  v2[2] = @"143455-fr-ca";
  v2[3] = @"143444";
  v3[2] = @"ADaPfwzFeS4Kqd7ynKkCGtA";
  v3[3] = @"ApJ3T6edORFWeIsm1UYVVnQ";
  v2[4] = @"143460";
  v3[4] = @"AOKrTMJ1ORhKcIeS77Oak5g";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)qword_1EB5D1910;
  qword_1EB5D1910 = v0;
}

+ (id)defaultEndOfPurchaseFamilySharingSetupArticleIDByLocalizedStorefrontID
{
  if (qword_1EB5D1928 != -1) {
    dispatch_once(&qword_1EB5D1928, &__block_literal_global_518);
  }
  id v2 = (void *)qword_1EB5D1920;
  return v2;
}

void __99__FCPaidBundleConfiguration_defaultEndOfPurchaseFamilySharingSetupArticleIDByLocalizedStorefrontID__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"143441";
  v2[1] = @"143455";
  v3[0] = @"Axse1yHejTiq4m6_FDhWjzQ";
  v3[1] = @"AQteqTSopTuyVb6risDsqqA";
  v2[2] = @"143455-fr-ca";
  v2[3] = @"143444";
  v3[2] = @"AQY3aWLseQxyESRs82-fbVA";
  v3[3] = @"AHhJreKRQTyueyd82FfUzVA";
  v2[4] = @"143460";
  v3[4] = @"ADcFux8UIR96JlKqVNI1fpQ";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)qword_1EB5D1920;
  qword_1EB5D1920 = v0;
}

+ (id)defaultEndOfPurchaseNoFamilySharingSetupArticleIDByLocalizedStorefrontID
{
  if (qword_1EB5D1938 != -1) {
    dispatch_once(&qword_1EB5D1938, &__block_literal_global_535);
  }
  id v2 = (void *)qword_1EB5D1930;
  return v2;
}

void __101__FCPaidBundleConfiguration_defaultEndOfPurchaseNoFamilySharingSetupArticleIDByLocalizedStorefrontID__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"143441";
  v2[1] = @"143455";
  v3[0] = @"Aj9QiLScMQ6ux3gXuFpSjLQ";
  v3[1] = @"AzXHbVKNIT4CFohbsyaGOOw";
  v2[2] = @"143455-fr-ca";
  v2[3] = @"143444";
  v3[2] = @"AbTcLWiv4TvGpXAB-tS0e3w";
  v3[3] = @"Ad0wrgFufRKKrELGiiY6KAA";
  v2[4] = @"143460";
  v3[4] = @"AoXCsrwX1Tm6WCWhQvbwomw";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)qword_1EB5D1930;
  qword_1EB5D1930 = v0;
}

+ (id)defaultTagListIDByLocalizedStorefrontID
{
  if (qword_1EB5D1948 != -1) {
    dispatch_once(&qword_1EB5D1948, &__block_literal_global_552);
  }
  id v2 = (void *)qword_1EB5D1940;
  return v2;
}

void __68__FCPaidBundleConfiguration_defaultTagListIDByLocalizedStorefrontID__block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"143441";
  uint64_t v0 = [NSString stringWithFormat:@"%@-%@-en", @"GI", @"143441"];
  v8[0] = v0;
  v7[1] = @"143455";
  v1 = [NSString stringWithFormat:@"%@-%@-en", @"GI", @"143455"];
  v8[1] = v1;
  void v7[2] = @"143455-fr-ca";
  id v2 = [NSString stringWithFormat:@"%@-%@-fr", @"GI", @"143455"];
  void v8[2] = v2;
  v7[3] = @"143444";
  id v3 = [NSString stringWithFormat:@"%@-%@-en", @"GI", @"143444"];
  v8[3] = v3;
  v7[4] = @"143460";
  id v4 = [NSString stringWithFormat:@"%@-%@-en", @"GI", @"143460"];
  v8[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  int64_t v6 = (void *)qword_1EB5D1940;
  qword_1EB5D1940 = v5;
}

+ (id)defaultPaidFeedIDByLocalizedStorefrontID
{
  if (qword_1EB5D1968 != -1) {
    dispatch_once(&qword_1EB5D1968, &__block_literal_global_568);
  }
  id v2 = (void *)qword_1EB5D1960;
  return v2;
}

void __69__FCPaidBundleConfiguration_defaultPaidFeedIDByLocalizedStorefrontID__block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [NSString stringWithFormat:@"%@$en-US", @"TRKNDEVsSSl2ye3cRDsruSQ", @"143441"];
  v8[0] = v0;
  v7[1] = @"143455";
  v1 = [NSString stringWithFormat:@"%@$en-CA", @"TRKNDEVsSSl2ye3cRDsruSQ"];
  v8[1] = v1;
  void v7[2] = @"143455-fr-ca";
  id v2 = [NSString stringWithFormat:@"%@$fr-CA", @"TRKNDEVsSSl2ye3cRDsruSQ"];
  void v8[2] = v2;
  v7[3] = @"143444";
  id v3 = [NSString stringWithFormat:@"%@$en-UK", @"TRKNDEVsSSl2ye3cRDsruSQ"];
  v8[3] = v3;
  v7[4] = @"143460";
  id v4 = [NSString stringWithFormat:@"%@$en-AU", @"TRKNDEVsSSl2ye3cRDsruSQ"];
  v8[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  int64_t v6 = (void *)qword_1EB5D1960;
  qword_1EB5D1960 = v5;
}

- (id)defaultPaywallConfigs
{
  v17[11] = *MEMORY[0x1E4F143B8];
  id v2 = [(FCPaidBundleConfiguration *)self defaultLandingPageArticleID];
  v16[0] = &unk_1EF8D8100;
  __int16 v15 = +[FCPaywallConfiguration defaultArticleHardPaywallWithLandingPageArticleID:v2];
  v17[0] = v15;
  v16[1] = &unk_1EF8D8118;
  uint64_t v14 = +[FCPaywallConfiguration defaultArticleSharedHardPaywallWithLandingPageArticleID:v2];
  v17[1] = v14;
  v16[2] = &unk_1EF8D8130;
  uint64_t v13 = +[FCPaywallConfiguration defaultArticleSoftPaywallWithLandingPageArticleID:v2];
  v17[2] = v13;
  v16[3] = &unk_1EF8D8148;
  id v3 = +[FCPaywallConfiguration defaultArticleSharedSoftPaywallWithLandingPageArticleID:v2];
  v17[3] = v3;
  v16[4] = &unk_1EF8D8160;
  id v4 = +[FCPaywallConfiguration defaultChannelSoftPaywallWithLandingPageArticleID:v2];
  void v17[4] = v4;
  v16[5] = &unk_1EF8D8178;
  uint64_t v5 = +[FCPaywallConfiguration defaultMagazineFeedSoftPaywallSmallPaywallWithLandingPageArticleID:v2];
  v17[5] = v5;
  v16[6] = &unk_1EF8D8190;
  int64_t v6 = +[FCPaywallConfiguration defaultMagazineFeedSoftPaywallMediumPaywallWithLandingPageArticleID:v2];
  v17[6] = v6;
  v16[7] = &unk_1EF8D81A8;
  id v7 = +[FCPaywallConfiguration defaultMagazineFeedSoftPaywallLargePaywallWithLandingPageArticleID:v2];
  v17[7] = v7;
  v16[8] = &unk_1EF8D81C0;
  uint64_t v8 = +[FCPaywallConfiguration defaultMagazineFeedVideoSoftPaywallSmallPaywallWithLandingPageArticleID:v2];
  v17[8] = v8;
  v16[9] = &unk_1EF8D81D8;
  uint64_t v9 = +[FCPaywallConfiguration defaultMagazineFeedVideoSoftPaywallLargePaywallWithLandingPageArticleID:v2];
  v17[9] = v9;
  v16[10] = &unk_1EF8D81F0;
  uint64_t v10 = +[FCPaywallConfiguration defaultPDFHardPaywallWithLandingPageArticleID:v2];
  v17[10] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:11];

  return v11;
}

- (id)defaultAudioPaywallConfigs
{
  v13[7] = *MEMORY[0x1E4F143B8];
  id v2 = [(FCPaidBundleConfiguration *)self defaultLandingPageArticleID];
  v12[0] = &unk_1EF8D8100;
  id v3 = +[FCPaywallConfiguration defaultAudioArticleHardPaywallWithLandingPageArticleID:v2];
  v13[0] = v3;
  v12[1] = &unk_1EF8D8118;
  id v4 = +[FCPaywallConfiguration defaultAudioArticleSharedHardPaywallWithLandingPageArticleID:v2];
  v13[1] = v4;
  v12[2] = &unk_1EF8D8130;
  uint64_t v5 = +[FCPaywallConfiguration defaultAudioArticleSoftPaywallWithLandingPageArticleID:v2];
  v13[2] = v5;
  v12[3] = &unk_1EF8D8148;
  int64_t v6 = +[FCPaywallConfiguration defaultAudioArticleSharedSoftPaywallWithLandingPageArticleID:v2];
  v13[3] = v6;
  v12[4] = &unk_1EF8D8208;
  id v7 = +[FCPaywallConfiguration defaultAudioFeedSoftPaywallSmallPaywallWithLandingPageArticleID:v2];
  v13[4] = v7;
  v12[5] = &unk_1EF8D8220;
  uint64_t v8 = +[FCPaywallConfiguration defaultAudioFeedSoftPaywallLargePaywallWithLandingPageArticleID:v2];
  v13[5] = v8;
  v12[6] = &unk_1EF8D8160;
  uint64_t v9 = +[FCPaywallConfiguration defaultChannelSoftPaywallWithLandingPageArticleID:v2];
  v13[6] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];

  return v10;
}

- (id)defaultSubscriptionButtonConfigs
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v2 = [(FCPaidBundleConfiguration *)self defaultLandingPageArticleID];
  v8[0] = &unk_1EF8D8100;
  id v3 = +[FCSubscriptionButtonConfiguration defaultArticleSubscriptionButtonWithLandingPageArticleID:v2];
  v9[0] = v3;
  v8[1] = &unk_1EF8D8118;
  id v4 = +[FCSubscriptionButtonConfiguration defaultOsloSheetTargetSubscriptionButton];
  v9[1] = v4;
  void v8[2] = &unk_1EF8D8130;
  uint64_t v5 = +[FCSubscriptionButtonConfiguration defaultIssueCoverSubscriptionButtonWithLandingPageArticleID:v2];
  v9[2] = v5;
  int64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)defaultServicesBundleSubscriptionButtonConfigs
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v2 = [(FCPaidBundleConfiguration *)self defaultServicesBundleLandingPageArticleID];
  v8[0] = &unk_1EF8D8100;
  id v3 = +[FCSubscriptionButtonConfiguration defaultArticleSubscriptionButtonWithLandingPageArticleID:v2];
  v9[0] = v3;
  v8[1] = &unk_1EF8D8118;
  id v4 = +[FCSubscriptionButtonConfiguration defaultAmsSheetTargetSubscriptionButton];
  v9[1] = v4;
  void v8[2] = &unk_1EF8D8130;
  uint64_t v5 = +[FCSubscriptionButtonConfiguration defaultIssueCoverSubscriptionButtonWithLandingPageArticleID:v2];
  v9[2] = v5;
  int64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)defaultMagazineGenres
{
  v70[15] = *MEMORY[0x1E4F143B8];
  id v2 = FCBundle();
  id v3 = [v2 localizedStringForKey:@"automotive magazines" value:&stru_1EF8299B8 table:0];
  id v4 = +[FCMagazineGenre magazineGenreWithGenre:@"automotive" localizedDescription:v3];

  uint64_t v5 = FCBundle();
  int64_t v6 = [v5 localizedStringForKey:@"business & finance magazines" value:&stru_1EF8299B8 table:0];
  id v7 = +[FCMagazineGenre magazineGenreWithGenre:@"business-finance" localizedDescription:v6];

  uint64_t v8 = FCBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"crafts & hobby magazines" value:&stru_1EF8299B8 table:0];
  uint64_t v10 = +[FCMagazineGenre magazineGenreWithGenre:@"crafts-hobby" localizedDescription:v9];

  uint64_t v11 = FCBundle();
  uint64_t v12 = [v11 localizedStringForKey:@"entertainment magazines" value:&stru_1EF8299B8 table:0];
  uint64_t v13 = +[FCMagazineGenre magazineGenreWithGenre:@"entertainment" localizedDescription:v12];

  uint64_t v14 = FCBundle();
  __int16 v15 = [v14 localizedStringForKey:@"fashion & style magazines" value:&stru_1EF8299B8 table:0];
  __int16 v16 = +[FCMagazineGenre magazineGenreWithGenre:@"fashion-style" localizedDescription:v15];

  uint64_t v17 = FCBundle();
  long long v18 = [v17 localizedStringForKey:@"food & cooking magazines" value:&stru_1EF8299B8 table:0];
  v68 = +[FCMagazineGenre magazineGenreWithGenre:@"food-cooking" localizedDescription:v18];

  long long v19 = FCBundle();
  long long v20 = [v19 localizedStringForKey:@"health & fitness magazines" value:&stru_1EF8299B8 table:0];
  v67 = +[FCMagazineGenre magazineGenreWithGenre:@"health-fitness" localizedDescription:v20];

  long long v21 = FCBundle();
  long long v22 = [v21 localizedStringForKey:@"home & gardening magazines" value:&stru_1EF8299B8 table:0];
  v66 = +[FCMagazineGenre magazineGenreWithGenre:@"home-gardening" localizedDescription:v22];

  uint64_t v23 = FCBundle();
  long long v24 = [v23 localizedStringForKey:@"kids & parenting magazines" value:&stru_1EF8299B8 table:0];
  v65 = +[FCMagazineGenre magazineGenreWithGenre:@"kids-parenting" localizedDescription:v24];

  uint64_t v25 = FCBundle();
  long long v26 = [v25 localizedStringForKey:@"men’s lifestyle magazines" value:&stru_1EF8299B8 table:0];
  v64 = +[FCMagazineGenre magazineGenreWithGenre:@"men-lifestyle" localizedDescription:v26];

  uint64_t v27 = FCBundle();
  uint64_t v28 = [v27 localizedStringForKey:@"news & politics magazines" value:&stru_1EF8299B8 table:0];
  v63 = +[FCMagazineGenre magazineGenreWithGenre:@"news-politics" localizedDescription:v28];

  v29 = FCBundle();
  uint64_t v30 = [v29 localizedStringForKey:@"science & technology magazines" value:&stru_1EF8299B8 table:0];
  v62 = +[FCMagazineGenre magazineGenreWithGenre:@"science-technology" localizedDescription:v30];

  v31 = FCBundle();
  uint64_t v32 = [v31 localizedStringForKey:@"sports & recreation magazines" value:&stru_1EF8299B8 table:0];
  v61 = +[FCMagazineGenre magazineGenreWithGenre:@"sports-recreation" localizedDescription:v32];

  v33 = FCBundle();
  objc_super v34 = [v33 localizedStringForKey:@"travel magazines" value:&stru_1EF8299B8 table:0];
  v60 = +[FCMagazineGenre magazineGenreWithGenre:@"travel-regional" localizedDescription:v34];

  v35 = FCBundle();
  v36 = [v35 localizedStringForKey:@"women’s lifestyle magazines" value:&stru_1EF8299B8 table:0];
  v48 = +[FCMagazineGenre magazineGenreWithGenre:@"women-lifestyle" localizedDescription:v36];

  v59 = v4;
  v54 = [v4 genre];
  v69[0] = v54;
  v70[0] = v4;
  v58 = v7;
  v53 = [v7 genre];
  v69[1] = v53;
  v70[1] = v7;
  v57 = v10;
  v52 = [v10 genre];
  v69[2] = v52;
  v70[2] = v10;
  v56 = v13;
  v51 = [v13 genre];
  v69[3] = v51;
  v70[3] = v13;
  v55 = v16;
  v50 = [v16 genre];
  v69[4] = v50;
  v70[4] = v16;
  v49 = [v68 genre];
  v69[5] = v49;
  v70[5] = v68;
  v37 = [v67 genre];
  v69[6] = v37;
  v70[6] = v67;
  v38 = [v66 genre];
  v69[7] = v38;
  v70[7] = v66;
  v39 = [v65 genre];
  v69[8] = v39;
  v70[8] = v65;
  v40 = [v64 genre];
  v69[9] = v40;
  v70[9] = v64;
  v41 = [v63 genre];
  v69[10] = v41;
  v70[10] = v63;
  v42 = [v62 genre];
  v69[11] = v42;
  v70[11] = v62;
  v43 = [v61 genre];
  v69[12] = v43;
  v70[12] = v61;
  v44 = [v60 genre];
  v69[13] = v44;
  v70[13] = v60;
  v45 = [v48 genre];
  v69[14] = v45;
  v70[14] = v48;
  id v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:15];

  return v47;
}

- (unint64_t)articleSoftPaywallPosition
{
  return self->_articleSoftPaywallPosition;
}

- (unint64_t)aLaCarteArticleSoftPaywallPosition
{
  return self->_aLaCarteArticleSoftPaywallPosition;
}

- (void)setMagazineGenresByGenre:(id)a3
{
}

- (void)setAudioUpsellConfigurationsByID:(id)a3
{
}

- (void)setConfigDict:(id)a3
{
}

- (NSMutableDictionary)keyedPaywallConfigurationsByType
{
  return self->_keyedPaywallConfigurationsByType;
}

- (void)setKeyedPaywallConfigurationsByType:(id)a3
{
}

- (NSMutableDictionary)keyedSubscriptionButtonConfigurationsByType
{
  return self->_keyedSubscriptionButtonConfigurationsByType;
}

- (void)setKeyedSubscriptionButtonConfigurationsByType:(id)a3
{
}

- (NSMutableDictionary)keyedPostPurchaseOnboardingConfigurationsByType
{
  return self->_keyedPostPurchaseOnboardingConfigurationsByType;
}

- (void)setKeyedPostPurchaseOnboardingConfigurationsByType:(id)a3
{
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

@end