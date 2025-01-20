@interface PXAnalyticsSlideshowUsageDestination
+ (BOOL)_isUserCancelledError:(id)a3;
+ (NSString)exportCPAnalyticsIntervalName;
+ (NSString)exportEndedCoreAnalyticsEventName;
+ (NSString)exportFailedCPAnalyticsEventName;
+ (NSString)payloadAppSuspensionCountKey;
+ (NSString)payloadExportDurationKey;
+ (NSString)payloadExportEndStateKey;
+ (NSString)payloadExportErrorCodeKey;
+ (NSString)payloadExportErrorDomainKey;
+ (NSString)payloadPauseCountKey;
+ (NSString)payloadTimeFractionPlayedKey;
+ (NSString)payloadTimePausedKey;
+ (NSString)payloadTotalAssetCountKey;
+ (NSString)payloadTotalPlaybackTimeKey;
+ (NSString)playbackEndedCoreAnalyticsEventName;
+ (NSString)playbackStartedCoreAnalyticsEventName;
+ (id)exportEndedCPAnalyticsEventNameForSuccess:(BOOL)a3 error:(id)a4 duration:(double)a5;
+ (id)payloadAssetCountKeyForPlaybackStyle:(int64_t)a3;
+ (id)playbackEndedCPAnalyticsEventNameForTerminationType:(int64_t)a3;
+ (id)playbackEndedCPAnalyticsEventNameForTimeFractionPlayed:(double)a3;
+ (id)playbackStartedCPAnalyticsEventNameForTotalAssetCount:(int64_t)a3;
- (PXAnalyticsSlideshowUsageDestination)init;
- (id)_createDefaultPayloadForInfo:(id)a3;
- (id)_createInfoForEvent:(id)a3;
- (id)_existingInfoForEvent:(id)a3;
- (id)_existingInfoForEvent:(id)a3 pop:(BOOL)a4;
- (id)_payloadFilteredForCoreAnlaytics:(id)a3;
- (id)_popInfoForEndEvent:(id)a3;
- (void)processEvent:(id)a3;
@end

@implementation PXAnalyticsSlideshowUsageDestination

- (PXAnalyticsSlideshowUsageDestination)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXAnalyticsSlideshowUsageDestination;
  v2 = [(PXAnalyticsSlideshowUsageDestination *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    slideshowInfos = v2->_slideshowInfos;
    v2->_slideshowInfos = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (void)processEvent:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 name];
  if ([v5 isEqualToString:@"com.apple.photos.CPAnalytics.slideshowPlaybackStarted"])
  {
    objc_super v6 = [(PXAnalyticsSlideshowUsageDestination *)self _createInfoForEvent:v4];
    v7 = v6;
    if (v6) {
      v8 = v6;
    }
    else {
      v8 = objc_alloc_init(_PXAnalyticsSlideshowInfo);
    }
    v10 = v8;

    [v10 setStartEvent:v4];
    v11 = [(PXAnalyticsSlideshowUsageDestination *)self _createDefaultPayloadForInfo:v10];
    v12 = (void *)MEMORY[0x1E4F56658];
    v13 = [(id)objc_opt_class() playbackStartedCoreAnalyticsEventName];
    v14 = [(PXAnalyticsSlideshowUsageDestination *)self _payloadFilteredForCoreAnlaytics:v11];
    [v12 sendEvent:v13 withPayload:v14];

    v15 = [(id)objc_opt_class() payloadTotalAssetCountKey];
    v16 = [v11 objectForKeyedSubscript:v15];

    uint64_t v17 = [v16 integerValue];
    v18 = (void *)MEMORY[0x1E4F56658];
    v19 = [(id)objc_opt_class() playbackStartedCPAnalyticsEventNameForTotalAssetCount:v17];
    [v18 sendEvent:v19 withPayload:v11];

LABEL_10:
    goto LABEL_28;
  }
  if ([v5 isEqualToString:@"com.apple.photos.CPAnalytics.slideshowPlaybackPaused"])
  {
    v9 = [(PXAnalyticsSlideshowUsageDestination *)self _existingInfoForEvent:v4];
    [v9 pauseWithEvent:v4];
    goto LABEL_27;
  }
  if ([v5 isEqualToString:@"com.apple.photos.CPAnalytics.slideshowPlaybackResumed"])
  {
    v9 = [(PXAnalyticsSlideshowUsageDestination *)self _existingInfoForEvent:v4];
    [v9 unpauseWithEvent:v4];
    goto LABEL_27;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F563E8]])
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v9 = [(NSMutableDictionary *)self->_slideshowInfos objectEnumerator];
    uint64_t v20 = [v9 countByEnumeratingWithState:&v68 objects:v72 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v69 != v22) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * i), "setAppSuspensionCount:", objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * i), "appSuspensionCount") + 1);
        }
        uint64_t v21 = [v9 countByEnumeratingWithState:&v68 objects:v72 count:16];
      }
      while (v21);
    }
    goto LABEL_27;
  }
  if (![v5 isEqualToString:@"com.apple.photos.CPAnalytics.slideshowPlaybackEnded"])
  {
    if (![v5 isEqualToString:@"com.apple.photos.CPAnalytics.slideshowExportStarted"])
    {
      if (![v5 isEqualToString:@"com.apple.photos.CPAnalytics.slideshowExportEnded"])goto LABEL_28; {
      v10 = [(PXAnalyticsSlideshowUsageDestination *)self _popInfoForEndEvent:v4];
      }
      v11 = [(PXAnalyticsSlideshowUsageDestination *)self _createDefaultPayloadForInfo:v10];
      v31 = [v10 startEvent];
      uint64_t v32 = [v31 timestamp];

      v33 = [v10 endEvent];
      v34 = [v33 timestamp];

      v35 = [v11 objectForKeyedSubscript:@"slideshowExportSucceeded"];
      uint64_t v36 = [v35 BOOLValue];

      v37 = [v11 objectForKeyedSubscript:@"slideshowExportError"];
      int v38 = [(id)objc_opt_class() _isUserCancelledError:v37];
      v65 = v34;
      v67 = (void *)v32;
      [v34 timeIntervalSinceDate:v32];
      double v40 = v39;
      v41 = @"failed";
      if (v38) {
        v41 = @"cancelled";
      }
      if (v36) {
        v42 = @"succeeded";
      }
      else {
        v42 = v41;
      }
      v43 = [(id)objc_opt_class() payloadExportEndStateKey];
      [v11 setObject:v42 forKeyedSubscript:v43];

      if (v37 && (v38 & 1) == 0)
      {
        v44 = [v37 domain];
        v45 = [(id)objc_opt_class() payloadExportErrorDomainKey];
        [v11 setObject:v44 forKeyedSubscript:v45];

        v46 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v37, "code"));
        v47 = [(id)objc_opt_class() payloadExportErrorCodeKey];
        [v11 setObject:v46 forKeyedSubscript:v47];

        [v11 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F56568]];
      }
      v48 = [NSNumber numberWithDouble:v40];
      v49 = [(id)objc_opt_class() payloadExportDurationKey];
      [v11 setObject:v48 forKeyedSubscript:v49];

      v50 = (void *)MEMORY[0x1E4F56658];
      v51 = [(id)objc_opt_class() exportEndedCoreAnalyticsEventName];
      v52 = [(PXAnalyticsSlideshowUsageDestination *)self _payloadFilteredForCoreAnlaytics:v11];
      [v50 sendEvent:v51 withPayload:v52];

      v53 = (void *)MEMORY[0x1E4F56658];
      v54 = [(id)objc_opt_class() exportEndedCPAnalyticsEventNameForSuccess:v36 error:v37 duration:v40];
      [v53 sendEvent:v54 withPayload:v11];

      if (v36)
      {
        [v11 setObject:v67 forKeyedSubscript:*MEMORY[0x1E4F56588]];
        [v11 setObject:v65 forKeyedSubscript:*MEMORY[0x1E4F56578]];
        v55 = [(id)objc_opt_class() exportCPAnalyticsIntervalName];
        [v11 setObject:v55 forKeyedSubscript:*MEMORY[0x1E4F56580]];

        v56 = (void *)MEMORY[0x1E4F56658];
        uint64_t v57 = [v10 signpostID];
        [v56 endSignpost:v57 forEventName:*MEMORY[0x1E4F56440] withPayload:v11];
      }

      goto LABEL_10;
    }
    v9 = [(PXAnalyticsSlideshowUsageDestination *)self _createInfoForEvent:v4];
    if (!v9) {
      PXAssertGetLog();
    }
    [v9 setStartEvent:v4];
    objc_msgSend(v9, "setSignpostID:", objc_msgSend(MEMORY[0x1E4F56658], "startSignpost"));
LABEL_27:

    goto LABEL_28;
  }
  v66 = [(PXAnalyticsSlideshowUsageDestination *)self _popInfoForEndEvent:v4];
  v24 = -[PXAnalyticsSlideshowUsageDestination _createDefaultPayloadForInfo:](self, "_createDefaultPayloadForInfo:");
  v25 = [v4 propertyForKey:@"slideshowTerminationType"];
  uint64_t v26 = [v25 integerValue];

  v27 = [(id)objc_opt_class() payloadTimeFractionPlayedKey];
  v28 = [v24 objectForKeyedSubscript:v27];

  if (v28)
  {
    [v28 doubleValue];
    double v30 = v29;
  }
  else
  {
    double v30 = NAN;
  }
  v58 = (void *)MEMORY[0x1E4F56658];
  v59 = [(id)objc_opt_class() playbackEndedCoreAnalyticsEventName];
  v60 = [(PXAnalyticsSlideshowUsageDestination *)self _payloadFilteredForCoreAnlaytics:v24];
  [v58 sendEvent:v59 withPayload:v60];

  v61 = (void *)MEMORY[0x1E4F56658];
  v62 = [(id)objc_opt_class() playbackEndedCPAnalyticsEventNameForTerminationType:v26];
  [v61 sendEvent:v62 withPayload:v24];

  if (fabs(v30) != INFINITY)
  {
    v63 = (void *)MEMORY[0x1E4F56658];
    v64 = [(id)objc_opt_class() playbackEndedCPAnalyticsEventNameForTimeFractionPlayed:v30];
    [v63 sendEvent:v64 withPayload:v24];
  }
LABEL_28:
}

- (id)_payloadFilteredForCoreAnlaytics:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PXAnalyticsSlideshowUsageDestination__payloadFilteredForCoreAnlaytics___block_invoke;
  v9[3] = &unk_1E5DC7318;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  v7 = (void *)[v6 copy];
  return v7;
}

void __73__PXAnalyticsSlideshowUsageDestination__payloadFilteredForCoreAnlaytics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

- (id)_createDefaultPayloadForInfo:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 startEvent];
  id v6 = [v4 endEvent];
  v7 = (void *)[v5 copyRawPayload];
  v8 = (void *)[v7 mutableCopy];

  if (!v8) {
    PXAssertGetLog();
  }
  v9 = (void *)[v6 copyRawPayload];
  [v8 addEntriesFromDictionary:v9];

  [v8 setObject:0 forKeyedSubscript:@"slideshowSessionUUID"];
  id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "pauseCount"));
  v11 = [(id)objc_opt_class() payloadPauseCountKey];
  [v8 setObject:v10 forKeyedSubscript:v11];

  v12 = NSNumber;
  [v4 timePaused];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  v14 = [(id)objc_opt_class() payloadTimePausedKey];
  [v8 setObject:v13 forKeyedSubscript:v14];

  if (v5 && v6)
  {
    v15 = [v6 timestamp];
    v16 = [v5 timestamp];
    [v15 timeIntervalSinceDate:v16];
    double v18 = v17;

    v19 = [NSNumber numberWithDouble:v18];
    uint64_t v20 = [(id)objc_opt_class() payloadTotalPlaybackTimeKey];
    [v8 setObject:v19 forKeyedSubscript:v20];

    uint64_t v21 = [v8 objectForKeyedSubscript:@"slideshowExpectedDuration"];
    [v21 doubleValue];
    if (v22 > 0.0)
    {
      [v4 timePaused];
      double v24 = v18 - v23;
      [v21 doubleValue];
      uint64_t v26 = [NSNumber numberWithDouble:v24 / v25];
      v27 = [(id)objc_opt_class() payloadTimeFractionPlayedKey];
      [v8 setObject:v26 forKeyedSubscript:v27];
    }
  }
  v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "appSuspensionCount"));
  double v29 = [(id)objc_opt_class() payloadAppSuspensionCountKey];
  [v8 setObject:v28 forKeyedSubscript:v29];

  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __69__PXAnalyticsSlideshowUsageDestination__createDefaultPayloadForInfo___block_invoke;
  uint64_t v36 = &unk_1E5DC72C0;
  id v30 = v8;
  id v37 = v30;
  int v38 = self;
  objc_msgSend(v30, "_px_transformExistingValueForKey:usingBlock:", @"slideshowAssetCountsByPlaybackStyle", &v33);
  objc_msgSend(v30, "_px_transformExistingValueForKey:usingBlock:", @"slideshowTriggerType", &__block_literal_global_227182, v33, v34, v35, v36);
  objc_msgSend(v30, "_px_transformExistingValueForKey:usingBlock:", @"slideshowTerminationType", &__block_literal_global_310_227183);
  id v31 = v30;

  return v31;
}

uint64_t __69__PXAnalyticsSlideshowUsageDestination__createDefaultPayloadForInfo___block_invoke(uint64_t a1, void *a2)
{
  v3 = NSNumber;
  id v4 = a2;
  id v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "totalCount"));
  id v6 = *(void **)(a1 + 32);
  v7 = [(id)objc_opt_class() payloadTotalAssetCountKey];
  [v6 setObject:v5 forKeyedSubscript:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__PXAnalyticsSlideshowUsageDestination__createDefaultPayloadForInfo___block_invoke_2;
  v11[3] = &unk_1E5DC7298;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v12 = v8;
  uint64_t v13 = v9;
  [v4 enumerateCountsUsingBlock:v11];

  return 0;
}

__CFString *__69__PXAnalyticsSlideshowUsageDestination__createDefaultPayloadForInfo___block_invoke_4(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  return PXAnalyticsSlideshowTerminationTypeDescription(v2);
}

__CFString *__69__PXAnalyticsSlideshowUsageDestination__createDefaultPayloadForInfo___block_invoke_3(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  return PXAnalyticsSlideshowTriggerTypeDescription(v2);
}

void __69__PXAnalyticsSlideshowUsageDestination__createDefaultPayloadForInfo___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 >= 1)
  {
    objc_msgSend(NSNumber, "numberWithInteger:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = *(void **)(a1 + 32);
    v7 = [(id)objc_opt_class() payloadAssetCountKeyForPlaybackStyle:a2];
    [v6 setObject:v8 forKeyedSubscript:v7];
  }
}

- (id)_existingInfoForEvent:(id)a3 pop:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 propertyForKey:@"slideshowSessionUUID"];
  if (!v7) {
    PXAssertGetLog();
  }
  id v8 = [(NSMutableDictionary *)self->_slideshowInfos objectForKeyedSubscript:v7];
  if (!v8) {
    PXAssertGetLog();
  }
  if (v4) {
    [(NSMutableDictionary *)self->_slideshowInfos setObject:0 forKeyedSubscript:v7];
  }

  return v8;
}

- (id)_popInfoForEndEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAnalyticsSlideshowUsageDestination *)self _existingInfoForEvent:v4 pop:1];
  [v5 unpauseWithEvent:v4];
  [v5 setEndEvent:v4];

  return v5;
}

- (id)_existingInfoForEvent:(id)a3
{
  return [(PXAnalyticsSlideshowUsageDestination *)self _existingInfoForEvent:a3 pop:0];
}

- (id)_createInfoForEvent:(id)a3
{
  id v4 = [a3 propertyForKey:@"slideshowSessionUUID"];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_slideshowInfos objectForKeyedSubscript:v4];

    if (v5) {
      PXAssertGetLog();
    }
    id v6 = objc_alloc_init(_PXAnalyticsSlideshowInfo);
    [(NSMutableDictionary *)self->_slideshowInfos setObject:v6 forKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)_isUserCancelledError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]] && objc_msgSend(v3, "code") == 3072)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v3 domain];
    if ([v6 isEqualToString:@"OFNSOperationErrorDomain"]) {
      BOOL v5 = [v3 code] == 2;
    }
    else {
      BOOL v5 = 0;
    }
  }
  return v5;
}

+ (NSString)payloadExportDurationKey
{
  return (NSString *)@"slideshowExportDuration";
}

+ (NSString)payloadExportErrorCodeKey
{
  return (NSString *)@"slideshowExportErrorCode";
}

+ (NSString)payloadExportErrorDomainKey
{
  return (NSString *)@"slideshowExportErrorDomain";
}

+ (NSString)payloadExportEndStateKey
{
  return (NSString *)@"slideshowExportEndState";
}

+ (NSString)exportCPAnalyticsIntervalName
{
  return (NSString *)@"com.apple.photos.CPAnalytics.slideshowExportDuration";
}

+ (NSString)exportFailedCPAnalyticsEventName
{
  return (NSString *)@"com.apple.photos.CPAnalytics.slideshowExportFailed";
}

+ (id)exportEndedCPAnalyticsEventNameForSuccess:(BOOL)a3 error:(id)a4 duration:(double)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  if (v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F56658] bucketNameForDouble:&unk_1F02D5308 bucketLimits:0 numberFormatter:a5];
    uint64_t v10 = [[NSString alloc] initWithFormat:@"com.apple.photos.CPAnalytics.slideshowExportEndedSuccessfullyAfter%@Seconds", v9];
LABEL_5:
    v11 = (__CFString *)v10;

    goto LABEL_7;
  }
  if ([a1 _isUserCancelledError:v8])
  {
    uint64_t v9 = [MEMORY[0x1E4F56658] bucketNameForDouble:&unk_1F02D5320 bucketLimits:0 numberFormatter:a5];
    uint64_t v10 = [[NSString alloc] initWithFormat:@"com.apple.photos.CPAnalytics.slideshowExportCancelledAfter%@Seconds", v9];
    goto LABEL_5;
  }
  v11 = @"com.apple.photos.CPAnalytics.slideshowExportFailed";
LABEL_7:

  return v11;
}

+ (NSString)exportEndedCoreAnalyticsEventName
{
  return (NSString *)@"com.apple.Photos.slideshowExported";
}

+ (NSString)payloadAppSuspensionCountKey
{
  return (NSString *)@"slideshowAppSuspensionCount";
}

+ (NSString)payloadTimeFractionPlayedKey
{
  return (NSString *)@"slideshowTimeFractionPlayed";
}

+ (NSString)payloadTotalPlaybackTimeKey
{
  return (NSString *)@"slideshowTotalPlaybackTime";
}

+ (NSString)payloadTimePausedKey
{
  return (NSString *)@"slideshowTimePaused";
}

+ (NSString)payloadPauseCountKey
{
  return (NSString *)@"slideshowPauseCount";
}

+ (id)payloadAssetCountKeyForPlaybackStyle:(int64_t)a3
{
  id v3 = [NSString alloc];
  PXDisplayAssetPlaybackStyleDescription();
}

+ (NSString)payloadTotalAssetCountKey
{
  return (NSString *)@"slideshowTotalAssetCount";
}

+ (id)playbackEndedCPAnalyticsEventNameForTimeFractionPlayed:(double)a3
{
  id v3 = [MEMORY[0x1E4F56658] bucketNameForDouble:&unk_1F02D52F0 bucketLimits:0 numberFormatter:a3];
  id v4 = (void *)[[NSString alloc] initWithFormat:@"com.apple.photos.CPAnalytics.slideshowPlaybackEndedAfterTimeFraction%@", v3];

  return v4;
}

+ (id)playbackEndedCPAnalyticsEventNameForTerminationType:(int64_t)a3
{
  id v4 = [NSString alloc];
  BOOL v5 = PXAnalyticsSlideshowTerminationTypeDescription(a3);
  BOOL v6 = (void *)[v4 initWithFormat:@"com.apple.photos.CPAnalytics.slideshowPlaybackEndedBy%@", v5];

  return v6;
}

+ (NSString)playbackEndedCoreAnalyticsEventName
{
  return (NSString *)@"com.apple.Photos.slideshowPlaybackEnded";
}

+ (id)playbackStartedCPAnalyticsEventNameForTotalAssetCount:(int64_t)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F56658], "bucketNameForInteger:bucketLimits:", a3, 0, 5, 10, 15, 20, 30, 50, 100, 200, 300, 500, 1000, 0);
  id v4 = (void *)[[NSString alloc] initWithFormat:@"com.apple.photos.CPAnalytics.slideshowPlaybackStartedWith%@Assets", v3];

  return v4;
}

+ (NSString)playbackStartedCoreAnalyticsEventName
{
  return (NSString *)@"com.apple.Photos.slideshowPlaybackStarted";
}

@end