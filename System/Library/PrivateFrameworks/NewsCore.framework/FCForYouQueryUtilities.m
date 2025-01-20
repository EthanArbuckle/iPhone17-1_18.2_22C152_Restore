@interface FCForYouQueryUtilities
+ (id)_filterTagsForQuerying:(id)a3 withMutedTagIDs:(id)a4;
+ (id)feedRequestsForTags:(id)a3 tagBinProvider:(id)a4 hiddenFeedIDs:(id)a5 allowPaidBundleFeed:(BOOL)a6 purchasedTagIDs:(id)a7 bundleSubscriptionProvider:(id)a8 configuration:(id)a9 maxCount:(unint64_t)a10 feedRange:(id)a11 sidecar:(id)a12 isRunningPPT:(BOOL)a13;
+ (id)feedRequestsForTags:(id)a3 tagBinProvider:(id)a4 hiddenFeedIDs:(id)a5 purchasedTagIDs:(id)a6 bundleSubscriptionProvider:(id)a7 configuration:(id)a8 maxCount:(unint64_t)a9 feedRange:(id)a10 sidecar:(id)a11 options:(unint64_t)a12;
+ (void)fetchTagsForQueryingWithSubscribedTagIDs:(id)a3 mutedTagIDs:(id)a4 purchasedTagIDs:(id)a5 bundleSubscriptionProvider:(id)a6 configuration:(id)a7 contentContext:(id)a8 fallbackToPresubscribedTagIDs:(BOOL)a9 qualityOfService:(int64_t)a10 completionHandler:(id)a11;
+ (void)fetchTagsForQueryingWithSubscribedTags:(id)a3 mutedTagIDs:(id)a4 purchasedTagIDs:(id)a5 bundleSubscriptionProvider:(id)a6 configuration:(id)a7 contentContext:(id)a8 fallbackToPresubscribedTagIDs:(BOOL)a9 qualityOfService:(int64_t)a10 completionHandler:(id)a11;
@end

@implementation FCForYouQueryUtilities

+ (void)fetchTagsForQueryingWithSubscribedTags:(id)a3 mutedTagIDs:(id)a4 purchasedTagIDs:(id)a5 bundleSubscriptionProvider:(id)a6 configuration:(id)a7 contentContext:(id)a8 fallbackToPresubscribedTagIDs:(BOOL)a9 qualityOfService:(int64_t)a10 completionHandler:(id)a11
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  v23 = (void (**)(id, void *, void))a11;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v32 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "subscribedTags");
    *(_DWORD *)buf = 136315906;
    v41 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTags:mutedTagIDs:purchasedTagIDs:bundleSubscription"
          "Provider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    __int16 v42 = 2080;
    v43 = "FCForYouQueryUtilities.m";
    __int16 v44 = 1024;
    int v45 = 92;
    __int16 v46 = 2114;
    v47 = v32;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v18) {
      goto LABEL_6;
    }
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "mutedTagIDs");
    *(_DWORD *)buf = 136315906;
    v41 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTags:mutedTagIDs:purchasedTagIDs:bundleSubscription"
          "Provider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    __int16 v42 = 2080;
    v43 = "FCForYouQueryUtilities.m";
    __int16 v44 = 1024;
    int v45 = 93;
    __int16 v46 = 2114;
    v47 = v33;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentContext");
    *(_DWORD *)buf = 136315906;
    v41 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTags:mutedTagIDs:purchasedTagIDs:bundleSubscription"
          "Provider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    __int16 v42 = 2080;
    v43 = "FCForYouQueryUtilities.m";
    __int16 v44 = 1024;
    int v45 = 94;
    __int16 v46 = 2114;
    v47 = v34;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v23) {
      goto LABEL_11;
    }
  }
  else if (v23)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v35 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completionHandler");
    *(_DWORD *)buf = 136315906;
    v41 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTags:mutedTagIDs:purchasedTagIDs:bundleSubscription"
          "Provider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    __int16 v42 = 2080;
    v43 = "FCForYouQueryUtilities.m";
    __int16 v44 = 1024;
    int v45 = 95;
    __int16 v46 = 2114;
    v47 = v35;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_11:
  if ([v17 count] || !a9)
  {
    v24 = [a1 _filterTagsForQuerying:v17 withMutedTagIDs:v18];
    v23[2](v23, v24, 0);
  }
  else
  {
    v24 = [v21 presubscribedFeedIDs];
    if ([v24 count])
    {
      v25 = FCDispatchQueueForQualityOfService(a10);
      uint64_t v26 = [v22 tagController];
      id v27 = a1;
      id v28 = v22;
      id v29 = v21;
      id v30 = v20;
      v31 = (void *)v26;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __214__FCForYouQueryUtilities_fetchTagsForQueryingWithSubscribedTags_mutedTagIDs_purchasedTagIDs_bundleSubscriptionProvider_configuration_contentContext_fallbackToPresubscribedTagIDs_qualityOfService_completionHandler___block_invoke;
      v36[3] = &unk_1E5B4EDF8;
      id v39 = v27;
      id v37 = v18;
      v38 = v23;
      [v31 fetchTagsForTagIDs:v24 qualityOfService:a10 callbackQueue:v25 completionHandler:v36];

      id v20 = v30;
      id v21 = v29;
      id v22 = v28;
    }
    else
    {
      v25 = objc_opt_new();
      v23[2](v23, v25, 0);
    }
  }
}

void __214__FCForYouQueryUtilities_fetchTagsForQueryingWithSubscribedTags_mutedTagIDs_purchasedTagIDs_bundleSubscriptionProvider_configuration_contentContext_fallbackToPresubscribedTagIDs_qualityOfService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = [a2 allValues];
  v6 = [*(id *)(a1 + 48) _filterTagsForQuerying:v7 withMutedTagIDs:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)fetchTagsForQueryingWithSubscribedTagIDs:(id)a3 mutedTagIDs:(id)a4 purchasedTagIDs:(id)a5 bundleSubscriptionProvider:(id)a6 configuration:(id)a7 contentContext:(id)a8 fallbackToPresubscribedTagIDs:(BOOL)a9 qualityOfService:(int64_t)a10 completionHandler:(id)a11
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v18 = a8;
  id v19 = a11;
  if (!v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "subscribedTagIDs");
    *(_DWORD *)buf = 136315906;
    v49 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscripti"
          "onProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    __int16 v50 = 2080;
    v51 = "FCForYouQueryUtilities.m";
    __int16 v52 = 1024;
    int v53 = 135;
    __int16 v54 = 2114;
    v55 = v29;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v17) {
      goto LABEL_6;
    }
  }
  else if (v17)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "mutedTagIDs");
    *(_DWORD *)buf = 136315906;
    v49 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscripti"
          "onProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    __int16 v50 = 2080;
    v51 = "FCForYouQueryUtilities.m";
    __int16 v52 = 1024;
    int v53 = 136;
    __int16 v54 = 2114;
    v55 = v30;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v18 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v31 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentContext");
    *(_DWORD *)buf = 136315906;
    v49 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscripti"
          "onProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    __int16 v50 = 2080;
    v51 = "FCForYouQueryUtilities.m";
    __int16 v52 = 1024;
    int v53 = 137;
    __int16 v54 = 2114;
    v55 = v31;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v20 = v19;
  if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v32 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completionHandler");
    *(_DWORD *)buf = 136315906;
    v49 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscripti"
          "onProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    __int16 v50 = 2080;
    v51 = "FCForYouQueryUtilities.m";
    __int16 v52 = 1024;
    int v53 = 138;
    __int16 v54 = 2114;
    v55 = v32;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v21 = FCDispatchQueueForQualityOfService(a10);
  id v22 = [v18 tagController];
  v23 = [v16 allObjects];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __216__FCForYouQueryUtilities_fetchTagsForQueryingWithSubscribedTagIDs_mutedTagIDs_purchasedTagIDs_bundleSubscriptionProvider_configuration_contentContext_fallbackToPresubscribedTagIDs_qualityOfService_completionHandler___block_invoke;
  v38[3] = &unk_1E5B4EE20;
  id v39 = v17;
  id v40 = v35;
  id v41 = v34;
  id v42 = v33;
  id v43 = v18;
  BOOL v47 = a9;
  id v44 = v20;
  id v45 = a1;
  int64_t v46 = a10;
  id v37 = v18;
  id v24 = v33;
  id v25 = v34;
  id v26 = v35;
  id v27 = v17;
  id v28 = v20;
  [v22 fetchTagsForTagIDs:v23 qualityOfService:a10 callbackQueue:v21 completionHandler:v38];
}

void __216__FCForYouQueryUtilities_fetchTagsForQueryingWithSubscribedTagIDs_mutedTagIDs_purchasedTagIDs_bundleSubscriptionProvider_configuration_contentContext_fallbackToPresubscribedTagIDs_qualityOfService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = [a2 allValues];
  if (v5)
  {
    LOBYTE(v6) = *(unsigned char *)(a1 + 96);
    [*(id *)(a1 + 80) fetchTagsForQueryingWithSubscribedTags:v5 mutedTagIDs:*(void *)(a1 + 32) purchasedTagIDs:*(void *)(a1 + 40) bundleSubscriptionProvider:*(void *)(a1 + 48) configuration:*(void *)(a1 + 56) contentContext:*(void *)(a1 + 64) fallbackToPresubscribedTagIDs:v6 qualityOfService:*(void *)(a1 + 88) completionHandler:*(void *)(a1 + 72)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

+ (id)feedRequestsForTags:(id)a3 tagBinProvider:(id)a4 hiddenFeedIDs:(id)a5 allowPaidBundleFeed:(BOOL)a6 purchasedTagIDs:(id)a7 bundleSubscriptionProvider:(id)a8 configuration:(id)a9 maxCount:(unint64_t)a10 feedRange:(id)a11 sidecar:(id)a12 isRunningPPT:(BOOL)a13
{
  return (id)objc_msgSend(a1, "feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:maxCount:feedRange:sidecar:options:", a3, a4, a5, a7, a8, a9);
}

+ (id)feedRequestsForTags:(id)a3 tagBinProvider:(id)a4 hiddenFeedIDs:(id)a5 purchasedTagIDs:(id)a6 bundleSubscriptionProvider:(id)a7 configuration:(id)a8 maxCount:(unint64_t)a9 feedRange:(id)a10 sidecar:(id)a11 options:(unint64_t)a12
{
  uint64_t v193 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v110 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v138 = a10;
  id v139 = a11;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v105 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tags");
    *(_DWORD *)buf = 136315906;
    v186 = "+[FCForYouQueryUtilities feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscriptionP"
           "rovider:configuration:maxCount:feedRange:sidecar:options:]";
    __int16 v187 = 2080;
    v188 = "FCForYouQueryUtilities.m";
    __int16 v189 = 1024;
    int v190 = 213;
    __int16 v191 = 2114;
    v192 = v105;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v120 = (uint64_t (**)(void, void))v18;
  if (!v18 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v106 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagBinProvider");
    *(_DWORD *)buf = 136315906;
    v186 = "+[FCForYouQueryUtilities feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscriptionP"
           "rovider:configuration:maxCount:feedRange:sidecar:options:]";
    __int16 v187 = 2080;
    v188 = "FCForYouQueryUtilities.m";
    __int16 v189 = 1024;
    int v190 = 214;
    __int16 v191 = 2114;
    v192 = v106;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v21) {
      goto LABEL_9;
    }
  }
  else if (v21)
  {
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v107 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "configuration");
    *(_DWORD *)buf = 136315906;
    v186 = "+[FCForYouQueryUtilities feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscriptionP"
           "rovider:configuration:maxCount:feedRange:sidecar:options:]";
    __int16 v187 = 2080;
    v188 = "FCForYouQueryUtilities.m";
    __int16 v189 = 1024;
    int v190 = 215;
    __int16 v191 = 2114;
    v192 = v107;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_9:
  if (!a9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v108 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "maxCount");
    *(_DWORD *)buf = 136315906;
    v186 = "+[FCForYouQueryUtilities feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscriptionP"
           "rovider:configuration:maxCount:feedRange:sidecar:options:]";
    __int16 v187 = 2080;
    v188 = "FCForYouQueryUtilities.m";
    __int16 v189 = 1024;
    int v190 = 216;
    __int16 v191 = 2114;
    v192 = v108;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v138 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v109 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "feedRange");
    *(_DWORD *)buf = 136315906;
    v186 = "+[FCForYouQueryUtilities feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscriptionP"
           "rovider:configuration:maxCount:feedRange:sidecar:options:]";
    __int16 v187 = 2080;
    v188 = "FCForYouQueryUtilities.m";
    __int16 v189 = 1024;
    int v190 = 217;
    __int16 v191 = 2114;
    v192 = v109;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v132 = [MEMORY[0x1E4F1CA48] array];
  v131 = [MEMORY[0x1E4F1CA48] array];
  v118 = [MEMORY[0x1E4F1CA48] array];
  v111 = [MEMORY[0x1E4F1CA48] array];
  v113 = [MEMORY[0x1E4F1CA48] array];
  v135 = [MEMORY[0x1E4F1CA48] array];
  v140 = [MEMORY[0x1E4F1CA60] dictionary];
  id v22 = [v21 topStoriesConfig];
  v116 = [v22 channelID];

  v115 = [v21 editorialChannelID];
  v124 = [v21 editorialGemsSectionID];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __167__FCForYouQueryUtilities_feedRequestsForTags_tagBinProvider_hiddenFeedIDs_purchasedTagIDs_bundleSubscriptionProvider_configuration_maxCount_feedRange_sidecar_options___block_invoke;
  aBlock[3] = &unk_1E5B4EE48;
  id v119 = v20;
  id v175 = v119;
  id v117 = v19;
  id v176 = v117;
  id v112 = v21;
  id v177 = v112;
  v128 = (unsigned int (**)(void *, id))_Block_copy(aBlock);
  long long v170 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  obuint64_t j = v17;
  uint64_t v23 = [obj countByEnumeratingWithState:&v170 objects:v184 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v171;
    uint64_t v114 = *(void *)v171;
    do
    {
      uint64_t v26 = 0;
      uint64_t v121 = v24;
      do
      {
        if (*(void *)v171 != v25) {
          objc_enumerationMutation(obj);
        }
        id v27 = *(void **)(*((void *)&v170 + 1) + 8 * v26);
        uint64_t v136 = (*((uint64_t (**)(id, void *))v18 + 2))(v18, v27);
        uint64_t v28 = [v27 tagType];
        if (v28 == 1)
        {
          id v35 = +[FCFeedContext feedContextForTag:v27];
          v36 = objc_alloc_init(FCFeedRequest);
          id v37 = [v27 freeFeedIDForBin:v136];
          [(FCFeedRequest *)v36 setFeedID:v37];
          [(FCFeedRequest *)v36 setFeedRange:v138];
          [(FCFeedRequest *)v36 setMaxCount:a9];
          [v118 addObject:v36];
          [v140 setObject:v35 forKey:v37];
        }
        else if (v28 == 2)
        {
          id v29 = [v27 asChannel];
          id v30 = [v27 identifier];
          int v133 = [v116 isEqualToString:v30];
          int v125 = [v115 isEqualToString:v30];
          int v31 = [v117 containsObject:v30];
          int HasBundleSubscriptionToChannelInline = FCPaidAccessCheckerHasBundleSubscriptionToChannelInline(v119, v30, 8);
          uint64_t v161 = MEMORY[0x1E4F143A8];
          uint64_t v162 = 3221225472;
          v163 = __167__FCForYouQueryUtilities_feedRequestsForTags_tagBinProvider_hiddenFeedIDs_purchasedTagIDs_bundleSubscriptionProvider_configuration_maxCount_feedRange_sidecar_options___block_invoke_2;
          v164 = &unk_1E5B4EE70;
          unint64_t v167 = a12;
          char v168 = v31;
          char v169 = HasBundleSubscriptionToChannelInline;
          id v129 = v30;
          id v165 = v129;
          id v33 = v115;
          id v166 = v33;
          uint64_t v123 = v26;
          if ((a12 & 4) != 0
            || (a12 & 2) == 0
            && (((v31 | HasBundleSubscriptionToChannelInline) & 1) != 0
             || [v129 isEqualToString:v33]))
          {
            id v34 = [v29 sectionIDs];
          }
          else
          {
            id v34 = [v29 defaultSectionID];

            if (v34)
            {
              id v39 = [v29 defaultSectionID];
              v183 = v39;
              id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v183 count:1];
            }
          }
          long long v159 = 0u;
          long long v160 = 0u;
          long long v157 = 0u;
          long long v158 = 0u;
          id v126 = v34;
          uint64_t v40 = [v126 countByEnumeratingWithState:&v157 objects:v182 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v158;
            do
            {
              for (uint64_t i = 0; i != v41; ++i)
              {
                if (*(void *)v158 != v42) {
                  objc_enumerationMutation(v126);
                }
                id v44 = *(void **)(*((void *)&v157 + 1) + 8 * i);
                id v45 = [v29 defaultSectionID];
                int v46 = [v44 isEqualToString:v45];

                BOOL v47 = v132;
                if (!v46) {
                  BOOL v47 = v131;
                }
                id v48 = v47;
                if (v133)
                {
                  uint64_t v49 = +[FCFeedContext feedContextForTopStoriesChannel:v29 sectionID:v44];
                }
                else if (v125)
                {
                  if ([v44 isEqualToString:v124]) {
                    +[FCFeedContext feedContextForEditorialChannel:v29 editorialGemsSectionID:v44];
                  }
                  else {
                  uint64_t v49 = +[FCFeedContext feedContextForEditorialChannel:v29 sectionID:v44];
                  }
                }
                else
                {
                  uint64_t v49 = +[FCFeedContext feedContextForChannel:v29 sectionID:v44];
                }
                __int16 v50 = (void *)v49;
                v51 = [v29 freeFeedIDForSection:v44 bin:v136];
                if (v51)
                {
                  __int16 v52 = objc_alloc_init(FCFeedRequest);
                  [(FCFeedRequest *)v52 setFeedID:v51];
                  [(FCFeedRequest *)v52 setFeedRange:v138];
                  [(FCFeedRequest *)v52 setMaxCount:a9];
                  int v53 = [v29 defaultSectionID];
                  -[FCFeedRequest setIsExpendable:](v52, "setIsExpendable:", [v44 isEqualToString:v53] ^ 1);

                  [v48 addObject:v52];
                  [v140 setObject:v50 forKey:v51];
                  if (v128[2](v128, v129))
                  {
                    __int16 v54 = [v29 paidFeedIDForSection:v44 bin:v136];
                    v55 = v54;
                    if (v54 && ([v54 isEqualToString:v51] & 1) == 0)
                    {
                      uint64_t v56 = (void *)[(FCFeedRequest *)v52 copy];
                      [v56 setFeedID:v55];
                      [v48 addObject:v56];
                      [v140 setObject:v50 forKey:v55];
                    }
                  }
                }
              }
              uint64_t v41 = [v126 countByEnumeratingWithState:&v157 objects:v182 count:16];
            }
            while (v41);
          }

          id v18 = v120;
          uint64_t v24 = v121;
          uint64_t v25 = v114;
          uint64_t v26 = v123;
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v38 = (void *)[[NSString alloc] initWithFormat:@"only expected to build a For You query from channels and topics"];
          *(_DWORD *)buf = 136315906;
          v186 = "+[FCForYouQueryUtilities feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscri"
                 "ptionProvider:configuration:maxCount:feedRange:sidecar:options:]";
          __int16 v187 = 2080;
          v188 = "FCForYouQueryUtilities.m";
          __int16 v189 = 1024;
          int v190 = 371;
          __int16 v191 = 2114;
          v192 = v38;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        ++v26;
      }
      while (v26 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v170 objects:v184 count:16];
    }
    while (v24);
  }

  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  id v57 = v110;
  uint64_t v58 = [v57 countByEnumeratingWithState:&v153 objects:v181 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v154;
    do
    {
      for (uint64_t j = 0; j != v59; ++j)
      {
        if (*(void *)v154 != v60) {
          objc_enumerationMutation(v57);
        }
        uint64_t v62 = *(void *)(*((void *)&v153 + 1) + 8 * j);
        v63 = objc_alloc_init(FCFeedRequest);
        [(FCFeedRequest *)v63 setFeedID:v62];
        [(FCFeedRequest *)v63 setFeedRange:v138];
        [(FCFeedRequest *)v63 setMaxCount:a9];
        [v113 addObject:v63];
        v64 = +[FCFeedContext feedContextForHiddenFeed];
        [v140 setObject:v64 forKeyedSubscript:v62];
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v153 objects:v181 count:16];
    }
    while (v59);
  }

  if ((a12 & 1) == 0)
  {
    uint64_t v65 = [v119 bundleSubscription];
    v66 = objc_getAssociatedObject((id)v65, (const void *)(v65 + 1));
    uint64_t v67 = [v66 unsignedIntegerValue];
    char v68 = v67;
    v69 = objc_getAssociatedObject((id)v65, (const void *)~v67);
    char v70 = ([v69 unsignedIntegerValue] + 1) ^ (v68 + 1);

    v71 = [v112 paidBundleConfig];
    v72 = v71;
    if (v70) {
      [v71 globalFeedIDForPaidUsers];
    }
    else {
    v73 = [v71 globalFeedIDForFreeUsers];
    }

    if (v73)
    {
      v74 = [v112 paidBundleConfig];
      int v75 = [v74 areMagazinesEnabled];

      if (v75)
      {
        v76 = objc_alloc_init(FCFeedRequest);
        [(FCFeedRequest *)v76 setFeedID:v73];
        [(FCFeedRequest *)v76 setFeedRange:v138];
        [(FCFeedRequest *)v76 setMaxCount:a9];
        [v111 addObject:v76];
        v77 = +[FCFeedContext feedContextForPaidBundleFeed];
        [v140 setObject:v77 forKeyedSubscript:v73];
      }
    }
  }
  v127 = v57;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v130 = [v139 additionalChannelsToQuery];
  uint64_t v137 = [v130 countByEnumeratingWithState:&v149 objects:v180 count:16];
  if (v137)
  {
    uint64_t v134 = *(void *)v150;
    do
    {
      for (uint64_t k = 0; k != v137; ++k)
      {
        if (*(void *)v150 != v134) {
          objc_enumerationMutation(v130);
        }
        v79 = *(void **)(*((void *)&v149 + 1) + 8 * k);
        long long v145 = 0u;
        long long v146 = 0u;
        long long v147 = 0u;
        long long v148 = 0u;
        v80 = [v139 additionalSectionIDsToQueryForChannel:v79];
        uint64_t v81 = [v80 countByEnumeratingWithState:&v145 objects:v179 count:16];
        if (v81)
        {
          uint64_t v82 = v81;
          uint64_t v83 = *(void *)v146;
          do
          {
            for (uint64_t m = 0; m != v82; ++m)
            {
              if (*(void *)v146 != v83) {
                objc_enumerationMutation(v80);
              }
              uint64_t v85 = *(void *)(*((void *)&v145 + 1) + 8 * m);
              v86 = +[FCFeedContext feedContextForChannel:v79 sectionID:v85];
              v87 = [v79 freeFeedIDForSection:v85 bin:3];
              if (v87)
              {
                v88 = [v140 objectForKey:v87];

                if (!v88)
                {
                  v89 = objc_alloc_init(FCFeedRequest);
                  [(FCFeedRequest *)v89 setFeedID:v87];
                  [(FCFeedRequest *)v89 setFeedRange:v138];
                  [(FCFeedRequest *)v89 setMaxCount:a9];
                  [(FCFeedRequest *)v89 setIsExpendable:1];
                  [v135 addObject:v89];
                  [v140 setObject:v86 forKey:v87];
                }
              }
              if ([v139 shouldIncludePaidFeedForChannel:v79])
              {
                v90 = [v79 paidFeedIDForSection:v85 bin:3];
                if (v90)
                {
                  v91 = [v140 objectForKey:v90];

                  if (!v91)
                  {
                    v92 = objc_alloc_init(FCFeedRequest);
                    [(FCFeedRequest *)v92 setFeedID:v90];
                    [(FCFeedRequest *)v92 setFeedRange:v138];
                    [(FCFeedRequest *)v92 setMaxCount:a9];
                    [(FCFeedRequest *)v92 setIsExpendable:1];
                    [v135 addObject:v92];
                    [v140 setObject:v86 forKey:v90];
                  }
                }
              }
            }
            uint64_t v82 = [v80 countByEnumeratingWithState:&v145 objects:v179 count:16];
          }
          while (v82);
        }
      }
      uint64_t v137 = [v130 countByEnumeratingWithState:&v149 objects:v180 count:16];
    }
    while (v137);
  }

  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  v93 = [v139 additionalTopicsToQuery];
  uint64_t v94 = [v93 countByEnumeratingWithState:&v141 objects:v178 count:16];
  if (v94)
  {
    uint64_t v95 = v94;
    uint64_t v96 = *(void *)v142;
    do
    {
      for (uint64_t n = 0; n != v95; ++n)
      {
        if (*(void *)v142 != v96) {
          objc_enumerationMutation(v93);
        }
        v98 = *(void **)(*((void *)&v141 + 1) + 8 * n);
        v99 = +[FCFeedContext feedContextForTag:v98];
        v100 = objc_msgSend(v98, "freeFeedIDForBin:", ((uint64_t (**)(void, void *))v120)[2](v120, v98));
        if (v100)
        {
          v101 = [v140 objectForKey:v100];

          if (!v101)
          {
            v102 = objc_alloc_init(FCFeedRequest);
            [(FCFeedRequest *)v102 setFeedID:v100];
            [(FCFeedRequest *)v102 setFeedRange:v138];
            [(FCFeedRequest *)v102 setMaxCount:a9];
            [v135 addObject:v102];
            [v140 setObject:v99 forKey:v100];
          }
        }
      }
      uint64_t v95 = [v93 countByEnumeratingWithState:&v141 objects:v178 count:16];
    }
    while (v95);
  }

  v103 = [[FCForYouQueryResult alloc] initWithChannelDefaultSectionRequests:v132 channelOtherSectionsRequests:v131 topicRequests:v118 paidBundleRequests:v111 hiddenFeedRequests:v113 sidecarRequests:v135 feedContextByFeedID:v140];
  return v103;
}

uint64_t __167__FCForYouQueryUtilities_feedRequestsForTags_tagBinProvider_hiddenFeedIDs_purchasedTagIDs_bundleSubscriptionProvider_configuration_maxCount_feedRange_sidecar_options___block_invoke(void **a1, void *a2)
{
  v3 = a1[4];
  id v4 = a2;
  id v5 = [v3 bundleSubscription];
  uint64_t v6 = [v5 bundleChannelIDs];
  int v7 = [(id)v6 containsObject:v4];

  LOBYTE(v6) = [a1[5] containsObject:v4];
  int HasBundleSubscriptionToChannelInline = FCPaidAccessCheckerHasBundleSubscriptionToChannelInline(a1[4], v4, 235);

  if (v6) {
    return 1;
  }
  if ((v7 & HasBundleSubscriptionToChannelInline) == 1)
  {
    v10 = [a1[6] paidBundleConfig];
    char v11 = [v10 forYouIncludePaidSectionFeedsForPaidUsers];

    if (v11) {
      return 1;
    }
  }
  if ((v7 ^ 1 | HasBundleSubscriptionToChannelInline)) {
    return 0;
  }
  v12 = [a1[6] paidBundleConfig];
  uint64_t v13 = [v12 forYouIncludePaidSectionFeedsForFreeUsers];

  return v13;
}

uint64_t __167__FCForYouQueryUtilities_feedRequestsForTags_tagBinProvider_hiddenFeedIDs_purchasedTagIDs_bundleSubscriptionProvider_configuration_maxCount_feedRange_sidecar_options___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if ((v1 & 4) != 0) {
    return 1;
  }
  if ((v1 & 2) != 0) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 56) || *(unsigned char *)(a1 + 57)) {
    return 1;
  }
  return [*(id *)(a1 + 32) isEqualToString:*(void *)(a1 + 40)];
}

+ (id)_filterTagsForQuerying:(id)a3 withMutedTagIDs:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    char v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tags");
    *(_DWORD *)buf = 136315906;
    id v16 = "+[FCForYouQueryUtilities _filterTagsForQuerying:withMutedTagIDs:]";
    __int16 v17 = 2080;
    id v18 = "FCForYouQueryUtilities.m";
    __int16 v19 = 1024;
    int v20 = 472;
    __int16 v21 = 2114;
    id v22 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "mutedTagIDs");
    *(_DWORD *)buf = 136315906;
    id v16 = "+[FCForYouQueryUtilities _filterTagsForQuerying:withMutedTagIDs:]";
    __int16 v17 = 2080;
    id v18 = "FCForYouQueryUtilities.m";
    __int16 v19 = 1024;
    int v20 = 473;
    __int16 v21 = 2114;
    id v22 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__FCForYouQueryUtilities__filterTagsForQuerying_withMutedTagIDs___block_invoke;
  v13[3] = &unk_1E5B4EE98;
  id v14 = v6;
  id v7 = v6;
  v8 = objc_msgSend(v5, "fc_arrayOfObjectsPassingTest:", v13);
  v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];

  return v9;
}

uint64_t __65__FCForYouQueryUtilities__filterTagsForQuerying_withMutedTagIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 asChannel];
  id v5 = [v3 asSection];

  if (v4)
  {
    id v6 = *(void **)(a1 + 32);
    id v3 = [v4 identifier];
    if ([v6 containsObject:v3])
    {
      uint64_t v7 = 0;
LABEL_10:

      goto LABEL_11;
    }
    if (!v5)
    {
      uint64_t v7 = 1;
      goto LABEL_10;
    }
LABEL_7:
    v8 = *(void **)(a1 + 32);
    v9 = [v5 parentID];
    uint64_t v7 = [v8 containsObject:v9] ^ 1;

    if (!v4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v5) {
    goto LABEL_7;
  }
  uint64_t v7 = 1;
LABEL_11:

  return v7;
}

@end