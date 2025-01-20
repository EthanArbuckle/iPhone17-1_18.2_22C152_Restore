@interface PPSocialHighlightStorage
+ (id)appLinksForResourceURL:(id)a3 resolvedURL:(id)a4;
+ (id)feedbackPruningPolicy;
+ (int)attributionFeedbackTypeForAttributionFeedbackType:(unint64_t)a3;
+ (int)unifiedFeedbackTypeForHighlightFeedbackType:(unint64_t)a3;
+ (unint64_t)entitlementStatusForClient:(id)a3 applicationIdentifiers:(id)a4;
- (BOOL)_isCollaborationEntitlementPresentForApplicationIdentifiers:(id)a3;
- (BOOL)isClientEntitledForItem:(id)a3 client:(id)a4 applicationIdentifiers:(id)a5 blockedHosts:(id)a6;
- (BOOL)isClientEntitledForItem:(id)a3 client:(id)a4 applicationIdentifiers:(id)a5 blockedHosts:(id)a6 iTunesOverrideChecker:(id)a7;
- (BOOL)isValidHighlight:(id)a3 applicationIdentifiers:(id)a4;
- (BOOL)rerankingEnabled;
- (BOOL)saveAttributionFeedbackForAttributionIdentifier:(id)a3 feedbackType:(unint64_t)a4 client:(id)a5 variant:(id)a6;
- (BOOL)saveFeedbackForHighlightIdentifier:(id)a3 feedbackType:(unint64_t)a4 client:(id)a5 variant:(id)a6;
- (PPSocialHighlightStorage)init;
- (PPSocialHighlightStorage)initWithFeedbackStream:(id)a3 rankedStream:(id)a4 database:(id)a5;
- (double)_sessionLoggingRate;
- (id)_mostRecentRankedHighlightsMatchingTest:(id)a3 client:(id)a4;
- (id)_rankableItemsForClient:(id)a3 variant:(id)a4 applicationIdentifiers:(id)a5 autoDonatingChatIdentifiers:(id)a6 limit:(unint64_t)a7 error:(id *)a8;
- (id)_rankableItemsForClient:(id)a3 variant:(id)a4 applicationIdentifiers:(id)a5 limit:(unint64_t)a6 error:(id *)a7;
- (id)_screenTimeConversation;
- (id)_socialAttributionFromAttributeValues:(id)a3 fetchAttributes:(id)a4;
- (id)_socialLayerDefaults;
- (id)allSupportedHighlightsForAutoDonatingChats:(id)a3 error:(id *)a4;
- (id)applicationIdentifiersForResourceURL:(id)a3 resolvedURL:(id)a4;
- (id)attributionForIdentifier:(id)a3 error:(id *)a4;
- (id)attributionsForIdentifiers:(id)a3 error:(id *)a4;
- (id)autoDonatingChatsWithError:(id *)a3;
- (id)autoDonatingChatsWithShouldContinueBlock:(id)a3 error:(id *)a4;
- (id)cachedRankedHighlightsForClient:(id)a3 variant:(id)a4 queriedHighlights:(id)a5;
- (id)deduplicateAndSortRankedHighlights:(id)a3 attributionLookup:(id)a4 limit:(unint64_t)a5 client:(id)a6;
- (id)featurizeRankedHighlights:(id)a3;
- (id)feedbackItems;
- (id)feedbackItemsInInterval:(double)a3 includingRemote:(BOOL)a4;
- (id)feedbackPublisherWithInterval:(double)a3 includingRemote:(BOOL)a4;
- (id)highlightFromRankableHighlight:(id)a3 attributionIdentifiers:(id)a4 earliestAttributionIdentifiers:(id)a5;
- (id)lastCacheInvalidationDateForClient:(id)a3;
- (id)rankedHighlightsForSyncedItems:(id)a3 client:(id)a4 variant:(id)a5 applicationIdentifiers:(id)a6 error:(id *)a7;
- (id)rankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 applicationIdentifiers:(id)a6 error:(id *)a7;
- (id)rankedItems;
- (id)sharedContentForClient:(id)a3 variant:(id)a4 applicationIdentifiers:(id)a5 limit:(unint64_t)a6 autoDonatingChatIdentifiers:(id)a7 error:(id *)a8;
- (id)sharedContentFromChats:(id)a3 dateRange:(double)a4 applicationIdentifiers:(id)a5 error:(id *)a6;
- (unint64_t)countDistinctRankedItemsMatchingBatchIdentifier:(id)a3;
- (unsigned)automaticSharingEnabled;
- (unsigned)automaticSharingEnabledForClient:(id)a3 error:(id *)a4;
- (void)_performFeedbackSessionLoggingForEnrichedFeedback:(id)a3 client:(id)a4;
- (void)_writeEnrichedFeedbackForAttributionIdentifier:(id)a3 client:(id)a4 feedbackType:(int)a5;
- (void)_writeEnrichedFeedbackForHighlightIdentifier:(id)a3 client:(id)a4 feedbackType:(int)a5;
- (void)cleanUpFeedbackWithShouldContinueBlock:(id)a3 ttl:(double)a4 onDeleteBlock:(id)a5;
- (void)clearFeedbackStream;
- (void)clearRankedStream;
- (void)clearStreams;
- (void)deleteAllRecordsFromBundleId:(id)a3;
- (void)deleteAllRecordsFromBundleId:(id)a3 matchingAttributionIdentifiers:(id)a4;
- (void)deleteAllRecordsFromBundleId:(id)a3 matchingDomainSelection:(id)a4;
- (void)deleteDataDerivedFromContentMatchingRequest:(id)a3;
- (void)deleteFeedbackMatchingPredicate:(id)a3;
- (void)deleteVendedMatchingPredicate:(id)a3;
- (void)freezeAppLinksCache;
- (void)handleAppLinkChangeNotification:(id)a3;
- (void)invalidateCacheForClient:(id)a3;
- (void)resetLSAppLinkCache;
- (void)saveFeedbackItems:(id)a3;
- (void)saveOrderedBatch:(id)a3;
- (void)syncFeedback;
@end

@implementation PPSocialHighlightStorage

- (id)sharedContentFromChats:(id)a3 dateRange:(double)a4 applicationIdentifiers:(id)a5 error:(id *)a6
{
  v76[1] = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v53 = a5;
  v76[0] = *MEMORY[0x1E4F8A0A8];
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:1];
  v10 = +[PPSocialHighlightStorageUtilities filteredAllowedChatBundleIds:v9];

  if ([v10 count])
  {
    v11 = objc_opt_new();
    [v11 setReason:@"SHContent"];
    [v11 setDisableBlockingOnIndex:1];
    uint64_t v12 = [&unk_1F256A040 integerValue];
    [v11 setMaximumBatchSize:2 * v12];
    [v11 setReason:@"reason:PPSocialHighlightStore-2; code:1"];
    uint64_t v75 = *MEMORY[0x1E4F28358];
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
    [v11 setProtectionClasses:v13];

    uint64_t v14 = *MEMORY[0x1E4F23660];
    v74[0] = *MEMORY[0x1E4F23670];
    v74[1] = v14;
    uint64_t v15 = *MEMORY[0x1E4F22AF8];
    v74[2] = *MEMORY[0x1E4F22C38];
    v74[3] = v15;
    uint64_t v16 = *MEMORY[0x1E4F22B10];
    v74[4] = *MEMORY[0x1E4F22B00];
    v74[5] = v16;
    uint64_t v17 = *MEMORY[0x1E4F23498];
    v74[6] = *MEMORY[0x1E4F22A08];
    v74[7] = v17;
    uint64_t v18 = *MEMORY[0x1E4F230A8];
    v74[8] = *MEMORY[0x1E4F22CE8];
    v74[9] = v18;
    uint64_t v19 = *MEMORY[0x1E4F22FC0];
    v74[10] = *MEMORY[0x1E4F22C60];
    v74[11] = v19;
    uint64_t v20 = *MEMORY[0x1E4F22FB0];
    v74[12] = *MEMORY[0x1E4F23598];
    v74[13] = v20;
    v74[14] = @"com_apple_mobilesms_highlightedContentServerDate";
    v74[15] = @"com_apple_mobilesms_syndicationContentType";
    uint64_t v21 = *MEMORY[0x1E4F235E8];
    v74[16] = @"com_apple_mobilesms_collaborationIdentifier";
    v74[17] = v21;
    v74[18] = *MEMORY[0x1E4F22FD8];
    v74[19] = @"com_apple_mobilesms_resolvedURL";
    v74[20] = @"com_apple_mobilesms_fromMe";
    v74[21] = @"com_apple_mobilesms_ckBundleIDs";
    v74[22] = @"com_apple_mobilesms_localIdentityProof";
    v74[23] = @"com_apple_mobilesms_localIdentity";
    v74[24] = @"com_apple_mobilesms_handleToIdentityMap";
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:25];
    [v11 setFetchAttributes:v22];

    [v11 setLowPriority:qos_class_self() < QOS_CLASS_USER_INITIATED];
    id v23 = [NSString alloc];
    v50 = (void *)[v23 initWithFormat:@"%@=\"%@\", *MEMORY[0x1E4F23148], @"lnk""];
    BOOL v24 = [(PPSocialHighlightStorage *)self _isCollaborationEntitlementPresentForApplicationIdentifiers:v53];
    id v25 = [NSString alloc];
    if (v24) {
      v26 = @"%@=1";
    }
    else {
      v26 = @"%@!=2";
    }
    v49 = objc_msgSend(v25, "initWithFormat:", v26, @"com_apple_mobilesms_syndicationContentType");
    v51 = (void *)[[NSString alloc] initWithFormat:@"%@ != 0 && (InRange(com_apple_mobilesms_isHighlightedContent, 1, 2) || com_apple_mobilesms_isHighlightedContent=8)", v18];
    v48 = (void *)[[NSString alloc] initWithFormat:@"(%@ || %@)", @"InRange(com_apple_mobilesms_isHighlightedContent, 1, 2)", v51];
    v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"kMDItemContentCreationDate>=$time.now(-%.f)", *(void *)&a4);
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v12];
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x2020000000;
    uint64_t v66 = 0;
    v29 = (void *)MEMORY[0x1CB79D060]();
    v73[0] = v50;
    v73[1] = v27;
    v73[2] = @"URL=*";
    v73[3] = v48;
    v73[4] = v49;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:5];
    v31 = objc_msgSend(v30, "_pas_componentsJoinedByString:", @" && ");

    v32 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = [v11 lowPriority];
      v34 = @"high";
      if (v33) {
        v34 = @"low";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v34;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v31;
      _os_log_impl(&dword_1CA9A8000, v32, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Performing CoreSpotlight highlight query (%@ priority): %@", buf, 0x16u);
    }

    v35 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v31 context:v11];
    [v35 setBundleIDs:v10];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __90__PPSocialHighlightStorage_sharedContentFromChats_dateRange_applicationIdentifiers_error___block_invoke;
    v59[3] = &unk_1E65DACF8;
    v61 = &v63;
    id v36 = v28;
    id v60 = v36;
    uint64_t v62 = v12;
    [v35 setFoundItemsHandler:v59];
    dispatch_semaphore_t v37 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v70 = __Block_byref_object_copy__22826;
    v71 = __Block_byref_object_dispose__22827;
    id v72 = 0;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __90__PPSocialHighlightStorage_sharedContentFromChats_dateRange_applicationIdentifiers_error___block_invoke_3;
    v56[3] = &unk_1E65DAC88;
    v58 = buf;
    v38 = v37;
    v57 = v38;
    [v35 setCompletionHandler:v56];
    [v35 start];
    dispatch_semaphore_wait(v38, 0xFFFFFFFFFFFFFFFFLL);
    if (v64[3] || !*(void *)(*(void *)&buf[8] + 40))
    {
      int v39 = 1;
    }
    else
    {
      v41 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v67 = 138412290;
        uint64_t v68 = v46;
        _os_log_error_impl(&dword_1CA9A8000, v41, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: CoreSpotlight highlight query error: %@", v67, 0xCu);
      }

      if (a6) {
        objc_storeStrong(a6, *(id *)(*(void *)&buf[8] + 40));
      }
      int v39 = 0;
    }

    _Block_object_dispose(buf, 8);
    if (v39)
    {
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __90__PPSocialHighlightStorage_sharedContentFromChats_dateRange_applicationIdentifiers_error___block_invoke_385;
      v54[3] = &unk_1E65DAD20;
      id v55 = v52;
      v40 = objc_msgSend(v36, "_pas_filteredArrayWithTest:", v54);
      v42 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v43 = v64[3];
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v12;
        _os_log_impl(&dword_1CA9A8000, v42, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight query result count: %tu returning top %tu", buf, 0x16u);
      }

      v44 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v40;
        _os_log_impl(&dword_1CA9A8000, v44, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Returned results: %@", buf, 0xCu);
      }
    }
    else
    {
      v40 = (void *)MEMORY[0x1E4F1CBF0];
    }
    _Block_object_dispose(&v63, 8);
  }
  else
  {
    v11 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Short-circuiting sharedContentFromChats query because Messages app is protected.", buf, 2u);
    }
    v40 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v40;
}

void __61__PPSocialHighlightStorage_attributionsForIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = [v3 count];
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight attribution query for identifiers: %tu result count: %tu", (uint8_t *)&v7, 0x16u);
  }

  if (v3) {
    v6 = v3;
  }
  else {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id __74__PPSocialHighlightStorage_feedbackPublisherWithInterval_includingRemote___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

void __74__PPSocialHighlightStorage_feedbackPublisherWithInterval_includingRemote___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = a2;
  id v3 = v12[1];
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = [v3 remoteDevices];
    uint64_t v5 = [v12[1] publishersForRemoteDevices:v4 startTime:1 includeLocal:&__block_literal_global_513 pipeline:*(double *)(a1 + 40)];
    uint64_t v6 = [v5 merge];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    uint64_t v9 = [v3 publisherFromStartTime:*(double *)(a1 + 40)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    v4 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }

  id v11 = self;
}

- (id)deduplicateAndSortRankedHighlights:(id)a3 attributionLookup:(id)a4 limit:(unint64_t)a5 client:(id)a6
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v64 = a4;
  id v69 = a6;
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = objc_opt_new();
  id v11 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_401);
  id v12 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v13 = objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_404);
  v73 = (void *)[v12 initWithObjects:v13 forKeys:v11];

  id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v15 = objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_406);
  uint64_t v68 = v11;
  id v72 = (void *)[v14 initWithObjects:v15 forKeys:v11];

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v80 objects:v92 count:16];
  v70 = v16;
  v71 = v10;
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v81 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        v22 = objc_msgSend(v21, "highlightIdentifier", v64);

        if (!v22)
        {
          v35 = pp_default_log_handle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1CA9A8000, v35, OS_LOG_TYPE_FAULT, "PPSocialHighlightStorage: highlight did not have a highlight identifier when queried.", buf, 2u);
          }
          goto LABEL_25;
        }
        if ([v21 isCollaboration]
          && [v21 hasDomainIdentifier])
        {
          id v23 = [v21 highlightIdentifier];
          BOOL v24 = [v73 objectForKeyedSubscript:v23];
          id v25 = [v21 domainIdentifier];
          v26 = [v24 objectForKeyedSubscript:v25];

          v27 = [v21 highlightIdentifier];
          v28 = [v73 objectForKeyedSubscript:v27];
          v29 = [v21 domainIdentifier];
          if (v26)
          {
            v30 = [v28 objectForKeyedSubscript:v29];

            [v30 syndicationSecondsSinceReferenceDate];
            double v32 = v31;
            [v21 syndicationSecondsSinceReferenceDate];
            if (v32 > v33)
            {
              v28 = [v21 highlightIdentifier];
              v29 = [v73 objectForKeyedSubscript:v28];
              v34 = [v21 domainIdentifier];
              [v29 setObject:v21 forKeyedSubscript:v34];

              goto LABEL_15;
            }
          }
          else
          {
            [v28 setObject:v21 forKeyedSubscript:v29];
            v30 = v27;
LABEL_15:
          }
          id v36 = [v21 highlightIdentifier];
          dispatch_semaphore_t v37 = [v72 objectForKeyedSubscript:v36];
          v38 = [v21 domainIdentifier];
          int v39 = [v37 objectForKeyedSubscript:v38];

          v40 = [v21 highlightIdentifier];
          v41 = [v72 objectForKeyedSubscript:v40];
          v42 = [v21 domainIdentifier];
          if (v39)
          {
            uint64_t v43 = [v41 objectForKeyedSubscript:v42];

            [v43 syndicationSecondsSinceReferenceDate];
            double v45 = v44;
            [v21 syndicationSecondsSinceReferenceDate];
            if (v45 < v46)
            {
              v41 = [v21 highlightIdentifier];
              v42 = [v72 objectForKeyedSubscript:v41];
              v47 = [v21 domainIdentifier];
              [v42 setObject:v21 forKeyedSubscript:v47];

              goto LABEL_20;
            }
            uint64_t v10 = v71;
          }
          else
          {
            [v41 setObject:v21 forKeyedSubscript:v42];
            uint64_t v43 = v40;
LABEL_20:
            uint64_t v10 = v71;
          }
          id v16 = v70;
        }
        v48 = [v21 highlightIdentifier];
        char v49 = [v9 containsObject:v48];

        if (v49) {
          continue;
        }
        [v10 addObject:v21];
        v35 = [v21 highlightIdentifier];
        [v9 addObject:v35];
LABEL_25:
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v80 objects:v92 count:16];
    }
    while (v18);
  }

  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __94__PPSocialHighlightStorage_deduplicateAndSortRankedHighlights_attributionLookup_limit_client___block_invoke_407;
  v75[3] = &unk_1E65DAD88;
  id v65 = v64;
  id v76 = v65;
  id v74 = v73;
  id v77 = v74;
  id v50 = v72;
  id v78 = v50;
  v79 = self;
  objc_msgSend(v10, "_pas_mappedArrayWithTransform:", v75);
  id v51 = (id)objc_claimAutoreleasedReturnValue();
  id v52 = +[PPConfiguration sharedInstance];
  unint64_t v53 = [v52 socialHighlightMaxNumHighlights];

  v54 = v51;
  if ([v51 count] > v53)
  {
    v54 = objc_msgSend(v51, "subarrayWithRange:", 0, v53, v65);
  }
  v91[0] = v69;
  v90[0] = @"client";
  v90[1] = @"limit";
  id v55 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v53, v65);
  v91[1] = v55;
  v90[2] = @"portraitResultCount";
  v56 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v54, "count"));
  v91[2] = v56;
  v90[3] = @"portraitCacheDate";
  v57 = [(PPSocialHighlightStorage *)self lastCacheInvalidationDateForClient:v69];
  v58 = v57;
  if (!v57)
  {
    v58 = [MEMORY[0x1E4F1CA98] null];
  }
  v91[3] = v58;
  v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:4];
  if (!v57) {

  }
  PLLogRegisteredEvent();
  id v60 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v61 = [v70 count];
    uint64_t v62 = [v54 count];
    *(_DWORD *)buf = 134218498;
    uint64_t v85 = v61;
    __int16 v86 = 2048;
    uint64_t v87 = v62;
    __int16 v88 = 2112;
    id v89 = v69;
    _os_log_impl(&dword_1CA9A8000, v60, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: reduced %tu highlights into %tu deduplicated highlights for %@", buf, 0x20u);
  }

  return v54;
}

- (id)sharedContentForClient:(id)a3 variant:(id)a4 applicationIdentifiers:(id)a5 limit:(unint64_t)a6 autoDonatingChatIdentifiers:(id)a7 error:(id *)a8
{
  v60[4] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  uint64_t v18 = pp_social_highlights_signpost_handle();
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  uint64_t v20 = pp_social_highlights_signpost_handle();
  uint64_t v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "Storage.sharedContentFromChats", "", buf, 2u);
  }

  v22 = +[PPConfiguration sharedInstance];
  [v22 socialHighlightDecayInterval];
  id v23 = -[PPSocialHighlightStorage sharedContentFromChats:dateRange:applicationIdentifiers:error:](self, "sharedContentFromChats:dateRange:applicationIdentifiers:error:", v17, v16, a8);

  BOOL v24 = pp_social_highlights_signpost_handle();
  id v25 = v24;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v25, OS_SIGNPOST_INTERVAL_END, v19, "Storage.sharedContentFromChats", " enableTelemetry=YES ", buf, 2u);
  }

  v60[0] = v14;
  v59[0] = @"client";
  v59[1] = @"limit";
  v26 = [NSNumber numberWithUnsignedInteger:a6];
  v60[1] = v26;
  v60[2] = &unk_1F256A040;
  v59[2] = @"maximumResultCount";
  v59[3] = @"spotlightResultCount";
  v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
  v60[3] = v27;
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:4];

  uint64_t v46 = v28;
  PLLogRegisteredEvent();
  v29 = +[PPTrialWrapper sharedInstance];
  v30 = [v29 plistForFactorName:@"social_highlight_blocked_hosts.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_SOCIAL_HIGHLIGHT"];

  double v31 = [v30 objectForKeyedSubscript:@"blockedHostSuffixes"];
  objc_opt_class();
  LOBYTE(v28) = objc_opt_isKindOfClass();

  if (v28)
  {
    double v32 = objc_msgSend(v30, "objectForKeyedSubscript:", @"blockedHostSuffixes", v46);
  }
  else
  {
    double v32 = (void *)MEMORY[0x1E4F1CBF0];
  }
  int v33 = objc_msgSend(v16, "containsObject:", @"*", v46);
  int v34 = [v16 containsObject:@"collaborations"];
  v35 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    int v56 = v33;
    __int16 v57 = 1024;
    int v58 = v34;
    _os_log_impl(&dword_1CA9A8000, v35, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: kPPAccessWildCard: %u, kPPAllCollaborations: %u entitlements detected", buf, 0xEu);
  }

  id v36 = [(PPSocialHighlightStorage *)self _screenTimeConversation];
  dispatch_semaphore_t v37 = objc_opt_new();
  [(PPSocialHighlightStorageUtilities *)self->_socialHighlightStorageUtils clearCache];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __122__PPSocialHighlightStorage_sharedContentForClient_variant_applicationIdentifiers_limit_autoDonatingChatIdentifiers_error___block_invoke;
  v48[3] = &unk_1E65DAE68;
  v48[4] = self;
  id v49 = v16;
  id v50 = v14;
  id v51 = v32;
  id v52 = v37;
  id v53 = v15;
  id v54 = v36;
  id v38 = v36;
  id v39 = v15;
  id v40 = v37;
  id v41 = v32;
  id v42 = v14;
  id v43 = v16;
  double v44 = objc_msgSend(v23, "_pas_filteredArrayWithTest:", v48);
  [(PPSocialHighlightStorage *)self freezeAppLinksCache];

  return v44;
}

- (BOOL)_isCollaborationEntitlementPresentForApplicationIdentifiers:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (([v3 containsObject:@"*"] & 1) != 0
      || ([v4 containsObject:@"collaborations"] & 1) == 0)
    {
      char v5 = [v4 containsObject:@"portraitCollaborations"];
    }
    else
    {
      char v5 = 1;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)rankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 applicationIdentifiers:(id)a6 error:(id *)a7
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v11 = (__CFString *)a4;
  id v57 = a5;
  id v62 = a6;
  v80[0] = @"client";
  v80[1] = @"limit";
  v81[0] = v11;
  unint64_t v56 = a3;
  id v12 = [NSNumber numberWithUnsignedInteger:a3];
  v81[1] = v12;
  int v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:2];

  PLLogRegisteredEvent();
  v13 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: fetching rankedHighlights for client %@", buf, 0xCu);
  }

  id v64 = objc_opt_new();
  if ([(PPSocialHighlightStorage *)self _isCollaborationEntitlementPresentForApplicationIdentifiers:v62])
  {
    id v14 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = @"collaborations";
      _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Overwriting client identifier %@ to %@", buf, 0x16u);
    }

    id v11 = @"collaborations";
  }
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x3032000000;
  id v76 = __Block_byref_object_copy__22826;
  id v77 = __Block_byref_object_dispose__22827;
  id v78 = 0;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  cache = self->_cache;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __98__PPSocialHighlightStorage_rankedHighlightsWithLimit_client_variant_applicationIdentifiers_error___block_invoke;
  v70[3] = &unk_1E65DAE90;
  id v72 = &v73;
  dispatch_semaphore_t dsema = v15;
  dispatch_semaphore_t v71 = dsema;
  -[PPSocialHighlightCache cachedRankedHighlightsForClient:variant:completion:]((uint64_t)cache, v11, v70);
  id v69 = 0;
  id v60 = [(PPSocialHighlightStorage *)self _rankableItemsForClient:v11 variant:v57 applicationIdentifiers:v62 limit:a3 error:&v69];
  if (a7) {
    *a7 = v69;
  }
  id v17 = [v60 first];
  uint64_t v61 = [v60 second];
  v59 = v11;
  if (v60 && v17 && v61)
  {
    id v54 = v17;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v18 = v61;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v65 objects:v79 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v66 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void *)(*((void *)&v65 + 1) + 8 * i);
          id v23 = (void *)MEMORY[0x1CB79D060]();
          BOOL v24 = [v18 objectForKeyedSubscript:v22];
          id v25 = [v24 allValues];
          v26 = [v25 sortedArrayUsingComparator:&__block_literal_global_497];
          v27 = objc_msgSend(v26, "_pas_mappedArrayWithTransform:", &__block_literal_global_500);

          uint64_t v28 = pp_social_highlights_log_handle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v29 = [v27 count];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v22;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v29;
            _os_log_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Social highlight: %@ attributions deduplicated to %tu items", buf, 0x16u);
          }

          [v64 setObject:v27 forKeyedSubscript:v22];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v65 objects:v79 count:16];
      }
      while (v19);
    }

    v30 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      double v31 = [v60 first];
      uint64_t v32 = [v31 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v32;
      _os_log_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: Social rankable highlights count: %tu", buf, 0xCu);
    }
    int v33 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = [v64 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v34;
      _os_log_impl(&dword_1CA9A8000, v33, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: Social highlight deduplicated count: %tu", buf, 0xCu);
    }

    v35 = self->_cache;
    if (v35) {
      dispatch_sync((dispatch_queue_t)v35->_queue, &__block_literal_global_689);
    }
    dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    id v36 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      uint64_t v37 = [(id)v74[5] count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v37;
      _os_log_impl(&dword_1CA9A8000, v36, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: cachedHighlights count: %tu", buf, 0xCu);
    }

    int v38 = -[PPSocialHighlightCache cachedHighlightsArrayIsValid:queryResults:]((uint64_t)self->_cache, (void *)v74[5], v54);
    id v39 = (void *)v74[5];
    if (v39) {
      int v40 = v38;
    }
    else {
      int v40 = 0;
    }
    if (v40 == 1)
    {
      id v41 = v39;
    }
    else
    {
      double v44 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v59;
        _os_log_impl(&dword_1CA9A8000, v44, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: Ranking social highlights for client '%@', as no valid cache exists.", buf, 0xCu);
      }

      double v45 = [(PPSocialHighlightStorage *)self featurizeRankedHighlights:v54];

      uint64_t v46 = objc_opt_new();
      v47 = objc_msgSend(v46, "rankSocialHighlights:client:performRerank:", v45, v59, -[PPSocialHighlightStorage rerankingEnabled](self, "rerankingEnabled"));

      v48 = self->_cache;
      id v41 = v47;
      id v49 = v59;
      id v50 = v49;
      if (v48)
      {
        if (!v49)
        {
          id v51 = pp_social_highlights_log_handle();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA9A8000, v51, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: Saving ranked items to the vended stream without a client identifier. The cache will not be active.", buf, 2u);
          }
        }
        queue = v48->_queue;
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __59__PPSocialHighlightCache_saveRankedItems_clientIdentifier___block_invoke;
        long long v83 = &unk_1E65D87E8;
        v84 = v48;
        id v85 = v41;
        __int16 v86 = v50;
        dispatch_sync(queue, buf);
      }
    }
    id v43 = -[PPSocialHighlightStorage deduplicateAndSortRankedHighlights:attributionLookup:limit:client:](self, "deduplicateAndSortRankedHighlights:attributionLookup:limit:client:", v41, v64, v56, v59, v54);
    id v17 = v41;
  }
  else
  {
    id v42 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v42, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: spotlight query failed.", buf, 2u);
    }

    id v43 = 0;
  }

  _Block_object_dispose(&v73, 8);
  return v43;
}

- (id)_rankableItemsForClient:(id)a3 variant:(id)a4 applicationIdentifiers:(id)a5 limit:(unint64_t)a6 error:(id *)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ([(PPSocialHighlightStorage *)self _isCollaborationEntitlementPresentForApplicationIdentifiers:v14])
  {
    dispatch_semaphore_t v15 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = @"collaborations";
      _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Automatic Sharing is enabled due to %@ entitlement", buf, 0xCu);
    }

    id v16 = 0;
  }
  else
  {
    id v24 = 0;
    int v17 = [(PPSocialHighlightStorage *)self automaticSharingEnabledForClient:v12 error:&v24];
    id v16 = (__CFString *)v24;
    if (v17 != 2)
    {
      id v18 = objc_opt_new();
      if (v18) {
        goto LABEL_7;
      }
      goto LABEL_9;
    }
  }
  id v23 = v16;
  id v18 = [(PPSocialHighlightStorage *)self autoDonatingChatsWithError:&v23];
  uint64_t v19 = v23;

  id v16 = v19;
  if (v18)
  {
LABEL_7:
    uint64_t v20 = [(PPSocialHighlightStorage *)self _rankableItemsForClient:v12 variant:v13 applicationIdentifiers:v14 autoDonatingChatIdentifiers:v18 limit:a6 error:a7];
    goto LABEL_14;
  }
LABEL_9:
  if (a7) {
    objc_storeStrong(a7, v16);
  }
  uint64_t v21 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v16;
    _os_log_error_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: unable to fetch auto donating chat identifiers: %@", buf, 0xCu);
  }

  uint64_t v20 = 0;
LABEL_14:

  return v20;
}

- (id)_rankableItemsForClient:(id)a3 variant:(id)a4 applicationIdentifiers:(id)a5 autoDonatingChatIdentifiers:(id)a6 limit:(unint64_t)a7 error:(id *)a8
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v84 = a6;
  int v17 = -[PPSocialHighlightStorage sharedContentForClient:variant:applicationIdentifiers:limit:autoDonatingChatIdentifiers:error:](self, "sharedContentForClient:variant:applicationIdentifiers:limit:autoDonatingChatIdentifiers:error:", v14, v15, v16, a7);
  id v18 = [v17 sortedArrayUsingComparator:&__block_literal_global_466];
  uint64_t v19 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v94 = [v18 count];
    _os_log_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight filtered result count: %tu", buf, 0xCu);
  }

  uint64_t v20 = pp_social_highlights_signpost_handle();
  os_signpost_id_t v21 = os_signpost_id_generate(v20);

  uint64_t v22 = pp_social_highlights_signpost_handle();
  id v23 = v22;
  unint64_t v75 = v21 - 1;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "Storage.rankableHighlightsFromItems", "", buf, 2u);
  }
  os_signpost_id_t spid = v21;

  id v24 = objc_msgSend(v18, "_pas_mappedArrayWithTransform:", &__block_literal_global_470);
  id v92 = 0;
  id v25 = [(PPSocialHighlightStorage *)self attributionsForIdentifiers:v24 error:&v92];
  id v26 = v92;
  if (![v24 count] || objc_msgSend(v25, "count"))
  {
    id v71 = v26;
    id v72 = v24;
    id v74 = v17;
    long long v80 = objc_opt_new();
    long long v82 = objc_opt_new();
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    uint64_t v73 = v18;
    id obj = v18;
    uint64_t v86 = [obj countByEnumeratingWithState:&v88 objects:v97 count:16];
    if (v86)
    {
      uint64_t v27 = *(void *)v89;
      uint64_t v76 = *MEMORY[0x1E4F22B10];
      id v78 = v15;
      id v79 = v14;
      long long v81 = v25;
      id v77 = v16;
      uint64_t v83 = *(void *)v89;
      do
      {
        for (uint64_t i = 0; i != v86; ++i)
        {
          if (*(void *)v89 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          v30 = (void *)MEMORY[0x1CB79D060]();
          double v31 = [v29 attributeSet];
          uint64_t v32 = [v31 URL];

          if (v32)
          {
            uint64_t v87 = v30;
            int v33 = [v29 uniqueIdentifier];
            uint64_t v34 = [v25 objectForKeyedSubscript:v33];
            v35 = (void *)v34;
            if (v33) {
              BOOL v36 = v34 == 0;
            }
            else {
              BOOL v36 = 1;
            }
            if (v36)
            {
              uint64_t v37 = pp_social_highlights_log_handle();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v94 = (uint64_t)v33;
                _os_log_impl(&dword_1CA9A8000, v37, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Failed to fetch attribution for identifier: %@", buf, 0xCu);
              }
            }
            else
            {
              int v38 = +[PPRankableSocialHighlightUtils rankableHighlightFromSearchableItem:v29 attribution:v34 autoDonatingChats:v84 applicationIdentifiers:v16 clientIdentifier:v14 variant:v15];
              uint64_t v37 = v38;
              if (v38
                && ([v38 highlightIdentifier],
                    id v39 = objc_claimAutoreleasedReturnValue(),
                    v39,
                    v39))
              {
                [v80 addObject:v37];
                int v40 = pp_social_highlights_log_handle();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                {
                  id v41 = [v37 highlightIdentifier];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v94 = (uint64_t)v41;
                  _os_log_impl(&dword_1CA9A8000, v40, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: CoreSpotlight fetched highlight with identifier: %@", buf, 0xCu);
                }
                id v42 = [v37 highlightIdentifier];
                id v43 = [v82 objectForKeyedSubscript:v42];

                if (!v43)
                {
                  double v44 = objc_opt_new();
                  double v45 = [v37 highlightIdentifier];
                  [v82 setObject:v44 forKeyedSubscript:v45];
                }
                uint64_t v46 = [v29 attributeSet];
                v47 = [v46 attributeForKey:v76];

                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v48 = [v47 firstObject];
                }
                else
                {
                  v48 = 0;
                }
                id v51 = [NSString alloc];
                uint64_t v52 = [v35 conversationIdentifier];
                id v53 = (void *)v52;
                if (v48)
                {
                  id v54 = (void *)[v51 initWithFormat:@"%@_%@", v52, v48, spid];
                }
                else
                {
                  id v55 = [v35 sender];
                  unint64_t v56 = [v55 handle];
                  id v54 = (void *)[v51 initWithFormat:@"%@_%@", v53, v56];
                }
                if (v54)
                {
                  id v57 = [v37 highlightIdentifier];
                  int v58 = [v82 objectForKeyedSubscript:v57];
                  v59 = [v58 objectForKeyedSubscript:v54];

                  if (!v59)
                  {
                    id v60 = [v37 highlightIdentifier];
                    uint64_t v61 = [v82 objectForKeyedSubscript:v60];
                    [v61 setObject:v35 forKeyedSubscript:v54];
                  }
                }

                id v15 = v78;
                id v14 = v79;
                id v16 = v77;
                id v25 = v81;
              }
              else
              {
                v47 = pp_social_highlights_log_handle();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  id v49 = [v29 uniqueIdentifier];
                  id v50 = [v37 highlightIdentifier];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v94 = (uint64_t)v49;
                  __int16 v95 = 2112;
                  v96 = v50;
                  _os_log_impl(&dword_1CA9A8000, v47, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: item %@ did not produce a correct rankable highlight identifier: %@", buf, 0x16u);

                  id v25 = v81;
                }
              }

              uint64_t v27 = v83;
            }

            v30 = v87;
          }
          else
          {
            int v33 = pp_social_highlights_log_handle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA9A8000, v33, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight fetched highlight with missing URL.", buf, 2u);
            }
          }
        }
        uint64_t v86 = [obj countByEnumeratingWithState:&v88 objects:v97 count:16];
      }
      while (v86);
    }

    id v62 = pp_social_highlights_signpost_handle();
    uint64_t v63 = v62;
    if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v63, OS_SIGNPOST_INTERVAL_END, spid, "Storage.rankableHighlightsFromItems", " enableTelemetry=YES ", buf, 2u);
    }

    id v64 = v80;
    long long v65 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v80 second:v82];

    id v18 = v73;
    int v17 = v74;
    id v26 = v71;
    id v24 = v72;
    goto LABEL_49;
  }
  long long v67 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v94 = (uint64_t)v26;
    _os_log_error_impl(&dword_1CA9A8000, v67, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: Failed to fetch attributions for identifiers: %@", buf, 0xCu);
  }

  if (a8)
  {
    id v68 = v26;
    long long v65 = 0;
    id v69 = *a8;
    *a8 = v68;
    id v64 = v69;
LABEL_49:

    goto LABEL_50;
  }
  long long v65 = 0;
LABEL_50:

  return v65;
}

- (BOOL)rerankingEnabled
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [(PPSocialHighlightStorage *)self _socialLayerDefaults];
  int v3 = [v2 BOOLForKey:@"ProactiveRerankingDisabled"];

  v4 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = @"on";
    if (v3) {
      uint64_t v6 = @"off";
    }
    int v7 = 138412290;
    id v8 = v6;
    _os_log_debug_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: reranking state is %@.", (uint8_t *)&v7, 0xCu);
  }

  return v3 ^ 1;
}

- (id)lastCacheInvalidationDateForClient:(id)a3
{
  return -[PPSocialHighlightCache lastCacheInvalidationDateForClient:](&self->_cache->super.isa, a3);
}

- (void)freezeAppLinksCache
{
  lsAppLinkCache = self->_lsAppLinkCache;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__PPSocialHighlightStorage_freezeAppLinksCache__block_invoke;
  v3[3] = &unk_1E65DADD0;
  v3[4] = self;
  v3[5] = a2;
  [(_PASLock *)lsAppLinkCache runWithLockAcquired:v3];
}

- (id)attributionsForIdentifiers:(id)a3 error:(id *)a4
{
  v58[13] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v35 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
  uint64_t v7 = *MEMORY[0x1E4F22D28];
  v58[0] = *MEMORY[0x1E4F23670];
  v58[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F22CE8];
  v58[2] = *MEMORY[0x1E4F22FD8];
  v58[3] = v8;
  uint64_t v9 = *MEMORY[0x1E4F22B00];
  v58[4] = *MEMORY[0x1E4F22B30];
  v58[5] = v9;
  uint64_t v10 = *MEMORY[0x1E4F23498];
  v58[6] = *MEMORY[0x1E4F234B0];
  v58[7] = v10;
  uint64_t v11 = *MEMORY[0x1E4F235E8];
  v58[8] = @"com_apple_mobilesms_highlightedContentServerDate";
  v58[9] = v11;
  v58[10] = @"com_apple_mobilesms_fromMe";
  v58[11] = @"com_apple_mobilesms_collaborationMetadata";
  v58[12] = @"com_apple_mobilesms_chatUniqueIdentifier";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:13];
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__22826;
  id v49 = __Block_byref_object_dispose__22827;
  id v50 = 0;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  uint64_t v14 = *MEMORY[0x1E4F28358];
  uint64_t v15 = *MEMORY[0x1E4F8A0A8];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __61__PPSocialHighlightStorage_attributionsForIdentifiers_error___block_invoke;
  v41[3] = &unk_1E65DAEF8;
  id v42 = v6;
  double v44 = &v45;
  id v33 = v42;
  dispatch_semaphore_t dsema = v13;
  dispatch_semaphore_t v43 = dsema;
  [v35 slowFetchAttributes:v12 protectionClass:v14 bundleID:v15 identifiers:v42 completionHandler:v41];
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  if (v46[5])
  {
    uint64_t v16 = [v33 count];
    if (v16 == [(id)v46[5] count])
    {
      id v36 = (id)objc_opt_new();
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v17 = (id)v46[5];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v51 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(v17);
            }
            os_signpost_id_t v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v22 = v21;
              id v23 = [(PPSocialHighlightStorage *)self _socialAttributionFromAttributeValues:v22 fetchAttributes:v12];
              id v24 = v23;
              if (v23)
              {
                id v25 = [v23 identifier];
                BOOL v26 = v25 == 0;

                if (!v26)
                {
                  uint64_t v27 = [v24 identifier];
                  [v36 setObject:v24 forKeyedSubscript:v27];
                }
              }
            }
            else
            {
              uint64_t v22 = pp_social_highlights_log_handle();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight attribution query result was not an array.", buf, 2u);
              }
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v51 count:16];
        }
        while (v18);
      }
      goto LABEL_22;
    }
  }
  uint64_t v28 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    uint64_t v31 = [v33 count];
    uint64_t v32 = [(id)v46[5] count];
    *(_DWORD *)buf = 134218240;
    uint64_t v55 = v31;
    __int16 v56 = 2048;
    uint64_t v57 = v32;
    _os_log_error_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: CoreSpotlight attribution query for identifiers: %tu returned invalid number of results: %tu", buf, 0x16u);
  }

  if (a4)
  {
    uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = *MEMORY[0x1E4F89FD8];
    id v53 = @"CoreSpotlight attribution query returned invalid results.";
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    *a4 = [v29 errorWithDomain:*MEMORY[0x1E4F89FD0] code:24 userInfo:v17];
    id v36 = (id)MEMORY[0x1E4F1CC08];
LABEL_22:

    goto LABEL_24;
  }
  id v36 = (id)MEMORY[0x1E4F1CC08];
LABEL_24:

  _Block_object_dispose(&v45, 8);
  return v36;
}

- (id)_socialLayerDefaults
{
  if (_socialLayerDefaults__pasOnceToken399 != -1) {
    dispatch_once(&_socialLayerDefaults__pasOnceToken399, &__block_literal_global_435);
  }
  id v2 = (void *)_socialLayerDefaults__pasExprOnceResult;
  return v2;
}

- (id)_screenTimeConversation
{
  if (_screenTimeConversation__pasOnceToken398 != -1) {
    dispatch_once(&_screenTimeConversation__pasOnceToken398, &__block_literal_global_432);
  }
  id v2 = (void *)_screenTimeConversation__pasExprOnceResult;
  return v2;
}

- (id)autoDonatingChatsWithShouldContinueBlock:(id)a3 error:(id *)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t (**)(void))a3;
  v45[0] = *MEMORY[0x1E4F8A0A8];
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  id v6 = +[PPSocialHighlightStorageUtilities filteredAllowedChatBundleIds:v5];

  if ([v6 count])
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = objc_opt_new();
    [v8 setReason:@"SHConversations"];
    [v8 setDisableBlockingOnIndex:1];
    uint64_t v44 = *MEMORY[0x1E4F22A10];
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
    [v8 setFetchAttributes:v9];

    [v8 setLowPriority:qos_class_self() < QOS_CLASS_USER_INITIATED];
    [v8 setReason:@"reason:PPSocialHighlightStore-1; code:1"];
    uint64_t v43 = *MEMORY[0x1E4F28358];
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    [v8 setProtectionClasses:v10];

    id v11 = [NSString alloc];
    id v12 = +[PPConfiguration sharedInstance];
    [v12 socialHighlightDecayInterval];
    uint64_t v14 = objc_msgSend(v11, "initWithFormat:", @"kMDItemLastUsedDate>=$time.now(-%.f)", v13);

    uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"%@ && %@", @"com_apple_mobilesms_isChatAutoDonating=1", v14];
    uint64_t v16 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Performing CoreSpotlight automatic donation query: %@", (uint8_t *)&buf, 0xCu);
    }

    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v15 context:v8];
    [v17 setBundleIDs:v6];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __75__PPSocialHighlightStorage_autoDonatingChatsWithShouldContinueBlock_error___block_invoke;
    v34[3] = &unk_1E65DAC60;
    id v18 = v7;
    id v35 = v18;
    [v17 setFoundItemsHandler:v34];
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v39 = 0x3032000000;
    long long v40 = __Block_byref_object_copy__22826;
    id v41 = __Block_byref_object_dispose__22827;
    id v42 = 0;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __75__PPSocialHighlightStorage_autoDonatingChatsWithShouldContinueBlock_error___block_invoke_336;
    v31[3] = &unk_1E65DAC88;
    p_long long buf = &buf;
    uint64_t v20 = v19;
    uint64_t v32 = v20;
    [v17 setCompletionHandler:v31];
    [v17 start];
    if (v4)
    {
      while ([MEMORY[0x1E4F93B18] waitForSemaphore:v20 timeoutSeconds:1.0] == 1)
      {
        if ((v4[2](v4) & 1) == 0)
        {
          os_signpost_id_t v21 = pp_social_highlights_log_handle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v36 = 0;
            _os_log_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMaintenance: deferring autodonating chats", v36, 2u);
          }

          [v17 cancel];
          goto LABEL_10;
        }
      }
    }
    else
    {
      [MEMORY[0x1E4F93B18] waitForSemaphore:v20];
    }
    id v24 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [v18 count];
      *(_DWORD *)id v36 = 134217984;
      uint64_t v37 = v25;
      _os_log_impl(&dword_1CA9A8000, v24, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight automatic donation query result count: %tu", v36, 0xCu);
    }

    if ([v18 count] || !*(void *)(*((void *)&buf + 1) + 40))
    {
      BOOL v26 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v36 = 138739971;
        uint64_t v37 = (uint64_t)v18;
        _os_log_debug_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: CoreSpotlight automatic donation query results: %{sensitive}@", v36, 0xCu);
      }

      id v22 = v18;
    }
    else
    {
      uint64_t v28 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)id v36 = 138412290;
        uint64_t v37 = v29;
        _os_log_error_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: CoreSpotlight automatic donation query error: %@", v36, 0xCu);
      }

      if (a4)
      {
        id v22 = 0;
        *a4 = *(id *)(*((void *)&buf + 1) + 40);
      }
      else
      {
LABEL_10:
        id v22 = 0;
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v23 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Short-circuiting autoDonatingChats query because Messages app is protected.", (uint8_t *)&buf, 2u);
    }

    id v22 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v22;
}

- (id)autoDonatingChatsWithError:(id *)a3
{
  return [(PPSocialHighlightStorage *)self autoDonatingChatsWithShouldContinueBlock:0 error:a3];
}

void __90__PPSocialHighlightStorage_sharedContentFromChats_dateRange_applicationIdentifiers_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)featurizeRankedHighlights:(id)a3
{
  id v4 = a3;
  char v5 = (void *)MEMORY[0x1E4F5B400];
  id v6 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
  uint64_t v7 = [v5 storeWithDirectory:v6 readOnly:1];

  uint64_t v8 = +[PPLocalTopicStore defaultStore];
  uint64_t v9 = +[PPLocalContactStore defaultStore];
  uint64_t v10 = objc_opt_new();
  [v10 timeIntervalSinceReferenceDate];
  id v11 = -[PPSocialHighlightStorage feedbackPublisherWithInterval:includingRemote:](self, "feedbackPublisherWithInterval:includingRemote:", 1);

  id v12 = +[PPSocialHighlightFeaturizer trialSpecifiedFeatures];
  if (!v12)
  {
    uint64_t v13 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_error_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: no ranking features found.", v20, 2u);
    }

    id v12 = objc_opt_new();
  }
  uint64_t v14 = [PPSocialHighlightFeaturizer alloc];
  uint64_t v15 = [v9 cachedSignificantContactHandles];
  if (v15)
  {
    uint64_t v16 = [(PPSocialHighlightFeaturizer *)v14 initWithFeedbackPublisher:v11 topicStore:v8 interactionStore:v7 significantContactHandles:v15 features:v12 highlights:v4];
  }
  else
  {
    id v17 = objc_opt_new();
    uint64_t v16 = [(PPSocialHighlightFeaturizer *)v14 initWithFeedbackPublisher:v11 topicStore:v8 interactionStore:v7 significantContactHandles:v17 features:v12 highlights:v4];
  }
  id v18 = [(PPSocialHighlightFeaturizer *)v16 featurizeHighlights:v4];

  return v18;
}

- (id)feedbackPublisherWithInterval:(double)a3 includingRemote:(BOOL)a4
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__22826;
  os_signpost_id_t v21 = __Block_byref_object_dispose__22827;
  id v22 = 0;
  uint64_t v7 = objc_opt_new();
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8 - a3;

  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__PPSocialHighlightStorage_feedbackPublisherWithInterval_includingRemote___block_invoke;
  v15[3] = &unk_1E65DAF68;
  BOOL v16 = a4;
  v15[4] = &v17;
  *(double *)&v15[5] = v9;
  [(_PASLock *)lock runWithLockAcquired:v15];
  uint64_t v11 = [(id)v18[5] filterWithIsIncluded:&__block_literal_global_516];
  id v12 = (void *)v18[5];
  v18[5] = v11;

  id v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __98__PPSocialHighlightStorage_rankedHighlightsWithLimit_client_variant_applicationIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unsigned)automaticSharingEnabledForClient:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned int v7 = [(PPSocialHighlightStorage *)self automaticSharingEnabled];
  if (v7 > 1)
  {
    uint64_t v10 = [(PPSocialHighlightStorage *)self _socialLayerDefaults];
    double v9 = [v10 dictionaryForKey:@"SharedWithYouApps"];

    if (!v9)
    {
      id v12 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: Failed to read SocialLayer app defaults", buf, 2u);
      }
      LOBYTE(v8) = 0;
      goto LABEL_21;
    }
    if (![v6 length])
    {
      LOBYTE(v8) = 2;
      goto LABEL_22;
    }
    id v19 = 0;
    uint64_t v11 = [MEMORY[0x1E4F223F8] bundleRecordWithApplicationIdentifier:v6 error:&v19];
    id v12 = v19;
    if (v11)
    {
      id v13 = [v11 bundleIdentifier];
      uint64_t v14 = [v9 objectForKeyedSubscript:v13];
      char v15 = [v14 BOOLValue];

      if (v15)
      {

        LOBYTE(v8) = 2;
LABEL_21:

        goto LABEL_22;
      }
      BOOL v16 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v11 bundleIdentifier];
        *(_DWORD *)long long buf = 138412290;
        os_signpost_id_t v21 = v17;
        _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Automatic Sharing is disabled for %@", buf, 0xCu);
      }
      LOBYTE(v8) = 1;
    }
    else
    {
      double v8 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        os_signpost_id_t v21 = v12;
        _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: LSBundleRecord query error: %@", buf, 0xCu);
      }

      LOBYTE(v8) = 0;
      if (a4) {
        *a4 = v12;
      }
    }

    goto LABEL_21;
  }
  LODWORD(v8) = v7;
  double v9 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v21) = v8;
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Automatic Sharing is disabled globally due to toggle state: %hhu", buf, 8u);
  }
LABEL_22:

  return v8;
}

- (unsigned)automaticSharingEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"SharedWithYouEnabled", @"com.apple.SocialLayer", &keyExistsAndHasValidFormat))
  {
    unsigned __int8 v2 = 2;
  }
  else
  {
    unsigned __int8 v2 = 1;
  }
  if (keyExistsAndHasValidFormat) {
    return v2;
  }
  else {
    return 0;
  }
}

void __47__PPSocialHighlightStorage_freezeAppLinksCache__block_invoke(uint64_t a1, void *a2)
{
  int v3 = a2;
  uint64_t v4 = v3[3];
  char v5 = pp_social_highlights_log_handle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: freezing app link cache", buf, 2u);
    }

    if (v3[2] != v3[3])
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"PPSocialHighlightStorage.m", 840, @"Invalid parameter not satisfying: %@", @"guardedData->_urlToAppID == guardedData->_mutableURLToAppID" object file lineNumber description];
    }
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F93B50], "lazyPlistDictionaryWithPlistDictionary:");
    double v8 = (void *)v3[2];
    v3[2] = v7;

    char v5 = v3[3];
    v3[3] = 0;
  }
  else if (v6)
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: existing frozen cache is still OK", v10, 2u);
  }
}

void __75__PPSocialHighlightStorage_autoDonatingChatsWithShouldContinueBlock_error___block_invoke_336(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lsAppLinkCache, 0);
  objc_storeStrong((id *)&self->_socialHighlightStorageUtils, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)invalidateCacheForClient:(id)a3
{
}

- (id)_mostRecentRankedHighlightsMatchingTest:(id)a3 client:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  cache = self->_cache;
  id v6 = a3;
  id v7 = a4;
  if (cache)
  {
    double v8 = objc_opt_new();
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__692;
    v21[4] = __Block_byref_object_dispose__693;
    id v22 = 0;
    double v9 = (void *)MEMORY[0x1CB79D060]();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__692;
    id v33 = __Block_byref_object_dispose__693;
    id v34 = 0;
    lock = cache->_lock;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __72__PPSocialHighlightCache_mostRecentRankedHighlightsMatchingTest_client___block_invoke;
    v20[3] = &unk_1E65D9E10;
    v20[4] = &buf;
    [(_PASLock *)lock runWithLockAcquired:v20];
    uint64_t v11 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)&long long v23 = MEMORY[0x1E4F143A8];
    *((void *)&v23 + 1) = 3221225472;
    id v24 = __72__PPSocialHighlightCache_mostRecentRankedHighlightsMatchingTest_client___block_invoke_34;
    uint64_t v25 = &unk_1E65D4590;
    id v26 = v7;
    id v28 = v6;
    uint64_t v29 = v21;
    id v12 = v8;
    id v27 = v12;
    id v13 = (id)[v11 sinkWithCompletion:&__block_literal_global_33 shouldContinue:&v23];

    _Block_object_dispose(&buf, 8);
    uint64_t v14 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v12 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: found %tu matching highlights.", (uint8_t *)&buf, 0xCu);
    }

    id v16 = v12;
    _Block_object_dispose(v21, 8);
  }
  else
  {
    id v16 = 0;
  }

  uint64_t v17 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v16 count];
    LODWORD(v23) = 134217984;
    *(void *)((char *)&v23 + 4) = v18;
    _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: found %tu matching highlights.", (uint8_t *)&v23, 0xCu);
  }

  return v16;
}

- (void)saveOrderedBatch:(id)a3
{
}

- (unint64_t)countDistinctRankedItemsMatchingBatchIdentifier:(id)a3
{
  cache = self->_cache;
  id v4 = a3;
  char v5 = v4;
  if (cache)
  {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (v4)
    {
      uint64_t v12 = 0;
      id v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      lock = cache->_lock;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __74__PPSocialHighlightCache_countDistinctRankedItemsMatchingBatchIdentifier___block_invoke;
      v9[3] = &unk_1E65D9E58;
      id v10 = v4;
      uint64_t v11 = &v12;
      [(_PASLock *)lock runWithLockAcquired:v9];
      unint64_t v6 = v13[3];

      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)cachedRankedHighlightsForClient:(id)a3 variant:(id)a4 queriedHighlights:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__22826;
  uint64_t v29 = __Block_byref_object_dispose__22827;
  id v30 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  cache = self->_cache;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  os_signpost_id_t v21 = __86__PPSocialHighlightStorage_cachedRankedHighlightsForClient_variant_queriedHighlights___block_invoke;
  id v22 = &unk_1E65DAE90;
  id v24 = &v25;
  id v13 = v11;
  long long v23 = v13;
  -[PPSocialHighlightCache cachedRankedHighlightsForClient:variant:completion:]((uint64_t)cache, v8, &v19);
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  if (v10
    && (-[PPSocialHighlightCache cachedHighlightsArrayIsValid:queryResults:]((uint64_t)self->_cache, (void *)v26[5], v10) & 1) == 0)
  {
    -[PPSocialHighlightStorage invalidateCacheForClient:](self, "invalidateCacheForClient:", v8, v19, v20, v21, v22);
    uint64_t v17 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v32 = (uint64_t)v8;
      _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: cache for client '%@' is invalid, re-ranking.", buf, 0xCu);
    }

    id v16 = 0;
  }
  else
  {
    uint64_t v14 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_msgSend((id)v26[5], "count", v19, v20, v21, v22);
      *(_DWORD *)long long buf = 134218242;
      uint64_t v32 = v15;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: returning cached %tu items for client '%@'", buf, 0x16u);
    }

    id v16 = (void *)[(id)v26[5] copy];
  }

  _Block_object_dispose(&v25, 8);
  return v16;
}

void __86__PPSocialHighlightStorage_cachedRankedHighlightsForClient_variant_queriedHighlights___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)clearFeedbackStream
{
  int v3 = (void *)MEMORY[0x1CB79D060](self, a2);
  [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_573];
}

uint64_t __47__PPSocialHighlightStorage_clearFeedbackStream__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) deleteLocalAndRemoteEventsWithReason:1 usingPredicateBlock:&__block_literal_global_575];
}

uint64_t __47__PPSocialHighlightStorage_clearFeedbackStream__block_invoke_2()
{
  return 1;
}

- (void)clearRankedStream
{
  int v3 = (void *)MEMORY[0x1CB79D060](self, a2);
  cache = self->_cache;
  char v5 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  -[PPSocialHighlightCache deleteMatchingPredicate:]((uint64_t)cache, v5);
}

- (void)clearStreams
{
  [(PPSocialHighlightStorage *)self clearRankedStream];
  [(PPSocialHighlightStorage *)self clearFeedbackStream];
}

- (id)rankedItems
{
  cache = self->_cache;
  if (cache)
  {
    int v3 = objc_opt_new();
    id v4 = (void *)MEMORY[0x1CB79D060]();
    lock = cache->_lock;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __34__PPSocialHighlightCache_allItems__block_invoke;
    v8[3] = &unk_1E65D9CB0;
    id v6 = v3;
    id v9 = v6;
    [(_PASLock *)lock runWithLockAcquired:v8];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)saveAttributionFeedbackForAttributionIdentifier:(id)a3 feedbackType:(unint64_t)a4 client:(id)a5 variant:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  if ([(PPSocialHighlightStorage *)self rerankingEnabled]) {
    [(PPSocialHighlightStorage *)self _writeEnrichedFeedbackForAttributionIdentifier:v9 client:v10 feedbackType:+[PPSocialHighlightStorage attributionFeedbackTypeForAttributionFeedbackType:a4]];
  }

  return 1;
}

- (BOOL)saveFeedbackForHighlightIdentifier:(id)a3 feedbackType:(unint64_t)a4 client:(id)a5 variant:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if ([(PPSocialHighlightStorage *)self rerankingEnabled])
  {
    uint64_t v11 = +[PPSocialHighlightStorage unifiedFeedbackTypeForHighlightFeedbackType:a4];
    [(PPSocialHighlightStorage *)self _writeEnrichedFeedbackForHighlightIdentifier:v9 client:v10 feedbackType:v11];
    if (a4 == 2)
    {
      uint64_t v12 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: forcing a sync as a hide occurred.", buf, 2u);
      }

      [(PPSocialHighlightStorage *)self syncFeedback];
      id v13 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (v11 >= 0xC)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
          uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v14 = off_1E65DB238[v11];
        }
        *(_DWORD *)long long buf = 138412546;
        uint64_t v17 = v14;
        __int16 v18 = 2112;
        id v19 = v10;
        _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: invalidating cache due to feedback of type %@ from client '%@'", buf, 0x16u);
      }
      -[PPSocialHighlightCache invalidateCacheForClient:]((uint64_t)self->_cache, v10);
    }
  }

  return 1;
}

- (void)_writeEnrichedFeedbackForHighlightIdentifier:(id)a3 client:(id)a4 feedbackType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    if (v5 >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
      long long v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v38 = off_1E65DB238[v5];
    }
    *(_DWORD *)long long buf = 138740483;
    id v54 = v8;
    __int16 v55 = 2112;
    id v56 = v9;
    __int16 v57 = 2112;
    int v58 = v38;
    _os_log_debug_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: saving feedback for item %{sensitive}@, from client '%@' of type %@.", buf, 0x20u);
  }
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __93__PPSocialHighlightStorage__writeEnrichedFeedbackForHighlightIdentifier_client_feedbackType___block_invoke;
  v50[3] = &unk_1E65DB1B0;
  id v11 = v8;
  id v51 = v11;
  uint64_t v12 = [(PPSocialHighlightStorage *)self _mostRecentRankedHighlightsMatchingTest:v50 client:v9];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v13 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v14 = [v12 reverseObjectEnumerator];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v47;
LABEL_4:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v47 != v17) {
        objc_enumerationMutation(v14);
      }
      id v19 = *(void **)(*((void *)&v46 + 1) + 8 * v18);
      if ([v19 hasIsPrimary])
      {
        if ([v19 isPrimary]) {
          break;
        }
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v46 objects:v52 count:16];
        if (v16) {
          goto LABEL_4;
        }
        goto LABEL_11;
      }
    }
    id v20 = v19;

    if (v20) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_11:
  }
  os_signpost_id_t v21 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v54 = v9;
    _os_log_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: received feedback from %@, but was unable to match a primary highlight.", buf, 0xCu);
  }

  id v20 = 0;
LABEL_16:
  id v22 = [v20 batchIdentifier];
  unint64_t v23 = [(PPSocialHighlightStorage *)self countDistinctRankedItemsMatchingBatchIdentifier:v22];

  id v24 = objc_opt_new();
  [v24 setClientIdentifier:v9];
  [v24 setFeedbackType:v5];
  uint64_t v25 = objc_opt_new();
  [v25 timeIntervalSinceReferenceDate];
  objc_msgSend(v24, "setFeedbackCreationSecondsSinceReferenceDate:");

  lock = self->_lock;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __93__PPSocialHighlightStorage__writeEnrichedFeedbackForHighlightIdentifier_client_feedbackType___block_invoke_569;
  v41[3] = &unk_1E65DB1D8;
  id v27 = v12;
  id v42 = v27;
  id v28 = v24;
  id v43 = v28;
  uint64_t v44 = self;
  id v29 = v9;
  id v45 = v29;
  [(_PASLock *)lock runWithLockAcquired:v41];
  +[PPSocialHighlightMetrics logMatchedFeedbackForHighlightMatches:v27 batchSize:v23 type:v5 client:v29];
  if (![v27 count])
  {
    id v30 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v31 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138740227;
      id v54 = v11;
      __int16 v55 = 2112;
      id v56 = v29;
      _os_log_debug_impl(&dword_1CA9A8000, v31, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: unable to match feedback for identifier: %{sensitive}@ from client '%@'", buf, 0x16u);
    }

    uint64_t v32 = objc_opt_new();
    [v32 setHighlightIdentifier:v11];
    __int16 v33 = objc_opt_new();
    [v33 setClientIdentifier:v29];
    [v33 setFeedbackType:v5];
    id v34 = objc_opt_new();
    [v34 timeIntervalSinceReferenceDate];
    objc_msgSend(v33, "setFeedbackCreationSecondsSinceReferenceDate:");

    [v33 setHighlight:v32];
    uint64_t v35 = +[PPSocialHighlightFeedbackUtils biomeEventFromFeedback:v33];
    id v36 = self->_lock;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __93__PPSocialHighlightStorage__writeEnrichedFeedbackForHighlightIdentifier_client_feedbackType___block_invoke_571;
    v39[3] = &unk_1E65DAF20;
    id v40 = v35;
    id v37 = v35;
    [(_PASLock *)v36 runWithLockAcquired:v39];
  }
}

uint64_t __93__PPSocialHighlightStorage__writeEnrichedFeedbackForHighlightIdentifier_client_feedbackType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasHighlightIdentifier])
  {
    id v4 = [v3 highlightIdentifier];
    uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __93__PPSocialHighlightStorage__writeEnrichedFeedbackForHighlightIdentifier_client_feedbackType___block_invoke_569(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x1CB79D060](v5);
        id v11 = objc_msgSend(*(id *)(a1 + 40), "copy", (void)v13);
        [v11 setHighlight:v9];
        [*(id *)(a1 + 48) _performFeedbackSessionLoggingForEnrichedFeedback:v11 client:*(void *)(a1 + 56)];
        uint64_t v12 = +[PPSocialHighlightFeedbackUtils biomeEventFromFeedback:v11];
        -[PPSocialHighlightStorageGuardedData sendEvent:]((uint64_t)v3, v12);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }
}

void __93__PPSocialHighlightStorage__writeEnrichedFeedbackForHighlightIdentifier_client_feedbackType___block_invoke_571(uint64_t a1, uint64_t a2)
{
}

- (void)_writeEnrichedFeedbackForAttributionIdentifier:(id)a3 client:(id)a4 feedbackType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    if (v5 >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
      id v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v45 = off_1E65DB238[v5];
    }
    *(_DWORD *)long long buf = 138740483;
    id v67 = v8;
    __int16 v68 = 2112;
    id v69 = v9;
    __int16 v70 = 2112;
    id v71 = v45;
    _os_log_debug_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: saving attribution feedback for item %{sensitive}@, from client '%@' of type %@.", buf, 0x20u);
  }
  uint64_t v51 = v5;

  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __95__PPSocialHighlightStorage__writeEnrichedFeedbackForAttributionIdentifier_client_feedbackType___block_invoke;
  v63[3] = &unk_1E65DB1B0;
  id v11 = v8;
  id v64 = v11;
  uint64_t v12 = [(PPSocialHighlightStorage *)self _mostRecentRankedHighlightsMatchingTest:v63 client:v9];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v13 = (void *)MEMORY[0x1CB79D060]();
  long long v14 = [v12 reverseObjectEnumerator];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v60;
LABEL_4:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v60 != v17) {
        objc_enumerationMutation(v14);
      }
      id v19 = *(void **)(*((void *)&v59 + 1) + 8 * v18);
      if ([v19 hasIsPrimary])
      {
        if ([v19 isPrimary]) {
          break;
        }
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v59 objects:v65 count:16];
        if (v16) {
          goto LABEL_4;
        }
        goto LABEL_11;
      }
    }
    id v21 = v19;

    uint64_t v20 = v51;
    if (v21) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_11:

    uint64_t v20 = v51;
  }
  id v22 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v67 = v9;
    _os_log_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: received feedback from %@, but was unable to match a primary highlight.", buf, 0xCu);
  }

  id v21 = 0;
LABEL_16:
  unint64_t v23 = objc_opt_new();
  [v23 setClientIdentifier:v9];
  id v24 = objc_opt_new();
  [v24 timeIntervalSinceReferenceDate];
  objc_msgSend(v23, "setFeedbackCreationSecondsSinceReferenceDate:");

  [v23 setFeedbackType:v20];
  lock = self->_lock;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __95__PPSocialHighlightStorage__writeEnrichedFeedbackForAttributionIdentifier_client_feedbackType___block_invoke_567;
  v54[3] = &unk_1E65DB1D8;
  id v26 = v12;
  id v55 = v26;
  id v27 = v23;
  id v56 = v27;
  __int16 v57 = self;
  id v28 = v9;
  id v58 = v28;
  [(_PASLock *)lock runWithLockAcquired:v54];
  if (![v26 count])
  {
    id v49 = v21;
    context = (void *)MEMORY[0x1CB79D060]();
    id v29 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138740227;
      id v67 = v11;
      __int16 v68 = 2112;
      id v69 = v28;
      _os_log_debug_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: unable to match feedback for attribution identifier: %{sensitive}@ from client '%@'", buf, 0x16u);
    }

    id v30 = [(PPSocialHighlightStorage *)self attributionForIdentifier:v11 error:0];
    id v50 = v11;
    uint64_t v31 = objc_opt_new();
    [v31 setAttributionIdentifier:v50];
    long long v47 = v30;
    uint64_t v32 = [v30 groupDisplayName];
    [v31 setDisplayName:v32];

    __int16 v33 = (void *)MEMORY[0x1E4F89FC8];
    id v34 = [v30 groupPhotoPath];
    uint64_t v35 = [v34 absoluteString];
    [v35 dataUsingEncoding:4];
    id v36 = v46 = self;
    id v37 = [v33 Sha256ForData:v36 withSalt:0];
    long long v38 = [v37 base64EncodedStringWithOptions:0];
    uint64_t v39 = [v38 substringToIndex:8];
    [v31 setGroupPhotoPathDigest:v39];

    id v40 = objc_opt_new();
    [v40 setClientIdentifier:v28];
    [v40 setFeedbackType:v51];
    id v41 = objc_opt_new();
    [v41 timeIntervalSinceReferenceDate];
    objc_msgSend(v40, "setFeedbackCreationSecondsSinceReferenceDate:");

    [v40 setHighlight:v31];
    id v42 = +[PPSocialHighlightFeedbackUtils biomeEventFromFeedback:v40];
    id v43 = v46->_lock;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __95__PPSocialHighlightStorage__writeEnrichedFeedbackForAttributionIdentifier_client_feedbackType___block_invoke_568;
    v52[3] = &unk_1E65DAF20;
    id v53 = v42;
    id v44 = v42;
    [(_PASLock *)v43 runWithLockAcquired:v52];

    id v11 = v50;
    id v21 = v49;
  }
}

uint64_t __95__PPSocialHighlightStorage__writeEnrichedFeedbackForAttributionIdentifier_client_feedbackType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasAttributionIdentifier])
  {
    id v4 = [v3 attributionIdentifier];
    uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __95__PPSocialHighlightStorage__writeEnrichedFeedbackForAttributionIdentifier_client_feedbackType___block_invoke_567(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x1CB79D060](v5);
        id v11 = objc_msgSend(*(id *)(a1 + 40), "copy", (void)v13);
        [v11 setHighlight:v9];
        [*(id *)(a1 + 48) _performFeedbackSessionLoggingForEnrichedFeedback:v11 client:*(void *)(a1 + 56)];
        uint64_t v12 = +[PPSocialHighlightFeedbackUtils biomeEventFromFeedback:v11];
        -[PPSocialHighlightStorageGuardedData sendEvent:]((uint64_t)v3, v12);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }
}

void __95__PPSocialHighlightStorage__writeEnrichedFeedbackForAttributionIdentifier_client_feedbackType___block_invoke_568(uint64_t a1, uint64_t a2)
{
}

- (void)_performFeedbackSessionLoggingForEnrichedFeedback:(id)a3 client:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PPSocialHighlightStorage *)self _sessionLoggingRate];
  if (objc_msgSend(MEMORY[0x1E4F89FC8], "yesWithProbability:"))
  {
    context = (void *)MEMORY[0x1CB79D060]();
    id v45 = v6;
    uint64_t v8 = [v6 highlight];
    uint64_t v9 = [v8 features];
    id v10 = (void *)[v9 mutableCopy];
    id v11 = v10;
    id v44 = v7;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = (id)objc_opt_new();
    }
    long long v14 = v12;

    long long v15 = objc_opt_new();
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v48 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          id v22 = (void *)MEMORY[0x1CB79D060]();
          unint64_t v23 = [v21 stringByReplacingOccurrencesOfString:@":" withString:@"_"];
          id v24 = [v23 stringByReplacingOccurrencesOfString:@"." withString:@"_"];

          uint64_t v25 = [v16 objectForKeyedSubscript:v21];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v26 = objc_msgSend(v25, "_pas_stringBackedByUTF8CString");

            uint64_t v25 = (void *)v26;
          }
          id v27 = objc_msgSend(v24, "_pas_stringBackedByUTF8CString");
          [v15 setObject:v25 forKeyedSubscript:v27];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v18);
    }

    id v7 = v44;
    id v28 = objc_msgSend(v44, "_pas_stringBackedByUTF8CString");
    [v15 setObject:v28 forKeyedSubscript:@"clientId"];

    id v6 = v45;
    uint64_t v29 = [v45 feedbackType];
    if (v29 >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v29);
      id v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v30 = off_1E65DB238[v29];
    }
    uint64_t v31 = [(__CFString *)v30 _pas_stringBackedByUTF8CString];
    [v15 setObject:v31 forKeyedSubscript:@"feedbackType"];

    uint64_t v32 = NSNumber;
    __int16 v33 = [v45 highlight];
    id v34 = objc_msgSend(v32, "numberWithBool:", objc_msgSend(v33, "isPrimary"));
    [v15 setObject:v34 forKeyedSubscript:@"isPrimary"];

    uint64_t v35 = NSNumber;
    id v36 = [v45 highlight];
    id v37 = objc_msgSend(v35, "numberWithBool:", objc_msgSend(v36, "isProxy"));
    [v15 setObject:v37 forKeyedSubscript:@"isProxy"];

    long long v38 = objc_opt_new();
    uint64_t v39 = [v38 UUIDString];

    id v40 = objc_msgSend(v39, "substringToIndex:", (unint64_t)objc_msgSend(v39, "length") >> 2);
    id v41 = objc_msgSend(v40, "_pas_stringBackedByUTF8CString");
    [v15 setObject:v41 forKeyedSubscript:@"uuid"];

    id v42 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v42, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: performing feedback session logging.", buf, 2u);
    }

    +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.SocialHighlightSessionMatched" payload:v15 inBackground:0];
  }
  else
  {
    long long v13 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: skipping feedback session logging as not selected for sampling.", buf, 2u);
    }
  }
}

- (double)_sessionLoggingRate
{
  char v2 = [MEMORY[0x1E4F93B08] isInternalBuild];
  double result = 1.0;
  if ((v2 & 1) == 0)
  {
    int v4 = objc_msgSend(MEMORY[0x1E4F93B08], "isBetaBuild", 1.0);
    double result = 0.01;
    if (!v4) {
      return 0.0;
    }
  }
  return result;
}

- (void)deleteAllRecordsFromBundleId:(id)a3 matchingAttributionIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v7];
  uint64_t v9 = (void *)MEMORY[0x1CB79D060]();
  id v10 = (void *)MEMORY[0x1E4F28F60];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __88__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingAttributionIdentifiers___block_invoke;
  v24[3] = &unk_1E65DB188;
  id v11 = v6;
  id v25 = v11;
  id v12 = v8;
  id v26 = v12;
  long long v13 = [v10 predicateWithBlock:v24];
  [(PPSocialHighlightStorage *)self deleteFeedbackMatchingPredicate:v13];

  long long v14 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __88__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingAttributionIdentifiers___block_invoke_2;
  id v21 = &unk_1E65DB188;
  id v15 = v11;
  id v22 = v15;
  id v16 = v12;
  id v23 = v16;
  uint64_t v17 = [v14 predicateWithBlock:&v18];
  -[PPSocialHighlightStorage deleteVendedMatchingPredicate:](self, "deleteVendedMatchingPredicate:", v17, v18, v19, v20, v21);
}

uint64_t __88__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingAttributionIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v8 = [v5 eventBody];
  uint64_t v9 = [v8 highlight];

  id v10 = [v9 sourceBundleId];
  if (v10)
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = [v9 sourceBundleId];
    if ([v11 isEqualToString:v12])
    {
      long long v13 = [v9 attributionIdentifier];
      if (v13)
      {
        long long v14 = *(void **)(a1 + 40);
        id v15 = [v9 attributionIdentifier];
        uint64_t v16 = [v14 containsObject:v15];
      }
      else
      {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

uint64_t __88__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingAttributionIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v8 = [v5 eventBody];
  uint64_t v9 = [v8 sourceBundleId];
  if (v9)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [v8 sourceBundleId];
    if ([v10 isEqualToString:v11])
    {
      id v12 = [v8 attributionIdentifier];
      if (v12)
      {
        long long v13 = *(void **)(a1 + 40);
        long long v14 = [v8 attributionIdentifier];
        uint64_t v15 = [v13 containsObject:v14];
      }
      else
      {
        uint64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)deleteAllRecordsFromBundleId:(id)a3 matchingDomainSelection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v9 = (void *)MEMORY[0x1E4F28F60];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingDomainSelection___block_invoke;
  v23[3] = &unk_1E65DB188;
  id v10 = v6;
  id v24 = v10;
  id v11 = v7;
  id v25 = v11;
  id v12 = [v9 predicateWithBlock:v23];
  [(PPSocialHighlightStorage *)self deleteFeedbackMatchingPredicate:v12];

  long long v13 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __81__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingDomainSelection___block_invoke_2;
  uint64_t v20 = &unk_1E65DB188;
  id v14 = v10;
  id v21 = v14;
  id v15 = v11;
  id v22 = v15;
  uint64_t v16 = [v13 predicateWithBlock:&v17];
  -[PPSocialHighlightStorage deleteVendedMatchingPredicate:](self, "deleteVendedMatchingPredicate:", v16, v17, v18, v19, v20);
}

uint64_t __81__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingDomainSelection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v8 = [v5 eventBody];
  uint64_t v9 = [v8 highlight];

  id v10 = [v9 sourceBundleId];
  if (v10)
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = [v9 sourceBundleId];
    if ([v11 isEqualToString:v12])
    {
      long long v13 = [v9 domainIdentifier];
      if (v13)
      {
        id v14 = *(void **)(a1 + 40);
        id v15 = [v9 domainIdentifier];
        uint64_t v16 = [v14 containsDomain:v15];
      }
      else
      {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

uint64_t __81__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingDomainSelection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v8 = [v5 eventBody];
  uint64_t v9 = [v8 sourceBundleId];
  if (v9)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [v8 sourceBundleId];
    if ([v10 isEqualToString:v11])
    {
      id v12 = [v8 domainIdentifier];
      if (v12)
      {
        long long v13 = *(void **)(a1 + 40);
        id v14 = [v8 domainIdentifier];
        uint64_t v15 = [v13 containsDomain:v14];
      }
      else
      {
        uint64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)deleteAllRecordsFromBundleId:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1CB79D060]();
  id v6 = (void *)MEMORY[0x1E4F28F60];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__PPSocialHighlightStorage_deleteAllRecordsFromBundleId___block_invoke;
  v16[3] = &unk_1E65DB160;
  id v7 = v4;
  id v17 = v7;
  uint64_t v8 = [v6 predicateWithBlock:v16];
  [(PPSocialHighlightStorage *)self deleteFeedbackMatchingPredicate:v8];

  uint64_t v9 = (void *)MEMORY[0x1CB79D060]();
  cache = self->_cache;
  id v11 = (void *)MEMORY[0x1E4F28F60];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__PPSocialHighlightStorage_deleteAllRecordsFromBundleId___block_invoke_2;
  v14[3] = &unk_1E65DB160;
  id v12 = v7;
  id v15 = v12;
  long long v13 = [v11 predicateWithBlock:v14];
  -[PPSocialHighlightCache deleteMatchingPredicate:]((uint64_t)cache, v13);
}

uint64_t __57__PPSocialHighlightStorage_deleteAllRecordsFromBundleId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v8 = [v5 eventBody];
  uint64_t v9 = [v8 highlight];

  id v10 = [v9 sourceBundleId];
  if (v10)
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = [v9 sourceBundleId];
    uint64_t v13 = [v11 isEqualToString:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __57__PPSocialHighlightStorage_deleteAllRecordsFromBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  if ([v4 hasSourceBundleId])
  {
    id v5 = [v3 eventBody];
    id v6 = [v5 sourceBundleId];
    uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke;
  v12[3] = &unk_1E65DB0C0;
  id v14 = &v15;
  id v6 = v4;
  id v13 = v6;
  [(_PASLock *)lock runWithLockAcquired:v12];
  if (*((unsigned char *)v16 + 24))
  {
    uint64_t v7 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Skipped deletion due to bloom filter miss", buf, 2u);
    }
  }
  else
  {
    void v9[4] = self;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke_535;
    v10[3] = &unk_1E65DB0E8;
    v10[4] = self;
    void v8[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke_2;
    v9[3] = &unk_1E65DB110;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke_3;
    v8[3] = &unk_1E65DB138;
    [v6 accessCriteriaUsingBundleIdentifierBlock:v10 domainSelectionBlock:v9 uniqueIdentifiersBlock:v8];
  }

  _Block_object_dispose(&v15, 8);
}

void __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = v4;
  if (a2)
  {
    if (*(void *)(a2 + 16)) {
      LOBYTE(a2) = objc_msgSend(v4, "matchesBloomFilter:") ^ 1;
    }
    else {
      LOBYTE(a2) = 0;
    }
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

uint64_t __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke_535(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteAllRecordsFromBundleId:a2];
}

uint64_t __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) deleteAllRecordsFromBundleId:a2 matchingDomainSelection:a3];
}

void __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 allObjects];
  [v4 deleteAllRecordsFromBundleId:v5 matchingAttributionIdentifiers:v6];
}

- (void)deleteVendedMatchingPredicate:(id)a3
{
}

- (void)deleteFeedbackMatchingPredicate:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  lock = self->_lock;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __60__PPSocialHighlightStorage_deleteFeedbackMatchingPredicate___block_invoke;
  char v18 = &unk_1E65DB098;
  id v8 = v6;
  id v19 = v8;
  id v9 = v5;
  id v20 = v9;
  id v10 = v4;
  id v21 = v10;
  id v22 = &v23;
  [(_PASLock *)lock runWithLockAcquired:&v15];
  id v11 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = objc_msgSend(v9, "count", v15, v16, v17, v18, v19, v20);
    uint64_t v13 = v24[3];
    *(_DWORD *)long long buf = 134218240;
    uint64_t v28 = v12;
    __int16 v29 = 2048;
    uint64_t v30 = v13;
    _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: distilled %lu hidden feedback, and deleted %lu others.", buf, 0x16u);
  }

  if (v24[3])
  {
    [(PPSocialHighlightStorage *)self syncFeedback];
    id v14 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: forcing sync of deletions.", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

void __60__PPSocialHighlightStorage_deleteFeedbackMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v4 = v3[1];
    LODWORD(v5) = 869711765;
    uint64_t v6 = [MEMORY[0x1E4F93AB8] bloomFilterInMemoryWithNumberOfValuesN:4000 errorRateP:v5];
    id v7 = v3[2];
    v3[2] = (id)v6;

    v3[3] = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __60__PPSocialHighlightStorage_deleteFeedbackMatchingPredicate___block_invoke_532;
    v32[3] = &unk_1E65DB070;
    id v33 = *(id *)(a1 + 32);
    id v34 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    id v35 = v8;
    uint64_t v37 = v9;
    id v10 = v3;
    id v36 = v10;
    [v4 deleteLocalAndRemoteEventsWithReason:2 usingPredicateBlock:v32];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v39 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v25 = v4;
      uint64_t v26 = v3;
      uint64_t v14 = *(void *)v29;
      id obj = v11;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v17 = (void *)MEMORY[0x1CB79D060]();
          char v18 = objc_opt_new();
          id v19 = objc_opt_new();
          [v18 setHighlight:v19];

          id v20 = [v16 highlight];
          id v21 = [v20 highlightIdentifier];
          id v22 = [v18 highlight];
          [v22 setHighlightIdentifier:v21];

          [v16 feedbackCreationSecondsSinceReferenceDate];
          objc_msgSend(v18, "setFeedbackCreationSecondsSinceReferenceDate:");
          [v18 setFeedbackType:2];
          uint64_t v23 = +[PPSocialHighlightFeedbackUtils biomeEventFromFeedback:v18];
          -[PPSocialHighlightStorageGuardedData sendEvent:]((uint64_t)v10, v23);
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
      }
      while (v13);

      id v4 = v25;
      id v3 = v26;
      if (!v10) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    if ((unint64_t)v3[3] <= 0x7F)
    {
      id v24 = v3[2];
      v3[2] = 0;

      v3[3] = 0;
    }
LABEL_16:

    goto LABEL_17;
  }
  id v4 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: failing deletion due to Biome version mismatch.", buf, 2u);
  }
LABEL_17:
}

uint64_t __60__PPSocialHighlightStorage_deleteFeedbackMatchingPredicate___block_invoke_532(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1CB79D060]();
  double v5 = [v3 eventBody];
  uint64_t v6 = +[PPSocialHighlightFeedbackUtils feedbackFromBiomeEvent:v5];
  if ([v6 feedbackType] == 2)
  {
    id v7 = [v6 highlight];
    id v8 = [v7 highlightIdentifier];

    if (!v8) {
      goto LABEL_10;
    }
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = [v6 highlight];
    id v11 = [v10 highlightIdentifier];
    LOBYTE(v9) = [v9 containsObject:v11];

    if ((v9 & 1) == 0)
    {
      [*(id *)(a1 + 40) addObject:v6];
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = [v6 highlight];
      uint64_t v14 = [v13 highlightIdentifier];
      [v12 addObject:v14];
    }
  }
  int v15 = [*(id *)(a1 + 48) evaluateWithObject:v3];
  if (v6) {
    BOOL v16 = v15 == 0;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16)
  {
    -[PPSocialHighlightStorageGuardedData addToBloomFilter:](*(void *)(a1 + 56), v5);
    uint64_t v17 = 0;
    goto LABEL_12;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
LABEL_10:
  uint64_t v17 = 1;
LABEL_12:

  return v17;
}

- (void)cleanUpFeedbackWithShouldContinueBlock:(id)a3 ttl:(double)a4 onDeleteBlock:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-a4];
  id v11 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  uint64_t v12 = +[PPConfiguration sharedInstance];
  [v12 socialHighlightDecayInterval];
  uint64_t v14 = (void *)[v11 initWithTimeIntervalSinceNow:-v13];

  int v15 = objc_opt_new();
  BOOL v16 = objc_opt_new();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  lock = self->_lock;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __85__PPSocialHighlightStorage_cleanUpFeedbackWithShouldContinueBlock_ttl_onDeleteBlock___block_invoke;
  v30[3] = &unk_1E65DB048;
  id v18 = v8;
  id v35 = v18;
  id v19 = v14;
  id v31 = v19;
  id v20 = v15;
  id v32 = v20;
  id v21 = v16;
  id v33 = v21;
  id v22 = v10;
  id v34 = v22;
  uint64_t v37 = v38;
  id v23 = v9;
  id v36 = v23;
  if (v18) {
    id v24 = v18;
  }
  else {
    id v24 = &__block_literal_global_531;
  }
  if ([(_PASLock *)lock runWithLockAcquired:v30 shouldContinueBlock:v24] == 1)
  {
    uint64_t v25 = pp_default_log_handle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: deferring before lock acquired for cleanup.", buf, 2u);
    }
  }
  uint64_t v26 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = [v21 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v40 = v27;
    _os_log_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: repersisted %tu hidden feedback items.", buf, 0xCu);
  }

  long long v28 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = [v21 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v40 = v29;
    _os_log_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: deleted a total of %tu feedback items.", buf, 0xCu);
  }

  _Block_object_dispose(v38, 8);
}

void __85__PPSocialHighlightStorage_cleanUpFeedbackWithShouldContinueBlock_ttl_onDeleteBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v4 = v3[1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __85__PPSocialHighlightStorage_cleanUpFeedbackWithShouldContinueBlock_ttl_onDeleteBlock___block_invoke_526;
    v18[3] = &unk_1E65DB020;
    id v23 = *(id *)(a1 + 64);
    id v19 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 40);
    id v21 = *(id *)(a1 + 48);
    id v22 = *(id *)(a1 + 56);
    long long v13 = *(_OWORD *)(a1 + 72);
    id v5 = (id)v13;
    long long v24 = v13;
    [v4 deleteLocalAndRemoteEventsWithReason:1 usingPredicateBlock:v18];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
          uint64_t v12 = (void *)MEMORY[0x1CB79D060]();
          -[PPSocialHighlightStorageGuardedData sendEvent:]((uint64_t)v3, v11);
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v26 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v4 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: failing deletion due to Biome version mismatch.", buf, 2u);
    }
  }
}

uint64_t __85__PPSocialHighlightStorage_cleanUpFeedbackWithShouldContinueBlock_ttl_onDeleteBlock___block_invoke_528()
{
  return 1;
}

uint64_t __85__PPSocialHighlightStorage_cleanUpFeedbackWithShouldContinueBlock_ttl_onDeleteBlock___block_invoke_526(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = a1[8];
  if (v6 && ((*(uint64_t (**)(void))(v6 + 16))() & 1) == 0)
  {
    uint64_t v7 = pp_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v35 = 0;
      _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: deferring cleanup.", v35, 2u);
    }

    *a3 = 1;
  }
  uint64_t v8 = (void *)MEMORY[0x1CB79D060]();
  id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v5 timestamp];
  uint64_t v10 = objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
  id v11 = [v5 eventBody];
  uint64_t v12 = [v11 feedbackCreationDate];

  long long v13 = [v5 eventBody];
  uint64_t v14 = [v13 feedbackType];

  if (v14 == 2 && [v12 compare:a1[4]] != -1)
  {
    uint64_t v15 = [v5 eventBody];
    if (v15)
    {
      long long v16 = (void *)v15;
      long long v17 = [v5 eventBody];
      id v18 = [v17 highlight];
      id v19 = [v18 highlightIdentifier];

      if (v19)
      {
        id v20 = (void *)a1[5];
        id v21 = [v5 eventBody];
        id v22 = [v21 highlight];
        id v23 = [v22 highlightIdentifier];
        LOBYTE(v20) = [v20 containsObject:v23];

        if ((v20 & 1) == 0)
        {
          long long v24 = (void *)a1[6];
          uint64_t v25 = [v5 eventBody];
          [v24 addObject:v25];

          uint64_t v26 = (void *)a1[5];
          uint64_t v27 = [v5 eventBody];
          long long v28 = [v27 highlight];
          uint64_t v29 = [v28 highlightIdentifier];
          [v26 addObject:v29];

LABEL_20:
          goto LABEL_21;
        }
        goto LABEL_21;
      }
    }
  }
  if ([v10 compare:a1[7]] == -1 || objc_msgSend(v12, "compare:", a1[7]) == -1 || v14 == 2)
  {
    id v31 = [v5 eventBody];

    if (v31)
    {
      id v32 = [v5 eventBody];
      uint64_t v27 = +[PPSocialHighlightFeedbackUtils feedbackFromBiomeEvent:v32];

      ++*(void *)(*(void *)(a1[10] + 8) + 24);
      if (v27)
      {
        uint64_t v33 = a1[9];
        if (v33) {
          (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v27);
        }
      }
      goto LABEL_20;
    }
LABEL_21:
    uint64_t v30 = 1;
    goto LABEL_22;
  }
  uint64_t v30 = 0;
LABEL_22:

  return v30;
}

- (id)feedbackItems
{
  id v3 = +[PPConfiguration sharedInstance];
  [v3 socialHighlightFeedbackDeletionInterval];
  id v4 = -[PPSocialHighlightStorage feedbackItemsInInterval:includingRemote:](self, "feedbackItemsInInterval:includingRemote:", 1);

  return v4;
}

- (id)feedbackItemsInInterval:(double)a3 includingRemote:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__22826;
  id v22 = __Block_byref_object_dispose__22827;
  id v23 = 0;
  uint64_t v7 = (void *)MEMORY[0x1CB79D060](self, a2);
  uint64_t v8 = [(PPSocialHighlightStorage *)self feedbackPublisherWithInterval:v4 includingRemote:a3];
  id v9 = [v8 filterWithIsIncluded:&__block_literal_global_518];
  uint64_t v10 = [v9 mapWithTransform:&__block_literal_global_521];
  id v11 = [v10 collect];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__PPSocialHighlightStorage_feedbackItemsInInterval_includingRemote___block_invoke_3;
  v17[3] = &unk_1E65DAFD0;
  v17[4] = &v18;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__PPSocialHighlightStorage_feedbackItemsInInterval_includingRemote___block_invoke_523;
  v16[3] = &unk_1E65DAFF8;
  void v16[4] = &v18;
  id v12 = (id)[v11 sinkWithCompletion:v17 receiveInput:v16];

  long long v13 = (void *)v19[5];
  if (!v13) {
    long long v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v14 = v13;
  _Block_object_dispose(&v18, 8);

  return v14;
}

void __68__PPSocialHighlightStorage_feedbackItemsInInterval_includingRemote___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v5 = [v3 state];
  uint64_t v6 = pp_social_highlights_log_handle();
  uint64_t v7 = v6;
  if (v5 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [v3 error];
      int v10 = 138412290;
      uint64_t v11 = (uint64_t)v8;
      _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: error collecting feedback: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count];
    int v10 = 134217984;
    uint64_t v11 = v9;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: successfully collected feedback %tu feedback items.", (uint8_t *)&v10, 0xCu);
  }
}

void __68__PPSocialHighlightStorage_feedbackItemsInInterval_includingRemote___block_invoke_523(uint64_t a1, void *a2)
{
}

id __68__PPSocialHighlightStorage_feedbackItemsInInterval_includingRemote___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1CB79D060]();
  BOOL v4 = [v2 eventBody];
  uint64_t v5 = +[PPSocialHighlightFeedbackUtils feedbackFromBiomeEvent:v4];

  return v5;
}

BOOL __68__PPSocialHighlightStorage_feedbackItemsInInterval_includingRemote___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1CB79D060]();
  BOOL v4 = [v2 eventBody];

  return v4 != 0;
}

BOOL __74__PPSocialHighlightStorage_feedbackPublisherWithInterval_includingRemote___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1CB79D060]();
  BOOL v4 = [v2 eventBody];

  if (!v4)
  {
    uint64_t v5 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: filtering event from Biome with nil event body.", v7, 2u);
    }
  }

  return v4 != 0;
}

- (void)saveFeedbackItems:(id)a3
{
  id v4 = a3;
  if ([(PPSocialHighlightStorage *)self rerankingEnabled])
  {
    lock = self->_lock;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__PPSocialHighlightStorage_saveFeedbackItems___block_invoke;
    v6[3] = &unk_1E65DAF20;
    id v7 = v4;
    [(_PASLock *)lock runWithLockAcquired:v6];
  }
}

void __46__PPSocialHighlightStorage_saveFeedbackItems___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1CB79D060]();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x1CB79D060](v6);
        uint64_t v12 = +[PPSocialHighlightFeedbackUtils biomeEventFromFeedback:](PPSocialHighlightFeedbackUtils, "biomeEventFromFeedback:", v10, (void)v15);
        -[PPSocialHighlightStorageGuardedData sendEvent:]((uint64_t)v3, v12);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  long long v13 = pp_default_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = [*(id *)(a1 + 32) count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v20 = v14;
    _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: saved %tu events to the stream.", buf, 0xCu);
  }
}

- (id)_socialAttributionFromAttributeValues:(id)a3 fetchAttributes:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = [v5 count];
  if (v8 == [v6 count])
  {
    uint64_t v9 = [v5 objectAtIndexedSubscript:0];
    uint64_t v10 = [v5 objectAtIndexedSubscript:1];
    uint64_t v11 = [v5 objectAtIndexedSubscript:2];
    uint64_t v12 = [v5 objectAtIndexedSubscript:3];
    long long v65 = [v5 objectAtIndexedSubscript:4];
    long long v13 = [v5 objectAtIndexedSubscript:5];
    uint64_t v14 = [v5 objectAtIndexedSubscript:6];
    long long v15 = [v5 objectAtIndexedSubscript:7];
    id v58 = [v5 objectAtIndexedSubscript:8];
    long long v62 = [v5 objectAtIndexedSubscript:9];
    long long v61 = [v5 objectAtIndexedSubscript:10];
    long long v60 = [v5 objectAtIndexedSubscript:11];
    __int16 v57 = [v5 objectAtIndexedSubscript:12];
    long long v50 = v9;
    id v48 = v6;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      long long v16 = v9;
      if (!v10) {
        goto LABEL_13;
      }
    }
    else
    {
      long long v16 = 0;
      if (!v10) {
        goto LABEL_13;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v63 = v10;
      if (!v11) {
        goto LABEL_17;
      }
      goto LABEL_14;
    }
LABEL_13:
    id v63 = 0;
    if (!v11) {
      goto LABEL_17;
    }
LABEL_14:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = [v11 stringByStandardizingPath];
      id v56 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v19 isDirectory:0];

      if (!v12) {
        goto LABEL_20;
      }
LABEL_18:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v55 = v12;
        goto LABEL_21;
      }
LABEL_20:
      id v55 = 0;
LABEL_21:
      uint64_t v51 = v15;
      uint64_t v52 = v14;
      if (v65)
      {
        objc_opt_class();
        id v64 = 0;
        if ((objc_opt_isKindOfClass() & 1) == 0 || !v13)
        {
LABEL_33:
          long long v49 = v10;
          if (v14)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (v15)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v46 = v7;
                  id v22 = v14;
                  id v23 = v15;
                  uint64_t v24 = [v22 count];
                  id v53 = v23;
                  if (v24 == [v23 count] && objc_msgSend(v22, "count"))
                  {
                    unint64_t v25 = 0;
                    do
                    {
                      uint64_t v26 = [v22 objectAtIndexedSubscript:v25];
                      uint64_t v27 = [v53 objectAtIndexedSubscript:v25];
                      if (v26)
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          if (v27)
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              long long v28 = v13;
                              uint64_t v29 = v12;
                              uint64_t v30 = v11;
                              id v31 = (void *)[objc_alloc(MEMORY[0x1E4F89F38]) initWithHandle:v27 displayName:v26];
                              [v46 addObject:v31];

                              uint64_t v11 = v30;
                              uint64_t v12 = v29;
                              long long v13 = v28;
                            }
                          }
                        }
                      }

                      ++v25;
                    }
                    while ([v22 count] > v25);
                  }

                  uint64_t v7 = v46;
                }
              }
            }
          }
          id v32 = v58;
          if (v58)
          {
            objc_opt_class();
            id v34 = v61;
            uint64_t v33 = v62;
            if (objc_opt_isKindOfClass())
            {
              uint64_t v35 = [v58 firstObject];

              id v32 = (id)v35;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v32 = v32;
              long long v59 = v32;
            }
            else
            {
              long long v59 = 0;
            }
          }
          else
          {
            long long v59 = 0;
            id v34 = v61;
            uint64_t v33 = v62;
          }
          if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            BOOL v47 = [v33 unsignedIntegerValue] == 2;
            if (!v34) {
              goto LABEL_61;
            }
          }
          else
          {
            BOOL v47 = 0;
            if (!v34) {
              goto LABEL_61;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v36 = [v34 BOOLValue];
            goto LABEL_62;
          }
LABEL_61:
          char v36 = 0;
LABEL_62:
          if (v60 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
            id v54 = v60;
          }
          else {
            id v54 = 0;
          }
          uint64_t v37 = pp_social_highlights_log_handle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v67 = v16;
            _os_log_impl(&dword_1CA9A8000, v37, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: Constructed social attribution with identifier: %@", buf, 0xCu);
          }

          if (v16 && v63 && v64 && [v7 count] && v59)
          {
            long long v38 = v13;
            long long v17 = v16;
            if (v57)
            {
              uint64_t v39 = v7;
              objc_opt_class();
              uint64_t v40 = v60;
              if (objc_opt_isKindOfClass()) {
                id v41 = v57;
              }
              else {
                id v41 = 0;
              }
            }
            else
            {
              uint64_t v39 = v7;
              id v41 = 0;
              uint64_t v40 = v60;
            }
            BYTE1(v45) = v36;
            LOBYTE(v45) = v47;
            long long v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89F18]), "initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:groupId:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:", v17, @"Messages", v63, v56, v55, v41, v39, v64, v59, v54, v45);
          }
          else
          {
            id v42 = pp_social_highlights_log_handle();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v67 = v16;
              _os_log_error_impl(&dword_1CA9A8000, v42, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: Constructed social attribution has missing data: %@", buf, 0xCu);
            }
            long long v38 = v13;

            id v43 = pp_social_highlights_log_handle();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138740995;
              id v67 = v16;
              __int16 v68 = 2117;
              id v69 = v63;
              __int16 v70 = 2117;
              id v71 = v64;
              __int16 v72 = 2117;
              uint64_t v73 = v7;
              __int16 v74 = 2112;
              unint64_t v75 = v59;
              _os_log_debug_impl(&dword_1CA9A8000, v43, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: attributionIdentifier: %{sensitive}@, conversationIdentifier: %{sensitive}@, sender: %{sensitive}@, relatedPeople: %{sensitive}@, timestamp: %@", buf, 0x34u);
            }
            long long v17 = v16;
            uint64_t v39 = v7;

            id v41 = 0;
            long long v18 = 0;
            uint64_t v40 = v60;
          }

          uint64_t v7 = v39;
          id v6 = v48;
          goto LABEL_85;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = [v65 firstObject];
          id v21 = [v13 firstObject];
          if (!v20) {
            goto LABEL_31;
          }
          objc_opt_class();
          id v64 = 0;
          if ((objc_opt_isKindOfClass() & 1) == 0 || !v21) {
            goto LABEL_32;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v64 = (void *)[objc_alloc(MEMORY[0x1E4F89F38]) initWithHandle:v21 displayName:v20];
            objc_msgSend(v7, "addObject:");
          }
          else
          {
LABEL_31:
            id v64 = 0;
          }
LABEL_32:

          long long v15 = v51;
          uint64_t v14 = v52;
          goto LABEL_33;
        }
      }
      id v64 = 0;
      goto LABEL_33;
    }
LABEL_17:
    id v56 = 0;
    if (!v12) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  long long v17 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight attribution query result did not include all of the necessary components.", buf, 2u);
  }
  long long v18 = 0;
LABEL_85:

  return v18;
}

- (id)attributionForIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  uint64_t v8 = [v6 arrayWithObjects:&v12 count:1];
  uint64_t v9 = -[PPSocialHighlightStorage attributionsForIdentifiers:error:](self, "attributionsForIdentifiers:error:", v8, a4, v12, v13);
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  return v10;
}

uint64_t __98__PPSocialHighlightStorage_rankedHighlightsWithLimit_client_variant_applicationIdentifiers_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __98__PPSocialHighlightStorage_rankedHighlightsWithLimit_client_variant_applicationIdentifiers_error___block_invoke_494(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 timestamp];
  id v6 = [v4 timestamp];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __122__PPSocialHighlightStorage_sharedContentForClient_variant_applicationIdentifiers_limit_autoDonatingChatIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) isValidHighlight:v3 applicationIdentifiers:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v5 = pp_social_highlights_log_handle();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
LABEL_8:

      uint64_t v4 = 0;
      goto LABEL_9;
    }
    id v6 = [v3 uniqueIdentifier];
    int v23 = 138412290;
    uint64_t v24 = v6;
    uint64_t v7 = "PPSocialHighlightStorage: item: %@ suppressed as it is not valid";
    uint64_t v8 = v5;
    uint32_t v9 = 12;
LABEL_19:
    _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v23, v9);

    goto LABEL_8;
  }
  if (([*(id *)(a1 + 32) isClientEntitledForItem:v3 client:*(void *)(a1 + 48) applicationIdentifiers:*(void *)(a1 + 40) blockedHosts:*(void *)(a1 + 56) iTunesOverrideChecker:*(void *)(a1 + 64)] & 1) == 0)
  {
    id v5 = pp_social_highlights_log_handle();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    id v22 = *(void **)(a1 + 48);
    id v6 = [v3 uniqueIdentifier];
    int v23 = 138412546;
    uint64_t v24 = v22;
    __int16 v25 = 2112;
    uint64_t v26 = v6;
    uint64_t v7 = "PPSocialHighlightStorage: Client: %@, is not entitled for item: %@";
    uint64_t v8 = v5;
    uint32_t v9 = 22;
    goto LABEL_19;
  }
  if ([*(id *)(a1 + 72) isEqualToString:*MEMORY[0x1E4F8A1A0]])
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1CB79D060]();
    id v12 = objc_opt_new();
    uint64_t v13 = [v3 attributeSet];
    uint64_t v14 = [v13 authorAddresses];
    [v12 addObjectsFromArray:v14];

    long long v15 = [v3 attributeSet];
    long long v16 = [v15 recipientAddresses];
    [v12 addObjectsFromArray:v16];

    long long v17 = [v3 attributeSet];
    long long v18 = [v17 accountHandles];
    [v12 removeObjectsInArray:v18];

    if ([v12 count])
    {
      id v19 = [*(id *)(a1 + 80) allowableByContactsHandles:v12];
      uint64_t v4 = [v19 allowedByScreenTime];
      if ((v4 & 1) == 0)
      {
        uint64_t v20 = pp_social_highlights_log_handle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = [v3 uniqueIdentifier];
          int v23 = 138412290;
          uint64_t v24 = v21;
          _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Suppressing item due to Screen Time restrictions: %@", (uint8_t *)&v23, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v4 = 1;
    }
  }
LABEL_9:

  return v4;
}

uint64_t __123__PPSocialHighlightStorage__rankableItemsForClient_variant_applicationIdentifiers_autoDonatingChatIdentifiers_limit_error___block_invoke_467(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

uint64_t __123__PPSocialHighlightStorage__rankableItemsForClient_variant_applicationIdentifiers_autoDonatingChatIdentifiers_limit_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 attributeSet];
  id v6 = [v5 contentCreationDate];
  uint64_t v7 = [v4 attributeSet];

  uint64_t v8 = [v7 contentCreationDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (BOOL)isClientEntitledForItem:(id)a3 client:(id)a4 applicationIdentifiers:(id)a5 blockedHosts:(id)a6 iTunesOverrideChecker:(id)a7
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int v16 = [v13 containsObject:@"portraitCollaborations"];
  LODWORD(a7) = [v13 containsObject:@"*"];
  int v17 = [v13 containsObject:@"collaborations"];
  unsigned int v18 = a7 & ~(a7 & v17 & v16);
  if (v18 == 1 && ![v12 length])
  {
    BOOL v30 = 1;
    goto LABEL_118;
  }
  v107 = v13;
  id v19 = v15;
  uint64_t v20 = v12;
  id v21 = v14;
  id v22 = (void *)MEMORY[0x1CB79D060]();
  int v23 = [v11 attributeSet];
  [v23 URL];
  v25 = uint64_t v24 = v11;

  v112 = (void *)v25;
  if (v25)
  {
    v108 = v24;
    uint64_t v26 = [v24 attributeSet];
    uint64_t v27 = [v26 attributeForKey:@"com_apple_mobilesms_resolvedURL"];

    if (v27)
    {
      objc_opt_class();
      id v14 = v21;
      if (objc_opt_isKindOfClass()) {
        uint64_t v28 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v27];
      }
      else {
        uint64_t v28 = 0;
      }
    }
    else
    {
      uint64_t v28 = 0;
      id v14 = v21;
    }
    id v12 = v20;
    v103 = (void *)v28;
    v104 = [(PPSocialHighlightStorage *)self applicationIdentifiersForResourceURL:v112 resolvedURL:v28];
    id v31 = v22;
    if (v104)
    {
      BOOL v93 = +[PPRankableSocialHighlightUtils isSearchableItemCollaboration:v108];
      id v15 = v19;
      id v13 = v107;
      if ((v17 & v93) == 1 && v16 == [v107 containsObject:@"*"])
      {
        int v53 = 1;
        char v52 = 1;
        id v32 = v112;
LABEL_114:

        if (v53) {
          BOOL v30 = v52;
        }
        else {
          BOOL v30 = 0;
        }
        id v11 = v108;
        goto LABEL_118;
      }
      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      id obj = v104;
      v113 = v12;
      v100 = v31;
      id v101 = v15;
      uint64_t v105 = [obj countByEnumeratingWithState:&v126 objects:v133 count:16];
      if (v105)
      {
        BOOL v102 = 0;
        uint64_t v106 = *(void *)v127;
        uint64_t v99 = *MEMORY[0x1E4F8A008];
        uint64_t v94 = v27;
        uint64_t v97 = *MEMORY[0x1E4F8A028];
        id v32 = v112;
        id v91 = v14;
        while (2)
        {
          for (uint64_t i = 0; i != v105; ++i)
          {
            if (*(void *)v127 != v106) {
              objc_enumerationMutation(obj);
            }
            id v34 = *(void **)(*((void *)&v126 + 1) + 8 * i);
            uint64_t v35 = (void *)MEMORY[0x1CB79D060]();
            char v36 = [v34 first];
            uint64_t v37 = [v34 second];
            int v38 = [v37 BOOLValue];

            if (v38)
            {
              if ([v36 isEqualToString:v99]
                && ((objc_msgSend(v32, "nr_isWebURL") & 1) != 0 || (objc_msgSend(v103, "nr_isWebURL") & 1) != 0))
              {
                BOOL v102 = 0;
              }
              else if ([v36 isEqualToString:v97])
              {
                uint64_t v39 = (void *)MEMORY[0x1CB79D060]();
                uint64_t v40 = [v108 attributeSet];
                id v41 = [v40 attributeForKey:@"com_apple_mobilesms_ckBundleIDs"];

                objc_opt_class();
                uint64_t v98 = v41;
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || ([v41 firstObject],
                      id v42 = objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      char isKindOfClass = objc_opt_isKindOfClass(),
                      v42,
                      (isKindOfClass & 1) == 0))
                {
                  long long v46 = pp_social_highlights_log_handle();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                  {
                    long long v89 = [v108 uniqueIdentifier];
                    *(_DWORD *)long long buf = 138412290;
                    v135 = v89;
                    _os_log_error_impl(&dword_1CA9A8000, v46, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: could not find any CKBundleIDs to check for %@", buf, 0xCu);
                  }
                  char v52 = 0;
                  id v14 = v91;
LABEL_53:

                  uint64_t v27 = v94;
                  goto LABEL_61;
                }
                context = v39;
                id v44 = pp_social_highlights_log_handle();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_debug_impl(&dword_1CA9A8000, v44, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: using CSSI bundle IDs to check link entitlement", buf, 2u);
                }

                uint64_t v45 = [(PPSocialHighlightStorageUtilities *)self->_socialHighlightStorageUtils resolveBundleIdToApplicationIdentifierIfInstalled:v98];
                BOOL v102 = [v45 count] != 0;
                long long v122 = 0u;
                long long v123 = 0u;
                long long v124 = 0u;
                long long v125 = 0u;
                long long v46 = v45;
                uint64_t v47 = [v46 countByEnumeratingWithState:&v122 objects:v132 count:16];
                if (v47)
                {
                  uint64_t v48 = v47;
                  uint64_t v49 = *(void *)v123;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v48; ++j)
                    {
                      if (*(void *)v123 != v49) {
                        objc_enumerationMutation(v46);
                      }
                      uint64_t v51 = *(void *)(*((void *)&v122 + 1) + 8 * j);
                      if ((v18 | objc_msgSend(v107, "containsObject:", v51, context)) == 1
                        && (![v113 length]
                         || ([v113 isEqualToString:v51] & 1) != 0))
                      {

                        char v52 = 1;
                        id v32 = v112;
                        id v12 = v113;
                        uint64_t v39 = context;
                        id v14 = v91;
                        goto LABEL_53;
                      }
                    }
                    uint64_t v48 = [v46 countByEnumeratingWithState:&v122 objects:v132 count:16];
                    if (v48) {
                      continue;
                    }
                    break;
                  }
                }

                id v32 = v112;
                id v12 = v113;
                uint64_t v27 = v94;
              }
              else
              {
                BOOL v102 = 1;
              }
            }
            if ((v18 | objc_msgSend(v107, "containsObject:", v36, context)) == 1
              && (![v12 length]
               || ([v12 isEqualToString:v36] & 1) != 0))
            {
              char v52 = 1;
              id v14 = v91;
LABEL_61:

              int v53 = 1;
              id v31 = v100;
              id v15 = v101;
              goto LABEL_113;
            }
          }
          id v14 = v91;
          id v31 = v100;
          id v15 = v101;
          uint64_t v105 = [obj countByEnumeratingWithState:&v126 objects:v133 count:16];
          if (v105) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v102 = 0;
        id v32 = v112;
      }

      if (!v102 && !v93)
      {
        id v54 = [v15 overrideForURL:v32];
        if (v54)
        {
          id obj = v54;
          if ([v54 isEqual:v32])
          {
            LOBYTE(v102) = 0;
          }
          else
          {
            id v56 = [MEMORY[0x1E4F223E0] defaultWorkspace];
            __int16 v57 = pp_social_highlights_log_handle();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138739971;
              v135 = obj;
              _os_log_debug_impl(&dword_1CA9A8000, v57, OS_LOG_TYPE_DEBUG, "Searching for applications to open URL override: %{sensitive}@", buf, 0xCu);
            }
            __int16 v95 = v27;
            id v92 = v14;

            id v58 = [v56 applicationsAvailableForOpeningURL:obj];
            long long v59 = pp_social_highlights_log_handle();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              v135 = v58;
              _os_log_impl(&dword_1CA9A8000, v59, OS_LOG_TYPE_INFO, "Applications found for URL override: %@", buf, 0xCu);
            }

            long long v120 = 0u;
            long long v121 = 0u;
            long long v118 = 0u;
            long long v119 = 0u;
            long long v60 = v58;
            uint64_t v61 = [v60 countByEnumeratingWithState:&v118 objects:v131 count:16];
            LOBYTE(v102) = v61 != 0;
            if (v61)
            {
              uint64_t v62 = v61;
              uint64_t v63 = *(void *)v119;
              while (2)
              {
                for (uint64_t k = 0; k != v62; ++k)
                {
                  if (*(void *)v119 != v63) {
                    objc_enumerationMutation(v60);
                  }
                  long long v65 = [*(id *)(*((void *)&v118 + 1) + 8 * k) correspondingApplicationRecord];
                  long long v66 = [v65 applicationIdentifier];
                  int v67 = v18 | [v107 containsObject:v66];

                  if (v67 == 1)
                  {
                    if (![v113 length]
                      || ([v65 applicationIdentifier],
                          __int16 v68 = objc_claimAutoreleasedReturnValue(),
                          int v69 = [v113 isEqualToString:v68],
                          v68,
                          v69))
                    {
                      uint64_t v87 = pp_social_highlights_log_handle();
                      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                      {
                        long long v88 = [v65 applicationIdentifier];
                        *(_DWORD *)long long buf = 138412290;
                        v135 = v88;
                        _os_log_impl(&dword_1CA9A8000, v87, OS_LOG_TYPE_DEFAULT, "Found app supporting URL override but not Universal Links: %@", buf, 0xCu);
                      }
                      int v53 = 1;
                      char v52 = 1;
                      id v32 = v112;
                      id v12 = v113;
                      id v14 = v92;
                      id v31 = v100;
                      id v15 = v101;
                      uint64_t v27 = v95;
                      goto LABEL_113;
                    }
                  }
                }
                uint64_t v62 = [v60 countByEnumeratingWithState:&v118 objects:v131 count:16];
                if (v62) {
                  continue;
                }
                break;
              }
            }

            id v32 = v112;
            id v12 = v113;
            id v14 = v92;
            id v31 = v100;
            id v15 = v101;
            uint64_t v27 = v95;
          }
          id v54 = obj;
        }
        else
        {
          LOBYTE(v102) = 0;
        }
      }
      __int16 v70 = [v108 attributeSet];
      id v71 = [v70 syndicationStatus];

      objc_opt_class();
      id obj = v71;
      if ((objc_opt_isKindOfClass() & 1) == 0 || [v71 unsignedIntegerValue] != 2)
      {
        __int16 v72 = [v32 host];
        if (v72)
        {
          v96 = v27;
          long long v116 = 0u;
          long long v117 = 0u;
          long long v114 = 0u;
          long long v115 = 0u;
          id v110 = v14;
          uint64_t v73 = [v110 countByEnumeratingWithState:&v114 objects:v130 count:16];
          if (v73)
          {
            uint64_t v74 = v73;
            uint64_t v75 = *(void *)v115;
            while (2)
            {
              uint64_t v76 = 0;
              do
              {
                id v77 = v14;
                if (*(void *)v115 != v75) {
                  objc_enumerationMutation(v110);
                }
                id v78 = *(void **)(*((void *)&v114 + 1) + 8 * v76);
                id v79 = (void *)MEMORY[0x1CB79D060]();
                if ([v78 hasPrefix:@"."])
                {
                  id v80 = v78;
                }
                else
                {
                  id v80 = [@"." stringByAppendingString:v78];
                }
                long long v81 = v80;
                if (([v72 isEqual:v78] & 1) != 0
                  || [v72 hasSuffix:v81])
                {
                  uint64_t v83 = pp_social_highlights_log_handle();
                  id v14 = v77;
                  id v31 = v100;
                  id v15 = v101;
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                  {
                    id v84 = [v108 uniqueIdentifier];
                    *(_DWORD *)long long buf = 138412290;
                    v135 = v84;
                    _os_log_impl(&dword_1CA9A8000, v83, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Suppressing URL with blocked host, item: %@", buf, 0xCu);
                  }
                  id v12 = v113;
                  uint64_t v27 = v96;
                  goto LABEL_107;
                }

                ++v76;
                id v12 = v113;
                id v14 = v77;
                id v31 = v100;
                id v15 = v101;
              }
              while (v74 != v76);
              uint64_t v74 = [v110 countByEnumeratingWithState:&v114 objects:v130 count:16];
              if (v74) {
                continue;
              }
              break;
            }
          }

          uint64_t v27 = v96;
        }

        id v32 = v112;
      }
      if (v102 || (v18 & 1) == 0)
      {
        int v53 = 0;
      }
      else
      {
        if ([v107 containsObject:@"internal"]
          && ![v12 isEqualToString:*MEMORY[0x1E4F8A020]]
          || [v12 isEqualToString:*MEMORY[0x1E4F8A030]])
        {
          __int16 v72 = pp_social_highlights_log_handle();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            long long v82 = [v108 uniqueIdentifier];
            *(_DWORD *)long long buf = 138412290;
            v135 = v82;
            _os_log_impl(&dword_1CA9A8000, v72, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Suppressing link that is not supported by installed app, wildcard entitlement is present and client is not Safari or TV: %@", buf, 0xCu);
          }
LABEL_107:

          char v52 = 0;
          int v53 = 1;
          id v32 = v112;
          goto LABEL_113;
        }
        int v53 = 1;
      }
      char v52 = 1;
    }
    else
    {
      id obj = pp_social_highlights_log_handle();
      id v15 = v19;
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      {
        id v85 = [v108 uniqueIdentifier];
        *(_DWORD *)long long buf = 138412546;
        v135 = v12;
        __int16 v136 = 2112;
        v137 = v85;
        _os_log_error_impl(&dword_1CA9A8000, obj, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: App Links could not be fetched for client: %@, item: %@", buf, 0x16u);
      }
      char v52 = 0;
      int v53 = 1;
      id v32 = v112;
      id v13 = v107;
    }
LABEL_113:

    goto LABEL_114;
  }
  uint64_t v29 = pp_social_highlights_log_handle();
  id v11 = v24;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    id v55 = [v24 uniqueIdentifier];
    *(_DWORD *)long long buf = 138412546;
    v135 = v20;
    __int16 v136 = 2112;
    v137 = v55;
    _os_log_error_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: Encountered CSSearchableItem with nil resourceURL when querying for client: %@, item: %@", buf, 0x16u);
  }
  BOOL v30 = 0;
  id v14 = v21;
  id v12 = v20;
  id v15 = v19;
  id v13 = v107;
LABEL_118:

  return v30;
}

- (BOOL)isClientEntitledForItem:(id)a3 client:(id)a4 applicationIdentifiers:(id)a5 blockedHosts:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_opt_new();
  LOBYTE(self) = [(PPSocialHighlightStorage *)self isClientEntitledForItem:v13 client:v12 applicationIdentifiers:v11 blockedHosts:v10 iTunesOverrideChecker:v14];

  return (char)self;
}

- (BOOL)isValidHighlight:(id)a3 applicationIdentifiers:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 attributeSet];
  uint64_t v8 = [v7 syndicationStatus];

  objc_opt_class();
  BOOL v9 = (objc_opt_isKindOfClass() & 1) != 0 && [v8 unsignedIntegerValue] == 2;
  id v10 = [v5 attributeSet];
  id v11 = [v10 attributeForKey:@"com_apple_mobilesms_fromMe"];

  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v12 = [v11 BOOLValue] ^ 1 | v9;
  }
  else {
    LOBYTE(v12) = 1;
  }
  BOOL v13 = +[PPRankableSocialHighlightUtils isSearchableItemCollaboration:v5];
  int v14 = [v6 containsObject:@"fromMe"];

  char v15 = v12 | v14 | v13;
  if ((v15 & 1) == 0)
  {
    int v16 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v5 uniqueIdentifier];
      int v20 = 138412290;
      id v21 = v17;
      unsigned int v18 = "PPSocialHighlightStorage: Suppressing outgoing item since it is not pinned: %@";
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  if (v14)
  {
    int v16 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v5 uniqueIdentifier];
      int v20 = 138412290;
      id v21 = v17;
      unsigned int v18 = "PPSocialHighlightStorage: Including outgoing item since fromMe entitlement is present: %@";
LABEL_14:
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v20, 0xCu);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v15;
}

- (id)applicationIdentifiersForResourceURL:(id)a3 resolvedURL:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  uint64_t v25 = self;
  lsAppLinkCache = self->_lsAppLinkCache;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __77__PPSocialHighlightStorage_applicationIdentifiersForResourceURL_resolvedURL___block_invoke;
  v38[3] = &unk_1E65DADF8;
  id v26 = v6;
  id v39 = v26;
  id v27 = v7;
  id v40 = v27;
  id v42 = &v43;
  id v29 = v8;
  id v41 = v29;
  [(_PASLock *)lsAppLinkCache runWithLockAcquired:v38];
  if (!*((unsigned char *)v44 + 24))
  {
    id v10 = objc_opt_new();
    uint64_t v24 = +[PPSocialHighlightStorage appLinksForResourceURL:v26 resolvedURL:v27];
    if ([v24 count])
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id obj = v24;
      uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v47 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v35 != v12) {
              objc_enumerationMutation(obj);
            }
            int v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            char v15 = [v14 targetApplicationRecord];
            int v16 = [v15 applicationIdentifier];

            id v17 = objc_alloc(MEMORY[0x1E4F93BB8]);
            unsigned int v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "isEnabled"));
            id v19 = (void *)[v17 initWithFirst:v16 second:v18];

            [v10 addObject:v19];
            [v29 addObject:v19];
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v47 count:16];
        }
        while (v11);
      }
    }
    int v20 = v25->_lsAppLinkCache;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __77__PPSocialHighlightStorage_applicationIdentifiersForResourceURL_resolvedURL___block_invoke_2;
    v30[3] = &unk_1E65DAE20;
    void v30[4] = v25;
    id v31 = v26;
    id v32 = v27;
    id v21 = v10;
    id v33 = v21;
    [(_PASLock *)v20 runWithLockAcquired:v30];
  }
  uint64_t v22 = [v29 allObjects];

  _Block_object_dispose(&v43, 8);
  return v22;
}

void __77__PPSocialHighlightStorage_applicationIdentifiersForResourceURL_resolvedURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) absoluteString];
  id v5 = [*(id *)(a1 + 40) absoluteString];
  id v6 = v3[1];
  id v7 = [v3[2] objectForKeyedSubscript:v4];
  if (*(void *)(a1 + 40))
  {
    uint64_t v8 = [v3[2] objectForKeyedSubscript:v5];
    if (!v7) {
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (!v7) {
      goto LABEL_23;
    }
  }
  if (!*(void *)(a1 + 40) || v8)
  {
    id v29 = v8;
    BOOL v30 = v7;
    id v31 = v5;
    id v32 = v4;
    id v33 = v3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v39;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v38 + 1) + 8 * v13);
          char v15 = *(void **)(a1 + 48);
          id v16 = objc_alloc(MEMORY[0x1E4F93BB8]);
          id v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "containsObject:", v14));
          unsigned int v18 = (void *)[v16 initWithFirst:v14 second:v17];
          [v15 addObject:v18];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v11);
    }

    id v4 = v32;
    id v3 = v33;
    id v7 = v30;
    id v5 = v31;
    uint64_t v8 = v29;
    if (v29)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v19 = v29;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v35;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v35 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v34 + 1) + 8 * v23);
            uint64_t v25 = *(void **)(a1 + 48);
            id v26 = objc_alloc(MEMORY[0x1E4F93BB8]);
            id v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "containsObject:", v24));
            uint64_t v28 = (void *)[v26 initWithFirst:v24 second:v27];
            [v25 addObject:v28];

            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v21);
      }

      id v4 = v32;
      id v3 = v33;
      id v7 = v30;
      id v5 = v31;
      uint64_t v8 = v29;
    }
  }
LABEL_23:
}

void __77__PPSocialHighlightStorage_applicationIdentifiersForResourceURL_resolvedURL___block_invoke_2(id *a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v37 = a2;
  if ((unint64_t)[v37[3] count] >= 0x7D1)
  {
    id v3 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: clearing LSAppLink cache.", buf, 2u);
    }

    [a1[4] resetLSAppLinkCache];
  }
  if (!v37[3])
  {
    uint64_t v4 = [v37[2] mutableCopy];
    id v5 = v37[3];
    v37[3] = (id)v4;

    objc_storeStrong(v37 + 2, v37[3]);
  }
  id v6 = [a1[5] absoluteString];
  long long v36 = [a1[6] absoluteString];
  id v33 = v6;
  if ([a1[7] count])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = a1[7];
    uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v39 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v12 = (void *)MEMORY[0x1CB79D060]();
          uint64_t v13 = [v11 first];
          if (v13)
          {
            uint64_t v14 = [v11 second];
            int v15 = [v14 BOOLValue];

            uint64_t v16 = [v37[3] objectForKeyedSubscript:v6];
            id v17 = (void *)v16;
            unsigned int v18 = (void *)MEMORY[0x1E4F1CBF0];
            if (v16) {
              unsigned int v18 = (void *)v16;
            }
            id v19 = v18;

            if (([v19 containsObject:v13] & 1) == 0)
            {
              uint64_t v20 = [v19 arrayByAddingObject:v13];
              [v37[3] setObject:v20 forKeyedSubscript:v6];
            }
            if (a1[6])
            {
              uint64_t v21 = a1;
              uint64_t v22 = [v37[3] objectForKeyedSubscript:v36];
              uint64_t v23 = (void *)v22;
              uint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
              if (v22) {
                uint64_t v24 = (void *)v22;
              }
              id v25 = v24;

              if (([v25 containsObject:v13] & 1) == 0)
              {
                id v26 = [v25 arrayByAddingObject:v13];
                [v37[3] setObject:v26 forKeyedSubscript:v36];
              }
              a1 = v21;
              id v6 = v33;
            }
            if (v15) {
              [v37[1] addObject:v13];
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v8);
    }
    goto LABEL_38;
  }
  uint64_t v27 = [v37[3] objectForKeyedSubscript:v6];
  uint64_t v28 = (void *)v27;
  uint64_t v29 = MEMORY[0x1E4F1CBF0];
  if (v27) {
    uint64_t v30 = v27;
  }
  else {
    uint64_t v30 = MEMORY[0x1E4F1CBF0];
  }
  objc_msgSend(v37[3], "setObject:forKeyedSubscript:", v30, v6, v6);

  if (a1[6])
  {
    uint64_t v31 = [v37[3] objectForKeyedSubscript:v36];
    id obj = (id)v31;
    if (v31) {
      uint64_t v32 = v31;
    }
    else {
      uint64_t v32 = v29;
    }
    id v6 = v34;
    [v37[3] setObject:v32 forKeyedSubscript:v36];
LABEL_38:
  }
}

- (void)resetLSAppLinkCache
{
}

void __47__PPSocialHighlightStorage_resetLSAppLinkCache__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)a2[2];
  a2[2] = MEMORY[0x1E4F1CC08];
  id v3 = a2;

  uint64_t v4 = (void *)v3[3];
  v3[3] = 0;

  uint64_t v5 = objc_opt_new();
  id v6 = (id)v3[1];
  v3[1] = v5;
}

- (void)handleAppLinkChangeNotification:(id)a3
{
  uint64_t v4 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: clearing app link cache due to invalidation notification", v5, 2u);
  }

  [(PPSocialHighlightStorage *)self resetLSAppLinkCache];
}

- (id)allSupportedHighlightsForAutoDonatingChats:(id)a3 error:(id *)a4
{
  void v39[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F8A190];
  uint64_t v8 = *MEMORY[0x1E4F8A030];
  v39[0] = *MEMORY[0x1E4F8A008];
  v39[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F8A018];
  v39[2] = *MEMORY[0x1E4F8A000];
  v39[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  uint64_t v11 = -[PPSocialHighlightStorage _rankableItemsForClient:variant:applicationIdentifiers:autoDonatingChatIdentifiers:limit:error:](self, "_rankableItemsForClient:variant:applicationIdentifiers:autoDonatingChatIdentifiers:limit:error:", &stru_1F253DF18, v7, v10, v6, [&unk_1F256A040 unsignedIntegerValue], a4);
  uint64_t v12 = [v11 first];

  if (v12)
  {
    uint64_t v13 = *MEMORY[0x1E4F8A020];
    v38[0] = @"*";
    v38[1] = @"internal";
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    int v15 = -[PPSocialHighlightStorage _rankableItemsForClient:variant:applicationIdentifiers:autoDonatingChatIdentifiers:limit:error:](self, "_rankableItemsForClient:variant:applicationIdentifiers:autoDonatingChatIdentifiers:limit:error:", v13, v7, v14, v6, [&unk_1F256A040 unsignedIntegerValue], a4);
    uint64_t v16 = [v15 first];

    if (v16)
    {
      id v32 = v6;
      id v17 = objc_opt_new();
      unsigned int v18 = objc_opt_new();
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v19 = (void *)MEMORY[0x1CB79D060]();
      uint64_t v31 = v16;
      uint64_t v20 = [v12 arrayByAddingObjectsFromArray:v16];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v34 != v23) {
              objc_enumerationMutation(v20);
            }
            id v25 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            id v26 = [v25 highlightIdentifier];
            char v27 = [v18 containsObject:v26];

            if ((v27 & 1) == 0)
            {
              [v17 addObject:v25];
              uint64_t v28 = [v25 highlightIdentifier];
              [v18 addObject:v28];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v22);
      }

      uint64_t v29 = (void *)[v17 copy];
      uint64_t v16 = v31;
      id v6 = v32;
    }
    else
    {
      uint64_t v29 = 0;
    }
  }
  else
  {
    uint64_t v29 = 0;
  }

  return v29;
}

void __48__PPSocialHighlightStorage__socialLayerDefaults__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.SocialLayer"];
  id v2 = (void *)_socialLayerDefaults__pasExprOnceResult;
  _socialLayerDefaults__pasExprOnceResult = v1;
}

void __51__PPSocialHighlightStorage__screenTimeConversation__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  id v1 = objc_alloc(MEMORY[0x1E4F99D60]);
  uint64_t v2 = *MEMORY[0x1E4F8A0A8];
  id v3 = PPSharedCNContactStore();
  uint64_t v4 = [v1 initWithBundleIdentifier:v2 contactStore:v3];
  uint64_t v5 = (void *)_screenTimeConversation__pasExprOnceResult;
  _screenTimeConversation__pasExprOnceResult = v4;
}

id __94__PPSocialHighlightStorage_deduplicateAndSortRankedHighlights_attributionLookup_limit_client___block_invoke_407(id *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 highlightIdentifier];
  char v27 = [v3 domainIdentifier];
  uint64_t v5 = [a1[4] objectForKeyedSubscript:v4];
  id v26 = 0;
  if ([v3 isCollaboration] && v4 && v27)
  {
    id v6 = v4;
    id v25 = v3;
    id v26 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(a1[5], "objectForKeyedSubscript:", v6, v25);
          uint64_t v14 = [v13 objectForKeyedSubscript:v27];
          int v15 = [v14 attributionIdentifier];
          [v26 setObject:v15 forKeyedSubscript:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v9);
    }

    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v4 = v6;
    id v17 = [a1[6] objectForKeyedSubscript:v6];
    unsigned int v18 = [v17 allValues];
    id v19 = [v18 valueForKey:@"attributionIdentifier"];
    uint64_t v20 = [v16 setWithArray:v19];

    uint64_t v21 = [a1[4] objectForKeyedSubscript:v6];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __94__PPSocialHighlightStorage_deduplicateAndSortRankedHighlights_attributionLookup_limit_client___block_invoke_2_411;
    v28[3] = &unk_1E65DC168;
    id v29 = v20;
    id v22 = v20;
    uint64_t v5 = objc_msgSend(v21, "_pas_filteredArrayWithTest:", v28);

    id v3 = v25;
  }
  uint64_t v23 = objc_msgSend(a1[7], "highlightFromRankableHighlight:attributionIdentifiers:earliestAttributionIdentifiers:", v3, v5, v26, v25);

  return v23;
}

uint64_t __94__PPSocialHighlightStorage_deduplicateAndSortRankedHighlights_attributionLookup_limit_client___block_invoke_2_411(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

id __94__PPSocialHighlightStorage_deduplicateAndSortRankedHighlights_attributionLookup_limit_client___block_invoke_3()
{
  v0 = objc_opt_new();
  return v0;
}

id __94__PPSocialHighlightStorage_deduplicateAndSortRankedHighlights_attributionLookup_limit_client___block_invoke_2()
{
  v0 = objc_opt_new();
  return v0;
}

id __94__PPSocialHighlightStorage_deduplicateAndSortRankedHighlights_attributionLookup_limit_client___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isCollaboration])
  {
    id v3 = [v2 highlightIdentifier];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)highlightFromRankableHighlight:(id)a3 attributionIdentifiers:(id)a4 earliestAttributionIdentifiers:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [v9 score];
  if (v12 < 0.0)
  {
    uint64_t v13 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      char v46 = [v9 highlightIdentifier];
      [v9 score];
      *(_DWORD *)long long buf = 138412546;
      id v64 = v46;
      __int16 v65 = 2048;
      id v66 = v47;
      _os_log_debug_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: Suppressing highlight %@ due to negative score: %g", buf, 0x16u);
    }
    uint64_t v14 = 0;
    goto LABEL_28;
  }
  int v15 = [v9 isTopKResult];
  [v9 score];
  double v17 = v16 * 0.2 + 0.8;
  double v18 = v16 * 0.8;
  if (v15) {
    double v19 = v17;
  }
  else {
    double v19 = v18;
  }
  if (![v9 hasResolvedUrl]
    || ([v9 resolvedUrl],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        uint64_t v21 = [v20 length],
        v20,
        !v21))
  {
    uint64_t v24 = 0;
    goto LABEL_13;
  }
  id v22 = objc_alloc(MEMORY[0x1E4F1CB10]);
  uint64_t v23 = [v9 resolvedUrl];
  uint64_t v24 = [v22 initWithString:v23];

  if (!v24)
  {
LABEL_13:
    uint64_t v59 = MEMORY[0x1E4F1CC08];
    goto LABEL_14;
  }
  uint64_t v61 = @"com_apple_mobilesms_resolvedURL";
  uint64_t v62 = v24;
  uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
LABEL_14:
  id v25 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    id v26 = [v9 highlightIdentifier];
    *(_DWORD *)long long buf = 138412546;
    id v64 = v26;
    __int16 v65 = 2112;
    id v66 = v10;
    _os_log_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: Constructed social highlight with identifier: %@, attributionIdentifiers: %@", buf, 0x16u);
  }
  id v27 = objc_alloc(MEMORY[0x1E4F1CB10]);
  uint64_t v28 = [v9 resourceUrl];
  uint64_t v29 = [v27 initWithString:v28];

  id v58 = (void *)v29;
  if (!v29)
  {
    uint64_t v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2 object:self file:@"PPSocialHighlightStorage.m" lineNumber:580 description:@"All social highlights must have a resource URL"];
  }
  id v30 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v9 syndicationSecondsSinceReferenceDate];
  long long v31 = objc_msgSend(v30, "initWithTimeIntervalSinceReferenceDate:");
  long long v60 = v24;
  if ([v9 isCollaboration])
  {
    long long v32 = [v9 applicationIdentifiers];
    int v33 = [v32 containsObject:@"com.apple.private.sociallayer.highlights"];

    id v56 = v11;
    if (v33)
    {
      uint64_t v34 = [v9 handleToIdentityMap];
    }
    else
    {
      uint64_t v34 = 0;
    }
    id v55 = objc_alloc(MEMORY[0x1E4F89F20]);
    uint64_t v57 = [v9 highlightIdentifier];
    int v53 = [v9 collaborationIdentifier];
    id v54 = [v9 contentDisplayName];
    id v42 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v9 contentCreationSecondsSinceReferenceDate];
    char v52 = objc_msgSend(v42, "initWithTimeIntervalSinceReferenceDate:");
    uint64_t v51 = [v9 contentType];
    long long v50 = [v9 fileProviderId];
    uint64_t v49 = [v9 localIdentity];
    uint64_t v43 = [v9 localIdentityProof];
    uint64_t v44 = [NSNumber numberWithDouble:v19];
    long long v41 = v58;
    long long v40 = (void *)v59;
    uint64_t v14 = (void *)[v55 initWithIdentifier:v57 resourceURL:v58 timestamp:v31 attributionIdentifiers:v10 supplementaryData:v59 collaborationIdentifier:v53 contentDisplayName:v54 contentCreationDate:v52 contentUTIType:v51 fileProviderId:v50 earliestAttributionIdentifiers:v56 localIdentity:v49 localIdentityProof:v43 handleToIdentityMap:v34 score:v44];

    long long v36 = (void *)v34;
    id v11 = v56;
    long long v38 = (void *)v57;
  }
  else
  {
    id v35 = objc_alloc(MEMORY[0x1E4F89F28]);
    long long v36 = [v9 highlightIdentifier];
    if (v10) {
      id v37 = v10;
    }
    else {
      id v37 = (id)MEMORY[0x1E4F1CBF0];
    }
    long long v38 = [NSNumber numberWithDouble:v19];
    long long v39 = v35;
    long long v41 = v58;
    long long v40 = (void *)v59;
    uint64_t v14 = (void *)[v39 initWithIdentifier:v36 resourceURL:v58 timestamp:v31 attributionIdentifiers:v37 supplementaryData:v59 score:v38];
  }

  uint64_t v13 = v60;
LABEL_28:

  return v14;
}

void __90__PPSocialHighlightStorage_sharedContentFromChats_dateRange_applicationIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v3;
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v6 = (void *)MEMORY[0x1CB79D060]();
      id v7 = [v9 objectAtIndexedSubscript:i];
      unint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 1024, &__block_literal_global_23039);
      if (v8 < *(void *)(a1 + 48)) {
        [*(id *)(a1 + 32) insertObject:v7 atIndex:v8];
      }
      if ((unint64_t)[*(id *)(a1 + 32) count] > *(void *)(a1 + 48)) {
        [*(id *)(a1 + 32) removeLastObject];
      }
    }
  }
}

uint64_t __90__PPSocialHighlightStorage_sharedContentFromChats_dateRange_applicationIdentifiers_error___block_invoke_385(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 domainIdentifier];
  if (v4)
  {
    uint64_t v5 = [v3 attributeSet];
    id v6 = [v5 syndicationStatus];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = [v6 unsignedIntegerValue];
    }
    else {
      uint64_t v7 = 0;
    }
    unsigned int v10 = [*(id *)(a1 + 32) containsObject:v4];
    if (v7 == 2) {
      unsigned int v11 = 1;
    }
    else {
      unsigned int v11 = v10;
    }
    if (v7 == 8) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v11;
    }
  }
  else
  {
    unint64_t v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      uint64_t v13 = [v3 uniqueIdentifier];
      int v14 = 138543362;
      int v15 = v13;
      _os_log_fault_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_FAULT, "PPSocialHighlightStorage: CSSI %{public}@ missing domainIdentifier", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __90__PPSocialHighlightStorage_sharedContentFromChats_dateRange_applicationIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 attributeSet];
  id v6 = [v5 contentCreationDate];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  uint64_t v9 = v8;

  unsigned int v10 = [v4 attributeSet];

  unsigned int v11 = [v10 contentCreationDate];
  double v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  int v14 = v13;

  uint64_t v15 = [v14 compare:v9];
  return v15;
}

- (id)rankedHighlightsForSyncedItems:(id)a3 client:(id)a4 variant:(id)a5 applicationIdentifiers:(id)a6 error:(id *)a7
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v45 = a4;
  id v44 = a6;
  unsigned int v10 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        double v17 = [v16 highlight];
        double v18 = [v17 identifier];
        double v19 = [v10 objectForKeyedSubscript:v18];

        if (!v19)
        {
          uint64_t v20 = objc_opt_new();
          uint64_t v21 = [v16 highlight];
          id v22 = [v21 identifier];
          [v10 setObject:v20 forKeyedSubscript:v22];
        }
        uint64_t v23 = [v16 highlight];
        uint64_t v24 = [v23 identifier];
        id v25 = [v10 objectForKeyedSubscript:v24];
        id v26 = [v16 highlight];
        id v27 = [v26 attributionIdentifiers];
        [v25 addObjectsFromArray:v27];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v13);
  }

  uint64_t v28 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v29 = [v10 allKeys];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v51 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v50 + 1) + 8 * j);
        id v35 = [v10 objectForKeyedSubscript:v34];
        long long v36 = [v35 allObjects];
        [v28 setObject:v36 forKeyedSubscript:v34];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v31);
  }

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __103__PPSocialHighlightStorage_rankedHighlightsForSyncedItems_client_variant_applicationIdentifiers_error___block_invoke;
  v47[3] = &unk_1E65DACB0;
  id v48 = v44;
  id v49 = v45;
  id v37 = v45;
  id v38 = v44;
  long long v39 = objc_msgSend(v11, "_pas_mappedArrayWithTransform:", v47);
  long long v40 = objc_opt_new();
  long long v41 = [v40 rankSocialHighlights:v39 client:v37 performRerank:0];

  id v42 = [(PPSocialHighlightStorage *)self deduplicateAndSortRankedHighlights:v41 attributionLookup:v28 limit:-1 client:v37];

  return v42;
}

id __103__PPSocialHighlightStorage_rankedHighlightsForSyncedItems_client_variant_applicationIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PPRankableSocialHighlightUtils rankableHighlightFromSyncedItem:a2 applicationIdentifiers:*(void *)(a1 + 32) clientIdentifier:*(void *)(a1 + 40)];
}

void __75__PPSocialHighlightStorage_autoDonatingChatsWithShouldContinueBlock_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = (void *)MEMORY[0x1CB79D060]();
        unsigned int v10 = [v8 attributeSet];
        id v11 = [v10 accountIdentifier];

        if (v11)
        {
          [*(id *)(a1 + 32) addObject:v11];
        }
        else
        {
          uint64_t v12 = pp_social_highlights_log_handle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = [v8 attributeSet];
            uint64_t v14 = [v13 uniqueIdentifier];
            *(_DWORD *)long long buf = 138412290;
            uint64_t v20 = v14;
            _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight automatic donation query returned nil accountIdentifier for chat: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }
}

- (void)syncFeedback
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: triggering sync", buf, 2u);
  }

  id v3 = objc_opt_new();
  id v8 = 0;
  int v4 = [v3 triggerSyncWithError:&v8];
  id v5 = v8;
  uint64_t v6 = pp_social_highlights_log_handle();
  uint64_t v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: successfully triggered sync", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v10 = v5;
    _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: failed to trigger sync: %@", buf, 0xCu);
  }
}

- (PPSocialHighlightStorage)initWithFeedbackStream:(id)a3 rankedStream:(id)a4 database:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PPSocialHighlightStorage;
  uint64_t v12 = [(PPSocialHighlightStorage *)&v19 init];
  if (v12)
  {
    uint64_t v13 = (id *)objc_opt_new();
    objc_storeStrong(v13 + 1, a3);
    if (v10)
    {
      uint64_t v14 = -[PPSocialHighlightCache initWithStream:database:]((id *)[PPSocialHighlightCache alloc], v10, v11);
      cache = v12->_cache;
      v12->_cache = (PPSocialHighlightCache *)v14;
    }
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v13];
    locuint64_t k = v12->_lock;
    v12->_locuint64_t k = (_PASLock *)v16;
  }
  return v12;
}

- (PPSocialHighlightStorage)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F50478]);
  int v4 = +[PPSocialHighlightStorage feedbackPruningPolicy];
  id v5 = (void *)[v3 initWithPruningPolicy:v4];

  NSUInteger v6 = NSRoundUpToMultipleOfPageSize(0x30000uLL);
  uint64_t v7 = +[PPPaths subdirectory:@"streams"];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50278]) initWithStoreBasePath:v7 segmentSize:v6];
  id v9 = objc_alloc(MEMORY[0x1E4F50268]);
  id v10 = +[PPConfiguration sharedInstance];
  [v10 socialHighlightRankedStorageMaxAge];
  id v11 = objc_msgSend(v9, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 1, 1, 5 * v6);

  [v8 setPruningPolicy:v11];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:@"rankedSocialHighlights" storeConfig:v8];
  id v13 = [(PPSocialHighlightStorage *)self _screenTimeConversation];
  uint64_t v14 = (PPSocialHighlightStorageUtilities *)objc_opt_new();
  socialHighlightStorageUtils = self->_socialHighlightStorageUtils;
  self->_socialHighlightStorageUtils = v14;

  uint64_t v16 = objc_opt_new();
  long long v17 = (_PASLock *)[objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v16];
  lsAppLinkCache = self->_lsAppLinkCache;
  self->_lsAppLinkCache = v17;

  [(PPSocialHighlightStorage *)self resetLSAppLinkCache];
  objc_super v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v19 addObserver:self selector:sel_handleAppLinkChangeNotification_ name:@"com.apple.LaunchServices.applicationRegistered" object:0];

  uint64_t v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v20 addObserver:self selector:sel_handleAppLinkChangeNotification_ name:@"com.apple.LaunchServices.applicationUnregistered" object:0];

  uint64_t v21 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v21 addObserver:self selector:sel_handleAppLinkChangeNotification_ name:@"com.apple.swc.internalUseOnly.serviceSettingsDidChangeNotification" object:0];

  uint64_t v22 = +[PPSQLDatabase sharedInstance];
  uint64_t v23 = [(PPSocialHighlightStorage *)self initWithFeedbackStream:v5 rankedStream:v12 database:v22];

  return v23;
}

+ (int)attributionFeedbackTypeForAttributionFeedbackType:(unint64_t)a3
{
  if (a3 == 1) {
    int v3 = 4;
  }
  else {
    int v3 = 3;
  }
  if (a3 == 2) {
    return 9;
  }
  else {
    return v3;
  }
}

+ (int)unifiedFeedbackTypeForHighlightFeedbackType:(unint64_t)a3
{
  if (a3 >= 0xC) {
    return 2;
  }
  else {
    return a3;
  }
}

+ (id)appLinksForResourceURL:(id)a3 resolvedURL:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v19 = 0;
  uint64_t v7 = [MEMORY[0x1E4F22398] appLinksWithURL:v5 limit:1 includeLinksForCurrentApplication:1 error:&v19];
  id v8 = v19;
  id v9 = pp_social_highlights_log_handle();
  id v10 = v9;
  if (!v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v21 = (uint64_t)v8;
      _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: LSAppLink URL query error: %@", buf, 0xCu);
    }
    uint64_t v14 = 0;
    uint64_t v7 = v10;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = [v7 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v21 = v16;
    _os_log_debug_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: LSAppLink for URL count: %tu", buf, 0xCu);
  }

  if (v6 && ([v6 isEqual:v5] & 1) == 0)
  {

    id v18 = 0;
    id v11 = [MEMORY[0x1E4F22398] appLinksWithURL:v6 limit:1 includeLinksForCurrentApplication:1 error:&v18];
    id v8 = v18;
    uint64_t v12 = pp_social_highlights_log_handle();
    id v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = [v11 count];
        *(_DWORD *)long long buf = 134217984;
        uint64_t v21 = v17;
        _os_log_debug_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: LSAppLink for resolvedURL count: %tu", buf, 0xCu);
      }

      uint64_t v14 = [v7 arrayByAddingObjectsFromArray:v11];

      uint64_t v7 = v11;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v21 = (uint64_t)v8;
        _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: LSAppLink resolvedURL query error: %@", buf, 0xCu);
      }

      uint64_t v14 = 0;
    }
LABEL_13:

    uint64_t v7 = (void *)v14;
  }

  return v7;
}

+ (unint64_t)entitlementStatusForClient:(id)a3 applicationIdentifiers:(id)a4
{
  if (!a3) {
    return 0;
  }
  int v4 = [MEMORY[0x1E4F223F8] bundleRecordWithApplicationIdentifier:a3 error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isWebBrowser]) {
      unint64_t v5 = 2;
    }
    else {
      unint64_t v5 = 1;
    }
  }
  else
  {
    unint64_t v5 = 1;
  }

  return v5;
}

+ (id)feedbackPruningPolicy
{
  id v2 = objc_alloc(MEMORY[0x1E4F50268]);
  int v3 = +[PPConfiguration sharedInstance];
  [v3 socialHighlightFeedbackDeletionInterval];
  int v4 = objc_msgSend(v2, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 1, 1, 7340032);

  return v4;
}

@end