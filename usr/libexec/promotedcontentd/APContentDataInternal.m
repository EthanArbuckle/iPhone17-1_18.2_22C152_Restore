@interface APContentDataInternal
+ (BOOL)isFinalMessage:(int)a3;
+ (BOOL)isPlaceholderIdentifier:(id)a3;
+ (BOOL)supportsSecureCoding;
- (APContentData)content;
- (APContentDataInternal)init;
- (APContentDataInternal)initWithAdData:(id)a3 identifier:(id)a4 contextIdentifier:(id)a5 placementType:(int64_t)a6 maxSize:(id)a7;
- (APContentDataInternal)initWithContent:(id)a3;
- (APContentDataInternal)initWithContent:(id)a3 privateContent:(id)a4 andTransientContent:(id)a5;
- (APContentDataInternal)initWithContentDataProvider:(id)a3;
- (APContentDataInternal)initWithUnfilledReason:(int64_t)a3 error:(id)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 containerSize:(id)a7 placementType:(int64_t)a8 journeyStartRelayValues:(id)a9;
- (APContentDataPrivate)privateContent;
- (APContentDataProviderProtocol)contentDataProvider;
- (APContentDataTransient)transientContent;
- (BOOL)_hasSentFinalEvent;
- (BOOL)canSend50PercentImpression:(BOOL)a3;
- (BOOL)canSendImpression:(BOOL)a3;
- (BOOL)hasConfirmed50PercentImpression;
- (BOOL)hasConfirmedImpression;
- (BOOL)hasSentStatusEvent:(int)a3;
- (BOOL)isFirstMessage:(int)a3;
- (BOOL)isPlaceholder;
- (BOOL)shouldSendAdSpaceStatusEvent:(int)a3;
- (NSDictionary)journeyStartRelayValues;
- (NSString)adOriginalRequesterId;
- (id)_loadJourneyStartRelayValuesFromAdData:(id)a3;
- (id)initRateLimitedForContextId:(id)a3 containerSize:(id)a4 placementType:(int64_t)a5;
- (void)_accumulatePlaybackTimeIfNoDuration;
- (void)_clicked:(id)a3;
- (void)_updateLastPlaybackTimestamp;
- (void)_visibleStateChanged:(int64_t)a3 duration:(double)a4;
- (void)accumulate50PercentVisibilityTime:(double)a3;
- (void)accumulateVisibilityTime:(double)a3;
- (void)addTimeSpent:(double)a3;
- (void)appearedOnScreenWithStatus:(int)a3;
- (void)carouselElementClicked:(id)a3 element:(int)a4;
- (void)carouselFinishedSent;
- (void)carouselVisibleStateChanged:(int64_t)a3 duration:(double)a4 elements:(id)a5 partialElements:(id)a6;
- (void)clicked:(id)a3;
- (void)confirm50PercentImpression;
- (void)confirmClick;
- (void)confirmImpression;
- (void)discarded;
- (void)eventSent;
- (void)incrementVideoEventSequence;
- (void)interfaceReady;
- (void)interfaceReplaced;
- (void)loadFailed;
- (void)pendingConfirmedClick:(BOOL)a3;
- (void)resetTransientData;
- (void)setAdOriginalRequesterId:(id)a3;
- (void)statusEventSent:(int)a3;
- (void)videoLoaded:(double)a3;
- (void)videoStateChanged:(double)a3 fromMetric:(int64_t)a4;
- (void)videoUnloaded;
- (void)visibleStateChanged:(int64_t)a3 duration:(double)a4;
- (void)volumeChanged:(double)a3;
- (void)wasFullyVisible;
@end

@implementation APContentDataInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APContentDataInternal)init
{
  v10.receiver = self;
  v10.super_class = (Class)APContentDataInternal;
  v2 = [(APContentDataInternal *)&v10 init];
  if (v2)
  {
    v3 = (APContentData *)objc_alloc_init((Class)APContentData);
    content = v2->_content;
    v2->_content = v3;

    v5 = objc_alloc_init(APContentDataPrivate);
    privateContent = v2->_privateContent;
    v2->_privateContent = v5;

    v7 = objc_alloc_init(APContentDataTransient);
    transientContent = v2->_transientContent;
    v2->_transientContent = v7;
  }
  return v2;
}

- (APContentDataInternal)initWithAdData:(id)a3 identifier:(id)a4 contextIdentifier:(id)a5 placementType:(int64_t)a6 maxSize:(id)a7
{
  double var1 = a7.var1;
  double var0 = a7.var0;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v26.receiver = self;
  v26.super_class = (Class)APContentDataInternal;
  v16 = [(APContentDataInternal *)&v26 init];
  if (v16)
  {
    v17 = (APContentData *)[objc_alloc((Class)APContentData) initWithAdData:v13 identifier:v14 contextIdentifier:v15 placementType:a6 maxSize:var0];
    content = v16->_content;
    v16->_content = v17;

    v19 = [[APContentDataPrivate alloc] initWithAdData:v13 forPlacementType:a6];
    privateContent = v16->_privateContent;
    v16->_privateContent = v19;

    v21 = objc_alloc_init(APContentDataTransient);
    transientContent = v16->_transientContent;
    v16->_transientContent = v21;

    uint64_t v23 = [(APContentDataInternal *)v16 _loadJourneyStartRelayValuesFromAdData:v13];
    journeyStartRelayValues = v16->_journeyStartRelayValues;
    v16->_journeyStartRelayValues = (NSDictionary *)v23;
  }
  return v16;
}

- (APContentDataInternal)initWithUnfilledReason:(int64_t)a3 error:(id)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 containerSize:(id)a7 placementType:(int64_t)a8 journeyStartRelayValues:(id)a9
{
  double var1 = a7.var1;
  double var0 = a7.var0;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  v21 = [(APContentDataInternal *)self init];
  if (v21)
  {
    v22 = (APContentData *)[objc_alloc((Class)APContentData) initWithUnfilledReason:a3 error:v17 contentIdentifier:v18 contextIdentifier:v19 containerSize:a8 contextIdentifier:var0 placementType:var1];
    content = v21->_content;
    v21->_content = v22;

    v24 = objc_alloc_init(APContentDataPrivate);
    privateContent = v21->_privateContent;
    v21->_privateContent = v24;

    objc_storeStrong((id *)&v21->_journeyStartRelayValues, a9);
  }

  return v21;
}

- (APContentDataInternal)initWithContent:(id)a3 privateContent:(id)a4 andTransientContent:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(APContentDataInternal *)self init];
  id v13 = v12;
  if (v12)
  {
    if (v9) {
      objc_storeStrong((id *)&v12->_content, a3);
    }
    if (v10) {
      objc_storeStrong((id *)&v13->_privateContent, a4);
    }
    if (v11) {
      objc_storeStrong((id *)&v13->_transientContent, a5);
    }
  }

  return v13;
}

- (APContentDataInternal)initWithContent:(id)a3
{
  return [(APContentDataInternal *)self initWithContent:a3 privateContent:0 andTransientContent:0];
}

- (APContentDataInternal)initWithContentDataProvider:(id)a3
{
  id v5 = a3;
  v6 = [v5 contentData];
  v7 = [v5 contentDataPrivate];
  v8 = [v5 contentDataTransient];
  id v9 = [(APContentDataInternal *)self initWithContent:v6 privateContent:v7 andTransientContent:v8];

  if (v9) {
    objc_storeStrong((id *)&v9->_contentDataProvider, a3);
  }

  return v9;
}

- (id)initRateLimitedForContextId:(id)a3 containerSize:(id)a4 placementType:(int64_t)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)APContentDataInternal;
  id v10 = [(APContentDataInternal *)&v18 init];
  if (v10)
  {
    id v11 = (APContentData *)[objc_alloc((Class)APContentData) initRateLimitedForContextId:v9 containerSize:a5 placementType:var0];
    content = v10->_content;
    v10->_content = v11;

    id v13 = objc_alloc_init(APContentDataPrivate);
    privateContent = v10->_privateContent;
    v10->_privateContent = v13;

    id v15 = objc_alloc_init(APContentDataTransient);
    transientContent = v10->_transientContent;
    v10->_transientContent = v15;
  }
  return v10;
}

- (void)resetTransientData
{
  self->_transientContent = objc_alloc_init(APContentDataTransient);

  _objc_release_x1();
}

- (void)accumulateVisibilityTime:(double)a3
{
  id v5 = [(APContentDataInternal *)self privateContent];
  unsigned int v6 = [v5 isCarouselAd];

  if (v6)
  {
    v7 = [(APContentDataInternal *)self transientContent];
    [v7 carouselVisibleTime];
    [v7 setCarouselVisibleTime:v8 + a3];
  }
  if (![(APContentDataInternal *)self hasConfirmedImpression])
  {
    id v9 = [(APContentDataInternal *)self transientContent];
    [v9 accumulatedVisibilityTime];
    double v11 = v10;
    v12 = [(APContentDataInternal *)self content];
    [v12 impressionThreshold];
    double v14 = v13;

    if (v11 <= v14)
    {
      id v16 = [(APContentDataInternal *)self transientContent];
      [v16 accumulatedVisibilityTime];
      [v16 setAccumulatedVisibilityTime:v15 + a3];
    }
  }
}

- (void)accumulate50PercentVisibilityTime:(double)a3
{
  id v5 = [(APContentDataInternal *)self privateContent];
  unsigned int v6 = [v5 isCarouselAd];

  if (v6)
  {
    v7 = [(APContentDataInternal *)self transientContent];
    [v7 carousel50PercentVisibleTime];
    [v7 setCarousel50PercentVisibleTime:v8 + a3];
  }
  if (![(APContentDataInternal *)self hasConfirmed50PercentImpression])
  {
    id v9 = [(APContentDataInternal *)self transientContent];
    [v9 accumulated50PercentVisibilityTime];
    double v11 = v10;
    v12 = [(APContentDataInternal *)self content];
    [v12 impressionThreshold];
    double v14 = v13;

    if (v11 <= v14)
    {
      id v16 = [(APContentDataInternal *)self transientContent];
      [v16 accumulated50PercentVisibilityTime];
      [v16 setAccumulated50PercentVisibilityTime:v15 + a3];
    }
  }
}

- (void)appearedOnScreenWithStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned int v6 = [(APContentDataInternal *)self content];
    v7 = [v6 contextIdentifier];
    double v8 = [(APContentDataInternal *)self content];
    id v9 = [v8 identifier];
    if (!v11 & v10)
    {
      switch((int)v3)
      {
        case 3000:
          v12 = @"ADStatusCodeNoError";
          break;
        case 3001:
          v12 = @"ADStatusCodeAdNotAvailable";
          break;
        case 3002:
          v12 = @"ADStatusCodeSpacedTooCloseToAnAd";
          break;
        case 3003:
          v12 = @"ADStatusCodePlacedInFirstScreenful";
          break;
        case 3004:
          v12 = @"ADStatusCodeAdLoadedTooLate";
          break;
        case 3005:
          v12 = @"ADStatusCodeAdUnloadedExceedingContainer";
          break;
        case 3006:
          v12 = @"ADStatusCodeAdUnloadedMedusaResizing";
          break;
        case 3007:
          v12 = @"ADStatusCodeAdGlobalCategoryBlacklisted";
          break;
        case 3008:
          v12 = @"ADStatusCodeAdGlobalKeywordBlacklisted";
          break;
        case 3009:
          v12 = @"ADStatusCodeAdCampaignCategoryBlacklisted";
          break;
        case 3010:
          v12 = @"ADStatusCodeAdCampaignKeywordBlacklisted";
          break;
        case 3011:
          v12 = @"ADStatusCodeAdMetadataError";
          break;
        case 3012:
          v12 = @"ADStatusCodeAdArticleLoadError";
          break;
        case 3013:
          v12 = @"ADStatusCodeAdVideoLoadError";
          break;
        default:
          if (v3 == 360)
          {
            v12 = @"ADStatusCodeNoAdDueToSubscriptionStatus";
          }
          else
          {
            v12 = +[NSString stringWithFormat:@"(unknown: %i)", v3];
          }
          break;
      }
    }
    else
    {
      v12 = @"ADStatusCodeUnknown";
      switch((int)v3)
      {
        case 0:
          break;
        case 1:
          v12 = @"ADStatusCodeServerFailure";
          break;
        case 2:
          v12 = @"ADStatusCodeLoadingThrottled";
          break;
        case 3:
          v12 = @"ADStatusCodeInventoryUnavailable";
          break;
        case 4:
          v12 = @"ADStatusCodeConfigurationError";
          break;
        case 5:
          v12 = @"ADStatusCodeBannerVisibleWithoutContent";
          break;
        case 6:
          v12 = @"ADStatusCodeApplicationInactive";
          break;
        case 7:
          v12 = @"ADStatusCodeAdUnloaded";
          break;
        case 8:
          v12 = @"ADStatusCodeAssetLoadFailure";
          break;
        case 9:
          v12 = @"ADStatusCodeAdResponseValidateFailure";
          break;
        case 10:
          v12 = @"ADStatusCodeAdAssetLoadPending";
          break;
        case 11:
          v12 = @"ADStatusCodeWaitingForResponse";
          break;
        case 12:
          v12 = @"ADStatusCodeNoAdDueToGlobalExclusion";
          break;
        case 13:
          v12 = @"ADStatusCodeNoAdDueToPolicyExclusion";
          break;
        case 14:
          v12 = @"ADStatusCodeBatchLimitExceeded";
          break;
        case 15:
          v12 = @"ADStatusCodeAdsDisabledInIssue";
          break;
        default:
          JUMPOUT(0);
      }
    }
    *(_DWORD *)buf = 138543874;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = v9;
    __int16 v20 = 2114;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Content for context %{public}@ with ID %{public}@ appeared on screen with status %{public}@.", buf, 0x20u);
  }
  double v13 = [(APContentDataInternal *)self transientContent];
  [v13 setHasBeenOnScreen:1];

  double v14 = [(APContentDataInternal *)self transientContent];
  [v14 setLastStatusCode:v3];

  double v15 = [(APContentDataInternal *)self transientContent];
  [v15 save];
}

- (BOOL)canSendImpression:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(APContentDataInternal *)self hasConfirmedImpression])
  {
    id v5 = APLogForCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_54:
      BOOL v10 = 0;
      goto LABEL_55;
    }
    unsigned int v6 = [(APContentDataInternal *)self content];
    v7 = [v6 identifier];
    *(_DWORD *)buf = 138543362;
    v40 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can NOT send viewable impression - it has already impressed.", buf, 0xCu);
LABEL_4:

    goto LABEL_54;
  }
  double v8 = [(APContentDataInternal *)self transientContent];
  unsigned int v9 = [v8 lastStatusCode];

  if (v9 != 3000)
  {
    id v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double v13 = [(APContentDataInternal *)self content];
      double v14 = [v13 identifier];
      double v15 = [(APContentDataInternal *)self transientContent];
      id v16 = [v15 lastStatusCode];
      if (!v18 & v17)
      {
        switch((int)v16)
        {
          case 3000:
            v31 = @"ADStatusCodeNoError";
            break;
          case 3001:
            v31 = @"ADStatusCodeAdNotAvailable";
            break;
          case 3002:
            v31 = @"ADStatusCodeSpacedTooCloseToAnAd";
            break;
          case 3003:
            v31 = @"ADStatusCodePlacedInFirstScreenful";
            break;
          case 3004:
            v31 = @"ADStatusCodeAdLoadedTooLate";
            break;
          case 3005:
            v31 = @"ADStatusCodeAdUnloadedExceedingContainer";
            break;
          case 3006:
            v31 = @"ADStatusCodeAdUnloadedMedusaResizing";
            break;
          case 3007:
            v31 = @"ADStatusCodeAdGlobalCategoryBlacklisted";
            break;
          case 3008:
            v31 = @"ADStatusCodeAdGlobalKeywordBlacklisted";
            break;
          case 3009:
            v31 = @"ADStatusCodeAdCampaignCategoryBlacklisted";
            break;
          case 3010:
            v31 = @"ADStatusCodeAdCampaignKeywordBlacklisted";
            break;
          case 3011:
            v31 = @"ADStatusCodeAdMetadataError";
            break;
          case 3012:
            v31 = @"ADStatusCodeAdArticleLoadError";
            break;
          case 3013:
            v31 = @"ADStatusCodeAdVideoLoadError";
            break;
          default:
            if (v16 == 360)
            {
              v31 = @"ADStatusCodeNoAdDueToSubscriptionStatus";
            }
            else
            {
              v31 = +[NSString stringWithFormat:@"(unknown: %i)", v16];
            }
            break;
        }
      }
      else
      {
        v31 = @"ADStatusCodeUnknown";
        switch((int)v16)
        {
          case 0:
            break;
          case 1:
            v31 = @"ADStatusCodeServerFailure";
            break;
          case 2:
            v31 = @"ADStatusCodeLoadingThrottled";
            break;
          case 3:
            v31 = @"ADStatusCodeInventoryUnavailable";
            break;
          case 4:
            v31 = @"ADStatusCodeConfigurationError";
            break;
          case 5:
            v31 = @"ADStatusCodeBannerVisibleWithoutContent";
            break;
          case 6:
            v31 = @"ADStatusCodeApplicationInactive";
            break;
          case 7:
            v31 = @"ADStatusCodeAdUnloaded";
            break;
          case 8:
            v31 = @"ADStatusCodeAssetLoadFailure";
            break;
          case 9:
            v31 = @"ADStatusCodeAdResponseValidateFailure";
            break;
          case 10:
            v31 = @"ADStatusCodeAdAssetLoadPending";
            break;
          case 11:
            v31 = @"ADStatusCodeWaitingForResponse";
            break;
          case 12:
            v31 = @"ADStatusCodeNoAdDueToGlobalExclusion";
            break;
          case 13:
            v31 = @"ADStatusCodeNoAdDueToPolicyExclusion";
            break;
          case 14:
            v31 = @"ADStatusCodeBatchLimitExceeded";
            break;
          case 15:
            v31 = @"ADStatusCodeAdsDisabledInIssue";
            break;
          default:
            JUMPOUT(0);
        }
      }
      *(_DWORD *)buf = 138543618;
      v40 = v14;
      __int16 v41 = 2112;
      v42 = v31;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can NOT send viewable impression - current ASE code is %@.", buf, 0x16u);
    }
    goto LABEL_54;
  }
  if (!v3)
  {
    id v19 = [(APContentDataInternal *)self transientContent];
    [v19 accumulatedVisibilityTime];
    double v21 = v20;
    v22 = [(APContentDataInternal *)self content];
    [v22 impressionThreshold];
    double v24 = v23;

    id v5 = APLogForCategory();
    BOOL v25 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v21 < v24)
    {
      if (!v25) {
        goto LABEL_54;
      }
      unsigned int v6 = [(APContentDataInternal *)self content];
      v7 = [v6 identifier];
      objc_super v26 = [(APContentDataInternal *)self transientContent];
      [v26 accumulatedVisibilityTime];
      v28 = v27;
      v29 = [(APContentDataInternal *)self content];
      [v29 impressionThreshold];
      *(_DWORD *)buf = 138543874;
      v40 = v7;
      __int16 v41 = 2048;
      v42 = v28;
      __int16 v43 = 2048;
      uint64_t v44 = v30;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can NOT send viewable impression - at visible threshold for only %.2f of %.2f seconds", buf, 0x20u);

      goto LABEL_4;
    }
    if (!v25)
    {
      BOOL v10 = 1;
      goto LABEL_55;
    }
    char v11 = [(APContentDataInternal *)self content];
    v32 = [v11 identifier];
    v33 = [(APContentDataInternal *)self content];
    [v33 impressionThreshold];
    v35 = v34;
    v36 = [(APContentDataInternal *)self transientContent];
    [v36 accumulatedVisibilityTime];
    *(_DWORD *)buf = 138543874;
    v40 = v32;
    __int16 v41 = 2048;
    v42 = v35;
    __int16 v43 = 2048;
    uint64_t v44 = v37;
    BOOL v10 = 1;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can send viewable impression - at visible threshold more than %.2f seconds (%.2f)", buf, 0x20u);

    goto LABEL_21;
  }
  id v5 = APLogForCategory();
  BOOL v10 = 1;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v11 = [(APContentDataInternal *)self content];
    v12 = [v11 identifier];
    *(_DWORD *)buf = 138543362;
    v40 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can send viewable impression due to interaction", buf, 0xCu);

LABEL_21:
  }
LABEL_55:

  return v10;
}

- (BOOL)canSend50PercentImpression:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(APContentDataInternal *)self hasConfirmed50PercentImpression])
  {
    id v5 = APLogForCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_54:
      BOOL v10 = 0;
      goto LABEL_55;
    }
    unsigned int v6 = [(APContentDataInternal *)self content];
    v7 = [v6 identifier];
    *(_DWORD *)buf = 138543362;
    v40 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can NOT send 50 percent viewable impression - it has already impressed.", buf, 0xCu);
LABEL_4:

    goto LABEL_54;
  }
  double v8 = [(APContentDataInternal *)self transientContent];
  unsigned int v9 = [v8 lastStatusCode];

  if (v9 != 3000)
  {
    id v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double v13 = [(APContentDataInternal *)self content];
      double v14 = [v13 identifier];
      double v15 = [(APContentDataInternal *)self transientContent];
      id v16 = [v15 lastStatusCode];
      if (!v18 & v17)
      {
        switch((int)v16)
        {
          case 3000:
            v31 = @"ADStatusCodeNoError";
            break;
          case 3001:
            v31 = @"ADStatusCodeAdNotAvailable";
            break;
          case 3002:
            v31 = @"ADStatusCodeSpacedTooCloseToAnAd";
            break;
          case 3003:
            v31 = @"ADStatusCodePlacedInFirstScreenful";
            break;
          case 3004:
            v31 = @"ADStatusCodeAdLoadedTooLate";
            break;
          case 3005:
            v31 = @"ADStatusCodeAdUnloadedExceedingContainer";
            break;
          case 3006:
            v31 = @"ADStatusCodeAdUnloadedMedusaResizing";
            break;
          case 3007:
            v31 = @"ADStatusCodeAdGlobalCategoryBlacklisted";
            break;
          case 3008:
            v31 = @"ADStatusCodeAdGlobalKeywordBlacklisted";
            break;
          case 3009:
            v31 = @"ADStatusCodeAdCampaignCategoryBlacklisted";
            break;
          case 3010:
            v31 = @"ADStatusCodeAdCampaignKeywordBlacklisted";
            break;
          case 3011:
            v31 = @"ADStatusCodeAdMetadataError";
            break;
          case 3012:
            v31 = @"ADStatusCodeAdArticleLoadError";
            break;
          case 3013:
            v31 = @"ADStatusCodeAdVideoLoadError";
            break;
          default:
            if (v16 == 360)
            {
              v31 = @"ADStatusCodeNoAdDueToSubscriptionStatus";
            }
            else
            {
              v31 = +[NSString stringWithFormat:@"(unknown: %i)", v16];
            }
            break;
        }
      }
      else
      {
        v31 = @"ADStatusCodeUnknown";
        switch((int)v16)
        {
          case 0:
            break;
          case 1:
            v31 = @"ADStatusCodeServerFailure";
            break;
          case 2:
            v31 = @"ADStatusCodeLoadingThrottled";
            break;
          case 3:
            v31 = @"ADStatusCodeInventoryUnavailable";
            break;
          case 4:
            v31 = @"ADStatusCodeConfigurationError";
            break;
          case 5:
            v31 = @"ADStatusCodeBannerVisibleWithoutContent";
            break;
          case 6:
            v31 = @"ADStatusCodeApplicationInactive";
            break;
          case 7:
            v31 = @"ADStatusCodeAdUnloaded";
            break;
          case 8:
            v31 = @"ADStatusCodeAssetLoadFailure";
            break;
          case 9:
            v31 = @"ADStatusCodeAdResponseValidateFailure";
            break;
          case 10:
            v31 = @"ADStatusCodeAdAssetLoadPending";
            break;
          case 11:
            v31 = @"ADStatusCodeWaitingForResponse";
            break;
          case 12:
            v31 = @"ADStatusCodeNoAdDueToGlobalExclusion";
            break;
          case 13:
            v31 = @"ADStatusCodeNoAdDueToPolicyExclusion";
            break;
          case 14:
            v31 = @"ADStatusCodeBatchLimitExceeded";
            break;
          case 15:
            v31 = @"ADStatusCodeAdsDisabledInIssue";
            break;
          default:
            JUMPOUT(0);
        }
      }
      *(_DWORD *)buf = 138543618;
      v40 = v14;
      __int16 v41 = 2112;
      v42 = v31;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can NOT send 50 percent viewable impression - current ASE code is %@.", buf, 0x16u);
    }
    goto LABEL_54;
  }
  if (!v3)
  {
    id v19 = [(APContentDataInternal *)self transientContent];
    [v19 accumulated50PercentVisibilityTime];
    double v21 = v20;
    v22 = [(APContentDataInternal *)self content];
    [v22 impressionThreshold];
    double v24 = v23;

    id v5 = APLogForCategory();
    BOOL v25 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v21 < v24)
    {
      if (!v25) {
        goto LABEL_54;
      }
      unsigned int v6 = [(APContentDataInternal *)self content];
      v7 = [v6 identifier];
      objc_super v26 = [(APContentDataInternal *)self transientContent];
      [v26 accumulatedVisibilityTime];
      v28 = v27;
      v29 = [(APContentDataInternal *)self content];
      [v29 impressionThreshold];
      *(_DWORD *)buf = 138543874;
      v40 = v7;
      __int16 v41 = 2048;
      v42 = v28;
      __int16 v43 = 2048;
      uint64_t v44 = v30;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can NOT send 50 percent viewable impression - at visible threshold for only %.2f of %.2f seconds", buf, 0x20u);

      goto LABEL_4;
    }
    if (!v25)
    {
      BOOL v10 = 1;
      goto LABEL_55;
    }
    char v11 = [(APContentDataInternal *)self content];
    v32 = [v11 identifier];
    v33 = [(APContentDataInternal *)self content];
    [v33 impressionThreshold];
    v35 = v34;
    v36 = [(APContentDataInternal *)self transientContent];
    [v36 accumulated50PercentVisibilityTime];
    *(_DWORD *)buf = 138543874;
    v40 = v32;
    __int16 v41 = 2048;
    v42 = v35;
    __int16 v43 = 2048;
    uint64_t v44 = v37;
    BOOL v10 = 1;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can send 50 percent viewable impression - at visible threshold more than %.2f seconds (%.2f)", buf, 0x20u);

    goto LABEL_21;
  }
  id v5 = APLogForCategory();
  BOOL v10 = 1;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v11 = [(APContentDataInternal *)self content];
    v12 = [v11 identifier];
    *(_DWORD *)buf = 138543362;
    v40 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can send 50 percent viewable impression due to interaction", buf, 0xCu);

LABEL_21:
  }
LABEL_55:

  return v10;
}

- (void)confirmImpression
{
  BOOL v3 = [(APContentDataInternal *)self transientContent];
  [v3 setHasConfirmedImpression:1];

  v4 = [(APContentDataInternal *)self privateContent];
  [v4 setConsumedImpressions:[v4 consumedImpressions] + 1];

  id v5 = [(APContentDataInternal *)self transientContent];
  [v5 save];

  id v6 = [(APContentDataInternal *)self privateContent];
  [v6 save];
}

- (void)confirm50PercentImpression
{
  BOOL v3 = [(APContentDataInternal *)self transientContent];
  [v3 setHasConfirmed50PercentImpression:1];

  v4 = [(APContentDataInternal *)self privateContent];
  [v4 setConsumed50PercentImpressions:[v4 consumed50PercentImpressions] + 1];

  id v5 = [(APContentDataInternal *)self transientContent];
  [v5 save];

  id v6 = [(APContentDataInternal *)self privateContent];
  [v6 save];
}

- (void)discarded
{
  BOOL v3 = [(APContentDataInternal *)self transientContent];
  [v3 setDiscarded:1];

  id v4 = [(APContentDataInternal *)self transientContent];
  [v4 save];
}

- (void)eventSent
{
  BOOL v3 = +[NSDate date];
  [v3 timeIntervalSince1970];
  double v5 = v4;
  id v6 = [(APContentDataInternal *)self transientContent];
  [v6 setLastSentEventTime:v5];

  id v7 = [(APContentDataInternal *)self transientContent];
  [v7 save];
}

- (void)interfaceReady
{
  BOOL v3 = [(APContentDataInternal *)self transientContent];
  [v3 setInterfaceReady:1];

  id v4 = [(APContentDataInternal *)self transientContent];
  [v4 save];
}

- (void)carouselElementClicked:(id)a3 element:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  -[APContentDataInternal _clicked:](self, "_clicked:", a3.var0, a3.var1);
  id v6 = [(APContentDataInternal *)self transientContent];
  [v6 setClickedCarouselElement:v4];

  id v7 = [(APContentDataInternal *)self transientContent];
  [v7 save];
}

- (void)carouselFinishedSent
{
  BOOL v3 = [(APContentDataInternal *)self transientContent];
  [v3 setCarouselFinishedSent:1];

  id v4 = [(APContentDataInternal *)self transientContent];
  [v4 save];
}

- (void)_clicked:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v6 = [(APContentDataInternal *)self transientContent];
  [v6 setClickLocation:var0, var1];

  id v7 = +[NSDate date];
  [v7 timeIntervalSince1970];
  double v9 = v8;
  BOOL v10 = [(APContentDataInternal *)self transientContent];
  [v10 setClickTime:v9];

  id v11 = [(APContentDataInternal *)self transientContent];
  [v11 setClickCount:[v11 clickCount] + 1];
}

- (void)clicked:(id)a3
{
  -[APContentDataInternal _clicked:](self, "_clicked:", a3.var0, a3.var1);
  id v4 = [(APContentDataInternal *)self transientContent];
  [v4 save];
}

- (void)confirmClick
{
  BOOL v3 = [(APContentDataInternal *)self transientContent];
  [v3 setHasConfirmedClick:1];

  id v4 = [(APContentDataInternal *)self transientContent];
  [v4 save];
}

- (BOOL)hasConfirmedImpression
{
  v2 = [(APContentDataInternal *)self transientContent];
  unsigned __int8 v3 = [v2 hasConfirmedImpression];

  return v3;
}

- (BOOL)hasConfirmed50PercentImpression
{
  v2 = [(APContentDataInternal *)self transientContent];
  unsigned __int8 v3 = [v2 hasConfirmed50PercentImpression];

  return v3;
}

- (void)incrementVideoEventSequence
{
  unsigned __int8 v3 = [(APContentDataInternal *)self transientContent];
  [v3 setVideoEventSequence:[v3 videoEventSequence] + 1];

  id v4 = [(APContentDataInternal *)self transientContent];
  [v4 save];
}

- (void)pendingConfirmedClick:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(APContentDataInternal *)self transientContent];
  [v5 setPendingConfirmedClick:v3];

  id v6 = [(APContentDataInternal *)self transientContent];
  [v6 save];
}

- (BOOL)isFirstMessage:(int)a3
{
  BOOL v3 = 1;
  if (a3 <= 0xD)
  {
    if (((1 << a3) & 0x361E) != 0) {
      return v3;
    }
    if (a3 == 8)
    {
LABEL_8:
      double v5 = [(APContentDataInternal *)self transientContent];
      id v6 = [v5 sentStatusCodes];
      BOOL v3 = [v6 count] == 0;

      return v3;
    }
  }
  if ((a3 - 3000) > 0xC) {
    return a3 == 360;
  }
  int v4 = 1 << (a3 + 72);
  if ((v4 & 0x1782) == 0)
  {
    if ((v4 & 0x11) != 0) {
      goto LABEL_8;
    }
    return a3 == 360;
  }
  return v3;
}

+ (BOOL)isFinalMessage:(int)a3
{
  BOOL result = 1;
  if (a3 > 0xF)
  {
LABEL_2:
    if ((a3 - 3000) > 0xD) {
      return a3 == 360;
    }
    int v4 = 1 << (a3 + 72);
    if ((v4 & 0x37A0) != 0) {
      return result;
    }
    if ((v4 & 0x13) == 0) {
      return a3 == 360;
    }
    return 0;
  }
  if (((1 << a3) & 0xF31E) == 0)
  {
    if (a3 == 10) {
      return 0;
    }
    goto LABEL_2;
  }
  return result;
}

+ (BOOL)isPlaceholderIdentifier:(id)a3
{
  return [a3 hasPrefix:@"placeholder: "];
}

- (BOOL)isPlaceholder
{
  v2 = [(APContentDataInternal *)self content];
  BOOL v3 = [v2 identifier];
  BOOL v4 = +[APContentDataInternal isPlaceholderIdentifier:v3];

  return v4;
}

- (void)loadFailed
{
  BOOL v3 = [(APContentDataInternal *)self transientContent];
  [v3 setLastStatusCode:8];

  id v4 = [(APContentDataInternal *)self transientContent];
  [v4 save];
}

- (BOOL)hasSentStatusEvent:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(APContentDataInternal *)self transientContent];
  double v5 = [v4 sentStatusCodes];
  id v6 = +[NSNumber numberWithInt:v3];
  unsigned __int8 v7 = [v5 containsObject:v6];

  return v7;
}

- (void)interfaceReplaced
{
  uint64_t v3 = [(APContentDataInternal *)self transientContent];
  [v3 setInterfaceReplaced:1];

  id v4 = [(APContentDataInternal *)self transientContent];
  [v4 save];
}

- (void)wasFullyVisible
{
  uint64_t v3 = [(APContentDataInternal *)self transientContent];
  [v3 setWasFullyVisible:1];

  id v4 = [(APContentDataInternal *)self transientContent];
  [v4 save];
}

- (BOOL)_hasSentFinalEvent
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(APContentDataInternal *)self transientContent];
  uint64_t v3 = [v2 sentStatusCodes];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (+[APContentDataInternal isFinalMessage:](APContentDataInternal, "isFinalMessage:", [*(id *)(*((void *)&v8 + 1) + 8 * i) intValue]))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)shouldSendAdSpaceStatusEvent:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 <= 0)
  {
    long long v9 = [(APContentDataInternal *)self content];
    id v10 = [v9 serverUnfilledReason];

    long long v11 = APLogForCategory();
    uint64_t v5 = v11;
    if (v10 != (id)1020)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Attempting to send invalid ASE %d", buf, 8u);
      }

      uint64_t v5 = +[NSString stringWithFormat:@"Attempting to send invalid ASE %d", v3];
      APSimulateCrash();
      goto LABEL_161;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_161;
    }
    v12 = [(APContentDataInternal *)self content];
    double v13 = [v12 identifier];
    *(_DWORD *)buf = 138412290;
    v57 = v13;
    double v14 = "Not sending ASE due to status condition discard for content %@";
    goto LABEL_11;
  }
  if ([(APContentDataInternal *)self _hasSentFinalEvent])
  {
    uint64_t v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v8 = v3 - 1;
      if (!(!v7 & v6))
      {
        double v23 = @"ADStatusCodeServerFailure";
        switch(v8)
        {
          case 0:
            goto LABEL_101;
          case 1:
            double v23 = @"ADStatusCodeLoadingThrottled";
            goto LABEL_101;
          case 2:
            double v23 = @"ADStatusCodeInventoryUnavailable";
            goto LABEL_101;
          case 3:
            double v23 = @"ADStatusCodeConfigurationError";
            goto LABEL_101;
          case 4:
            double v23 = @"ADStatusCodeBannerVisibleWithoutContent";
            goto LABEL_101;
          case 5:
            double v23 = @"ADStatusCodeApplicationInactive";
            goto LABEL_101;
          case 6:
            double v23 = @"ADStatusCodeAdUnloaded";
            goto LABEL_101;
          case 7:
            double v23 = @"ADStatusCodeAssetLoadFailure";
            goto LABEL_101;
          case 8:
            double v23 = @"ADStatusCodeAdResponseValidateFailure";
            goto LABEL_101;
          case 9:
            double v23 = @"ADStatusCodeAdAssetLoadPending";
            goto LABEL_101;
          case 10:
            double v23 = @"ADStatusCodeWaitingForResponse";
            goto LABEL_101;
          case 11:
            double v23 = @"ADStatusCodeNoAdDueToGlobalExclusion";
            goto LABEL_101;
          case 12:
            double v23 = @"ADStatusCodeNoAdDueToPolicyExclusion";
            goto LABEL_101;
          case 13:
            double v23 = @"ADStatusCodeBatchLimitExceeded";
            goto LABEL_101;
          case 14:
            double v23 = @"ADStatusCodeAdsDisabledInIssue";
            goto LABEL_101;
          default:
            goto LABEL_163;
        }
      }
      switch((int)v3)
      {
        case 3000:
          double v23 = @"ADStatusCodeNoError";
          break;
        case 3001:
          double v23 = @"ADStatusCodeAdNotAvailable";
          break;
        case 3002:
          double v23 = @"ADStatusCodeSpacedTooCloseToAnAd";
          break;
        case 3003:
          double v23 = @"ADStatusCodePlacedInFirstScreenful";
          break;
        case 3004:
          double v23 = @"ADStatusCodeAdLoadedTooLate";
          break;
        case 3005:
          double v23 = @"ADStatusCodeAdUnloadedExceedingContainer";
          break;
        case 3006:
          double v23 = @"ADStatusCodeAdUnloadedMedusaResizing";
          break;
        case 3007:
          double v23 = @"ADStatusCodeAdGlobalCategoryBlacklisted";
          break;
        case 3008:
          double v23 = @"ADStatusCodeAdGlobalKeywordBlacklisted";
          break;
        case 3009:
          double v23 = @"ADStatusCodeAdCampaignCategoryBlacklisted";
          break;
        case 3010:
          double v23 = @"ADStatusCodeAdCampaignKeywordBlacklisted";
          break;
        case 3011:
          double v23 = @"ADStatusCodeAdMetadataError";
          break;
        case 3012:
          double v23 = @"ADStatusCodeAdArticleLoadError";
          break;
        case 3013:
          double v23 = @"ADStatusCodeAdVideoLoadError";
          break;
        default:
          if (v3 == 360)
          {
            double v23 = @"ADStatusCodeNoAdDueToSubscriptionStatus";
          }
          else
          {
            double v23 = +[NSString stringWithFormat:@"(unknown: %i)", v3];
          }
          break;
      }
LABEL_101:
      v48 = [(APContentDataInternal *)self content];
      v49 = [v48 identifier];
      *(_DWORD *)buf = 138543618;
      v57 = v23;
      __int16 v58 = 2114;
      CFStringRef v59 = v49;
      v51 = "shouldSendAdSpaceStatusEvent: NOT sending ASE %{public}@ for content %{public}@ - a final ASE was previously sent.";
LABEL_160:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v51, buf, 0x16u);

      goto LABEL_161;
    }
    goto LABEL_161;
  }
  double v15 = [(APContentDataInternal *)self transientContent];
  id v16 = [v15 discarded];

  if (!v16)
  {
    unsigned int v20 = [(APContentDataInternal *)self hasSentStatusEvent:v3];
    if ((v20 & 1) != 0
      || ([(APContentDataInternal *)self transientContent],
          id v16 = (id)objc_claimAutoreleasedReturnValue(),
          [v16 lastStatusCode] == v3))
    {
      double v21 = [(APContentDataInternal *)self transientContent];
      unsigned __int8 v22 = [v21 hasBeenOnScreen];

      if (v20)
      {
        if ((v22 & 1) == 0)
        {
LABEL_31:
          if ([(APContentDataInternal *)self isPlaceholder])
          {
            BOOL v25 = [(APContentDataInternal *)self transientContent];
            unsigned int v24 = [v25 interfaceReplaced] ^ 1;
          }
          else
          {
            unsigned int v24 = 1;
          }
          if (v3 == 8 && v24)
          {
            objc_super v26 = [(APContentDataInternal *)self transientContent];
            unsigned __int8 v27 = [v26 hasBeenOnScreen];

            if (v27)
            {
              v28 = +[NSDate date];
              [v28 timeIntervalSince1970];
              double v30 = v29;
              v31 = [(APContentDataInternal *)self transientContent];
              [v31 lastSentEventTime];
              double v33 = v30 - v32;

              v34 = APLogForCategory();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                v35 = [(APContentDataInternal *)self content];
                v36 = [v35 identifier];
                CFStringRef v37 = @" NOT";
                *(_DWORD *)buf = 138543874;
                v57 = v36;
                if (v33 <= 180.0) {
                  CFStringRef v37 = &stru_1002392C0;
                }
                __int16 v58 = 2114;
                CFStringRef v59 = v37;
                __int16 v60 = 2048;
                double v61 = v33;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "shouldSendAdSpaceStatusEvent: AssetLoadFailure will%{public}@ be sent because content %{public}@ last event was %.0f seconds ago.", buf, 0x20u);
              }
              if (v33 > 180.0) {
                return 0;
              }
              unsigned int v24 = 1;
              goto LABEL_43;
            }
            uint64_t v5 = APLogForCategory();
            if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
              goto LABEL_161;
            }
            v12 = [(APContentDataInternal *)self content];
            double v13 = [v12 identifier];
            *(_DWORD *)buf = 138543362;
            v57 = v13;
            double v14 = "shouldSendAdSpaceStatusEvent: NOT sending AssetLoadFailure for content %{public}@ because the WebView "
                  "never appeared on screen.";
LABEL_11:
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v14, buf, 0xCu);

            goto LABEL_161;
          }
LABEL_43:
          v38 = APLogForCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            v55 = [(APContentDataInternal *)self content];
            v39 = [v55 identifier];
            if (v24) {
              CFStringRef v40 = @"YES";
            }
            else {
              CFStringRef v40 = @"NO";
            }
            if (v20) {
              CFStringRef v41 = @"YES";
            }
            else {
              CFStringRef v41 = @"NO";
            }
            CFStringRef v53 = v40;
            CFStringRef v54 = v41;
            v42 = [(APContentDataInternal *)self transientContent];
            unsigned int v52 = [v42 lastStatusCode];
            if ([(APContentDataInternal *)self isPlaceholder]) {
              CFStringRef v43 = @"YES";
            }
            else {
              CFStringRef v43 = @"NO";
            }
            uint64_t v44 = [(APContentDataInternal *)self transientContent];
            unsigned int v45 = [v44 interfaceReplaced];
            *(_DWORD *)buf = 138544898;
            if (v45) {
              CFStringRef v46 = @"YES";
            }
            else {
              CFStringRef v46 = @"NO";
            }
            v57 = v39;
            __int16 v58 = 2112;
            CFStringRef v59 = v53;
            __int16 v60 = 2114;
            double v61 = *(double *)&v54;
            __int16 v62 = 1024;
            int v63 = v3;
            __int16 v64 = 1024;
            unsigned int v65 = v52;
            __int16 v66 = 2114;
            CFStringRef v67 = v43;
            __int16 v68 = 2114;
            CFStringRef v69 = v46;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "shouldSendAdSpaceStatusEvent for %{public}@: %@ statusCodeSent: %{public}@ codeToSend: %d lastStatusCode: %d isPlaceholder: %{public}@ interfaceReplaced: %{public}@", buf, 0x40u);
          }
          if (v24) {
            return 1;
          }
          uint64_t v5 = APLogForCategory();
          if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
            goto LABEL_161;
          }
          v48 = [(APContentDataInternal *)self content];
          v49 = [v48 identifier];
          int v50 = v3 - 1;
          if (!v7 & v6)
          {
            switch((int)v3)
            {
              case 3000:
                double v23 = @"ADStatusCodeNoError";
                break;
              case 3001:
                double v23 = @"ADStatusCodeAdNotAvailable";
                break;
              case 3002:
                double v23 = @"ADStatusCodeSpacedTooCloseToAnAd";
                break;
              case 3003:
                double v23 = @"ADStatusCodePlacedInFirstScreenful";
                break;
              case 3004:
                double v23 = @"ADStatusCodeAdLoadedTooLate";
                break;
              case 3005:
                double v23 = @"ADStatusCodeAdUnloadedExceedingContainer";
                break;
              case 3006:
                double v23 = @"ADStatusCodeAdUnloadedMedusaResizing";
                break;
              case 3007:
                double v23 = @"ADStatusCodeAdGlobalCategoryBlacklisted";
                break;
              case 3008:
                double v23 = @"ADStatusCodeAdGlobalKeywordBlacklisted";
                break;
              case 3009:
                double v23 = @"ADStatusCodeAdCampaignCategoryBlacklisted";
                break;
              case 3010:
                double v23 = @"ADStatusCodeAdCampaignKeywordBlacklisted";
                break;
              case 3011:
                double v23 = @"ADStatusCodeAdMetadataError";
                break;
              case 3012:
                double v23 = @"ADStatusCodeAdArticleLoadError";
                break;
              case 3013:
                double v23 = @"ADStatusCodeAdVideoLoadError";
                break;
              default:
                if (v3 == 360)
                {
                  double v23 = @"ADStatusCodeNoAdDueToSubscriptionStatus";
                }
                else
                {
                  double v23 = +[NSString stringWithFormat:@"(unknown: %i)", v3];
                }
                break;
            }
          }
          else
          {
            double v23 = @"ADStatusCodeServerFailure";
            switch(v50)
            {
              case 0:
                break;
              case 1:
                double v23 = @"ADStatusCodeLoadingThrottled";
                break;
              case 2:
                double v23 = @"ADStatusCodeInventoryUnavailable";
                break;
              case 3:
                double v23 = @"ADStatusCodeConfigurationError";
                break;
              case 4:
                double v23 = @"ADStatusCodeBannerVisibleWithoutContent";
                break;
              case 5:
                double v23 = @"ADStatusCodeApplicationInactive";
                break;
              case 6:
                double v23 = @"ADStatusCodeAdUnloaded";
                break;
              case 7:
                double v23 = @"ADStatusCodeAssetLoadFailure";
                break;
              case 8:
                double v23 = @"ADStatusCodeAdResponseValidateFailure";
                break;
              case 9:
                double v23 = @"ADStatusCodeAdAssetLoadPending";
                break;
              case 10:
                double v23 = @"ADStatusCodeWaitingForResponse";
                break;
              case 11:
                double v23 = @"ADStatusCodeNoAdDueToGlobalExclusion";
                break;
              case 12:
                double v23 = @"ADStatusCodeNoAdDueToPolicyExclusion";
                break;
              case 13:
                double v23 = @"ADStatusCodeBatchLimitExceeded";
                break;
              case 14:
                double v23 = @"ADStatusCodeAdsDisabledInIssue";
                break;
              default:
LABEL_163:
                JUMPOUT(0);
            }
          }
          *(_DWORD *)buf = 138543618;
          v57 = v49;
          __int16 v58 = 2114;
          CFStringRef v59 = v23;
          v51 = "%{public}@ has already reported AdSpaceStatusEvent %{public}@. Ignoring.";
          goto LABEL_160;
        }
      }
      else
      {

        if ((v22 & 1) == 0) {
          goto LABEL_31;
        }
      }
      unsigned int v24 = 0;
      goto LABEL_43;
    }

    goto LABEL_31;
  }
  uint64_t v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v19 = v3 - 1;
    if (!(!v18 & v17))
    {
      double v23 = @"ADStatusCodeServerFailure";
      switch(v19)
      {
        case 0:
          goto LABEL_129;
        case 1:
          double v23 = @"ADStatusCodeLoadingThrottled";
          goto LABEL_129;
        case 2:
          double v23 = @"ADStatusCodeInventoryUnavailable";
          goto LABEL_129;
        case 3:
          double v23 = @"ADStatusCodeConfigurationError";
          goto LABEL_129;
        case 4:
          double v23 = @"ADStatusCodeBannerVisibleWithoutContent";
          goto LABEL_129;
        case 5:
          double v23 = @"ADStatusCodeApplicationInactive";
          goto LABEL_129;
        case 6:
          double v23 = @"ADStatusCodeAdUnloaded";
          goto LABEL_129;
        case 7:
          double v23 = @"ADStatusCodeAssetLoadFailure";
          goto LABEL_129;
        case 8:
          double v23 = @"ADStatusCodeAdResponseValidateFailure";
          goto LABEL_129;
        case 9:
          double v23 = @"ADStatusCodeAdAssetLoadPending";
          goto LABEL_129;
        case 10:
          double v23 = @"ADStatusCodeWaitingForResponse";
          goto LABEL_129;
        case 11:
          double v23 = @"ADStatusCodeNoAdDueToGlobalExclusion";
          goto LABEL_129;
        case 12:
          double v23 = @"ADStatusCodeNoAdDueToPolicyExclusion";
          goto LABEL_129;
        case 13:
          double v23 = @"ADStatusCodeBatchLimitExceeded";
          goto LABEL_129;
        case 14:
          double v23 = @"ADStatusCodeAdsDisabledInIssue";
          goto LABEL_129;
        default:
          goto LABEL_163;
      }
    }
    switch((int)v3)
    {
      case 3000:
        double v23 = @"ADStatusCodeNoError";
        break;
      case 3001:
        double v23 = @"ADStatusCodeAdNotAvailable";
        break;
      case 3002:
        double v23 = @"ADStatusCodeSpacedTooCloseToAnAd";
        break;
      case 3003:
        double v23 = @"ADStatusCodePlacedInFirstScreenful";
        break;
      case 3004:
        double v23 = @"ADStatusCodeAdLoadedTooLate";
        break;
      case 3005:
        double v23 = @"ADStatusCodeAdUnloadedExceedingContainer";
        break;
      case 3006:
        double v23 = @"ADStatusCodeAdUnloadedMedusaResizing";
        break;
      case 3007:
        double v23 = @"ADStatusCodeAdGlobalCategoryBlacklisted";
        break;
      case 3008:
        double v23 = @"ADStatusCodeAdGlobalKeywordBlacklisted";
        break;
      case 3009:
        double v23 = @"ADStatusCodeAdCampaignCategoryBlacklisted";
        break;
      case 3010:
        double v23 = @"ADStatusCodeAdCampaignKeywordBlacklisted";
        break;
      case 3011:
        double v23 = @"ADStatusCodeAdMetadataError";
        break;
      case 3012:
        double v23 = @"ADStatusCodeAdArticleLoadError";
        break;
      case 3013:
        double v23 = @"ADStatusCodeAdVideoLoadError";
        break;
      default:
        if (v3 == 360)
        {
          double v23 = @"ADStatusCodeNoAdDueToSubscriptionStatus";
        }
        else
        {
          double v23 = +[NSString stringWithFormat:@"(unknown: %i)", v3];
        }
        break;
    }
LABEL_129:
    v48 = [(APContentDataInternal *)self content];
    v49 = [v48 identifier];
    *(_DWORD *)buf = 138543618;
    v57 = v23;
    __int16 v58 = 2114;
    CFStringRef v59 = v49;
    v51 = "shouldSendAdSpaceStatusEvent: NOT sending ASE %{public}@ for content %{public}@ - it has been discarded.";
    goto LABEL_160;
  }
LABEL_161:

  return 0;
}

- (void)statusEventSent:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(APContentDataInternal *)self transientContent];
  char v6 = [v5 sentStatusCodes];
  char v7 = +[NSNumber numberWithInt:v3];
  [v6 addObject:v7];

  id v8 = [(APContentDataInternal *)self transientContent];
  [v8 save];
}

- (void)videoLoaded:(double)a3
{
  double v4 = fmax(a3, 0.0);
  uint64_t v5 = [(APContentDataInternal *)self transientContent];
  [v5 setDuration:v4];

  char v6 = [(APContentDataInternal *)self transientContent];
  [v6 setPlaybackInProgress:0];

  id v7 = [(APContentDataInternal *)self transientContent];
  [v7 save];
}

- (void)_updateLastPlaybackTimestamp
{
  id v6 = +[NSDate date];
  [v6 timeIntervalSince1970];
  double v4 = v3;
  uint64_t v5 = [(APContentDataInternal *)self transientContent];
  [v5 setLastPlaybackTimestamp:v4];
}

- (void)_accumulatePlaybackTimeIfNoDuration
{
  id v12 = [(APContentDataInternal *)self transientContent];
  if (([v12 hasDuration] & 1) == 0)
  {
    double v3 = [(APContentDataInternal *)self transientContent];
    unsigned int v4 = [v3 playbackInProgress];

    if (!v4) {
      return;
    }
    id v12 = [(APContentDataInternal *)self transientContent];
    uint64_t v5 = +[NSDate date];
    [v5 timeIntervalSince1970];
    double v7 = v6;
    id v8 = [(APContentDataInternal *)self transientContent];
    [v8 lastPlaybackTimestamp];
    double v10 = v7 - v9;
    [v12 accumulatedPlaybackTime];
    [v12 setAccumulatedPlaybackTime:v11 + v10];
  }
}

- (void)videoStateChanged:(double)a3 fromMetric:(int64_t)a4
{
  if (a3 >= 0.0)
  {
    id v8 = [(APContentDataInternal *)self transientContent];
    [v8 lastPosition];
    double v10 = v9;

    double v11 = [(APContentDataInternal *)self transientContent];
    unsigned int v12 = [v11 hasDuration];

    if (v12)
    {
      double v13 = a3 - v10;
      if (a3 - v10 > 0.0)
      {
        double v14 = [(APContentDataInternal *)self transientContent];
        double v15 = [(APContentDataInternal *)self transientContent];
        [v15 duration];
        double v17 = v16;
        [v14 accumulatedPlaybackTime];
        [v14 setAccumulatedPlaybackTime:v18 + v13 * v17];
      }
    }
    int v19 = [(APContentDataInternal *)self transientContent];
    [v19 setLastPosition:a3];

    switch(a4)
    {
      case 1600:
      case 1602:
        [(APContentDataInternal *)self _updateLastPlaybackTimestamp];
        unsigned int v20 = [(APContentDataInternal *)self transientContent];
        unsigned __int8 v21 = [v20 playbackInProgress];

        if ((v21 & 1) == 0)
        {
          double v23 = [(APContentDataInternal *)self transientContent];
          unsigned __int8 v22 = v23;
          uint64_t v24 = 1;
          goto LABEL_17;
        }
        unsigned __int8 v22 = APLogForCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v27) = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "MediaPlayed metric received but media is already thought to be in playback", (uint8_t *)&v27, 2u);
        }
        goto LABEL_18;
      case 1603:
      case 1604:
        [(APContentDataInternal *)self _accumulatePlaybackTimeIfNoDuration];
        double v23 = [(APContentDataInternal *)self transientContent];
        unsigned __int8 v22 = v23;
        uint64_t v24 = 0;
LABEL_17:
        [v23 setPlaybackInProgress:v24];
LABEL_18:

        break;
      case 1609:
        [(APContentDataInternal *)self _accumulatePlaybackTimeIfNoDuration];
        [(APContentDataInternal *)self _updateLastPlaybackTimestamp];
        BOOL v25 = a3 < 1.0 && a3 >= 0.0;
        objc_super v26 = [(APContentDataInternal *)self transientContent];
        [v26 setPlaybackInProgress:v25];

        break;
      default:
        break;
    }
    uint64_t v5 = [(APContentDataInternal *)self transientContent];
    [v5 save];
  }
  else
  {
    uint64_t v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v27 = 134217984;
      double v28 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "updateAccumulatedPlaybackTime: position cannot be negative (%.2f)", (uint8_t *)&v27, 0xCu);
    }
  }
}

- (void)videoUnloaded
{
  double v3 = [(APContentDataInternal *)self transientContent];
  [v3 setVideoUnloadedSent:1];

  id v4 = [(APContentDataInternal *)self transientContent];
  [v4 save];
}

- (void)_visibleStateChanged:(int64_t)a3 duration:(double)a4
{
  double v7 = [(APContentDataInternal *)self privateContent];
  unsigned int v8 = [v7 isOutstreamVideo];

  if (a3 >= 50 && v8)
  {
    [(APContentDataInternal *)self accumulateVisibilityTime:a4];
  }
  else if (a3 < 100)
  {
    if (a3 < 50)
    {
      unsigned int v12 = [(APContentDataInternal *)self transientContent];
      [v12 setAccumulatedVisibilityTime:0.0];

      id v13 = [(APContentDataInternal *)self transientContent];
      [v13 setAccumulated50PercentVisibilityTime:0.0];
    }
    else
    {
      [(APContentDataInternal *)self accumulate50PercentVisibilityTime:a4];
      double v9 = [(APContentDataInternal *)self transientContent];
      [v9 setAccumulatedVisibilityTime:0.0];

      double v10 = [(APContentDataInternal *)self privateContent];
      unsigned int v11 = [v10 isSponsorshipAd];

      if (v11)
      {
        [(APContentDataInternal *)self addTimeSpent:a4];
      }
    }
  }
  else
  {
    [(APContentDataInternal *)self accumulateVisibilityTime:a4];
    [(APContentDataInternal *)self accumulate50PercentVisibilityTime:a4];
  }
}

- (void)visibleStateChanged:(int64_t)a3 duration:(double)a4
{
  [(APContentDataInternal *)self _visibleStateChanged:a3 duration:a4];
  id v5 = [(APContentDataInternal *)self transientContent];
  [v5 save];
}

- (void)carouselVisibleStateChanged:(int64_t)a3 duration:(double)a4 elements:(id)a5 partialElements:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  [(APContentDataInternal *)self _visibleStateChanged:a3 duration:a4];
  unsigned int v12 = [(APContentDataInternal *)self transientContent];
  [v12 setCarouselElementsVisible:v11];

  id v13 = [(APContentDataInternal *)self transientContent];
  [v13 setCarouselElementsPartiallyVisible:v10];

  id v14 = [(APContentDataInternal *)self transientContent];
  [v14 save];
}

- (void)volumeChanged:(double)a3
{
  id v5 = [(APContentDataInternal *)self transientContent];
  [v5 setVolume:a3];

  id v6 = [(APContentDataInternal *)self transientContent];
  [v6 save];
}

- (id)_loadJourneyStartRelayValuesFromAdData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSMutableDictionary);
  id v5 = [v3 journeyStartRelayValues];
  id v6 = [v4 initWithCapacity:[v5 count]];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unsigned __int8 v21 = v3;
  double v7 = [v3 journeyStartRelayValues];
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v11);
        if (![v12 hasKey]
          || ([v12 key],
              id v13 = objc_claimAutoreleasedReturnValue(),
              id v14 = [v13 length],
              v13,
              !v14))
        {
          double v16 = APLogForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Journey start relay value does not have a key.", buf, 2u);
          }
          goto LABEL_21;
        }
        if ([v12 hasValueInt])
        {
          uint64_t v15 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 valueInt]);
LABEL_18:
          double v16 = v15;
          if (!v15) {
            goto LABEL_22;
          }
          double v17 = [v12 key];
          [v6 setObject:v16 forKeyedSubscript:v17];
          goto LABEL_20;
        }
        if ([v12 hasValueBool])
        {
          uint64_t v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 valueBool]);
          goto LABEL_18;
        }
        if ([v12 hasValueDouble])
        {
          [v12 valueDouble];
          uint64_t v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          goto LABEL_18;
        }
        if ([v12 hasValueString])
        {
          uint64_t v15 = [v12 valueString];
          goto LABEL_18;
        }
        double v16 = APLogForCategory();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        double v17 = [v12 key];
        *(_DWORD *)buf = 138543362;
        int v27 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "No Journey start relay value set for key %{public}@.", buf, 0xCu);
LABEL_20:

LABEL_21:
LABEL_22:
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v18 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
      id v9 = v18;
    }
    while (v18);
  }

  id v19 = [v6 copy];

  return v19;
}

- (void)addTimeSpent:(double)a3
{
  id v5 = [(APContentDataInternal *)self transientContent];
  [v5 timeSpent];
  [v5 setTimeSpent:v6 + a3];

  id v7 = [(APContentDataInternal *)self transientContent];
  [v7 save];
}

- (APContentData)content
{
  return (APContentData *)objc_getProperty(self, a2, 8, 1);
}

- (APContentDataPrivate)privateContent
{
  return (APContentDataPrivate *)objc_getProperty(self, a2, 16, 1);
}

- (APContentDataTransient)transientContent
{
  return (APContentDataTransient *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)journeyStartRelayValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)adOriginalRequesterId
{
  return self->_adOriginalRequesterId;
}

- (void)setAdOriginalRequesterId:(id)a3
{
}

- (APContentDataProviderProtocol)contentDataProvider
{
  return self->_contentDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDataProvider, 0);
  objc_storeStrong((id *)&self->_adOriginalRequesterId, 0);
  objc_storeStrong((id *)&self->_journeyStartRelayValues, 0);
  objc_storeStrong((id *)&self->_transientContent, 0);
  objc_storeStrong((id *)&self->_privateContent, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end