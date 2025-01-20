@interface IMURLBag
+ (id)sharedInstance;
+ (void)registerBagKeys:(id)a3;
- (AMSBag)liveBag;
- (AMSSnapshotBag)currentSnapshot;
- (BOOL)isExpired;
- (IMMutableBagKeySet)keySet;
- (IMURLBag)init;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (OS_dispatch_queue)queue;
- (double)libraryShowFetchThresholdDefaultValue;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)backgroundFetchInterval;
- (id)bag;
- (id)batchFeedFetchIsEnabled;
- (id)batchFeedFetchOnPushDormancyPeriod;
- (id)batchFeedFetchOnPushRolloutPercentage;
- (id)batchFeedFetchOnPushShowLimit;
- (id)batchFeedFetchShowBatchSize;
- (id)batchFeedFetchShowCountMinimum;
- (id)coldStartLandOnListenNow;
- (id)commerceMusicSubscriptionInfoUrl;
- (id)commerceOAuthCancellationUrl;
- (id)commerceOAuthVerificationUrl;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)fairPlayV2Enabled;
- (id)fairPlayV2RolloutRate;
- (id)fetchCategoriesSyncThresholdValue;
- (id)fetchMusicSubscriptionThresholdValue;
- (id)includeEntitlementsContent;
- (id)integerForKey:(id)a3;
- (id)libraryShowFetchThreshold;
- (id)mediaTaskCountryCode;
- (id)mescalCertificateURL;
- (id)mescalSetupURL;
- (id)mescalSignSapRequests;
- (id)mescalSignSapResponses;
- (id)mescalSignedActions;
- (id)metricsDictionary;
- (id)metricsFastImpressionTimeout;
- (id)metricsImpressionableThreshold;
- (id)metricsImpressionableViewablePercentage;
- (id)metricsSamplingPercentageUsersLog;
- (id)metricsSessionDurationLog;
- (id)metricsURL;
- (id)personalizedChannelPollingInterval;
- (id)personalizedLookupURL;
- (id)podcastsLicenseCert;
- (id)podcastsLicenseOfflineRenew;
- (id)podcastsLicenseOfflineStart;
- (id)podcastsLicenseOfflineStop;
- (id)podcastsLicenseOfflineStopNonce;
- (id)podcastsLicenseStreamingRenew;
- (id)podcastsLicenseStreamingStart;
- (id)podcastsLicenseStreamingStop;
- (id)podcastsMediaAPIHostUrl;
- (id)pushNotificationRegistration;
- (id)reportAConcernURL;
- (id)storefrontSupportsColdStart;
- (id)stringForKey:(id)a3;
- (id)syncStringForKey:(id)a3;
- (id)syncValueForKey:(id)a3;
- (id)tokenServiceUrl;
- (id)transcriptCensorWords;
- (id)trustedDomains;
- (id)unpersonalizedLookupURL;
- (int64_t)downloadLimitPodcast;
- (int64_t)downloadLimitVideoPodcast;
- (unint64_t)explicitContentBadgeTreatment;
- (unint64_t)failedUpdateAttempts;
- (void)_registerBagKeysIfNeeded;
- (void)createSnapshotWithCompletion:(id)a3;
- (void)reportAConcernURLWithCompletion:(id)a3;
- (void)scheduleBagUpdateOnDate:(id)a3;
- (void)setCurrentSnapshot:(id)a3;
- (void)setDownloadLimitPodcast:(int64_t)a3;
- (void)setDownloadLimitVideoPodcast:(int64_t)a3;
- (void)setFailedUpdateAttempts:(unint64_t)a3;
- (void)setKeySet:(id)a3;
- (void)setLibraryShowFetchThresholdDefaultValue:(double)a3;
- (void)setLiveBag:(id)a3;
- (void)setQueue:(id)a3;
- (void)updateBagOnCurrentQueue;
- (void)updateWithNewBag:(id)a3;
@end

@implementation IMURLBag

- (id)mediaTaskCountryCode
{
  v2 = [(IMURLBag *)self bag];
  v3 = [v2 stringForKey:@"countryCode"];

  return v3;
}

- (id)includeEntitlementsContent
{
  v2 = [(IMURLBag *)self bag];
  v3 = [v2 BOOLForKey:@"podcasts-entitlements"];

  return v3;
}

- (id)fetchCategoriesSyncThresholdValue
{
  v2 = [(IMURLBag *)self bag];
  v3 = [v2 doubleForKey:@"podcasts-category-sync-threshold-interval-seconds"];

  return v3;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__IMURLBag_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_instance_0;
  return v2;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  v5 = [(IMURLBag *)self bag];
  v6 = [v5 dictionaryForKey:v4];

  return v6;
}

- (id)metricsDictionary
{
  v2 = [(IMURLBag *)self bag];
  v3 = [v2 dictionaryForKey:@"metrics"];

  return v3;
}

- (id)doubleForKey:(id)a3
{
  id v4 = a3;
  v5 = [(IMURLBag *)self bag];
  v6 = [v5 doubleForKey:v4];

  return v6;
}

- (id)syncValueForKey:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(IMMutableBagKeySet *)self->_keySet valueTypeMap];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    switch([v6 integerValue])
    {
      case 1:
        uint64_t v7 = [(IMURLBag *)self BOOLForKey:v4];
        goto LABEL_10;
      case 2:
        uint64_t v7 = [(IMURLBag *)self doubleForKey:v4];
        goto LABEL_10;
      case 3:
        uint64_t v7 = [(IMURLBag *)self integerForKey:v4];
        goto LABEL_10;
      case 4:
        uint64_t v7 = [(IMURLBag *)self stringForKey:v4];
        goto LABEL_10;
      case 5:
        uint64_t v7 = [(IMURLBag *)self URLForKey:v4];
LABEL_10:
        v9 = (void *)v7;
        break;
      default:
        v9 = 0;
        break;
    }
    v10 = _MTLogCategoryBag();
    os_signpost_id_t v11 = os_signpost_id_generate(v10);

    v12 = _MTLogCategoryBag();
    v13 = v12;
    unint64_t v14 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v4;
      _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "IMURLBag.syncValue", "Key: %@", buf, 0xCu);
    }

    v15 = [(IMURLBag *)self bag];
    v16 = [(IMURLBag *)self liveBag];
    if (v15 == v16)
    {
      v18 = [(IMURLBag *)self liveBag];
      char v17 = [v18 isExpired];
    }
    else
    {
      char v17 = 0;
    }

    id v19 = 0;
    id v20 = 0;
    if (![v9 isLoaded]
      || (v17 & 1) != 0
      || ([v9 asyncValuePromise],
          v21 = objc_claimAutoreleasedReturnValue(),
          id v38 = 0,
          [v21 resultWithTimeout:&v38 error:0.15],
          id v19 = (id)objc_claimAutoreleasedReturnValue(),
          id v20 = v38,
          v21,
          !v19)
      || v20)
    {
      id v37 = v4;
      v24 = _MTLogCategoryBag();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v25 = [v9 isLoaded];
        unint64_t v26 = v11 - 1;
        v27 = v6;
        v28 = v15;
        v29 = v9;
        os_signpost_id_t v30 = v11;
        int v31 = v25;
        BOOL v32 = [(IMURLBag *)self isExpired];
        *(_DWORD *)buf = 138413058;
        id v40 = v37;
        __int16 v41 = 1024;
        int v42 = v31;
        os_signpost_id_t v11 = v30;
        v9 = v29;
        v15 = v28;
        v6 = v27;
        unint64_t v14 = v26;
        __int16 v43 = 1024;
        BOOL v44 = v32;
        __int16 v45 = 2112;
        id v46 = v20;
        _os_log_impl(&dword_1AC9D5000, v24, OS_LOG_TYPE_ERROR, "Failed synchronous bag key request: %@ isLoaded %d, isExpired %d. Error: %@", buf, 0x22u);
      }

      v33 = _MTLogCategoryBag();
      v34 = v33;
      if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v20;
        _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v34, OS_SIGNPOST_INTERVAL_END, v11, "IMURLBag.syncValue", "Error: %@", buf, 0xCu);
      }

      v35 = [(IMMutableBagKeySet *)self->_keySet defaultValueMap];
      id v4 = v37;
      v8 = [v35 objectForKeyedSubscript:v37];
    }
    else
    {
      v22 = _MTLogCategoryBag();
      v23 = v22;
      if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v23, OS_SIGNPOST_INTERVAL_END, v11, "IMURLBag.syncValue", "", buf, 2u);
      }

      id v19 = v19;
      id v20 = 0;
      v8 = v19;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)bag
{
  if (os_feature_enabled_bag_snapshot_overlay())
  {
    v3 = [(IMURLBag *)self currentSnapshot];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [(IMURLBag *)self liveBag];
    }
    v6 = v5;
  }
  else
  {
    v6 = [(IMURLBag *)self liveBag];
  }
  return v6;
}

- (AMSSnapshotBag)currentSnapshot
{
  return (AMSSnapshotBag *)objc_getProperty(self, a2, 40, 1);
}

- (AMSBag)liveBag
{
  return self->_liveBag;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(IMURLBag *)self bag];
  v6 = [v5 stringForKey:v4];

  return v6;
}

void __36__IMURLBag__registerBagKeysIfNeeded__block_invoke(uint64_t a1)
{
  v35 = objc_alloc_init(IMMutableBagKeySet);
  [(AMSMutableBagKeySet *)v35 addBagKey:@"js-app-url" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"language" valueType:4];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"fetch-timeout" valueType:2];
  [(IMMutableBagKeySet *)v35 addBagKey:@"ExplicitContentBadgeTreatment" valueType:4 defaultValue:&stru_1F03A51F0];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"search" valueType:4];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"searchHints" valueType:4];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"podcasts" valueType:5];
  [(IMMutableBagKeySet *)v35 addBagKey:@"viewPodcast" valueType:5 defaultValue:@"https://podcasts.apple.com/podcast"];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"appletv-view-top-url" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"library-link" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"showSearchTranscriptMessage" valueType:1];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"ListenNowStoreShelvesThrottleInterval" valueType:2];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"followedShowsMetricsCadence" valueType:4];
  v2 = (void *)MEMORY[0x1E4F28ED0];
  +[MTPodcast defaultUpdateInterval];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-skip-feed-update-interval-seconds" valueType:2 defaultValue:v3];

  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-upp-sync-interval-seconds" valueType:2 defaultValue:&unk_1F03D8970];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-old-feed-update-processor-interval-in-seconds" valueType:2 defaultValue:&unk_1F03D8730];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"p2-application-user-rate-content" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"sp2-application-user-write-review" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"forgottenPassword" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"modifyAccount" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"AddFundsUrl" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"manageSubscriptionsV2Url" valueType:5];
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/signupWizard"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"signup" valueType:5 defaultValue:v4];

  [(AMSMutableBagKeySet *)v35 addBagKey:@"metrics/metricsUrl" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"metrics" valueType:6];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"metrics/performance/samplingPercentageUsersLog" valueType:2];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"metrics/performance/sessionDurationLog" valueType:2];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"metrics/impressions/viewableThreshold" valueType:2];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"metrics/impressions/viewablePercentage" valueType:2];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"metrics/postFrequencyLowLatency" valueType:2];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"sign-sap-setup-cert" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"sign-sap-setup" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"signed-actions" valueType:6];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"sign-sap-request" valueType:6];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"sign-sap-response" valueType:6];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"storeplatform-lookup-url" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"storeplatform-lookup-url-unpersonalized" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"trustedDomains" valueType:0];
  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"amp-api.podcasts.apple.com"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcasts-media-api-host" valueType:5 defaultValue:v5];

  [(IMMutableBagKeySet *)v35 addBagKey:@"countryCode" valueType:4 defaultValue:@"us"];
  v6 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://sf-api-token-service.itunes.apple.com/apiToken/"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"sf-api-token-service-url" valueType:5 defaultValue:v6];

  [(IMMutableBagKeySet *)v35 addBagKey:@"channelSubsCacheTTL" valueType:2 defaultValue:&unk_1F03D8980];
  [(IMMutableBagKeySet *)v35 addBagKey:@"token-service-backoff-interval" valueType:2 defaultValue:&unk_1F03D8990];
  [(IMMutableBagKeySet *)v35 addBagKey:@"token-service-backoff-max" valueType:2 defaultValue:&unk_1F03D89A0];
  uint64_t v7 = MEMORY[0x1E4F1CC38];
  [(IMMutableBagKeySet *)v35 addBagKey:@"token-service-enabled" valueType:1 defaultValue:MEMORY[0x1E4F1CC38]];
  [(IMMutableBagKeySet *)v35 addBagKey:@"token-service-refresh-percentage" valueType:2 defaultValue:&unk_1F03D89B0];
  [(IMMutableBagKeySet *)v35 addBagKey:@"token-service-refresh-time" valueType:2 defaultValue:&unk_1F03D8748];
  v8 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://s.mzstatic.com/sap/fps-prod.crt"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"fps-cert" valueType:5 defaultValue:v8];

  v9 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/streaming/start"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcasts-license-streaming-start" valueType:5 defaultValue:v9];

  v10 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/streaming/renew"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcasts-license-streaming-renew" valueType:5 defaultValue:v10];

  os_signpost_id_t v11 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/streaming/stop"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcasts-license-streaming-stop" valueType:5 defaultValue:v11];

  v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/offline/start"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcasts-license-offline-start" valueType:5 defaultValue:v12];

  v13 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/offline/renew"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcasts-license-offline-renew" valueType:5 defaultValue:v13];

  unint64_t v14 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/offline/stop"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcasts-license-offline-stop" valueType:5 defaultValue:v14];

  v15 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/offline/stop/nonce"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcasts-license-offline-stop-nonce" valueType:5 defaultValue:v15];

  [(IMMutableBagKeySet *)v35 addBagKey:@"fairplay-v2-enabled" valueType:1 defaultValue:v7];
  [(IMMutableBagKeySet *)v35 addBagKey:@"fairplay-v2-rollout-rate" valueType:2 defaultValue:&unk_1F03D89C0];
  v16 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://buy.itunes.apple.com/WebObjects/MZBuy.woa/wa/buyProduct"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"buyProduct" valueType:5 defaultValue:v16];

  char v17 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://p2-buy.itunes.apple.com/WebObjects/MZBuy.woa/wa/buyProduct"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"p2-in-app-buy" valueType:5 defaultValue:v17];

  [(IMMutableBagKeySet *)v35 addBagKey:@"commerce-ui-urls/url-patterns" valueType:0 defaultValue:&unk_1F03D8910];
  [(IMMutableBagKeySet *)v35 addBagKey:@"commerce-ui-urls/v2-url-patterns" valueType:0 defaultValue:&unk_1F03D8928];
  [(IMMutableBagKeySet *)v35 addBagKey:@"commerce-ui-urls/dynamic-url-patterns" valueType:0 defaultValue:&unk_1F03D8940];
  v18 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://finance-app.itunes.apple.com/account/manage-payments?=mtPageRef=BE-IAB"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"paymentInformationUrl" valueType:5 defaultValue:v18];

  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-implicitly-followed-shows-limit" valueType:3 defaultValue:&unk_1F03D8760];
  id v19 = (void *)MEMORY[0x1E4F28ED0];
  +[MTPodcast defaultUpdateInterval];
  id v20 = objc_msgSend(v19, "numberWithDouble:");
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-skip-feed-update-interval-seconds" valueType:2 defaultValue:v20];

  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-old-feed-update-processor-interval-in-seconds" valueType:2 defaultValue:&unk_1F03D8730];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-foreground-show-feed-update-threshold-in-seconds" valueType:2 defaultValue:&unk_1F03D8778];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-feed-update-interval-seconds" valueType:2 defaultValue:&unk_1F03D8790];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcasts-oauth-redirect-url" valueType:4 defaultValue:@"https://oauth.link.apple.com/api/v1/client/redirect/{oauth-adam-id}"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcasts-oauth-revoke-subscription-url" valueType:4 defaultValue:@"https://oauth.link.apple.com/api/v1/revoke/subscription/{oauth-adam-id}"];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"play-activity-feed-metadata" valueType:5];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcasts-music-subs-info-interval-in-seconds" valueType:2 defaultValue:&unk_1F03D87A8];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcasts-entitlements" valueType:1 defaultValue:v7];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcasts-category-sync-threshold-interval-seconds" valueType:2 defaultValue:&unk_1F03D87C0];
  v21 = [MEMORY[0x1E4F28ED0] numberWithDouble:60.0];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-library-show-feed-update-threshold-in-seconds" valueType:2 defaultValue:v21];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"guid-urls/regex" valueType:0];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"guid-urls/schemes" valueType:0];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"pushNotificationSettings" valueType:6];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"podcast-catalog" valueType:1];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"upp-polling-interval-secs" valueType:3];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"podcast-lookup-url" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"podcast-genres-tree" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"podcast-dzc-auto-download-url" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"podcast-dzc-download-url" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"podcast-dzc-enclosure-url" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"podcast-dzc-material-delete-url" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"podcast-dzc-stream-url" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"podcast-dzc-subscribe-podcast" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"podcast-dzc-browse-url" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"kvs-getall" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"kvs-putall" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"p2-podcasts-search" valueType:5];
  v22 = [MEMORY[0x1E4F1CB10] URLWithString:@"itms://itunes.com/welcometopodcasts"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-welcome-room-url" valueType:5 defaultValue:v22];

  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-redirect-url-prefix" valueType:4 defaultValue:@"https://pcr.apple.com/id"];
  v23 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://bookkeeper.itunes.apple.com/WebObjects/MZBookkeeper.woa/wa/register"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"kvs-register" valueType:5 defaultValue:v23];

  v24 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/acknowledgePrivacy"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"privacyAcknowledgementUrl" valueType:5 defaultValue:v24];

  [(AMSMutableBagKeySet *)v35 addBagKey:@"kvs-getall.com.apple.upp" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"kvs-putall.com.apple.upp" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"baseURLForGETAll" valueType:5];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"baseURLForPUTAll" valueType:5];
  [(IMMutableBagKeySet *)v35 addBagKey:@"upp-disabled" valueType:4 defaultValue:@"NO"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"UPPDisabled" valueType:1 defaultValue:MEMORY[0x1E4F1CC28]];
  LODWORD(v25) = 1163984896;
  unint64_t v26 = [MEMORY[0x1E4F28ED0] numberWithFloat:v25];
  [(IMMutableBagKeySet *)v35 addBagKey:@"pollingInterval" valueType:2 defaultValue:v26];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"mobile-network-constraints" valueType:0];
  v27 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://www.apple.com/feedback/apple-podcasts.html"];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-report-a-concern-url" valueType:5 defaultValue:v27];

  [(AMSMutableBagKeySet *)v35 addBagKey:@"podcast-cold-start-available-in-storefront" valueType:1];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"podcast-cold-start-should-land-listen-now" valueType:1];
  [(AMSMutableBagKeySet *)v35 addBagKey:@"transcript-censor-words" valueType:0];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-delta-feed-sync-batch-enabled" valueType:1 defaultValue:v7];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-delta-feed-sync-batch-threshold" valueType:3 defaultValue:&unk_1F03D87D8];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-delta-feed-sync-batch-size-limit" valueType:3 defaultValue:&unk_1F03D87F0];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-delta-feed-sync-batch-on-pushes-rollout-percentage" valueType:3 defaultValue:&unk_1F03D8718];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-delta-feed-sync-show-decay-period-in-days" valueType:3 defaultValue:&unk_1F03D8808];
  [(IMMutableBagKeySet *)v35 addBagKey:@"podcast-delta-feed-sync-batch-on-pushes-size-limit" valueType:3 defaultValue:&unk_1F03D8820];
  v28 = (void *)MEMORY[0x1E4F4DBE0];
  v29 = [MEMORY[0x1E4F4DE68] bagKeySet];
  os_signpost_id_t v30 = +[PFClientUtil bagProfileName];
  int v31 = +[PFClientUtil bagProfileVersion];
  [v28 registerBagKeySet:v29 forProfile:v30 profileVersion:v31];

  BOOL v32 = (void *)MEMORY[0x1E4F4DBE0];
  v33 = +[PFClientUtil bagProfileName];
  v34 = +[PFClientUtil bagProfileVersion];
  [v32 registerBagKeySet:v35 forProfile:v33 profileVersion:v34];

  [*(id *)(a1 + 32) setKeySet:v35];
}

- (void)setKeySet:(id)a3
{
}

- (id)syncStringForKey:(id)a3
{
  v3 = [(IMURLBag *)self syncValueForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [NSString stringWithFormat:@"%@", v3];
  }
  id v5 = v4;

  return v5;
}

uint64_t __41__IMURLBag_createSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(IMURLBag *)self bag];
  v6 = [v5 arrayForKey:v4];

  return v6;
}

void __16__IMURLBag_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateBagOnCurrentQueue];
  v2 = [MEMORY[0x1E4F4DDB8] networkConstraintsForMediaType:@"podcast" withBag:*(void *)(a1 + 32)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __16__IMURLBag_init__block_invoke_2;
  v6[3] = &unk_1E5E63610;
  id v7 = *(id *)(a1 + 32);
  [v2 addFinishBlock:v6];

  v3 = [MEMORY[0x1E4F4DDB8] networkConstraintsForMediaType:@"videoPodcast" withBag:*(void *)(a1 + 32)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __16__IMURLBag_init__block_invoke_3;
  v4[3] = &unk_1E5E63610;
  id v5 = *(id *)(a1 + 32);
  [v3 addFinishBlock:v4];
}

- (void)updateBagOnCurrentQueue
{
  if (os_feature_enabled_bag_snapshot_overlay())
  {
    objc_initWeak(&location, self);
    v3 = [(IMURLBag *)self liveBag];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __35__IMURLBag_updateBagOnCurrentQueue__block_invoke;
    v4[3] = &unk_1E5E63638;
    objc_copyWeak(&v5, &location);
    [v3 createSnapshotWithCompletion:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IMURLBag *)self liveBag];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__IMURLBag_createSnapshotWithCompletion___block_invoke;
  v7[3] = &unk_1E5E63688;
  id v8 = v4;
  id v6 = v4;
  [v5 createSnapshotWithCompletion:v7];
}

- (id)batchFeedFetchIsEnabled
{
  if (os_feature_enabled_batch_feed_fetch_on_push_forced()) {
    [MEMORY[0x1E4F4DBE8] frozenBagValueWithKey:@"podcast-delta-feed-sync-batch-enabled" value:MEMORY[0x1E4F1CC38] valueType:1];
  }
  else {
  v3 = [(IMURLBag *)self BOOLForKey:@"podcast-delta-feed-sync-batch-enabled"];
  }
  return v3;
}

- (id)BOOLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(IMURLBag *)self bag];
  id v6 = [v5 BOOLForKey:v4];

  return v6;
}

- (id)URLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(IMURLBag *)self bag];
  id v6 = [v5 URLForKey:v4];

  return v6;
}

- (id)podcastsMediaAPIHostUrl
{
  v2 = [(IMURLBag *)self bag];
  v3 = [v2 URLForKey:@"podcasts-media-api-host"];

  return v3;
}

- (id)integerForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(IMURLBag *)self bag];
  id v6 = [v5 integerForKey:v4];

  return v6;
}

void __16__IMURLBag_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x1E4F4DB30];
  id v5 = v3;
  if ([v3 hasSizeLimitForNetworkType:*MEMORY[0x1E4F4DB30]]) {
    objc_msgSend(*(id *)(a1 + 32), "setDownloadLimitPodcast:", objc_msgSend(v5, "sizeLimitForNetworkType:", v4));
  }
}

void __16__IMURLBag_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x1E4F4DB30];
  id v5 = v3;
  if ([v3 hasSizeLimitForNetworkType:*MEMORY[0x1E4F4DB30]]) {
    objc_msgSend(*(id *)(a1 + 32), "setDownloadLimitVideoPodcast:", objc_msgSend(v5, "sizeLimitForNetworkType:", v4));
  }
}

- (void)setDownloadLimitVideoPodcast:(int64_t)a3
{
  self->_downloadLimitVideoPodcast = a3;
}

- (void)setDownloadLimitPodcast:(int64_t)a3
{
  self->_downloadLimitPodcast = a3;
}

void __35__IMURLBag_updateBagOnCurrentQueue__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__IMURLBag_updateBagOnCurrentQueue__block_invoke_2;
    block[3] = &unk_1E5E62180;
    id v11 = v5;
    id v12 = v6;
    v13 = v8;
    dispatch_async(v9, block);
  }
}

void __35__IMURLBag_updateBagOnCurrentQueue__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    id v7 = _MTLogCategoryBag();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1AC9D5000, v7, OS_LOG_TYPE_DEFAULT, "Successfully updated bag snapshot.", (uint8_t *)&v8, 2u);
    }

    [*(id *)(a1 + 48) updateWithNewBag:*(void *)(a1 + 32)];
    [*(id *)(a1 + 48) setFailedUpdateAttempts:0];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "setFailedUpdateAttempts:", objc_msgSend(*(id *)(a1 + 48), "failedUpdateAttempts") + 1);
    v2 = _MTLogCategoryBag();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "failedUpdateAttempts"));
      uint64_t v4 = *(void *)(a1 + 40);
      int v8 = 138412546;
      v9 = v3;
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      _os_log_impl(&dword_1AC9D5000, v2, OS_LOG_TYPE_ERROR, "%@ failure to create snapshot bag with error %@", (uint8_t *)&v8, 0x16u);
    }
    id v5 = *(void **)(a1 + 48);
    id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:300.0];
    [v5 scheduleBagUpdateOnDate:v6];
  }
}

- (void)updateWithNewBag:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(IMURLBag *)self setCurrentSnapshot:v4];
    id v6 = [v4 expirationDate];

    id v5 = [v6 dateByAddingTimeInterval:1.0];
    [(IMURLBag *)self scheduleBagUpdateOnDate:v5];
  }
}

- (void)setFailedUpdateAttempts:(unint64_t)a3
{
  self->_failedUpdateAttempts = a3;
}

- (void)setCurrentSnapshot:(id)a3
{
}

- (void)scheduleBagUpdateOnDate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  [v4 timeIntervalSinceNow];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  id v7 = [(IMURLBag *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__IMURLBag_scheduleBagUpdateOnDate___block_invoke;
  v8[3] = &unk_1E5E62098;
  objc_copyWeak(&v9, &location);
  dispatch_after(v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __26__IMURLBag_sharedInstance__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___IMURLBag;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "init");
  v2 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = v1;
}

- (IMURLBag)init
{
  v15.receiver = self;
  v15.super_class = (Class)IMURLBag;
  v2 = [(IMURLBag *)&v15 init];
  objc_super v3 = v2;
  if (v2)
  {
    [(IMURLBag *)v2 _registerBagKeysIfNeeded];
    id v4 = (void *)MEMORY[0x1E4F4DBD8];
    double v5 = +[PFClientUtil bagProfileName];
    dispatch_time_t v6 = +[PFClientUtil bagProfileVersion];
    uint64_t v7 = [v4 bagForProfile:v5 profileVersion:v6];
    liveBag = v3->_liveBag;
    v3->_liveBag = (AMSBag *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("IMURLBag", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    *(int64x2_t *)&v3->_downloadLimitPodcast = vdupq_n_s64(0xBEBC200uLL);
    v3->_libraryShowFetchThresholdDefaultValue = 60.0;
    uint64_t v11 = v3->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __16__IMURLBag_init__block_invoke;
    block[3] = &unk_1E5E611F0;
    unint64_t v14 = v3;
    dispatch_async(v11, block);
  }
  return v3;
}

- (void)_registerBagKeysIfNeeded
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__IMURLBag__registerBagKeysIfNeeded__block_invoke;
  block[3] = &unk_1E5E611F0;
  void block[4] = self;
  if (_registerBagKeysIfNeeded_onceToken != -1) {
    dispatch_once(&_registerBagKeysIfNeeded_onceToken, block);
  }
}

+ (void)registerBagKeys:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4F4DBE0];
  id v4 = a3;
  id v6 = +[PFClientUtil bagProfileName];
  double v5 = +[PFClientUtil bagProfileVersion];
  [v3 registerBagKeySet:v4 forProfile:v6 profileVersion:v5];
}

void __36__IMURLBag_scheduleBagUpdateOnDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateBagOnCurrentQueue];
}

- (NSDate)expirationDate
{
  v2 = [(IMURLBag *)self bag];
  objc_super v3 = [v2 expirationDate];

  return (NSDate *)v3;
}

- (BOOL)isExpired
{
  v2 = [(IMURLBag *)self bag];
  char v3 = [v2 isExpired];

  return v3;
}

- (NSString)profile
{
  v2 = [(IMURLBag *)self bag];
  char v3 = [v2 profile];

  return (NSString *)v3;
}

- (NSString)profileVersion
{
  v2 = [(IMURLBag *)self bag];
  char v3 = [v2 profileVersion];

  return (NSString *)v3;
}

- (void)reportAConcernURLWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(IMURLBag *)self reportAConcernURL];
  id v6 = [(IMURLBag *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__IMURLBag_reportAConcernURLWithCompletion___block_invoke;
  v8[3] = &unk_1E5E61D80;
  id v9 = v4;
  id v7 = v4;
  [v5 asyncValueOnQueue:v6 withCompletion:v8];
}

void __44__IMURLBag_reportAConcernURLWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__IMURLBag_reportAConcernURLWithCompletion___block_invoke_2;
  block[3] = &unk_1E5E63660;
  id v12 = v7;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __44__IMURLBag_reportAConcernURLWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[6];
  if (a1[4])
  {
    id v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://www.apple.com/feedback/apple-podcasts.html"];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v5);
  }
  else
  {
    uint64_t v2 = a1[5];
    char v3 = *(void (**)(uint64_t, uint64_t))(v1 + 16);
    uint64_t v4 = a1[6];
    v3(v4, v2);
  }
}

- (id)metricsURL
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 URLForKey:@"metrics/metricsUrl"];

  return v3;
}

- (id)metricsSamplingPercentageUsersLog
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 doubleForKey:@"metrics/performance/samplingPercentageUsersLog"];

  return v3;
}

- (id)metricsSessionDurationLog
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 doubleForKey:@"metrics/performance/sessionDurationLog"];

  return v3;
}

- (id)metricsImpressionableThreshold
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 doubleForKey:@"metrics/impressions/viewableThreshold"];

  return v3;
}

- (id)metricsImpressionableViewablePercentage
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 doubleForKey:@"metrics/impressions/viewablePercentage"];

  return v3;
}

- (id)metricsFastImpressionTimeout
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 doubleForKey:@"metrics/postFrequencyLowLatency"];

  return v3;
}

- (id)mescalCertificateURL
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 URLForKey:@"sign-sap-setup-cert"];

  return v3;
}

- (id)mescalSetupURL
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 URLForKey:@"sign-sap-setup"];

  return v3;
}

- (id)mescalSignedActions
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 dictionaryForKey:@"signed-actions"];

  return v3;
}

- (id)mescalSignSapRequests
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 dictionaryForKey:@"sign-sap-request"];

  return v3;
}

- (id)mescalSignSapResponses
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 dictionaryForKey:@"sign-sap-response"];

  return v3;
}

- (id)personalizedLookupURL
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 URLForKey:@"storeplatform-lookup-url"];

  return v3;
}

- (id)unpersonalizedLookupURL
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 URLForKey:@"storeplatform-lookup-url-unpersonalized"];

  return v3;
}

- (id)backgroundFetchInterval
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 doubleForKey:@"podcast-feed-update-interval-seconds"];

  return v3;
}

- (id)libraryShowFetchThreshold
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 doubleForKey:@"podcast-library-show-feed-update-threshold-in-seconds"];

  return v3;
}

- (id)trustedDomains
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 arrayForKey:@"trustedDomains"];

  return v3;
}

- (id)tokenServiceUrl
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 URLForKey:@"sf-api-token-service-url"];

  return v3;
}

- (id)personalizedChannelPollingInterval
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 doubleForKey:@"channelSubsCacheTTL"];

  return v3;
}

- (id)podcastsLicenseCert
{
  return [(IMURLBag *)self URLForKey:@"fps-cert"];
}

- (id)podcastsLicenseStreamingStart
{
  return [(IMURLBag *)self URLForKey:@"podcasts-license-streaming-start"];
}

- (id)podcastsLicenseStreamingRenew
{
  return [(IMURLBag *)self URLForKey:@"podcasts-license-streaming-renew"];
}

- (id)podcastsLicenseStreamingStop
{
  return [(IMURLBag *)self URLForKey:@"podcasts-license-streaming-stop"];
}

- (id)podcastsLicenseOfflineStart
{
  return [(IMURLBag *)self URLForKey:@"podcasts-license-offline-start"];
}

- (id)podcastsLicenseOfflineRenew
{
  return [(IMURLBag *)self URLForKey:@"podcasts-license-offline-renew"];
}

- (id)podcastsLicenseOfflineStop
{
  return [(IMURLBag *)self URLForKey:@"podcasts-license-offline-stop"];
}

- (id)podcastsLicenseOfflineStopNonce
{
  return [(IMURLBag *)self URLForKey:@"podcasts-license-offline-stop-nonce"];
}

- (id)fairPlayV2Enabled
{
  return [(IMURLBag *)self BOOLForKey:@"fairplay-v2-enabled"];
}

- (id)fairPlayV2RolloutRate
{
  return [(IMURLBag *)self doubleForKey:@"fairplay-v2-rollout-rate"];
}

- (id)pushNotificationRegistration
{
  return [(IMURLBag *)self URLForKey:@"kvs-register"];
}

- (id)reportAConcernURL
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 URLForKey:@"podcast-report-a-concern-url"];

  return v3;
}

- (id)commerceOAuthVerificationUrl
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 stringForKey:@"podcasts-oauth-redirect-url"];

  return v3;
}

- (id)commerceOAuthCancellationUrl
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 stringForKey:@"podcasts-oauth-revoke-subscription-url"];

  return v3;
}

- (id)commerceMusicSubscriptionInfoUrl
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 URLForKey:@"play-activity-feed-metadata"];

  return v3;
}

- (id)fetchMusicSubscriptionThresholdValue
{
  uint64_t v2 = [(IMURLBag *)self bag];
  char v3 = [v2 doubleForKey:@"podcasts-music-subs-info-interval-in-seconds"];

  return v3;
}

- (unint64_t)explicitContentBadgeTreatment
{
  uint64_t v2 = [(IMURLBag *)self syncStringForKey:@"ExplicitContentBadgeTreatment"];
  unint64_t v3 = [v2 isEqualToString:@"korea"];

  return v3;
}

- (id)storefrontSupportsColdStart
{
  uint64_t v2 = [(IMURLBag *)self bag];
  unint64_t v3 = [v2 BOOLForKey:@"podcast-cold-start-available-in-storefront"];

  return v3;
}

- (id)coldStartLandOnListenNow
{
  uint64_t v2 = [(IMURLBag *)self bag];
  unint64_t v3 = [v2 BOOLForKey:@"podcast-cold-start-should-land-listen-now"];

  return v3;
}

- (id)transcriptCensorWords
{
  uint64_t v2 = [(IMURLBag *)self bag];
  unint64_t v3 = [v2 arrayForKey:@"transcript-censor-words"];

  return v3;
}

- (id)batchFeedFetchShowCountMinimum
{
  return [(IMURLBag *)self integerForKey:@"podcast-delta-feed-sync-batch-threshold"];
}

- (id)batchFeedFetchShowBatchSize
{
  return [(IMURLBag *)self integerForKey:@"podcast-delta-feed-sync-batch-size-limit"];
}

- (id)batchFeedFetchOnPushRolloutPercentage
{
  if (os_feature_enabled_batch_feed_fetch_on_push_forced()) {
    [MEMORY[0x1E4F4DBE8] frozenBagValueWithKey:@"podcast-delta-feed-sync-batch-on-pushes-rollout-percentage" value:&unk_1F03D8718 valueType:3];
  }
  else {
  unint64_t v3 = [(IMURLBag *)self integerForKey:@"podcast-delta-feed-sync-batch-on-pushes-rollout-percentage"];
  }
  return v3;
}

- (id)batchFeedFetchOnPushDormancyPeriod
{
  return [(IMURLBag *)self integerForKey:@"podcast-delta-feed-sync-show-decay-period-in-days"];
}

- (id)batchFeedFetchOnPushShowLimit
{
  return [(IMURLBag *)self integerForKey:@"podcast-delta-feed-sync-batch-on-pushes-size-limit"];
}

- (int64_t)downloadLimitPodcast
{
  return self->_downloadLimitPodcast;
}

- (int64_t)downloadLimitVideoPodcast
{
  return self->_downloadLimitVideoPodcast;
}

- (double)libraryShowFetchThresholdDefaultValue
{
  return self->_libraryShowFetchThresholdDefaultValue;
}

- (void)setLibraryShowFetchThresholdDefaultValue:(double)a3
{
  self->_libraryShowFetchThresholdDefaultValue = a3;
}

- (void)setLiveBag:(id)a3
{
}

- (IMMutableBagKeySet)keySet
{
  return self->_keySet;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)failedUpdateAttempts
{
  return self->_failedUpdateAttempts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_keySet, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_liveBag, 0);
}

@end