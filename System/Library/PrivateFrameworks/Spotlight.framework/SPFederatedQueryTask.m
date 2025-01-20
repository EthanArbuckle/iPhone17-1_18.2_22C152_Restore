@interface SPFederatedQueryTask
+ (BOOL)isCJK;
+ (BOOL)sectionSupportsShowMoreInApp:(id)a3;
+ (id)appGenreMap;
+ (id)contactEntityFromQueryContext:(id)a3;
+ (id)queryClasses;
+ (id)searchContinuationCompatibilitySet;
+ (void)activate;
+ (void)deactivate;
+ (void)initialize;
+ (void)invalidateCacheForSearchContinuation;
+ (void)prepareCacheForSearchContinuation;
- (BOOL)active;
- (BOOL)allowAnonymousDataCollection;
- (BOOL)didReceiveCompleteCallback;
- (BOOL)didReceiveCoreSpotlightProgress;
- (BOOL)enforcePreferredBundleIDs;
- (BOOL)forceAboveFoldResultsWithQuery:(id)a3 topHitSection:(id)a4 sections:(id)a5;
- (BOOL)genreGroupingEnabled;
- (BOOL)isBullseyeCommittedSearch;
- (BOOL)isBullseyeNonCommittedSearch;
- (BOOL)isCJK;
- (BOOL)isEntitySearch;
- (BOOL)isInternalDevice;
- (BOOL)isNLPSearch;
- (BOOL)isPeopleSearch;
- (BOOL)isPhotosSearch;
- (BOOL)isRewrite;
- (BOOL)isScopedAppSearch;
- (BOOL)needsReRunForFuzzy;
- (BOOL)newQuery;
- (BOOL)parsecAvailable;
- (BOOL)prefersLocalUserTypedSuggestion;
- (BOOL)readyToUpdate;
- (BOOL)started;
- (BOOL)storeCompletedSearch:(id)a3 withSections:(id)a4;
- (BOOL)storeCompletedSearch:(id)a3 withSections:(id)a4 suggestionResults:(id)a5;
- (BOOL)storeSearchProgress:(id)a3 withSections:(id)a4 suggestionResults:(id)a5;
- (BOOL)suggestionsAreBlended;
- (BOOL)topHitsReadyToSend:(id)a3;
- (NSArray)corrections;
- (NSArray)localSuggestionResults;
- (NSArray)preferredBundleIDs;
- (NSArray)queries;
- (NSArray)serverSuggestionResults;
- (NSArray)showMoreInAppInfo;
- (NSArray)supportedAppScopes;
- (NSDictionary)searchThroughCEPData;
- (NSDictionary)server_features;
- (NSMutableArray)delayedStartQueries;
- (NSMutableArray)delayedStartTokens;
- (NSMutableArray)finishedTokens;
- (NSMutableArray)matchInfo;
- (NSMutableArray)slowTokens;
- (NSMutableArray)tokens;
- (NSMutableDictionary)categoryEngagements;
- (NSMutableDictionary)categoryToResultMapping;
- (NSMutableOrderedSet)sectionOrderByInsertion;
- (NSNumber)experimentalWeight;
- (NSString)clientBundleID;
- (NSString)fbq;
- (NSString)geoUserSessionEntityString;
- (NSString)mutableSessionEntityString;
- (NSString)web_fbq;
- (OS_dispatch_semaphore)correctionsSem;
- (OS_xpc_object)perfDictionary;
- (PRSRankingItemRanker)itemRanker;
- (SFMutableResultSection)suggestionsSection;
- (SFMutableResultSection)topHitSection;
- (SPCSSearchQuery)csQuery;
- (SPClientSession)session;
- (SPParsecQuery)parsecQuery;
- (SPXPCConnection)connection;
- (SPXPCMessage)message;
- (SSRankingManager)rankingManager;
- (__CFArray)copyMatchInfo;
- (double)blendingTime;
- (double)startTimeIntervalSinceReferenceDate;
- (double)storeStartTime;
- (id)_queriesForSearchTool;
- (id)_queriesForUserQuery:(BOOL)a3;
- (id)contactSuggestionsWithSearchString:(id)a3;
- (id)correctedQueryWithCorrection:(id)a3;
- (id)dedupeLocalSectionsByBundleId:(id)a3;
- (id)detailTextFromBundleIDs:(id)a3;
- (id)displayedText;
- (id)initForSession:(id)a3 withQuery:(id)a4;
- (id)orderedCategories:(id)a3;
- (id)retainAndMergeSections:(id)a3 forState:(unint64_t)a4;
- (id)searchString;
- (id)suggestionsWithSearchString:(id)a3 sections:(id)a4 topHitSection:(id)a5 highestLocalScore:(double)a6;
- (id)unsafeSections;
- (id)unsafeSessionEntityString;
- (id)waitForQueryCorrections;
- (int64_t)initiallyHiddenSectionSentCount;
- (int64_t)initiallyVisibleSectionSentCount;
- (unint64_t)previousQueryKind;
- (unint64_t)queryIdent;
- (unint64_t)startTime;
- (unsigned)externalID;
- (void)_processResponse:(id)a3 toQuery:(id)a4;
- (void)_updateQueryContext:(id)a3;
- (void)activate;
- (void)addAndStartQuery;
- (void)addDelayedStartQuery:(id)a3;
- (void)addDictionarySections:(id)a3;
- (void)addMatchInfo:(_MDPlistContainer *)a3;
- (void)addQueryCorrections:(id)a3;
- (void)addQueryToken:(id)a3;
- (void)addSections:(id)a3 delayedTopHit:(BOOL)a4;
- (void)addSlowQueryToken:(id)a3;
- (void)addSuggestionsToSectionsForSending:(id)a3 searchString:(id)a4 updatedSections:(BOOL)a5 queryKind:(unint64_t)a6;
- (void)addTopHitSectionIfNecessaryToSectionsForSending:(id)a3 updatedSections:(BOOL)a4 isScopedSearch:(BOOL)a5;
- (void)allowAnonymousDataCollection:(BOOL)a3;
- (void)cancel;
- (void)cancelQuery;
- (void)clear;
- (void)deDuplicateMailResults:(id)a3;
- (void)deDuplicateSection:(id)a3 againstSection:(id)a4;
- (void)dealloc;
- (void)handleOptionsForNewSections:(id)a3;
- (void)logPerfToAnalytics:(int)a3;
- (void)mergeRelatedContentFromSections:(id)a3 bundlesToMerge:(id)a4 mergedSectionId:(id)a5;
- (void)mergeSections;
- (void)prepareAndSend:(id)a3 force:(BOOL)a4 moreComing:(BOOL)a5 reason:(int)a6;
- (void)processAppResults:(id)a3 maxAppResults:(unint64_t)a4 section:(id)a5 topHitsIndex:(unint64_t *)a6;
- (void)queryTask:(id)a3 gotResponse:(id)a4;
- (void)relatedContentSectionMerging:(id)a3;
- (void)searchQuery:(id)a3 gotResultSet:(id)a4 replace:(BOOL)a5 partiallyComplete:(BOOL)a6 priorityFastPath:(BOOL)a7 update:(BOOL)a8 complete:(BOOL)a9 delayedTopHit:(BOOL)a10 unchanged:(BOOL)a11 forceStable:(BOOL)a12 blendingDuration:(double)a13 geoEntityString:(id)a14 supportedAppScopes:(id)a15 showMoreInAppInfo:(id)a16;
- (void)searchQueryEncounteredError:(id)a3;
- (void)sendError:(id)a3;
- (void)sendFinishedDomains:(BOOL)a3 reason:(int)a4;
- (void)sendFinishedDomains:(int)a3;
- (void)sendFinishedDomainsZKW:(BOOL)a3;
- (void)sendQueryCompleted;
- (void)sendQueryReset;
- (void)sendResults:(id)a3 reset:(BOOL)a4 partiallyComplete:(BOOL)a5 update:(BOOL)a6 complete:(BOOL)a7 delayedTopHit:(BOOL)a8 reason:(int)a9;
- (void)sendResults:(id)a3 reset:(BOOL)a4 partiallyComplete:(BOOL)a5 update:(BOOL)a6 complete:(BOOL)a7 unchanged:(BOOL)a8 delayedTopHit:(BOOL)a9 reason:(int)a10;
- (void)sendResultsForKeys:(id)a3 toSendSections:(id)a4;
- (void)sendTTRLogsWithSections:(id)a3;
- (void)serverSideDedupe:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAllowAnonymousDataCollection:(BOOL)a3;
- (void)setBlendingTime:(double)a3;
- (void)setBundlesSupportingAppScoping:(id)a3;
- (void)setCategoryEngagements:(id)a3;
- (void)setCategoryToResultMapping:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setCorrections:(id)a3;
- (void)setCorrectionsSem:(id)a3;
- (void)setCsQuery:(id)a3;
- (void)setDelayedStartQueries:(id)a3;
- (void)setDelayedStartTokens:(id)a3;
- (void)setDidReceiveCompleteCallback:(BOOL)a3;
- (void)setDidReceiveCoreSpotlightProgress:(BOOL)a3;
- (void)setEnforcePreferredBundleIDs:(BOOL)a3;
- (void)setExperimentalWeight:(id)a3;
- (void)setFinishedTokens:(id)a3;
- (void)setGenreGroupingEnabled:(BOOL)a3;
- (void)setGeoUserSessionEntityString:(id)a3;
- (void)setIsCJK:(BOOL)a3;
- (void)setIsEntitySearch:(BOOL)a3;
- (void)setIsInternalDevice:(BOOL)a3;
- (void)setIsNLPSearch:(BOOL)a3;
- (void)setIsPeopleSearch:(BOOL)a3;
- (void)setIsPhotosSearch:(BOOL)a3;
- (void)setIsRewrite:(BOOL)a3;
- (void)setIsScopedAppSearch:(BOOL)a3;
- (void)setItemRanker:(id)a3;
- (void)setLocalSuggestionResults:(id)a3;
- (void)setMatchInfo:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMutableSessionEntityString:(id)a3;
- (void)setNeedsReRunForFuzzy:(BOOL)a3;
- (void)setNewQuery:(BOOL)a3;
- (void)setParsecQuery:(id)a3;
- (void)setPerfDictionary:(id)a3;
- (void)setPreferredBundleIDs:(id)a3;
- (void)setPrefersLocalUserTypedSuggestion:(BOOL)a3;
- (void)setPreviousQueryKind:(unint64_t)a3;
- (void)setQueries:(id)a3;
- (void)setRankingManager:(id)a3;
- (void)setSearchThroughCEPData:(id)a3;
- (void)setSectionOrderByInsertion:(id)a3;
- (void)setServerSuggestionResults:(id)a3;
- (void)setServer_features:(id)a3;
- (void)setSession:(id)a3;
- (void)setShowMoreInAppInfo:(id)a3;
- (void)setSlowTokens:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setSuggestionsAreBlended:(BOOL)a3;
- (void)setSupportedAppScopes:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTokens:(id)a3;
- (void)start;
- (void)startSetup;
- (void)storeWillComplete:(id)a3;
- (void)truncateSuggestionsSectionToFit:(id)a3;
- (void)updateResultsWithContactHeader;
@end

@implementation SPFederatedQueryTask

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"com.apple.application", @"com.apple.mobilesafari", @"com.apple.Preferences", @"com.apple.MobileAddressBook", @"com.apple.shortcuts", 0);
    v3 = (void *)sEligibleBundleSet;
    sEligibleBundleSet = v2;

    uint64_t v4 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithObjects:", @"com.apple.mobilecal", @"com.apple.Health", @"com.apple.Music", @"com.apple.podcasts", @"com.apple.reminders", @"com.apple.MobileAddressBook", @"com.apple.mobilenotes", @"com.apple.mobilemail", @"com.apple.MobileSMS", @"com.apple.Maps", @"com.apple.DocumentsApp", 0);
    v5 = (void *)sSearchContinuationCompatibilityCache;
    sSearchContinuationCompatibilityCache = v4;

    v6 = (void *)sAppGenreCache;
    sAppGenreCache = (uint64_t)&unk_26E931250;

    sDeviceClass = (int)MGGetSInt32Answer();
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_overcommit();
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.SpotlightFramework.workq", v8);
    v10 = (void *)__workQueue;
    __workQueue = (uint64_t)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.search.daemonQueue", v12);
    v14 = (void *)__lifeCycleQueue;
    __lifeCycleQueue = (uint64_t)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.SpotlightFramework.bgworkq", v16);
    v18 = (void *)__backgroundWorkQueue;
    __backgroundWorkQueue = (uint64_t)v17;

    v19 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.searchd"];
    [v19 BOOLForKey:@"enableDebug"];
    SPSetAppsChangedBlockClient();
    v20 = dispatch_get_global_queue(17, 0);
    tracing_dispatch_async();
  }
}

void __34__SPFederatedQueryTask_initialize__block_invoke(uint64_t a1)
{
  uint64_t v2 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235D0B000, v2, OS_LOG_TYPE_DEFAULT, "Apps changed", buf, 2u);
  }

  v3 = __workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SPFederatedQueryTask_initialize__block_invoke_239;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  dispatch_block_t v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(v3, v4);
}

uint64_t __34__SPFederatedQueryTask_initialize__block_invoke_239()
{
  v0 = objc_opt_class();
  return [v0 invalidateCacheForSearchContinuation];
}

void __34__SPFederatedQueryTask_initialize__block_invoke_2()
{
  id v1 = [MEMORY[0x263F78D10] sharedManager];
  v0 = [MEMORY[0x263F674B0] sharedProxy];
  [v1 setFeedbackDelegate:v0];
}

+ (id)appGenreMap
{
  os_unfair_lock_lock((os_unfair_lock_t)&sCacheLock);
  uint64_t v2 = (void *)[(id)sAppGenreCache copy];
  os_unfair_lock_unlock((os_unfair_lock_t)&sCacheLock);
  return v2;
}

+ (id)searchContinuationCompatibilitySet
{
  os_unfair_lock_lock((os_unfair_lock_t)&sCacheLock);
  uint64_t v2 = (void *)[(id)sSearchContinuationCompatibilityCache copy];
  os_unfair_lock_unlock((os_unfair_lock_t)&sCacheLock);
  return v2;
}

+ (id)queryClasses
{
  if (queryClasses_onceToken != -1) {
    dispatch_once(&queryClasses_onceToken, &__block_literal_global_244);
  }
  uint64_t v2 = (void *)queryClasses_queryClasses;
  return v2;
}

void __36__SPFederatedQueryTask_queryClasses__block_invoke()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:5];
  id v1 = (void *)queryClasses_queryClasses;
  queryClasses_queryClasses = v0;

  if (_os_feature_enabled_impl())
  {
    uint64_t v2 = objc_msgSend((id)queryClasses_queryClasses, "arrayByAddingObject:", objc_opt_class(), v8, v9, v10, v11);
    v3 = (void *)queryClasses_queryClasses;
    queryClasses_queryClasses = v2;
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v4 = [(id)queryClasses_queryClasses arrayByAddingObject:objc_opt_class()];
    v5 = (void *)queryClasses_queryClasses;
    queryClasses_queryClasses = v4;
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = [(id)queryClasses_queryClasses arrayByAddingObject:objc_opt_class()];
    v7 = (void *)queryClasses_queryClasses;
    queryClasses_queryClasses = v6;
  }
}

- (id)_queriesForUserQuery:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v30 = (id)objc_opt_new();
  v5 = [(SPQueryTask *)self query];
  uint64_t v6 = [v5 queryContext];

  +[SPCalculatorQuery enableConversion:1];
  +[SPCalculatorQuery enableCalculator:1];
  +[SPDictionaryQuery enableDictionary:1];
  v31 = v6;
  v7 = [v6 disabledBundles];
  int v8 = [v7 containsObject:@"com.apple.conversion"];

  if (v8) {
    +[SPCalculatorQuery enableConversion:0];
  }
  uint64_t v9 = [v6 disabledBundles];
  int v10 = [v9 containsObject:@"com.apple.calculator"];

  if (v10)
  {
    +[SPCalculatorQuery enableConversion:0];
    +[SPCalculatorQuery enableCalculator:0];
  }
  if ([(SPFederatedQueryTask *)self isPeopleSearch]
    || [(SPFederatedQueryTask *)self isScopedAppSearch])
  {
    +[SPDictionaryQuery enableDictionary:0];
    +[SPCalculatorQuery enableConversion:0];
    +[SPCalculatorQuery enableCalculator:0];
  }
  uint64_t v11 = [(SPQueryTask *)self query];
  uint64_t v12 = [v11 queryContext];
  uint64_t v13 = [v12 options];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v14 = [(id)objc_opt_class() queryClasses];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    v18 = &unk_26E931318;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        v20 = *(objc_class **)(*((void *)&v32 + 1) + 8 * i);
        if (!v3 || v20 != (objc_class *)objc_opt_class())
        {
          v21 = SPGetDisabledDomains();
          if ([v21 containsObject:v18])
          {
            BOOL v22 = v3;
            v23 = v18;
            uint64_t v24 = objc_opt_class();

            BOOL v25 = v20 == (objc_class *)v24;
            v18 = v23;
            BOOL v3 = v22;
            if (v25) {
              continue;
            }
          }
          else
          {
          }
          if ([(objc_class *)v20 isQuerySupported:v13])
          {
            id v26 = [v20 alloc];
            v27 = [v31 searchString];
            v28 = objc_msgSend(v26, "initWithUserQuery:queryGroupId:options:queryContext:", v27, objc_msgSend(v31, "queryIdent"), v13, v31);

            if (v28) {
              [v30 addObject:v28];
            }
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v16);
  }

  return v30;
}

- (id)_queriesForSearchTool
{
  BOOL v3 = objc_opt_new();
  uint64_t v4 = [(SPQueryTask *)self query];
  v5 = [v4 queryContext];

  uint64_t v6 = (void *)MEMORY[0x263F78DB0];
  v7 = [v5 searchString];
  int v8 = [v6 normalizeSearchString:v7 queryContext:v5];
  [v5 setSearchString:v8];

  uint64_t v9 = [SPCSSearchQuery alloc];
  int v10 = [v5 searchString];
  uint64_t v11 = -[SPCSSearchQuery initWithUserQuery:queryGroupId:options:queryContext:](v9, "initWithUserQuery:queryGroupId:options:queryContext:", v10, [v5 queryIdent], objc_msgSend(v5, "options"), v5);

  if (v11) {
    [v3 addObject:v11];
  }

  return v3;
}

- (void)startSetup
{
  BOOL v3 = SPLogForSPLogCategoryTelemetry();
  uint64_t v4 = v3;
  os_signpost_id_t externalID = self->_externalID;
  if (externalID && os_signpost_enabled(v3))
  {
    *(_WORD *)int v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_235D0B000, v4, OS_SIGNPOST_INTERVAL_BEGIN, externalID, "spotlightLatency", " enableTelemetry=YES ", v10, 2u);
  }

  self->_startTime = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  self->_startTimeIntervalSinceReferenceDate = v6;
  v7 = [(SPQueryTask *)self query];
  int v8 = [v7 queryContext];
  uint64_t v9 = [v8 searchString];
  SDTraceAdd();

  self->_genreGroupingEnabled = SPGenreGroupingEnabled();
  self->_shouldRecomputeSuggestions = 1;
}

- (void)addQueryToken:(id)a3
{
}

- (void)addSlowQueryToken:(id)a3
{
}

- (void)addDelayedStartQuery:(id)a3
{
}

- (void)cancelQuery
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  SDTraceAdd();
  BOOL v3 = [(SPQueryTask *)self query];
  [v3 cancel];

  uint64_t v4 = [(SPFederatedQueryTask *)self itemRanker];
  [v4 cancel];

  [(SSRankingManager *)self->_rankingManager cancel];
  v5 = (void *)[(NSMutableArray *)self->_slowTokens copy];
  double v6 = (void *)[(NSMutableArray *)self->_tokens copy];
  slowTokens = self->_slowTokens;
  self->_slowTokens = 0;

  tokens = self->_tokens;
  self->_tokens = 0;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v13++) cancel];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v11);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v18++), "cancel", (void)v20);
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }

  categoryToResultMapping = self->_categoryToResultMapping;
  self->_categoryToResultMapping = 0;

  self->_sentTaggedTopHits = 0;
  [(SPFederatedQueryTask *)self setMessage:0];
}

+ (void)prepareCacheForSearchContinuation
{
}

void __57__SPFederatedQueryTask_prepareCacheForSearchContinuation__block_invoke()
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (sCacheUpToDate) {
    return;
  }
  if (!sSRResources_block_invoke_sSearchContinuationCompatibilityNegativeCache)
  {
    uint64_t v0 = objc_opt_new();
    id v1 = (void *)sSRResources_block_invoke_sSearchContinuationCompatibilityNegativeCache;
    sSRResources_block_invoke_sSearchContinuationCompatibilityNegativeCache = v0;
  }
  uint64_t v2 = SPCopyVisibleApps();
  os_unfair_lock_lock((os_unfair_lock_t)&sCacheLock);
  BOOL v3 = (void *)[(id)sAppGenreCache mutableCopy];
  uint64_t v4 = (void *)[(id)sSearchContinuationCompatibilityCache mutableCopy];
  os_unfair_lock_unlock((os_unfair_lock_t)&sCacheLock);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
  id obj = v5;
  if (!v6) {
    goto LABEL_47;
  }
  uint64_t v8 = v6;
  uint64_t v32 = 0;
  uint64_t v9 = *(void *)v37;
  *(void *)&long long v7 = 138412290;
  long long v31 = v7;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v37 != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v36 + 1) + 8 * i);
      if ((objc_msgSend(v4, "containsObject:", v11, v31) & 1) == 0
        && ([(id)sSRResources_block_invoke_sSearchContinuationCompatibilityNegativeCache containsObject:v11] & 1) == 0)
      {
        id v12 = objc_alloc(MEMORY[0x263F01878]);
        id v35 = 0;
        uint64_t v13 = (void *)[v12 initWithBundleIdentifier:v11 allowPlaceholder:1 error:&v35];
        id v14 = v35;
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = SPLogForSPLogCategoryDefault();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v31;
            v41 = v15;
            _os_log_error_impl(&dword_235D0B000, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        if (v13)
        {
          char v17 = [v13 supportsSpotlightQueryContinuation];
          uint64_t v18 = [v13 iTunesMetadata];
          v19 = [v18 genre];

          if (v17)
          {
            LODWORD(v32) = 1;
            long long v20 = v4;
            goto LABEL_20;
          }
        }
        else
        {
          v19 = 0;
        }
        long long v20 = (void *)sSRResources_block_invoke_sSearchContinuationCompatibilityNegativeCache;
LABEL_20:
        [v20 addObject:v11];
        long long v21 = [v3 objectForKey:v11];

        if (!v21 && v19 && ([v19 isEqual:&stru_26E92AFF0] & 1) == 0)
        {
          [v3 setObject:v19 forKey:v11];
          HIDWORD(v32) = 1;
        }
      }
      long long v22 = [v3 objectForKey:v11];

      if (!v22)
      {
        id v23 = objc_alloc(MEMORY[0x263F01878]);
        id v34 = 0;
        long long v24 = (void *)[v23 initWithBundleIdentifier:v11 allowPlaceholder:1 error:&v34];
        id v25 = v34;
        if (v25)
        {
          long long v26 = v25;
          long long v27 = SPLogForSPLogCategoryDefault();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v31;
            v41 = v26;
            _os_log_error_impl(&dword_235D0B000, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        v28 = [v24 iTunesMetadata];
        v29 = [v28 genre];

        if (v29 && ([v29 isEqual:&stru_26E92AFF0] & 1) == 0)
        {
          [v3 setObject:v29 forKey:v11];
          HIDWORD(v32) = 1;
        }
      }
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  }
  while (v8);

  if ((v32 | HIDWORD(v32)))
  {
    if ((v32 & 0x100000000) != 0)
    {
      id v5 = (id)[v3 copy];
      if ((v32 & 1) == 0)
      {
        uint64_t v30 = 0;
        goto LABEL_42;
      }
LABEL_41:
      uint64_t v30 = (void *)[v4 copy];
    }
    else
    {
      id v5 = 0;
      uint64_t v30 = 0;
      if (v32) {
        goto LABEL_41;
      }
    }
LABEL_42:
    os_unfair_lock_lock((os_unfair_lock_t)&sCacheLock);
    if (v5) {
      objc_storeStrong((id *)&sAppGenreCache, v5);
    }
    if (v30) {
      objc_storeStrong((id *)&sSearchContinuationCompatibilityCache, v30);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sCacheLock);

LABEL_47:
  }
  sCacheUpToDate = 1;
}

+ (void)invalidateCacheForSearchContinuation
{
}

void __60__SPFederatedQueryTask_invalidateCacheForSearchContinuation__block_invoke()
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v0 = SPCopyVisibleApps();
  os_unfair_lock_lock((os_unfair_lock_t)&sCacheLock);
  id v1 = (void *)[(id)sAppGenreCache mutableCopy];
  os_unfair_lock_unlock((os_unfair_lock_t)&sCacheLock);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    char v22 = 0;
    uint64_t v5 = *(void *)v27;
    unint64_t v6 = 0x263F01000uLL;
    id v23 = v2;
    uint64_t v24 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      uint64_t v25 = v4;
      do
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v26 + 1) + 8 * v7);
        uint64_t v9 = [v1 objectForKey:v8];

        if (!v9)
        {
          uint64_t v10 = [*(id *)(v6 + 2152) applicationProxyForIdentifier:v8];
          uint64_t v11 = SPLogForSPLogCategoryDefault();
          os_log_type_t v12 = 2 * (*MEMORY[0x263F67540] == 0);
          if (os_log_type_enabled(v11, v12))
          {
            uint64_t v13 = [v10 genre];
            [v10 subgenres];
            uint64_t v15 = v14 = v1;
            [v10 genreID];
            char v17 = v16 = v6;
            *(_DWORD *)buf = 138413058;
            uint64_t v31 = v8;
            __int16 v32 = 2112;
            long long v33 = v13;
            __int16 v34 = 2112;
            id v35 = v15;
            __int16 v36 = 2112;
            long long v37 = v17;
            _os_log_impl(&dword_235D0B000, v11, v12, "%@ genre %@, subgenre %@, id %@", buf, 0x2Au);

            unint64_t v6 = v16;
            id v1 = v14;
            id v2 = v23;
            uint64_t v5 = v24;

            uint64_t v4 = v25;
          }

          uint64_t v18 = [v10 genre];
          v19 = v18;
          if (v18 && ([v18 isEqual:&stru_26E92AFF0] & 1) == 0)
          {
            [v1 setObject:v19 forKey:v8];
            char v22 = 1;
          }
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v4);

    if (v22)
    {
      uint64_t v20 = [v1 copy];
      os_unfair_lock_lock((os_unfair_lock_t)&sCacheLock);
      long long v21 = (void *)sAppGenreCache;
      sAppGenreCache = v20;

      os_unfair_lock_unlock((os_unfair_lock_t)&sCacheLock);
    }
  }
  else
  {
  }
  sCacheUpToDate = 0;
}

+ (BOOL)sectionSupportsShowMoreInApp:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[SPFederatedQueryTask searchContinuationCompatibilitySet];
  uint64_t v5 = [v3 bundleIdentifier];

  LOBYTE(v3) = [v4 containsObject:v5];
  return (char)v3;
}

- (void)setBundlesSupportingAppScoping:(id)a3
{
  self->_bundlesSupportingAppScoping = [a3 allObjects];
  MEMORY[0x270F9A758]();
}

- (BOOL)isBullseyeNonCommittedSearch
{
  id v3 = [(SPQueryTask *)self query];
  uint64_t v4 = [v3 queryContext];
  uint64_t v5 = [v4 queryKind];

  return v5 == 2 || v5 == 10 && self->_previousQueryKind == 2;
}

- (BOOL)isBullseyeCommittedSearch
{
  id v3 = [(SPQueryTask *)self query];
  uint64_t v4 = [v3 queryContext];
  uint64_t v5 = [v4 queryKind];

  if ((unint64_t)(v5 - 5) < 4) {
    return 1;
  }
  if (v5 == 10) {
    return self->_previousQueryKind - 5 < 4;
  }
  return 0;
}

- (void)sendTTRLogsWithSections:(id)a3
{
  rankingManager = self->_rankingManager;
  id v5 = a3;
  unint64_t v6 = [(SPQueryTask *)self query];
  uint64_t v7 = [v6 queryContext];
  uint64_t v8 = [v7 searchString];
  uint64_t v9 = [(SPQueryTask *)self query];
  uint64_t v10 = [v9 queryContext];
  -[SSRankingManager sendTTRLogsWithSections:searchString:queryKind:isCommittedSearch:parsecCameLaterThanSRT:](rankingManager, "sendTTRLogsWithSections:searchString:queryKind:isCommittedSearch:parsecCameLaterThanSRT:", v5, v8, [v10 queryKind], -[SPFederatedQueryTask isBullseyeCommittedSearch](self, "isBullseyeCommittedSearch"), self->_parsecCameLaterThanSRT);

  uint64_t v11 = [(SSRankingManager *)self->_rankingManager logValues];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    id v13 = [(SSRankingManager *)self->_rankingManager logValues];
    [(SPFederatedQueryTask *)self sendLogValuesForDebuggingRanking:v13];
  }
}

- (void)deDuplicateMailResults:(id)a3
{
  id v17 = a3;
  id v3 = objc_alloc(MEMORY[0x263EFF9C0]);
  uint64_t v4 = [v17 resultSet];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  unint64_t v6 = objc_opt_new();
  uint64_t v7 = [v17 resultSet];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v10 = [v17 resultSet];
      uint64_t v11 = [v10 objectAtIndexedSubscript:i];

      uint64_t v12 = [v11 rankingItem];
      id v13 = v12;
      if (v12)
      {
        [v12 attributes];
        uint64_t v14 = SSCompactRankingAttrsGetValue();
        if (v14)
        {
          uint64_t v15 = (void *)v14;
          if ([v5 containsObject:v14]) {
            [v6 addIndex:i];
          }
          else {
            [v5 addObject:v15];
          }
        }
      }
    }
  }
  unint64_t v16 = [v17 resultSet];
  [v16 removeObjectsAtIndexes:v6];
}

- (void)deDuplicateSection:(id)a3 againstSection:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x263EFF9C0]);
  uint64_t v8 = [v6 resultSet];
  uint64_t v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  uint64_t v10 = [v5 bundleIdentifier];
  if (([v10 isEqual:*MEMORY[0x263F78E88]] & 1) == 0)
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v11 = [v5 bundleIdentifier];
  uint64_t v12 = [v6 bundleIdentifier];
  int v13 = [v11 isEqual:v12];

  if (v13)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v10 = [v6 results];
    uint64_t v14 = [v10 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v45;
      while (2)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v45 != v16) {
            objc_enumerationMutation(v10);
          }
          uint64_t v18 = [*(id *)(*((void *)&v44 + 1) + 8 * v17) rankingItem];
          char v19 = [v18 isServerAlternativeResult];

          if (v19)
          {

            uint64_t v20 = v5;
            id v5 = v6;
            goto LABEL_13;
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v10 countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v20 = v6;
LABEL_13:
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v21 = [v20 resultSet];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v41;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = [*(id *)(*((void *)&v40 + 1) + 8 * v25) identifier];
        if (v26) {
          [v9 addObject:v26];
        }

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v23);
  }

  id v27 = objc_alloc_init(MEMORY[0x263F089C8]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v28 = objc_msgSend(v5, "resultSet", 0);
  uint64_t v29 = [v28 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = 0;
    uint64_t v32 = *(void *)v37;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(v28);
        }
        __int16 v34 = [*(id *)(*((void *)&v36 + 1) + 8 * v33) identifier];
        if (v34 && [v9 containsObject:v34]) {
          [v27 addIndex:v31 + v33];
        }

        ++v33;
      }
      while (v30 != v33);
      uint64_t v30 = [v28 countByEnumeratingWithState:&v36 objects:v48 count:16];
      v31 += v33;
    }
    while (v30);
  }

  id v35 = [v5 resultSet];
  [v35 removeObjectsAtIndexes:v27];
}

- (id)dedupeLocalSectionsByBundleId:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v5 = objc_alloc_init(MEMORY[0x263F089C8]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "bundleIdentifier", (void)v16);
        int v13 = v12;
        if (v12 && ([v12 hasPrefix:@"com.apple.parsec"] & 1) == 0)
        {
          if ([v4 containsObject:v13]) {
            [v5 addIndex:v9];
          }
          else {
            [v4 addObject:v13];
          }
          ++v9;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    uint64_t v14 = (void *)[v6 mutableCopy];
    [v14 removeObjectsAtIndexes:v5];

    id v6 = v14;
  }

  return v6;
}

- (void)serverSideDedupe:(id)a3
{
  uint64_t v260 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  v193 = objc_opt_new();
  v199 = objc_opt_new();
  v204 = objc_opt_new();
  v211 = objc_opt_new();
  v198 = objc_opt_new();
  uint64_t v7 = self;
  uint64_t v8 = objc_opt_new();
  v202 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"_"];
  int v224 = SSEnableSpotlightTopHitPersonalizedRanking();
  uint64_t v9 = [(SPFederatedQueryTask *)self dedupeLocalSectionsByBundleId:v4];

  v222 = v5;
  v213 = v6;
  if ([v9 count])
  {
    uint64_t v10 = [v9 objectAtIndex:0];
    uint64_t v11 = [v10 bundleIdentifier];
    if ([v11 isEqual:@"com.apple.spotlight.tophits"])
    {
      uint64_t v12 = [v10 resultSet];
      int v13 = [v12 firstObject];
      uint64_t v14 = [v13 sectionBundleIdentifier];
      int v15 = priorityIndexEligibleBundleIdentifer(v14);

      if (v15) {
        id v189 = v10;
      }
      else {
        id v189 = 0;
      }
      id v5 = v222;
    }
    else
    {

      id v189 = 0;
    }
    id v6 = v213;
  }
  else
  {
    id v189 = 0;
  }
  v187 = [MEMORY[0x263EFF910] now];
  long long v240 = 0u;
  long long v241 = 0u;
  long long v242 = 0u;
  long long v243 = 0u;
  id obj = v9;
  uint64_t v195 = [obj countByEnumeratingWithState:&v240 objects:v259 count:16];
  if (v195)
  {
    uint64_t v194 = *(void *)v241;
    uint64_t v190 = *MEMORY[0x263F78F10];
    uint64_t v223 = *MEMORY[0x263F79018];
    uint64_t v216 = *MEMORY[0x263F78FD8];
    uint64_t v206 = *MEMORY[0x263F78F88];
    uint64_t v215 = *MEMORY[0x263F78EA0];
    uint64_t v205 = *MEMORY[0x263F023D0];
    uint64_t v186 = *MEMORY[0x263F02858];
    uint64_t v210 = *MEMORY[0x263F78F90];
    uint64_t v203 = *MEMORY[0x263F01F10];
    uint64_t v209 = *MEMORY[0x263F78E88];
    uint64_t v184 = *MEMORY[0x263F790F8];
    uint64_t v208 = *MEMORY[0x263F790C8];
    uint64_t v214 = *MEMORY[0x263F78FF8];
    uint64_t v201 = *MEMORY[0x263F027D8];
    uint64_t v212 = *MEMORY[0x263F78FF0];
    uint64_t v207 = *MEMORY[0x263F78F98];
    v185 = v7;
    v217 = v8;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v241 != v194) {
          objc_enumerationMutation(obj);
        }
        uint64_t v200 = v16;
        id v17 = *(id *)(*((void *)&v240 + 1) + 8 * v16);
        if ([(SPFederatedQueryTask *)v7 isBullseyeCommittedSearch])
        {
          long long v18 = [v17 bundleIdentifier];
          char v19 = [v18 isEqualToString:@"com.apple.spotlight.tophits"];

          if (v19) {
            goto LABEL_206;
          }
        }
        id v225 = objc_alloc_init(MEMORY[0x263F089C8]);
        uint64_t v20 = [v17 results];
        uint64_t v21 = [v20 firstObject];
        uint64_t v22 = [v21 sectionBundleIdentifier];
        int v23 = [v22 isEqualToString:v190];

        if (v23)
        {
          [(SPFederatedQueryTask *)v7 deDuplicateMailResults:v17];
          uint64_t v24 = v225;
          goto LABEL_205;
        }
        uint64_t v25 = v17;
        v229 = v17;
        if (v17 != v189)
        {
          long long v26 = [v17 resultSet];
          id v27 = [v26 firstObject];
          long long v28 = [v27 sectionBundleIdentifier];
          uint64_t v29 = [v189 resultSet];
          uint64_t v30 = [v29 firstObject];
          uint64_t v31 = [v30 sectionBundleIdentifier];
          if ([v28 isEqualToString:v31])
          {
            BOOL v32 = [(SPFederatedQueryTask *)v7 isBullseyeCommittedSearch];

            uint64_t v25 = v229;
            if (!v32) {
              [(SPFederatedQueryTask *)v7 deDuplicateSection:v229 againstSection:v189];
            }
          }
          else
          {

            uint64_t v25 = v229;
          }
        }
        uint64_t v33 = [v25 resultSet];
        uint64_t v34 = [v33 count];

        if (!v34)
        {
          id v41 = 0;
          uint64_t v8 = v217;
          goto LABEL_204;
        }
        unint64_t v35 = 0;
        unint64_t v36 = 0;
        unsigned int v219 = 0;
        long long v37 = 0;
        uint64_t v8 = v217;
        do
        {
          unint64_t v38 = v36;
          long long v39 = [v25 resultSet];
          long long v40 = [v39 objectAtIndexedSubscript:v35];

          id v41 = [NSNumber numberWithUnsignedInt:v38];

          long long v42 = [v40 resultBundleId];
          LODWORD(v39) = [v42 isEqualToString:v223];

          int v218 = v38;
          if (v39) {
            unsigned int v43 = v38;
          }
          else {
            unsigned int v43 = v219;
          }
          unsigned int v219 = v43;
          long long v44 = [v40 sectionBundleIdentifier];
          v220 = v41;
          v231 = v40;
          if ([v44 isEqualToString:v216])
          {
          }
          else
          {
            long long v45 = [v40 sectionBundleIdentifier];
            int v46 = [v45 isEqualToString:v206];

            if (!v46)
            {
              id v230 = 0;
              v226 = 0;
              goto LABEL_90;
            }
          }
          long long v238 = 0u;
          long long v239 = 0u;
          long long v236 = 0u;
          long long v237 = 0u;
          long long v47 = [v40 alternativeURLs];
          uint64_t v48 = [v47 countByEnumeratingWithState:&v236 objects:v258 count:16];
          if (!v48)
          {

            v226 = 0;
            long long v40 = v231;
            goto LABEL_62;
          }
          uint64_t v49 = v48;
          id v230 = 0;
          v226 = 0;
          uint64_t v50 = *(void *)v237;
          do
          {
            uint64_t v51 = 0;
            uint64_t v227 = v49;
            do
            {
              if (*(void *)v237 != v50) {
                objc_enumerationMutation(v47);
              }
              v52 = [*(id *)(*((void *)&v236 + 1) + 8 * v51) absoluteString];
              v53 = strippedURL();

              v54 = [v5 objectForKey:v53];
              uint64_t v55 = [v54 objectAtIndex:0];
              id v56 = (id)v55;
              if (v55)
              {
                if ((void *)v55 == v231) {
                  goto LABEL_57;
                }
                v57 = v47;
                id v58 = [v54 objectAtIndex:1];
                uint64_t v59 = (uint64_t)v230;
                if (v230)
                {
                  if (v230 != v56)
                  {
                    if ((int)[v230 topHit] >= 1) {
                      goto LABEL_42;
                    }
                    if ((int)[v56 topHit] >= 1)
                    {
                      v60 = v230;
                      goto LABEL_53;
                    }
                    uint64_t v59 = (uint64_t)v230;
                    [v230 l2score];
                    float v68 = v67;
                    [v56 l2score];
                    if (v68 >= v69)
                    {
LABEL_42:
                      v60 = v56;
                      v61 = v58;
                      v62 = v225;
                      uint64_t v63 = v59;
                    }
                    else
                    {
                      v60 = v230;
LABEL_53:
                      v62 = v225;
                      v61 = v226;
                      uint64_t v63 = (uint64_t)v56;
                    }
                    hideResultFromSection(v60, v61, v62, v63, v25);
                  }
                }
                else
                {
                  id v64 = v56;
                  id v58 = v58;

                  id v230 = v64;
                  if (v224)
                  {
                    v65 = [v64 resultBundleId];
                    int v66 = [v65 isEqualToString:v223];

                    if (v66) {
                      [MEMORY[0x263F78E58] setTopHitCandidate:v64];
                    }
                    v226 = v58;
                    id v5 = v222;
                    uint64_t v25 = v229;
                  }
                  else
                  {
                    v226 = v58;
                  }
                }
                long long v47 = v57;
                uint64_t v49 = v227;
                goto LABEL_56;
              }
              v257[0] = v231;
              v257[1] = v25;
              id v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v257 count:2];
              [v5 setObject:v58 forKey:v53];
LABEL_56:

LABEL_57:
              ++v51;
            }
            while (v49 != v51);
            uint64_t v49 = [v47 countByEnumeratingWithState:&v236 objects:v258 count:16];
          }
          while (v49);

          uint64_t v8 = v217;
          long long v40 = v231;
          if (v230) {
            goto LABEL_78;
          }
LABEL_62:
          long long v234 = 0u;
          long long v235 = 0u;
          long long v232 = 0u;
          long long v233 = 0u;
          v70 = [v40 punchout];
          v71 = [v70 urls];

          uint64_t v72 = [v71 countByEnumeratingWithState:&v232 objects:v256 count:16];
          if (!v72)
          {
            id v230 = 0;
            goto LABEL_77;
          }
          uint64_t v73 = v72;
          id v230 = 0;
          uint64_t v74 = *(void *)v233;
          while (2)
          {
            uint64_t v75 = 0;
            while (2)
            {
              if (*(void *)v233 != v74) {
                objc_enumerationMutation(v71);
              }
              v76 = [*(id *)(*((void *)&v232 + 1) + 8 * v75) absoluteString];
              v77 = strippedURL();

              v78 = [v5 objectForKey:v77];
              v79 = [v78 objectAtIndex:0];
              v80 = v79;
              if (v79)
              {
                uint64_t v25 = v229;
                if (v79 != v40)
                {
                  v81 = v230;
                  id v230 = v79;
                  goto LABEL_71;
                }
              }
              else
              {
                v255[0] = v40;
                uint64_t v25 = v229;
                v255[1] = v229;
                v81 = [MEMORY[0x263EFF8C0] arrayWithObjects:v255 count:2];
                [v5 setObject:v81 forKey:v77];
LABEL_71:

                long long v40 = v231;
              }

              if (v73 != ++v75) {
                continue;
              }
              break;
            }
            uint64_t v73 = [v71 countByEnumeratingWithState:&v232 objects:v256 count:16];
            if (v73) {
              continue;
            }
            break;
          }
LABEL_77:

          uint64_t v8 = v217;
LABEL_78:
          v82 = [v40 contentURL];

          if (!v82)
          {
            id v41 = v220;
            goto LABEL_90;
          }
          id v41 = v220;
          if (v230) {
            goto LABEL_90;
          }
          v83 = [v40 contentURL];
          strippedURL();
          v85 = v84 = v40;

          v86 = [v5 objectForKey:v85];
          v87 = [v86 objectAtIndex:0];
          v88 = v87;
          if (!v87)
          {
            v254[0] = v84;
            v254[1] = v25;
            v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:v254 count:2];
            [v5 setObject:v93 forKey:v85];

LABEL_87:
            id v230 = 0;
            goto LABEL_89;
          }
          if (v87 == v84) {
            goto LABEL_87;
          }
          if (v224)
          {
            v89 = [v87 resultBundleId];
            char v90 = [v89 isEqualToString:v223];

            if (v90)
            {
              v253[0] = v231;
              v253[1] = v25;
              v91 = [MEMORY[0x263EFF8C0] arrayWithObjects:v253 count:2];
              [v5 setObject:v91 forKey:v85];

              id v230 = 0;
              unsigned int v92 = v219;
              goto LABEL_197;
            }
          }
          id v230 = v88;
LABEL_89:

          long long v40 = v231;
LABEL_90:
          v94 = [v40 storeIdentifier];

          if (v94)
          {
            v95 = [v40 storeIdentifier];
            v96 = [v213 objectForKeyedSubscript:v95];

            id v97 = [v96 objectAtIndex:0];
            v98 = [v96 objectAtIndex:1];
            if (!v97)
            {
              v252[0] = v40;
              v252[1] = v25;
              v99 = [MEMORY[0x263EFF8C0] arrayWithObjects:v252 count:2];
              v100 = [v40 storeIdentifier];
              [v213 setObject:v99 forKeyedSubscript:v100];

              uint64_t v25 = v229;
              goto LABEL_98;
            }
            if (v97 != v230)
            {
              if ([v97 type] == 26)
              {
                v99 = v230;
                id v230 = v97;
                goto LABEL_98;
              }
              if ([v40 type] == 26)
              {
                handleHiddenResult();
                [v98 removeResults:v97];
                v99 = v230;
                id v230 = 0;
LABEL_98:

                id v41 = v220;
              }
            }
          }
          v101 = [v40 sectionBundleIdentifier];
          int v102 = [v101 isEqualToString:v215];

          if (!v102) {
            goto LABEL_127;
          }
          v103 = [v40 valueForAttribute:v205 withType:objc_opt_class()];
          v85 = v103;
          if (!v103
            || (unint64_t)[v103 length] < 0x24
            || ([v85 substringToIndex:36], (uint64_t v104 = objc_claimAutoreleasedReturnValue()) == 0))
          {
LABEL_198:

            long long v40 = v231;
            goto LABEL_200;
          }
          v105 = (void *)v104;
          v106 = [v193 objectForKeyedSubscript:v104];
          v107 = v106;
          if (v106)
          {
            v197 = v105;
            v108 = [v106 objectAtIndexedSubscript:0];
            v192 = v107;
            v196 = [v107 objectAtIndexedSubscript:1];
            v228 = v108;
            v109 = [v108 valueForAttribute:v186 withType:objc_opt_class()];
            v110 = [v231 valueForAttribute:v186 withType:objc_opt_class()];
            v111 = [v109 earlierDate:v187];

            v112 = [v110 earlierDate:v187];

            v113 = [v109 earlierDate:v110];

            BOOL v114 = v111 != v109;
            v191 = v109;
            if (v111 != v109 || v112 != v110)
            {
              if (v112 == v110) {
                BOOL v114 = 1;
              }
              if (v114)
              {
                if (v111 != v109 && v112 == v110) {
                  goto LABEL_121;
                }
                if (v111 == v109 || v112 == v110)
                {
                  id v41 = v220;
                  v105 = v197;
                  v107 = v192;
                  goto LABEL_125;
                }
                if (v113 == v109) {
                  goto LABEL_121;
                }
                v115 = v231;
                id v120 = v231;

                id v249 = v120;
                v117 = &v249;
              }
              else
              {
                v115 = v231;
                id v124 = v231;

                id v250 = v124;
                v117 = &v250;
              }
LABEL_123:
              v117[1] = v220;
              v125 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:");
              [v193 setObject:v125 forKeyedSubscript:v197];

              id v41 = v196;
              v122 = v115;
              v123 = v228;
              v121 = v228;
              goto LABEL_124;
            }
            if (v113 == v109)
            {
              v115 = v231;
              id v116 = v231;

              id v251 = v116;
              v117 = &v251;
              goto LABEL_123;
            }
LABEL_121:
            v122 = v230;
            v121 = v231;
            v123 = v108;
            v115 = v108;
            id v41 = v220;
LABEL_124:
            id v126 = v123;

            id v230 = v115;
            v231 = v121;
            v105 = v197;
            v109 = v191;
            v107 = v192;
LABEL_125:

            uint64_t v8 = v217;
            v118 = v228;
          }
          else
          {
            v248[0] = v231;
            v248[1] = v41;
            v118 = [MEMORY[0x263EFF8C0] arrayWithObjects:v248 count:2];
            [v193 setObject:v118 forKeyedSubscript:v105];
          }

          long long v40 = v231;
LABEL_127:
          v127 = [v40 sectionBundleIdentifier];
          int v128 = [v127 isEqualToString:v210];

          if (v128)
          {
            v129 = [v40 valueForAttribute:v203 withType:objc_opt_class()];
            if (v129)
            {
              uint64_t v130 = [v199 objectForKeyedSubscript:v129];

              id v230 = (id)v130;
              if (!v130)
              {
                [v199 setObject:v40 forKeyedSubscript:v129];
                id v230 = 0;
              }
            }
          }
          v131 = [v40 sectionBundleIdentifier];
          int v132 = [v131 isEqualToString:v209];

          v231 = v40;
          if (!v132)
          {
            v137 = v211;
            goto LABEL_146;
          }
          v85 = [v40 identifier];
          if (!v85)
          {
            v133 = v230;
LABEL_144:
            v137 = v211;
            goto LABEL_145;
          }
          v133 = [v204 objectForKeyedSubscript:v85];

          if (!v133)
          {
            [v204 setObject:v231 forKeyedSubscript:v85];
            goto LABEL_144;
          }
          v134 = [v133 rankingItem];
          uint64_t v135 = [v231 rankingItem];
          v136 = (void *)v135;
          if (!v134
            || !v135
            || ![v134 isTopHit]
            || v134 != v136
            || [v134 isServerAlternativeResult])
          {

            goto LABEL_144;
          }
          v174 = [v25 bundleIdentifier];
          int v175 = [v174 isEqualToString:v184];

          v137 = v211;
          if (!v175)
          {
            id v230 = v133;
            uint64_t v25 = v229;
            goto LABEL_198;
          }
LABEL_145:

          id v230 = v133;
          uint64_t v25 = v229;
          long long v40 = v231;
LABEL_146:
          v138 = [v40 sectionBundleIdentifier];
          int v139 = [v138 isEqualToString:v208];

          if (v139)
          {
            v140 = [v40 url];
            if (v140)
            {
              uint64_t v141 = [v198 objectForKeyedSubscript:v140];

              id v230 = (id)v141;
              if (!v141)
              {
                [v198 setObject:v40 forKeyedSubscript:v140];
                id v230 = 0;
              }
            }
          }
          v142 = [v40 sectionBundleIdentifier];
          int v143 = [v142 isEqualToString:v214];

          if (v143)
          {
            v144 = [v40 valueForAttribute:v201 withType:objc_opt_class()];
            if (v144)
            {
              v145 = [v137 objectForKeyedSubscript:v144];
              v146 = v145;
              if (v145)
              {
                v147 = [v145 objectAtIndexedSubscript:0];
                v148 = [v147 sectionBundleIdentifier];
                int v149 = [v148 isEqualToString:v212];

                if (v149)
                {
                  v150 = [v146 objectAtIndexedSubscript:1];
                  handleHiddenResult();
                  [v150 removeResults:v147];

                  id v230 = 0;
                }
                id v5 = v222;
                uint64_t v25 = v229;
              }
              else
              {
                v247[0] = v40;
                v247[1] = v25;
                v147 = [MEMORY[0x263EFF8C0] arrayWithObjects:v247 count:2];
                [v137 setObject:v147 forKeyedSubscript:v144];
              }
            }
          }
          v151 = [v40 sectionBundleIdentifier];
          int v152 = [v151 isEqualToString:v212];

          if (v152)
          {
            v153 = [v40 identifier];
            v154 = [v137 objectForKeyedSubscript:v153];
            v155 = v154;
            if (v154)
            {
              id v156 = [v154 objectAtIndexedSubscript:0];
              v157 = [v156 sectionBundleIdentifier];
              int v158 = [v157 isEqualToString:v214];

              if (v158)
              {
                id v156 = v156;

                id v230 = v156;
              }
              id v5 = v222;
              uint64_t v25 = v229;
            }
            else
            {
              v246[0] = v40;
              v246[1] = v25;
              id v156 = [MEMORY[0x263EFF8C0] arrayWithObjects:v246 count:2];
              [v137 setObject:v156 forKeyedSubscript:v153];
            }
          }
          v159 = [v40 sectionBundleIdentifier];
          int v160 = [v159 isEqualToString:v207];

          if (v160)
          {
            v161 = [v40 identifier];
            unint64_t v162 = [v161 rangeOfCharacterFromSet:v202];
            if (v162 != 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v163 = v162;
              if (v162 < [v161 length])
              {
                v164 = [v161 substringToIndex:v163];
                v165 = objc_msgSend(v161, "substringWithRange:", v163 + 1, objc_msgSend(v161, "length") + ~v163);
                if ([v164 length] && objc_msgSend(v165, "length"))
                {
                  id v221 = v41;
                  v166 = [v8 objectForKeyedSubscript:v165];
                  [v166 objectAtIndexedSubscript:1];
                  v168 = v167 = v8;
                  v169 = [v166 objectAtIndexedSubscript:0];
                  uint64_t v25 = v229;
                  if (v166)
                  {
                    if ([v164 compare:v168] == 1)
                    {
                      v244 = v40;
                      v245 = v164;
                      v170 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v244 count:2];
                      [v217 setObject:v170 forKeyedSubscript:v165];

                      id v171 = v40;
                      id v172 = v171;
                      uint64_t v25 = v229;
                      v173 = v172;
                    }
                    else
                    {
                      id v172 = v169;
                      v173 = v230;
                    }
                    id v230 = v172;
                  }
                  else
                  {
                    v244 = v40;
                    v245 = v164;
                    v173 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v244 count:2];
                    [v167 setObject:v173 forKeyedSubscript:v165];
                  }

                  uint64_t v8 = v217;
                  id v41 = v221;
                  long long v40 = v231;
                }
                else
                {
                  uint64_t v25 = v229;
                }
              }
            }
          }
          if (v230)
          {
            v176 = [v40 inlineCard];
            if (v176) {
              [v230 setInlineCard:v176];
            }
            v85 = [v40 compactCard];

            if (v85) {
              [v230 setCompactCard:v85];
            }
            v86 = [v231 punchout];
            if (v86)
            {
              v177 = [v230 punchout];

              if (!v177) {
                [v230 setPunchout:v86];
              }
            }
            v88 = [v231 completedQuery];
            v178 = [v231 completedQuery];

            if (v178) {
              [v230 setCompletedQuery:v88];
            }
            v179 = [v231 completion];

            if (v179)
            {
              v180 = [v231 completion];
              [v230 setCompletion:v180];
            }
            handleHiddenResult();
            unsigned int v92 = [v41 unsignedIntValue];
LABEL_197:
            [v225 addIndex:v92];

            goto LABEL_198;
          }
          id v230 = 0;
LABEL_200:

          unint64_t v35 = (v218 + 1);
          v181 = [v25 resultSet];
          unint64_t v182 = [v181 count];

          unint64_t v36 = v35;
          long long v37 = v41;
        }
        while (v182 > v35);
LABEL_204:
        v183 = [v25 resultSet];
        uint64_t v24 = v225;
        [v183 removeObjectsAtIndexes:v225];

        uint64_t v7 = v185;
LABEL_205:

        id v6 = v213;
LABEL_206:
        uint64_t v16 = v200 + 1;
      }
      while (v200 + 1 != v195);
      uint64_t v195 = [obj countByEnumeratingWithState:&v240 objects:v259 count:16];
    }
    while (v195);
  }
}

- (void)addDictionarySections:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v48 = self;
  id v5 = self->_actualSentSections;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v66;
    uint64_t v9 = *MEMORY[0x263F790F8];
    uint64_t v10 = *MEMORY[0x263F78F60];
    id v46 = v4;
    long long v47 = v5;
    uint64_t v45 = *MEMORY[0x263F790F8];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v66 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        if ([v12 resultsCount])
        {
          int v13 = [v12 bundleIdentifier];
          int v14 = [v13 isEqualToString:v9];

          if (v14)
          {
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            int v15 = [v12 resultSet];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v72 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v62;
              while (2)
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  if (*(void *)v62 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = [*(id *)(*((void *)&v61 + 1) + 8 * j) sectionBundleIdentifier];
                  char v21 = [v20 isEqualToString:v10];

                  if (v21)
                  {
                    int v24 = 1;
                    id v4 = v46;
                    id v5 = v47;
                    goto LABEL_22;
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v61 objects:v72 count:16];
                if (v17) {
                  continue;
                }
                break;
              }
            }

            id v5 = v47;
            uint64_t v9 = v45;
          }
          else
          {
            uint64_t v22 = [v12 bundleIdentifier];
            int v23 = [v22 isEqualToString:v10];

            if (v23)
            {
              long long v59 = 0u;
              long long v60 = 0u;
              long long v57 = 0u;
              long long v58 = 0u;
              int v15 = [v12 resultSet];
              uint64_t v41 = [v15 countByEnumeratingWithState:&v57 objects:v71 count:16];
              if (v41)
              {
                uint64_t v42 = v41;
                uint64_t v43 = *(void *)v58;
                id v4 = v46;
                while (2)
                {
                  for (uint64_t k = 0; k != v42; ++k)
                  {
                    if (*(void *)v58 != v43) {
                      objc_enumerationMutation(v15);
                    }
                    if ((int)[*(id *)(*((void *)&v57 + 1) + 8 * k) topHit] > 0)
                    {
                      int v24 = 1;
                      goto LABEL_22;
                    }
                  }
                  uint64_t v42 = [v15 countByEnumeratingWithState:&v57 objects:v71 count:16];
                  if (v42) {
                    continue;
                  }
                  break;
                }
                int v24 = 0;
              }
              else
              {
                int v24 = 0;
                id v4 = v46;
              }
LABEL_22:

              goto LABEL_24;
            }
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v65 objects:v73 count:16];
      int v24 = 0;
      id v4 = v46;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v24 = 0;
  }
LABEL_24:

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v25 = (NSArray *)v4;
  uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v53 objects:v70 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v54;
    uint64_t v29 = *MEMORY[0x263F78EB8];
LABEL_26:
    uint64_t v30 = 0;
    while (1)
    {
      if (*(void *)v54 != v28) {
        objc_enumerationMutation(v25);
      }
      uint64_t v31 = *(void **)(*((void *)&v53 + 1) + 8 * v30);
      BOOL v32 = [v31 bundleIdentifier];
      int v33 = [v32 isEqualToString:v29];

      if (v33) {
        break;
      }
      if (v27 == ++v30)
      {
        uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v53 objects:v70 count:16];
        if (v27) {
          goto LABEL_26;
        }
        goto LABEL_44;
      }
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v34 = [v31 resultSet];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v49 objects:v69 count:16];
    if (!v35)
    {
LABEL_41:

      goto LABEL_44;
    }
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v50;
LABEL_35:
    uint64_t v38 = 0;
    while (1)
    {
      if (*(void *)v50 != v37) {
        objc_enumerationMutation(v34);
      }
      if ((int)[*(id *)(*((void *)&v49 + 1) + 8 * v38) topHit] > 0) {
        break;
      }
      if (v36 == ++v38)
      {
        uint64_t v36 = [v34 countByEnumeratingWithState:&v49 objects:v69 count:16];
        if (v36) {
          goto LABEL_35;
        }
        goto LABEL_41;
      }
    }

    if (!v24) {
      goto LABEL_44;
    }
    [v31 clearResults];
    actualSentSections = v25;
  }
  else
  {
LABEL_44:

    uint64_t v40 = [(NSArray *)v48->_actualSentSections arrayByAddingObjectsFromArray:v25];
    actualSentSections = v48->_actualSentSections;
    v48->_actualSentSections = (NSArray *)v40;
  }
}

- (void)sendResults:(id)a3 reset:(BOOL)a4 partiallyComplete:(BOOL)a5 update:(BOOL)a6 complete:(BOOL)a7 unchanged:(BOOL)a8 delayedTopHit:(BOOL)a9 reason:(int)a10
{
  BOOL v372 = a4;
  BOOL v373 = a7;
  BOOL v368 = a5;
  BOOL v369 = a6;
  uint64_t v497 = *MEMORY[0x263EF8340];
  uint64_t v11 = (NSArray *)a3;
  uint64_t v12 = [(SPQueryTask *)self query];
  int v13 = [v12 queryContext];
  uint64_t v14 = [v13 queryKind];
  id v15 = [(SPFederatedQueryTask *)self clientBundleID];
  if (SPQueryKindIsSearchToolSearch_onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken, &__block_literal_global_1034);
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode) {
    goto LABEL_4;
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolRanking)
  {
    if (([v15 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
      || ([v15 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
    {
LABEL_4:
      char v16 = 1;
      goto LABEL_5;
    }
    char v22 = [v15 hasPrefix:@"com.apple.ondeviceeval"];
    if (v14 == 12) {
      char v16 = 1;
    }
    else {
      char v16 = v22;
    }
  }
  else
  {
    char v16 = 0;
  }
LABEL_5:

  if ((v16 & 1) == 0) {
    [(SPFederatedQueryTask *)self serverSideDedupe:v11];
  }
  BOOL v17 = a9;
  v397 = self;
  char v389 = v16;
  unint64_t v367 = [(NSArray *)v11 count];
  if (v367)
  {
    p_sentSections = &self->_sentSections;
    if ([(NSArray *)self->_sentSections count])
    {
      BOOL v19 = [(SPFederatedQueryTask *)self didReceiveCoreSpotlightProgress];
      if (a10 <= 1 && v19)
      {
        [(SSBullseyeTopHitsManager *)self->_topHitsManager resetVisibilityCounts];
        copyForResending(self->_actualSentSections);
        uint64_t v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        actualSentSections = self->_actualSentSections;
        self->_actualSentSections = v20;
      }
      else if (a10 == 3)
      {
        uint64_t v25 = [(NSArray *)v11 firstObject];
        uint64_t v26 = [v25 bundleIdentifier];
        uint64_t v27 = [(NSArray *)*p_sentSections firstObject];
        uint64_t v28 = [v27 bundleIdentifier];
        uint64_t v29 = v11;
        int v30 = [v26 isEqual:v28];

        if (v30)
        {
          self = v397;
          [(SSBullseyeTopHitsManager *)v397->_topHitsManager resetVisibilityCounts];
          uint64_t v31 = (void *)[(NSArray *)v29 copy];
        }
        else
        {
          uint64_t v31 = 0;
          self = v397;
        }
        uint64_t v11 = v29;
        copyForResending(self->_actualSentSections);
        BOOL v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
        int v33 = self->_actualSentSections;
        self->_actualSentSections = v32;

        BOOL v17 = a9;
        char v16 = v389;
        if (v31) {
          goto LABEL_34;
        }
      }
      if ((v16 & 1) != 0 || [(SPFederatedQueryTask *)self isBullseyeCommittedSearch])
      {
        uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9B0]), "initWithCapacity:", -[NSArray count](*p_sentSections, "count"));
        uint64_t v35 = v34;
        if (v17)
        {
          [v34 addObjectsFromArray:v11];
          uint64_t v36 = *p_sentSections;
        }
        else
        {
          [v34 addObjectsFromArray:*p_sentSections];
          uint64_t v36 = v11;
        }
        [v35 addObjectsFromArray:v36];
        uint64_t v31 = [v35 array];

        goto LABEL_34;
      }
      uint64_t v24 = [(NSArray *)*p_sentSections arrayByAddingObjectsFromArray:v11];
    }
    else
    {
      uint64_t v24 = [(NSArray *)v11 copy];
    }
    uint64_t v31 = (void *)v24;
LABEL_34:
    objc_storeStrong((id *)p_sentSections, v31);

    int v23 = 1;
    goto LABEL_35;
  }
  int v23 = v369 || v373 || v372 || v368;
LABEL_35:
  int v370 = v23;
  uint64_t v37 = [(SPQueryTask *)self query];
  uint64_t v38 = [v37 queryContext];
  uint64_t v39 = [v38 queryKind];
  id v40 = [(SPFederatedQueryTask *)self clientBundleID];
  if (SPQueryKindIsSearchToolSearch_onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken, &__block_literal_global_1034);
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode) {
    goto LABEL_38;
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolRanking)
  {
    if (([v40 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
      || ([v40 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
    {
LABEL_38:

      uint64_t v41 = 0;
      v424 = 0;
      id obj = 0;
      id v396 = 0;
      v434 = 0;
      double v42 = -1.79769313e308;
      goto LABEL_39;
    }
    char v50 = [v40 hasPrefix:@"com.apple.ondeviceeval"];

    uint64_t v41 = 0;
    double v42 = -1.79769313e308;
    if (v39 == 12 || (v50 & 1) != 0)
    {
      v424 = 0;
      id obj = 0;
      id v396 = 0;
      v434 = 0;
      goto LABEL_189;
    }
  }
  else
  {
  }
  uint64_t v377 = SSMaxSectionsBelowSuggestions();
  long long v477 = 0u;
  long long v478 = 0u;
  long long v479 = 0u;
  long long v480 = 0u;
  long long v51 = v11;
  uint64_t v425 = [(NSArray *)v51 countByEnumeratingWithState:&v477 objects:v496 count:16];
  uint64_t v41 = 0;
  if (!v425)
  {
    v424 = 0;
    id v396 = 0;
    v434 = 0;
    double v42 = -1.79769313e308;
    goto LABEL_106;
  }
  id v396 = 0;
  v434 = 0;
  uint64_t v421 = *(void *)v478;
  v424 = 0;
  uint64_t v414 = *MEMORY[0x263F79058];
  uint64_t v408 = *MEMORY[0x263F79030];
  uint64_t v402 = *MEMORY[0x263F790C0];
  double v42 = -1.79769313e308;
  id v398 = (id)*MEMORY[0x263F790F8];
  obja = v51;
  do
  {
    for (uint64_t i = 0; i != v425; ++i)
    {
      if (*(void *)v478 != v421) {
        objc_enumerationMutation(obja);
      }
      long long v53 = *(void **)(*((void *)&v477 + 1) + 8 * i);
      long long v54 = [v53 bundleIdentifier];
      int v55 = [v54 isEqual:v414];

      if (v55)
      {
        id v56 = v53;

        uint64_t v41 = v56;
      }
      long long v57 = [v53 bundleIdentifier];
      int v58 = [v57 isEqual:v408];

      if (v58)
      {
        id v59 = v53;

        v434 = v59;
      }
      long long v60 = [v53 bundleIdentifier];
      int v61 = [v60 isEqual:v402];

      if (v61)
      {
        id v62 = v53;

        v424 = v62;
      }
      long long v63 = [v53 bundleIdentifier];
      if ([v63 isEqualToString:v398])
      {
        long long v64 = [v53 results];
        uint64_t v65 = [v64 count];

        if (v65 != 1) {
          goto LABEL_70;
        }
        long long v63 = v396;
        id v396 = v53;
      }

LABEL_70:
      long long v475 = 0u;
      long long v476 = 0u;
      long long v473 = 0u;
      long long v474 = 0u;
      long long v66 = [v53 results];
      uint64_t v67 = [v66 countByEnumeratingWithState:&v473 objects:v495 count:16];
      if (v67)
      {
        uint64_t v68 = v67;
        v431 = v41;
        char v69 = 0;
        uint64_t v70 = *(void *)v474;
        do
        {
          for (uint64_t j = 0; j != v68; ++j)
          {
            if (*(void *)v474 != v70) {
              objc_enumerationMutation(v66);
            }
            uint64_t v72 = *(void **)(*((void *)&v473 + 1) + 8 * j);
            int v73 = [v72 type];
            int v74 = [v72 type];
            if (v73 != 36)
            {
              int v79 = v74;
              if ([v72 type] != 2 && v79 != 37) {
                continue;
              }
            }
            uint64_t v75 = [v72 rankingItem];
            v76 = [v75 L2FeatureVector];
            [v76 originalL2Score];
            double v78 = v77;

            if (v42 < v78) {
              double v42 = v78;
            }
            char v69 = 1;
          }
          uint64_t v68 = [v66 countByEnumeratingWithState:&v473 objects:v495 count:16];
        }
        while (v68);

        if ((v69 & 1) != 0
          && ([(SPFederatedQueryTask *)v397 isNLPSearch]
           || [(SPFederatedQueryTask *)v397 isPeopleSearch]))
        {
          objc_msgSend(v53, "setMaxInitiallyVisibleResults:", objc_msgSend(v53, "resultsCount"));
        }
        uint64_t v41 = v431;
      }
      else
      {
      }
    }
    long long v51 = obja;
    uint64_t v425 = [(NSArray *)obja countByEnumeratingWithState:&v477 objects:v496 count:16];
  }
  while (v425);
LABEL_106:

  if (a10 != 4)
  {
    v111 = (void *)MEMORY[0x263F78E48];
    v112 = [(SPQueryTask *)v397 query];
    v113 = [v112 queryContext];
    uint64_t v114 = objc_msgSend(v111, "moveShortcutsToRelatedAppSectionsForAllSections:isAsYouTypeTopHitSearch:sectionBuilderBlock:", v51, objc_msgSend(v113, "queryKind") == 2, &__block_literal_global_302);

    long long v51 = (NSArray *)v114;
  }
  long long v471 = 0u;
  long long v472 = 0u;
  long long v469 = 0u;
  long long v470 = 0u;
  uint64_t v11 = v51;
  uint64_t v115 = [(NSArray *)v11 countByEnumeratingWithState:&v469 objects:v494 count:16];
  if (!v115)
  {
    id obj = 0;
    goto LABEL_188;
  }
  uint64_t v116 = v115;
  id obj = 0;
  uint64_t v117 = *(void *)v470;
  uint64_t v118 = *MEMORY[0x263F79030];
  uint64_t v119 = *MEMORY[0x263F79058];
  id v399 = (id)*MEMORY[0x263F01CE0];
  uint64_t v374 = *MEMORY[0x263F01CC0];
  uint64_t v416 = *MEMORY[0x263F79058];
  v423 = v11;
  v433 = v41;
  uint64_t v404 = *(void *)v470;
  uint64_t v410 = *MEMORY[0x263F79030];
  while (2)
  {
    uint64_t v120 = 0;
    while (2)
    {
      if (*(void *)v470 != v117) {
        objc_enumerationMutation(v11);
      }
      v121 = *(void **)(*((void *)&v469 + 1) + 8 * v120);
      v122 = [v121 bundleIdentifier];
      int v123 = [v122 isEqual:v118];

      if (v123) {
        BOOL v124 = v41 == 0;
      }
      else {
        BOOL v124 = 1;
      }
      if (!v124) {
        goto LABEL_174;
      }
      v125 = [v121 bundleIdentifier];
      int v126 = [v125 isEqual:v119];

      if (v126 && v434 != 0) {
        goto LABEL_174;
      }
      uint64_t v128 = [v121 resultsCount];
      if (!v128) {
        goto LABEL_174;
      }
      id v129 = (id)v128;
      if ([(SPFederatedQueryTask *)v397 isScopedAppSearch])
      {
        [v121 setMaxInitiallyVisibleResults:50];
        unint64_t v426 = 50;
        goto LABEL_164;
      }
      if (!+[SPFederatedQueryTask sectionSupportsShowMoreInApp:v121])
      {
        v138 = [v121 bundleIdentifier];
        char IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();

        if (IsSyndicatedPhotos)
        {
          unint64_t v426 = 14;
        }
        else
        {
          v140 = [(SPQueryTask *)v397 query];
          unint64_t v426 = [v140 maxCount];
        }
        uint64_t v41 = v433;
        goto LABEL_164;
      }
      unint64_t v426 = [v121 maxInitiallyVisibleResults];
      if (v389 & 1) != 0 || (SPHideSearchThroughSuggestions()) {
        goto LABEL_152;
      }
      long long v467 = 0u;
      long long v468 = 0u;
      long long v465 = 0u;
      long long v466 = 0u;
      uint64_t v130 = [v121 resultSet];
      uint64_t v131 = [v130 countByEnumeratingWithState:&v465 objects:v493 count:16];
      if (!v131)
      {
LABEL_141:
        uint64_t v118 = v410;
LABEL_151:

        goto LABEL_152;
      }
      uint64_t v132 = v131;
      uint64_t v133 = *(void *)v466;
      while (2)
      {
        uint64_t v134 = 0;
LABEL_132:
        if (*(void *)v466 != v133) {
          objc_enumerationMutation(v130);
        }
        uint64_t v135 = *(void **)(*((void *)&v465 + 1) + 8 * v134);
        if ([v135 isFuzzyMatch])
        {
LABEL_138:
          if (v132 == ++v134)
          {
            uint64_t v132 = [v130 countByEnumeratingWithState:&v465 objects:v493 count:16];
            if (v132) {
              continue;
            }
            uint64_t v11 = v423;
            uint64_t v41 = v433;
            goto LABEL_141;
          }
          goto LABEL_132;
        }
        break;
      }
      v136 = [v135 userActivityType];
      v137 = v136;
      if (v136 && ![v136 isEqualToString:v399])
      {

        goto LABEL_138;
      }

      uint64_t v141 = (uint64_t)obj;
      if (!obj) {
        uint64_t v141 = objc_opt_new();
      }
      id obj = (NSArray *)v141;
      uint64_t v142 = [v121 title];
      uint64_t v11 = v423;
      uint64_t v41 = v433;
      uint64_t v118 = v410;
      if (v142)
      {
        int v143 = (void *)v142;
        v144 = [v121 bundleIdentifier];

        if (v144)
        {
          v145 = [v121 bundleIdentifier];
          [(NSArray *)obj addObject:v145];

          uint64_t v130 = [v121 title];
          [(NSArray *)obj addObject:v130];
          goto LABEL_151;
        }
      }
LABEL_152:
      if (v377)
      {
        id v384 = v129;
        v146 = objc_opt_new();
        v147 = objc_opt_new();
        [v147 setActivityType:v374];
        v380 = v147;
        [v146 setUserActivityData:v147];
        long long v463 = 0u;
        long long v464 = 0u;
        long long v461 = 0u;
        long long v462 = 0u;
        v148 = [v121 results];
        uint64_t v149 = [v148 countByEnumeratingWithState:&v461 objects:v492 count:16];
        if (v149)
        {
          uint64_t v150 = v149;
          uint64_t v151 = *(void *)v462;
          do
          {
            for (uint64_t k = 0; k != v150; ++k)
            {
              if (*(void *)v462 != v151) {
                objc_enumerationMutation(v148);
              }
              v153 = *(void **)(*((void *)&v461 + 1) + 8 * k);
              uint64_t v154 = [v153 moreResultsPunchout];
              v155 = (void *)v154;
              if (v154) {
                id v156 = (void *)v154;
              }
              else {
                id v156 = v146;
              }
              [v153 setMoreResultsPunchout:v156];
            }
            uint64_t v150 = [v148 countByEnumeratingWithState:&v461 objects:v492 count:16];
          }
          while (v150);
        }

        uint64_t v11 = v423;
        uint64_t v41 = v433;
        uint64_t v117 = v404;
        uint64_t v118 = v410;
        id v129 = v384;
      }
LABEL_164:
      v157 = SPLogForSPLogCategoryQuery();
      os_log_type_t v158 = 2 * (*MEMORY[0x263F67540] == 0);
      if (os_log_type_enabled(v157, v158))
      {
        v159 = [v121 title];
        unsigned int v160 = [v121 domain];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v159;
        __int16 v488 = 2048;
        *(void *)v489 = v160;
        *(_WORD *)&v489[8] = 2048;
        unint64_t v490 = v426;
        LOWORD(v491[0]) = 2048;
        *(void *)((char *)v491 + 2) = v129;
        _os_log_impl(&dword_235D0B000, v157, v158, "Sending section title:%@, domain:%ld, maxCount:%ld, resultCount:%ld", buf, 0x2Au);

        uint64_t v11 = v423;
      }

      v161 = [v121 resultSet];
      if ([v161 count] <= v426)
      {
        uint64_t v119 = v416;
        goto LABEL_173;
      }
      unint64_t v162 = [(SPQueryTask *)v397 query];
      unint64_t v163 = [v162 queryContext];
      uint64_t v164 = [v163 queryKind];
      id v165 = [(SPFederatedQueryTask *)v397 clientBundleID];
      if (SPQueryKindIsSearchToolSearch_onceToken != -1) {
        dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken, &__block_literal_global_1034);
      }
      uint64_t v11 = v423;
      if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode)
      {
LABEL_170:

        uint64_t v117 = v404;
        uint64_t v118 = v410;
        uint64_t v119 = v416;
        goto LABEL_171;
      }
      if (!SPQueryKindIsSearchToolSearch_isSearchToolRanking)
      {

        uint64_t v117 = v404;
        uint64_t v118 = v410;
        uint64_t v119 = v416;
LABEL_183:
        v161 = [v121 resultSet];
        unint64_t v162 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9B0]), "initWithOrderedSet:range:copyItems:", v161, 0, v426, 1);
        [v121 setResultSet:v162];
LABEL_171:

LABEL_173:
        goto LABEL_174;
      }
      if (([v165 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
        || ([v165 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
      {
        goto LABEL_170;
      }
      char v385 = [v165 hasPrefix:@"com.apple.ondeviceeval"];

      if (v164 == 12)
      {
        uint64_t v117 = v404;
        uint64_t v118 = v410;
        uint64_t v119 = v416;
        goto LABEL_174;
      }
      uint64_t v117 = v404;
      uint64_t v118 = v410;
      uint64_t v119 = v416;
      if ((v385 & 1) == 0) {
        goto LABEL_183;
      }
LABEL_174:
      if (++v120 != v116) {
        continue;
      }
      break;
    }
    uint64_t v166 = [(NSArray *)v11 countByEnumeratingWithState:&v469 objects:v494 count:16];
    uint64_t v116 = v166;
    if (v166) {
      continue;
    }
    break;
  }
LABEL_188:

LABEL_189:
  self = v397;
LABEL_39:
  if (!v370)
  {
LABEL_236:
    v196 = 0;
    goto LABEL_320;
  }
  uint64_t v43 = SPLogForSPLogCategoryQuery();
  os_log_type_t v44 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = [(NSArray *)v11 count];
    *(_DWORD *)buf = 134219008;
    *(void *)&uint8_t buf[4] = v45;
    __int16 v488 = 1024;
    *(_DWORD *)v489 = v373;
    *(_WORD *)&v489[4] = 1024;
    *(_DWORD *)&v489[6] = v372;
    LOWORD(v490) = 1024;
    *(_DWORD *)((char *)&v490 + 2) = v368;
    HIWORD(v490) = 1024;
    v491[0] = v369;
    _os_log_impl(&dword_235D0B000, v43, v44, "Sending results, sectionCount:%ld, complete:%d, reset:%d, partiallyComplete:%d, update:%d", buf, 0x24u);
  }

  if (sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__onceToken[0] != -1) {
    dispatch_once(sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__onceToken, &__block_literal_global_309);
  }
  uint64_t v46 = SPMaxCountTopHits();
  SPMinTopHitThresholdForBigResult();
  double v48 = v47;
  if ([(SPFederatedQueryTask *)self isBullseyeCommittedSearch])
  {
    if (self->_isPeopleSearch) {
      unint64_t v49 = SPMaxSectionsBeforeShowMoreWithScopedSearch();
    }
    else {
      unint64_t v49 = SPMaxSectionsBeforeShowMore();
    }
  }
  else
  {
    unint64_t v49 = SSMaxSectionsBelowSuggestions();
  }
  if (v367 >= v49) {
    unint64_t v80 = v49;
  }
  else {
    unint64_t v80 = v367;
  }
  v432 = v41;
  v422 = v11;
  if (!self->_topHitsManager)
  {
    id v81 = objc_alloc(MEMORY[0x263F78DD0]);
    v82 = [(SPQueryTask *)self query];
    uint64_t v83 = [v82 queryID];
    categoryToResultMapping = v397->_categoryToResultMapping;
    topHitSectiouint64_t n = v397->_topHitSection;
    v86 = [(SPQueryTask *)v397 query];
    [v86 queryContext];
    v88 = unint64_t v87 = v80;
    uint64_t v89 = v83;
    self = v397;
    char v90 = categoryToResultMapping;
    uint64_t v11 = v422;
    v91 = topHitSection;
    uint64_t v41 = v432;
    uint64_t v92 = [v81 initWithQueryId:v89 categoryToResultMapping:v90 currentTopHitSection:v91 queryContext:v88 ranker:v397->_itemRanker];
    topHitsManager = v397->_topHitsManager;
    v397->_topHitsManager = (SSBullseyeTopHitsManager *)v92;

    unint64_t v80 = v87;
  }
  if (v389)
  {
    v94 = v11;
  }
  else if (v367)
  {
    v95 = [(SPQueryTask *)self query];
    v96 = [v95 queryContext];
    [v96 searchEntities];
    v98 = id v97 = self;
    if (v98)
    {
      v99 = [(SPQueryTask *)v97 query];
      v100 = [v99 queryContext];
      v101 = [v100 searchEntities];
      if ([v101 count])
      {
        v409 = [(SPQueryTask *)v97 query];
        v403 = [v409 queryContext];
        int v102 = [v403 searchEntities];
        [v102 lastObject];
        v415 = v100;
        v103 = v95;
        uint64_t v104 = v99;
        unint64_t v105 = v80;
        v107 = uint64_t v106 = v46;
        v108 = v101;
        int v109 = [v107 isScopedSearch] ^ 1;

        uint64_t v46 = v106;
        unint64_t v80 = v105;
        v99 = v104;
        v95 = v103;
        v100 = v415;

        int v110 = v109;
        v101 = v108;
      }
      else
      {
        int v110 = 1;
      }

      uint64_t v41 = v432;
    }
    else
    {
      int v110 = 1;
    }

    if (v369 || !v110)
    {
      uint64_t v11 = v422;
      v94 = v422;
      self = v397;
    }
    else
    {
      self = v397;
      v167 = [(NSArray *)v397->_actualSentSections firstObject];
      v168 = v167;
      if (v167)
      {
        uint64_t v169 = v46;
        v170 = [v167 bundleIdentifier];
        char v171 = [v170 isEqual:@"com.apple.spotlight.tophits"];

        if ((v171 & 1) == 0)
        {

          v168 = 0;
        }
        uint64_t v46 = v169;
      }
      id v172 = v397->_topHitsManager;
      uint64_t v11 = v422;
      uint64_t v173 = [(SPFederatedQueryTask *)v397 isBullseyeCommittedSearch]
          || [(SPFederatedQueryTask *)v397 isEntitySearch];
      id v460 = v168;
      v94 = [(SSBullseyeTopHitsManager *)v172 tagOrFilterHiddenSectionsForClient:v422 isCommittedSearch:v173 maxVisibleSections:v80 maxTopHitsCount:v46 minThresholdForBigResult:&v460 topHitSection:v48];
      id v174 = v460;

      if (v174 && [v174 resultsCount]) {
        v397->_sentTaggedTopHits = 1;
      }
    }
  }
  else
  {
    v94 = 0;
  }
  int v175 = [(SPQueryTask *)self query];
  [v175 queryIdent];
  v176 = v94;
  v177 = v176;
  if (v176) {
    v178 = v176;
  }
  else {
    v178 = (NSArray *)MEMORY[0x263EFFA68];
  }
  if (a10 != 4)
  {
    v188 = v178;
    goto LABEL_230;
  }
  if (![(NSArray *)v178 count])
  {
    v188 = 0;
    goto LABEL_230;
  }
  v179 = [(NSArray *)v178 objectAtIndex:0];
  v180 = [v179 bundleIdentifier];
  int v181 = [v180 isEqualToString:@"com.apple.spotlight.tophits"];

  if (!v181)
  {
LABEL_229:

    v188 = 0;
    self = v397;
    uint64_t v11 = v422;
    uint64_t v41 = v432;
    goto LABEL_230;
  }
  unint64_t v182 = [v179 resultSet];
  v183 = [v182 objectAtIndexedSubscript:0];
  uint64_t v184 = [v183 sectionBundleIdentifier];

  if (!v184 || !priorityIndexEligibleBundleIdentifer(v184))
  {
LABEL_228:

    goto LABEL_229;
  }
  if (!SSIsCounterFactual())
  {
    int v189 = SSPriorityIndexFastPathEnabled();
    id v190 = objc_alloc(MEMORY[0x263F08C38]);
    if (v189)
    {
      v191 = (void *)[v190 initWithUUIDString:*MEMORY[0x263F79138]];
      SSDefaultsLogForTrigger();

      goto LABEL_223;
    }
    v192 = (void *)[v190 initWithUUIDString:*MEMORY[0x263F79130]];
    SSDefaultsLogForTrigger();

    v187 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
LABEL_226:
      _os_log_impl(&dword_235D0B000, v187, OS_LOG_TYPE_DEFAULT, "Withholding priority index fast path because it's disabled", buf, 2u);
    }
LABEL_227:

    goto LABEL_228;
  }
  id v185 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v186 = (void *)[v185 initWithUUIDString:*MEMORY[0x263F79138]];
  SSDefaultsLogForTrigger();

  if (!SSPriorityIndexFastPathEnabled())
  {
    v187 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      goto LABEL_226;
    }
    goto LABEL_227;
  }
LABEL_223:
  *(void *)buf = v179;
  uint64_t v41 = v432;
  v188 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:1];

  self = v397;
  uint64_t v11 = v422;
LABEL_230:

  if (!v188)
  {
    uint64_t v195 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235D0B000, v195, OS_LOG_TYPE_DEFAULT, "Withholding early priority index results", buf, 2u);
    }

    [(SSBullseyeTopHitsManager *)self->_topHitsManager resetVisibilityCounts];
    goto LABEL_236;
  }
  id v400 = v188;
  id v193 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a10 == 4)
  {
    id v390 = 0;
    id v194 = 0;
    goto LABEL_242;
  }
  id v197 = [(SPQueryTask *)v397 query];
  v198 = [v197 queryContext];
  uint64_t v199 = [v198 queryKind];
  uint64_t v200 = v397->_clientBundleID;
  if (SPQueryKindIsSearchToolSearch_onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken, &__block_literal_global_1034);
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode)
  {
LABEL_240:

    id v390 = 0;
    id v194 = 0;
    goto LABEL_241;
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolRanking)
  {
    if ([(NSString *)v200 hasPrefix:@"com.apple.omniSearch"]
      || [(NSString *)v200 hasPrefix:@"com.apple.intelligenceflow"])
    {
      goto LABEL_240;
    }
    BOOL v219 = [(NSString *)v200 hasPrefix:@"com.apple.ondeviceeval"];

    id v194 = 0;
    if (v199 == 12 || v219)
    {
      id v390 = 0;
      goto LABEL_242;
    }
  }
  else
  {
  }
  int v259 = [MEMORY[0x263F78E10] isEnabled];
  if (a10 == 2)
  {
    uint64_t v260 = v400;
  }
  else
  {
    uint64_t v260 = v400;
    if (v259)
    {
      if ([(SPFederatedQueryTask *)v397 isBullseyeNonCommittedSearch])
      {
        v261 = (void *)MEMORY[0x263F78E10];
        v262 = [(SPQueryTask *)v397 query];
        v263 = [v262 queryContext];
        v264 = [(SSRankingManager *)v397->_rankingManager rankingConfiguration];
        [v261 setQueryIntentForQueryContext:v263 sections:v400 rankingInfo:v264];

        v265 = (void *)MEMORY[0x263F78E10];
        v266 = [(SPQueryTask *)v397 query];
        v267 = [v266 queryContext];
        uint64_t v268 = [v265 applySectionPolicyForQueryContext:v267 sections:v400];

        uint64_t v260 = (void *)v268;
      }
      uint64_t v41 = v432;
    }
  }
  id v400 = v260;
  if (!v424)
  {
    id v390 = 0;
    id v194 = 0;
    goto LABEL_387;
  }
  long long v458 = 0u;
  long long v459 = 0u;
  long long v456 = 0u;
  long long v457 = 0u;
  id v392 = v260;
  uint64_t v417 = [v392 countByEnumeratingWithState:&v456 objects:v486 count:16];
  if (!v417)
  {
    id v390 = 0;
    id v194 = 0;
    goto LABEL_386;
  }
  id v390 = 0;
  id v194 = 0;
  uint64_t v269 = *(void *)v457;
  uint64_t v412 = *MEMORY[0x263F790F8];
  uint64_t v382 = *(void *)v457;
  id v387 = (id)*MEMORY[0x263F79110];
  while (2)
  {
    uint64_t v270 = 0;
    while (2)
    {
      if (*(void *)v457 != v269) {
        objc_enumerationMutation(v392);
      }
      v271 = *(void **)(*((void *)&v456 + 1) + 8 * v270);
      v272 = [v271 bundleIdentifier];
      int v273 = [v272 isEqual:v412];

      if (v273)
      {
        uint64_t v428 = v270;
        id v274 = v271;

        long long v454 = 0u;
        long long v455 = 0u;
        long long v452 = 0u;
        long long v453 = 0u;
        v275 = [v274 results];
        uint64_t v276 = [v275 countByEnumeratingWithState:&v452 objects:v485 count:16];
        if (v276)
        {
          uint64_t v277 = v276;
          id v406 = v274;
          uint64_t v278 = *(void *)v453;
          while (1)
          {
            for (uint64_t m = 0; m != v277; ++m)
            {
              if (*(void *)v453 != v278) {
                objc_enumerationMutation(v275);
              }
              v280 = *(void **)(*((void *)&v452 + 1) + 8 * m);
              if (!v194)
              {
                v284 = [*(id *)(*((void *)&v452 + 1) + 8 * m) contactIdentifier];
                if (v284)
                {

LABEL_369:
                  v286 = [v280 contactIdentifier];
                  id v283 = v286;
                  if (v286)
                  {
                    id v283 = v286;
                    id v194 = v283;
                  }
                  else
                  {
                    id v194 = [v280 personIdentifier];
                  }
LABEL_372:

                  continue;
                }
                v285 = [v280 personIdentifier];

                if (v285) {
                  goto LABEL_369;
                }
              }
              v281 = [v280 sectionBundleIdentifier];
              int v282 = [v281 isEqualToString:@"com.apple.application"];

              if (v282 && ![v193 count])
              {
                id v283 = [v280 resultBundleId];
                [v193 addObject:v283];
                goto LABEL_372;
              }
            }
            uint64_t v277 = [v275 countByEnumeratingWithState:&v452 objects:v485 count:16];
            if (!v277)
            {
              id v396 = v406;
              uint64_t v269 = v382;
              goto LABEL_380;
            }
          }
        }
        id v396 = v274;
LABEL_380:

        uint64_t v270 = v428;
        uint64_t v41 = v432;
      }
      else
      {
        v287 = [v271 bundleIdentifier];
        int v288 = [v287 isEqual:v387];

        if (v288)
        {
          uint64_t v428 = v270;
          v275 = v390;
          id v390 = v271;
          goto LABEL_380;
        }
        uint64_t v41 = v432;
      }
      if (++v270 != v417) {
        continue;
      }
      break;
    }
    uint64_t v417 = [v392 countByEnumeratingWithState:&v456 objects:v486 count:16];
    if (v417) {
      continue;
    }
    break;
  }
LABEL_386:

LABEL_387:
  v289 = [v41 resultSet];
  uint64_t v290 = [v289 count];

  if (!v290) {
    goto LABEL_453;
  }
  id v291 = objc_alloc_init(MEMORY[0x263EFF980]);
  v429 = objc_opt_new();
  v379 = objc_opt_new();
  v292 = [v41 results];
  v293 = (void *)[v292 copy];

  v294 = [v434 results];
  v295 = (void *)[v294 copy];

  long long v450 = 0u;
  long long v451 = 0u;
  long long v448 = 0u;
  long long v449 = 0u;
  id v388 = v295;
  uint64_t v296 = [v388 countByEnumeratingWithState:&v448 objects:v484 count:16];
  if (v296)
  {
    uint64_t v297 = v296;
    char v418 = 0;
    uint64_t v298 = *(void *)v449;
    do
    {
      for (uint64_t n = 0; n != v297; ++n)
      {
        if (*(void *)v449 != v298) {
          objc_enumerationMutation(v388);
        }
        v300 = *(void **)(*((void *)&v448 + 1) + 8 * n);
        v301 = [v300 contactIdentifier];

        if (v301)
        {
          v302 = [v300 contactIdentifier];
          [v429 setObject:v300 forKey:v302];

          if ((v418 & 1) != 0
            || ([v300 contactIdentifier],
                v303 = objc_claimAutoreleasedReturnValue(),
                char v304 = [v303 isEqualToString:v194],
                v303,
                (v304 & 1) == 0))
          {
            [v291 addObject:v300];
          }
          else
          {
            char v418 = 1;
          }
        }
      }
      uint64_t v297 = [v388 countByEnumeratingWithState:&v448 objects:v484 count:16];
    }
    while (v297);
  }
  else
  {
    char v418 = 0;
  }

  if (sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__onceTokenContact != -1) {
    dispatch_once(&sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__onceTokenContact, &__block_literal_global_313);
  }
  v413 = v291;
  long long v446 = 0u;
  long long v447 = 0u;
  long long v444 = 0u;
  long long v445 = 0u;
  id v305 = v293;
  uint64_t v306 = [v305 countByEnumeratingWithState:&v444 objects:v483 count:16];
  if (!v306)
  {
    id v308 = 0;
    goto LABEL_427;
  }
  uint64_t v307 = v306;
  id v308 = 0;
  uint64_t v309 = *(void *)v445;
  while (2)
  {
    uint64_t v310 = 0;
    while (2)
    {
      if (*(void *)v445 != v309) {
        objc_enumerationMutation(v305);
      }
      v311 = *(void **)(*((void *)&v444 + 1) + 8 * v310);
      v312 = [v311 personIdentifier];

      if (v312)
      {
        v313 = (void *)sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__store;
        v314 = [v311 personIdentifier];
        id v443 = v308;
        id v315 = (id)[v313 unifiedContactWithIdentifier:v314 keysToFetch:sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__contactKeysToFetch error:&v443];
        id v316 = v443;
        v317 = v308;
        id v308 = v316;

        if (v308)
        {
          if ([v308 code] != 200)
          {
            v318 = SPLogForSPLogCategoryDefault();
            if (os_log_type_enabled(v318, OS_LOG_TYPE_DEFAULT))
            {
              id v319 = [v308 localizedDescription];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v319;
              _os_log_impl(&dword_235D0B000, v318, OS_LOG_TYPE_DEFAULT, "*warn* CNContactStore fetch error: %@", buf, 0xCu);
            }
            goto LABEL_422;
          }
        }
        else
        {
          v320 = [v311 personIdentifier];
          v321 = [v429 objectForKey:v320];

          if (v321)
          {
            id v308 = 0;
          }
          else
          {
            v322 = [v311 personIdentifier];
            [v429 setObject:v311 forKey:v322];

            v323 = [v311 title];
            v324 = [v323 text];
            v318 = SSNormalizedQueryString();

            if (([v379 containsObject:v318] & 1) == 0)
            {
              [v379 addObject:v318];
              if ((v418 & 1) == 0)
              {
                v325 = [v311 personIdentifier];
                char v326 = [v325 isEqualToString:v194];

                if (v326)
                {
                  id v308 = 0;
                  char v418 = 1;
                  goto LABEL_422;
                }
              }
              [v413 addObject:v311];
            }
            id v308 = 0;
LABEL_422:
          }
        }
      }
      if (v307 != ++v310) {
        continue;
      }
      break;
    }
    uint64_t v307 = [v305 countByEnumeratingWithState:&v444 objects:v483 count:16];
    if (v307) {
      continue;
    }
    break;
  }
LABEL_427:
  v371 = v308;
  v376 = v305;

  v327 = v413;
  unint64_t v328 = [v413 count];
  if (v328 >= SPMaxVisibleResultsCountPerSection()) {
    uint64_t v329 = SPMaxVisibleResultsCountPerSection();
  }
  else {
    uint64_t v329 = [v413 count];
  }
  uint64_t v407 = v329;
  v330 = v429;
  long long v441 = 0u;
  long long v442 = 0u;
  long long v439 = 0u;
  long long v440 = 0u;
  id v400 = v400;
  uint64_t v331 = [v400 countByEnumeratingWithState:&v439 objects:v482 count:16];
  if (v331)
  {
    uint64_t v332 = v331;
    uint64_t v393 = 0;
    uint64_t v333 = *(void *)v440;
    uint64_t v334 = *MEMORY[0x263F79030];
    uint64_t v383 = *MEMORY[0x263F79058];
    uint64_t v419 = -1;
    do
    {
      for (iuint64_t i = 0; ii != v332; ++ii)
      {
        if (*(void *)v440 != v333) {
          objc_enumerationMutation(v400);
        }
        v336 = *(void **)(*((void *)&v439 + 1) + 8 * ii);
        v337 = [v336 bundleIdentifier];
        int v338 = [v337 isEqual:v334];

        if (v338)
        {
          [v336 setMaxInitiallyVisibleResults:v407];
          [v336 setResults:v413];
        }
        else
        {
          v339 = [v336 bundleIdentifier];
          int v340 = [v339 isEqual:v383];

          uint64_t v341 = v419;
          if (v340)
          {
            uint64_t v341 = v393 + ii;
            BOOL v342 = v434 == 0;
          }
          else
          {
            BOOL v342 = 0;
          }
          if (v342)
          {
            [v336 setBundleIdentifier:v334];
            [v336 setMaxInitiallyVisibleResults:v407];
            [v336 setResults:v413];
            v343 = obj;
            if (!obj) {
              v343 = (NSArray *)objc_opt_new();
            }
            v344 = [v336 bundleIdentifier];
            [(NSArray *)v343 addObject:v344];

            v345 = [v336 title];
            id obj = v343;
            [(NSArray *)v343 addObject:v345];
          }
          else
          {
            uint64_t v419 = v341;
          }
        }
      }
      v393 += v332;
      uint64_t v332 = [v400 countByEnumeratingWithState:&v439 objects:v482 count:16];
    }
    while (v332);

    if (v419 < 0)
    {
      v327 = v413;
      v330 = v429;
    }
    else
    {
      v327 = v413;
      v330 = v429;
      if (v434)
      {
        v346 = (void *)[v400 mutableCopy];
        [v346 removeObjectAtIndex:v419];
        id v347 = v346;

        goto LABEL_451;
      }
    }
  }
  else
  {
    id v347 = v400;
LABEL_451:
    id v400 = v347;
  }
LABEL_453:
  if (v424)
  {
    long long v437 = 0u;
    long long v438 = 0u;
    long long v435 = 0u;
    long long v436 = 0u;
    id v197 = v400;
    uint64_t v348 = [v197 countByEnumeratingWithState:&v435 objects:v481 count:16];
    if (v348)
    {
      uint64_t v349 = v348;
      uint64_t v350 = *(void *)v436;
      uint64_t v351 = *MEMORY[0x263F790C0];
      uint64_t v420 = *MEMORY[0x263F790C0];
      do
      {
        uint64_t v352 = 0;
        uint64_t v430 = v349;
        do
        {
          if (*(void *)v436 != v350) {
            objc_enumerationMutation(v197);
          }
          v353 = *(void **)(*((void *)&v435 + 1) + 8 * v352);
          v354 = [v353 bundleIdentifier];
          int v355 = [v354 isEqual:v351];

          if (v355)
          {
            v356 = [(SPQueryTask *)v397 query];
            v357 = [v356 queryContext];
            [v357 searchString];
            uint64_t v358 = v350;
            v360 = id v359 = v197;
            v361 = [(SPFederatedQueryTask *)v397 suggestionsWithSearchString:v360 sections:v359 topHitSection:v396 highestLocalScore:v42];
            [v353 setResults:v361];

            uint64_t v349 = v430;
            id v197 = v359;
            uint64_t v350 = v358;
            uint64_t v351 = v420;
          }
          ++v352;
        }
        while (v349 != v352);
        uint64_t v349 = [v197 countByEnumeratingWithState:&v435 objects:v481 count:16];
      }
      while (v349);
    }
    id v400 = v197;
LABEL_241:
  }
LABEL_242:
  uint64_t v201 = [(SPQueryTask *)v397 query];
  v202 = [v201 queryContext];
  uint64_t v203 = [v202 queryKind];
  v204 = v397->_clientBundleID;
  if (SPQueryKindIsSearchToolSearch_onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken, &__block_literal_global_1034);
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode)
  {
LABEL_245:

    goto LABEL_246;
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolRanking)
  {
    if ([(NSString *)v204 hasPrefix:@"com.apple.omniSearch"]
      || [(NSString *)v204 hasPrefix:@"com.apple.intelligenceflow"])
    {
      goto LABEL_245;
    }
    BOOL v218 = [(NSString *)v204 hasPrefix:@"com.apple.ondeviceeval"];

    if (v203 == 12 || v218)
    {
LABEL_246:
      uint64_t v205 = (void *)MEMORY[0x263F78E28];
      uint64_t v201 = [(SPQueryTask *)v397 query];
      v202 = [v201 queryContext];
      uint64_t v206 = v205;
      v204 = (NSString *)v400;
      id v400 = [v206 processSearchToolFinalResults:v400 queryContext:v202];
      goto LABEL_247;
    }
  }
  else
  {
LABEL_247:
  }
  uint64_t v207 = [MEMORY[0x263F78E58] postProcessSectionsBasedOnTopHitSection:v400 withTopHitSection:v396];

  [MEMORY[0x263F78E58] finalizeTopHitsInSections:v207 withTopHitSection:v396];
  [MEMORY[0x263F78E28] fillRankingPosition:v207];
  if (a10 != 2) {
    goto LABEL_253;
  }
  uint64_t v208 = [(SPQueryTask *)v397 query];
  uint64_t v209 = [v208 queryContext];
  uint64_t v210 = [v209 queryKind];
  v211 = v397->_clientBundleID;
  if (SPQueryKindIsSearchToolSearch_onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken, &__block_literal_global_1034);
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode)
  {
LABEL_252:

    goto LABEL_253;
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolRanking)
  {
    if ([(NSString *)v211 hasPrefix:@"com.apple.omniSearch"]
      || [(NSString *)v211 hasPrefix:@"com.apple.intelligenceflow"])
    {
      goto LABEL_252;
    }
    BOOL v220 = [(NSString *)v211 hasPrefix:@"com.apple.ondeviceeval"];

    if (v210 == 12 || v220)
    {
LABEL_253:
      p_isa = (id *)&v397->super.super.isa;
      objc_storeStrong((id *)&v397->_actualSentSections, v207);
      goto LABEL_254;
    }
  }
  else
  {
  }
  p_isa = (id *)&v397->super.super.isa;
  [(SPFederatedQueryTask *)v397 addDictionarySections:v207];
LABEL_254:
  v213 = [p_isa query];
  uint64_t v214 = [v213 queryContext];
  uint64_t v215 = [v214 queryKind];
  id v216 = p_isa[56];
  if (SPQueryKindIsSearchToolSearch_onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken, &__block_literal_global_1034);
  }
  v427 = v207;
  if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode)
  {
LABEL_283:

    goto LABEL_284;
  }
  if (!SPQueryKindIsSearchToolSearch_isSearchToolRanking)
  {

LABEL_282:
    v213 = [MEMORY[0x263F67468] sharedInstance];
    v405 = v397->_actualSentSections;
    uint64_t v214 = [(SPQueryTask *)v397 query];
    id v216 = [v214 queryContext];
    id v401 = [v216 searchString];
    v411 = [(SPQueryTask *)v397 query];
    uint64_t v391 = [v411 queryIdent];
    allowAnonymousDataCollectiouint64_t n = v397->_allowAnonymousDataCollection;
    itemRanker = v397->_itemRanker;
    id v221 = [(SSRankingManager *)v397->_rankingManager rankingConfiguration];
    id v386 = [(SPQueryTask *)v397 query];
    char v222 = [v386 internalDebug];
    v375 = [(SPQueryTask *)v397 query];
    uint64_t v223 = [v375 queryContext];
    int v224 = [v223 keyboardPrimaryLanguage];
    LOBYTE(v362) = v222;
    uint64_t v207 = v427;
    [v213 willSendSections:v405 forQuery:v401 queryIdentifier:v391 allowAnonymousDataCollection:allowAnonymousDataCollection withRankerUsed:itemRanker withRankingConfiguration:v221 internalDebug:v362 keyboardPrimaryLanguage:v224 clientID:v397->_clientBundleID];

    goto LABEL_283;
  }
  if (([v216 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
    || ([v216 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
  {
    goto LABEL_283;
  }
  char v217 = [v216 hasPrefix:@"com.apple.ondeviceeval"];

  if (v215 != 12 && (v217 & 1) == 0) {
    goto LABEL_282;
  }
LABEL_284:
  if ([(SPFederatedQueryTask *)v397 isInternalDevice] && v373) {
    [(SPFederatedQueryTask *)v397 sendTTRLogsWithSections:v397->_actualSentSections];
  }
  if ([v207 count])
  {
    BOOL v225 = 0;
    goto LABEL_291;
  }
  v226 = v397;
  if (v397->_sendStableSections)
  {
    BOOL v225 = [(NSArray *)v397->_stableSections count] != 0;
LABEL_291:
    v226 = v397;
    uint64_t v227 = [(SPQueryTask *)v397 query];
    char v228 = [v227 cancelled];

    if ((v228 & 1) == 0)
    {
      BOOL v229 = a10 == 4;
      id v230 = (void *)[objc_alloc(MEMORY[0x263F674A8]) initWithSections:v427 stableSections:v397->_stableSections];
      v231 = [(SPQueryTask *)v397 query];
      double blendingTime = v397->_blendingTime;
      uint64_t v233 = [(SPFederatedQueryTask *)v397 geoUserSessionEntityString];
      long long v234 = (void *)v233;
      long long v235 = &stru_26E92AFF0;
      if (v233) {
        long long v235 = (__CFString *)v233;
      }
      bundlesSupportingAppScoping = v397->_bundlesSupportingAppScoping;
      if (!bundlesSupportingAppScoping) {
        bundlesSupportingAppScoping = (NSArray *)MEMORY[0x263EFFA68];
      }
      long long v237 = obj;
      if (!obj) {
        long long v237 = (NSArray *)MEMORY[0x263EFFA68];
      }
      v364 = bundlesSupportingAppScoping;
      v365 = v237;
      v363 = v235;
      BYTE3(v362) = v225;
      BYTE2(v362) = a8;
      BYTE1(v362) = a9;
      goto LABEL_299;
    }
  }
  else
  {
    v247 = [(SPQueryTask *)v397 query];
    char v248 = [v247 cancelled];

    if ((v248 & 1) == 0)
    {
      BOOL v229 = a10 == 4;
      id v249 = objc_alloc(MEMORY[0x263F674A8]);
      id v250 = (NSArray *)MEMORY[0x263EFFA68];
      id v230 = (void *)[v249 initWithSections:MEMORY[0x263EFFA68]];
      v231 = [(SPQueryTask *)v397 query];
      double blendingTime = v397->_blendingTime;
      uint64_t v251 = [(SPFederatedQueryTask *)v397 geoUserSessionEntityString];
      long long v234 = (void *)v251;
      v252 = &stru_26E92AFF0;
      if (v251) {
        v252 = (__CFString *)v251;
      }
      v253 = v397->_bundlesSupportingAppScoping;
      if (!v253) {
        v253 = v250;
      }
      v254 = obj;
      if (!obj) {
        v254 = v250;
      }
      v364 = v253;
      v365 = v254;
      v363 = v252;
      BYTE3(v362) = 0;
      BYTE2(v362) = a8;
      BYTE1(v362) = 0;
LABEL_299:
      LOBYTE(v362) = v373;
      -[SPFederatedQueryTask searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:](v226, "searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", v231, v230, v372, v368, v229, v369, blendingTime, v362, v363, v364, v365);

      v226 = v397;
    }
  }
  stableSections = v226->_stableSections;
  v226->_stableSections = 0;

  long long v239 = [(SPQueryTask *)v226 query];
  long long v240 = [v239 queryContext];
  uint64_t v241 = [v240 queryKind];
  long long v242 = v226->_clientBundleID;
  if (SPQueryKindIsSearchToolSearch_onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken, &__block_literal_global_1034);
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode)
  {
LABEL_303:

    uint64_t v11 = v422;
    goto LABEL_304;
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolRanking)
  {
    if ([(NSString *)v242 hasPrefix:@"com.apple.omniSearch"]
      || [(NSString *)v242 hasPrefix:@"com.apple.intelligenceflow"])
    {
      goto LABEL_303;
    }
    BOOL v246 = [(NSString *)v242 hasPrefix:@"com.apple.ondeviceeval"];

    BOOL v124 = v241 == 12;
    uint64_t v11 = v422;
    uint64_t v41 = v432;
    if (v124 || v246) {
      goto LABEL_305;
    }
  }
  else
  {

    uint64_t v11 = v422;
  }
  id v255 = objc_alloc(MEMORY[0x263F67808]);
  v256 = [(SPQueryTask *)v397 query];
  long long v239 = objc_msgSend(v255, "initWithEvent:timeInterval:queryId:", @"com.apple.spotlight.backend.query.end", 0, objc_msgSend(v256, "queryIdent"));

  if (!v369)
  {
    long long v240 = [MEMORY[0x263F674B0] sharedProxy];
    long long v242 = [(SPQueryTask *)v397 query];
    uint64_t v257 = [(NSString *)v242 queryIdent];
    v258 = [(SPXPCConnection *)v397->_connection bundleID];
    [v240 sendFeedbackType:21 feedback:v239 queryId:v257 clientID:v258];

    goto LABEL_303;
  }
LABEL_304:
  uint64_t v41 = v432;

LABEL_305:
  if ([(NSMutableArray *)v397->_slowTokens count]
    || [(NSMutableArray *)v397->_tokens count]
    || [(NSMutableArray *)v397->_delayedStartTokens count])
  {
    BOOL v243 = 0;
  }
  else if ([(NSMutableArray *)v397->_delayedStartQueries count])
  {
    BOOL v243 = 0;
  }
  else
  {
    BOOL v243 = v373;
  }
  if (v372)
  {
    [(SPFederatedQueryTask *)v397 externalID];
    kdebug_trace();
  }
  if (v373)
  {
    [(SPFederatedQueryTask *)v397 externalID];
    kdebug_trace();
  }
  if (v243)
  {
    v244 = v397->_categoryToResultMapping;
    v397->_categoryToResultMapping = 0;

    [(SPFederatedQueryTask *)v397 setServer_features:0];
    [(SPFederatedQueryTask *)v397 setTokens:0];
    [(SPFederatedQueryTask *)v397 setSlowTokens:0];
  }
  if (a10 == 4)
  {
    v245 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235D0B000, v245, OS_LOG_TYPE_DEFAULT, "Sending early priority index results", buf, 2u);
    }

    v397->_sentPriority = 1;
  }

  v196 = v390;
LABEL_320:
}

id __107__SPFederatedQueryTask_sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  [v3 setDomain:1];
  [v3 setBundleIdentifier:v2];
  [v3 setMaxInitiallyVisibleResults:SPMaxVisibleResultsCountPerSection()];
  id v4 = [MEMORY[0x263F67470] displayNameForBundleIdentifer:v2];

  [v3 setTitle:v4];
  return v3;
}

void __107__SPFederatedQueryTask_sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason___block_invoke_2()
{
  v4[1] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc_init(MEMORY[0x263EFEA58]);
  id v1 = (void *)sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__store;
  sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__store = (uint64_t)v0;

  v4[0] = *MEMORY[0x263EFDFE0];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  id v3 = (void *)sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__contactKeysToFetch;
  sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__contactKeysToFetch = v2;
}

- (void)sendResults:(id)a3 reset:(BOOL)a4 partiallyComplete:(BOOL)a5 update:(BOOL)a6 complete:(BOOL)a7 delayedTopHit:(BOOL)a8 reason:(int)a9
{
  HIDWORD(v9) = a9;
  LOBYTE(v9) = a8;
  -[SPFederatedQueryTask sendResults:reset:partiallyComplete:update:complete:unchanged:delayedTopHit:reason:](self, "sendResults:reset:partiallyComplete:update:complete:unchanged:delayedTopHit:reason:", a3, a4, a5, a6, a7, 0, v9);
}

- (void)sendError:(id)a3
{
  id v6 = a3;
  id v4 = [(SPQueryTask *)self query];
  char v5 = [v4 cancelled];

  if ((v5 & 1) == 0) {
    [(SPFederatedQueryTask *)self searchQueryEncounteredError:v6];
  }
}

- (void)sendQueryCompleted
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = SPLogForSPLogCategoryDefault();
  id v4 = (unsigned char *)MEMORY[0x263F67540];
  os_log_type_t v5 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v3, v5))
  {
    int v16 = 67109120;
    qos_class_t v17 = qos_class_self();
    _os_log_impl(&dword_235D0B000, v3, v5, "QOS sendQueryCompleted 1: %d", (uint8_t *)&v16, 8u);
  }

  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  SDTraceAdd();
  id v6 = SPLogForSPLogCategoryDefault();
  os_log_type_t v7 = 2 * (*v4 == 0);
  if (os_log_type_enabled(v6, v7))
  {
    qos_class_t v8 = qos_class_self();
    int v16 = 67109120;
    qos_class_t v17 = v8;
    _os_log_impl(&dword_235D0B000, v6, v7, "QOS sendQueryCompleted 2: %d", (uint8_t *)&v16, 8u);
  }

  uint64_t v9 = SPLogForSPLogCategoryQuery();
  os_log_type_t v10 = 2 * (*v4 == 0);
  if (os_log_type_enabled(v9, v10))
  {
    unsigned int externalID = self->_externalID;
    int v16 = 67109120;
    qos_class_t v17 = externalID;
    _os_log_impl(&dword_235D0B000, v9, v10, "Completed query %d", (uint8_t *)&v16, 8u);
  }

  uint64_t v12 = SPLogForSPLogCategoryTelemetry();
  int v13 = v12;
  os_signpost_id_t v14 = self->_externalID;
  if (v14 && os_signpost_enabled(v12))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_235D0B000, v13, OS_SIGNPOST_INTERVAL_END, v14, "spotlightLatency", " enableTelemetry=YES ", (uint8_t *)&v16, 2u);
  }

  categoryToResultMapping = self->_categoryToResultMapping;
  self->_categoryToResultMapping = 0;

  [(SPFederatedQueryTask *)self setTokens:0];
  [(SPFederatedQueryTask *)self setSlowTokens:0];
  [(SPFederatedQueryTask *)self setDelayedStartTokens:0];
  [(SPFederatedQueryTask *)self setDelayedStartQueries:0];
  self->_parsecCameLaterThanSRT = 0;
  self->_parsecEntityCameEarly = 0;
  self->_receivedLateParsecResults = 0;
  self->_shouldRecomputeSuggestions = 1;
  self->_sentTaggedTopHits = 0;
}

- (void)sendQueryReset
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(SPFederatedQueryTask *)self externalID];
  kdebug_trace();
  id v3 = SPLogForSPLogCategoryQuery();
  os_log_type_t v4 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v3, v4))
  {
    unsigned int externalID = self->_externalID;
    *(_DWORD *)buf = 67109120;
    unsigned int v9 = externalID;
    _os_log_impl(&dword_235D0B000, v3, v4, "Reset query %d", buf, 8u);
  }

  id v6 = [(SPQueryTask *)self query];
  LODWORD(v7) = 0;
  -[SPFederatedQueryTask searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:](self, "searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", v6, 0, 1, 0, 0, 0, 0.0, v7, &stru_26E92AFF0, 0, 0);
}

- (id)orderedCategories:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v4;
  uint64_t v19 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v7 = [(NSMutableDictionary *)self->_categoryToResultMapping objectForKey:v6];
        qos_class_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "domain"));
        unsigned int v9 = [(SPQueryTask *)self query];
        uint64_t v10 = [v9 queryContext];
        uint64_t v11 = [v10 searchDomains];
        uint64_t v12 = [v11 indexOfObject:v8];

        int v13 = [NSNumber numberWithUnsignedLongLong:v12];
        [v18 setObject:v13 forKey:v6];
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v19);
  }

  os_signpost_id_t v14 = [v18 keysSortedByValueWithOptions:1 usingComparator:&__block_literal_global_327];

  return v14;
}

uint64_t __42__SPFederatedQueryTask_orderedCategories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 integerValue];
  if (v6 <= [v5 integerValue])
  {
    uint64_t v8 = [v4 integerValue];
    if (v8 >= [v5 integerValue]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)sendResultsForKeys:(id)a3 toSendSections:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(SPFederatedQueryTask *)self orderedCategories:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [(NSMutableDictionary *)self->_categoryToResultMapping objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * v11)];
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)prepareAndSend:(id)a3 force:(BOOL)a4 moreComing:(BOOL)a5 reason:(int)a6
{
  BOOL v8 = a4;
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (v8) {
    self->_BOOL didForceSend = 1;
  }
  if (!a5)
  {
    int v50 = a6;
    uint64_t v22 = [(NSMutableArray *)self->_slowTokens count];
    uint64_t v23 = [(NSMutableArray *)self->_delayedStartTokens count];
    uint64_t v24 = [(NSMutableArray *)self->_delayedStartQueries count];
    uint64_t v25 = [(NSMutableArray *)self->_tokens count];
    if (v23 + v24) {
      BOOL v26 = 0;
    }
    else {
      BOOL v26 = (v22 | v25) == 0;
    }
    uint64_t v27 = v26;
    if (v25) {
      uint64_t v28 = 0;
    }
    else {
      uint64_t v28 = v27 ^ 1;
    }
    uint64_t v29 = SPLogForSPLogCategoryQuery();
    int v30 = (unsigned char *)MEMORY[0x263F67540];
    os_log_type_t v31 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v29, v31))
    {
      uint64_t v32 = v27;
      uint64_t v33 = v28;
      bottomPlacedSections = self->_bottomPlacedSections;
      uint64_t v35 = [(NSMutableDictionary *)self->_categoryToResultMapping allKeys];
      *(_DWORD *)buf = 138412546;
      long long v52 = bottomPlacedSections;
      uint64_t v28 = v33;
      uint64_t v27 = v32;
      int v30 = (unsigned char *)MEMORY[0x263F67540];
      __int16 v53 = 2112;
      long long v54 = v35;
      _os_log_impl(&dword_235D0B000, v29, v31, "#query send bottomRankedCategories %@ from %@", buf, 0x16u);
    }
    uint64_t v36 = SPLogForSPLogCategoryQuery();
    os_log_type_t v37 = 2 * (*v30 == 0);
    BOOL v38 = os_log_type_enabled(v36, v37);
    if (v22)
    {
      if (v38)
      {
        slowTokens = self->_slowTokens;
        tokens = self->_tokens;
        *(_DWORD *)buf = 138412546;
        long long v52 = slowTokens;
        __int16 v53 = 2112;
        long long v54 = tokens;
        _os_log_impl(&dword_235D0B000, v36, v37, "#query still waiting for %@ and %@", buf, 0x16u);
      }

      uint64_t v36 = SPLogForSPLogCategoryQuery();
      os_log_type_t v41 = 2 * (*v30 == 0);
      if (!os_log_type_enabled(v36, v41)) {
        goto LABEL_37;
      }
      double v42 = self->_bottomPlacedSections;
      *(_DWORD *)buf = 138412290;
      long long v52 = v42;
      uint64_t v43 = "#query _bottomRankedCategories %@";
      os_log_type_t v44 = v36;
      os_log_type_t v45 = v41;
      uint32_t v46 = 12;
    }
    else
    {
      if (!v38)
      {
LABEL_37:

        BOOL didForceSend = self->_didForceSend;
        LODWORD(v49) = v50;
        uint64_t v19 = self;
        id v20 = v10;
        BOOL v17 = v28;
        uint64_t v21 = v27;
        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
      uint64_t v43 = "#query No waiting stores";
      os_log_type_t v44 = v36;
      os_log_type_t v45 = v37;
      uint32_t v46 = 2;
    }
    _os_log_impl(&dword_235D0B000, v44, v45, v43, buf, v46);
    goto LABEL_37;
  }
  if (a6 == 5)
  {
    uint64_t v11 = [(NSMutableArray *)self->_slowTokens count];
    uint64_t v12 = [(NSMutableArray *)self->_delayedStartTokens count];
    uint64_t v13 = [(NSMutableArray *)self->_delayedStartQueries count];
    uint64_t v14 = [(NSMutableArray *)self->_tokens count];
    if (v12 + v13) {
      BOOL v15 = 0;
    }
    else {
      BOOL v15 = (v14 | v11) == 0;
    }
    BOOL v17 = !v15 && v14 == 0;
    BOOL didForceSend = self->_didForceSend;
    LODWORD(v49) = 5;
    uint64_t v19 = self;
    id v20 = v10;
    uint64_t v21 = 1;
    goto LABEL_38;
  }
  double v47 = [(SPQueryTask *)self query];
  char v48 = [v47 infinitePatience];

  if ((v48 & 1) == 0 && [v10 count])
  {
    BOOL v17 = a6 == 4;
    BOOL didForceSend = self->_didForceSend;
    LODWORD(v49) = a6;
    uint64_t v19 = self;
    id v20 = v10;
    uint64_t v21 = 0;
LABEL_38:
    [(SPFederatedQueryTask *)v19 sendResults:v20 reset:didForceSend partiallyComplete:v17 update:0 complete:v21 delayedTopHit:0 reason:v49];
  }
}

- (void)sendFinishedDomainsZKW:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(NSMutableArray *)self->_tokens count];
  BOOL v6 = v5 != 0;
  if (!v5 && !v3) {
    BOOL v6 = [(NSMutableArray *)self->_slowTokens count] != 0;
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v8 = self->_sectionOrderByInsertion;
  uint64_t v9 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v13, "resultsCount", (void)v14)) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(NSMutableOrderedSet *)self->_sectionOrderByInsertion removeAllObjects];
  [(SPFederatedQueryTask *)self prepareAndSend:v7 force:v3 moreComing:v6 reason:0];
}

- (BOOL)isPeopleSearch
{
  return self->_isPeopleSearch;
}

- (BOOL)isNLPSearch
{
  return self->_isNLPSearch;
}

- (BOOL)isEntitySearch
{
  return self->_isEntitySearch;
}

- (BOOL)isScopedAppSearch
{
  return self->_isScopedAppSearch;
}

- (BOOL)isPhotosSearch
{
  return self->_isPhotosSearch;
}

- (void)logPerfToAnalytics:(int)a3
{
  if (a3 > 4) {
    BOOL v3 = "unknown";
  }
  else {
    BOOL v3 = off_264C76B50[a3];
  }
  query_analytics_log_complete(self, v3, self->_startTime);
}

- (void)addMatchInfo:(_MDPlistContainer *)a3
{
  id obj = self;
  objc_sync_enter(obj);
  matchInfo = obj->_matchInfo;
  if (!matchInfo)
  {
    uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    BOOL v6 = obj->_matchInfo;
    obj->_matchInfo = v5;

    matchInfo = obj->_matchInfo;
  }
  [(NSMutableArray *)matchInfo addObject:a3];
  objc_sync_exit(obj);
}

- (__CFArray)copyMatchInfo
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (__CFArray *)[(NSMutableArray *)v2->_matchInfo copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)sendFinishedDomains:(BOOL)a3 reason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned int v5 = a3;
  uint64_t v250 = *MEMORY[0x263EF8340];
  id v7 = SPLogForSPLogCategoryDefault();
  os_log_type_t v8 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v7, v8))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235D0B000, v7, v8, "sendFinishedDomains", buf, 2u);
  }

  uint64_t v9 = [(NSMutableArray *)self->_slowTokens count];
  uint64_t v10 = [(NSMutableArray *)self->_tokens count];
  unsigned int v177 = v5;
  int v11 = (v9 > 0) & ~v5;
  if (v10 > 0) {
    int v11 = 1;
  }
  if (v4 == 4) {
    int v11 = 1;
  }
  unsigned int v182 = v11;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v237 = 0u;
  long long v238 = 0u;
  long long v239 = 0u;
  long long v240 = 0u;
  uint64_t v13 = [(NSMutableDictionary *)self->_categoryToResultMapping allValues];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v237 objects:v249 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v238;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v238 != v16) {
          objc_enumerationMutation(v13);
        }
        if ([*(id *)(*((void *)&v237 + 1) + 8 * i) resultsCount])
        {
          uint64_t v18 = 1;
          goto LABEL_17;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v237 objects:v249 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  uint64_t v18 = 0;
LABEL_17:

  uint64_t v19 = [(SPQueryTask *)self query];
  id v20 = [v19 queryContext];
  uint64_t v21 = [v20 searchEntities];
  v192 = self;
  if (v21)
  {
    unsigned int v202 = v18;
    id v197 = [(SPQueryTask *)self query];
    uint64_t v22 = [v197 queryContext];
    uint64_t v23 = [v22 searchEntities];
    if ([v23 count])
    {
      [(SPQueryTask *)self query];
      id v193 = v183 = v12;
      uint64_t v24 = [v193 queryContext];
      [v24 searchEntities];
      uint64_t v25 = v178 = v4;
      BOOL v26 = [v25 lastObject];
      uint64_t v27 = [v26 isScopedSearch];

      uint64_t v28 = v27;
      uint64_t v4 = v178;

      self = v192;
      id v12 = v183;
    }
    else
    {
      uint64_t v28 = 0;
    }

    uint64_t v18 = v202;
  }
  else
  {
    uint64_t v28 = 0;
  }

  uint64_t v29 = objc_opt_new();
  [(SSRankingManager *)self->_rankingManager setLogValues:v29];

  int v30 = [(SPQueryTask *)self query];
  char v31 = [v30 cancelled];

  if (v31) {
    goto LABEL_224;
  }
  uint64_t v32 = [(SPQueryTask *)self query];
  uint64_t v33 = [v32 queryContext];
  uint64_t v34 = [v33 queryKind];

  unsigned int v175 = v28;
  if (v4 != 4 && -[NSArray count](self->_actualSentSections, "count") && ![v12 count])
  {
    uint64_t v35 = [(NSArray *)self->_actualSentSections objectAtIndex:0];
    uint64_t v36 = [v35 bundleIdentifier];
    int v37 = [v36 isEqualToString:@"com.apple.spotlight.tophits"];

    if (v37)
    {
      [v12 addObject:v35];

      goto LABEL_31;
    }
  }
  [(SPFederatedQueryTask *)self addTopHitSectionIfNecessaryToSectionsForSending:v12 updatedSections:v18 isScopedSearch:v28];
LABEL_31:
  BOOL v38 = [(SPQueryTask *)self query];
  uint64_t v39 = [v38 queryContext];
  id v40 = [v39 searchString];
  [(SPFederatedQueryTask *)self addSuggestionsToSectionsForSending:v12 searchString:v40 updatedSections:v18 | v182 ^ 1 queryKind:v34];

  if (((v182 ^ 1) & 1) == 0
    && v4 >= 2
    && v4 != 3
    && (v4 != 4 || !self->_didReceiveCoreSpotlightProgress)
    && self->_didSendResults
    || !self->_categoryToResultMapping)
  {
    p_super = SPLogForSPLogCategoryDefault();
    os_log_type_t v52 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(p_super, v52))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235D0B000, p_super, v52, "Skipped ranking; already sent", buf, 2u);
    }
    goto LABEL_178;
  }
  self->_didSendResults = 1;
  uint64_t v176 = v34;
  unsigned int v179 = v4;
  uint64_t v184 = v12;
  __uint64_t v174 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  if (v4 == 4)
  {
    os_log_type_t v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v233 = 0u;
    long long v234 = 0u;
    long long v235 = 0u;
    long long v236 = 0u;
    double v42 = [(NSMutableDictionary *)self->_categoryToResultMapping allKeys];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v233 objects:v248 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v234;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v234 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v47 = *(void *)(*((void *)&v233 + 1) + 8 * j);
          char v48 = [(NSMutableDictionary *)self->_categoryToResultMapping objectForKey:v47];
          uint64_t v49 = [v48 bundleIdentifier];
          if (priorityIndexEligibleBundleIdentifer(v49)) {
            [(NSMutableDictionary *)v41 setObject:v48 forKey:v47];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v233 objects:v248 count:16];
      }
      while (v44);
    }

    id v12 = v184;
    uint64_t v34 = v176;
    int v50 = v41;
    uint64_t v4 = 4;
  }
  else
  {
    int v50 = self->_categoryToResultMapping;
  }
  long long v231 = 0u;
  long long v232 = 0u;
  long long v229 = 0u;
  long long v230 = 0u;
  __int16 v53 = [(NSMutableDictionary *)v50 allKeys];
  uint64_t v54 = [v53 countByEnumeratingWithState:&v229 objects:v247 count:16];
  uint64_t v203 = v50;
  if (!v54)
  {

    goto LABEL_91;
  }
  uint64_t v55 = v54;
  id obj = v53;
  LOBYTE(v56) = 0;
  LOBYTE(v57) = 0;
  int v58 = 0;
  uint64_t v194 = *MEMORY[0x263F78FC8];
  uint64_t v198 = *(void *)v230;
  uint64_t v189 = *MEMORY[0x263F78F70];
  uint64_t v187 = *MEMORY[0x263F78F48];
  uint64_t v188 = *MEMORY[0x263F78FC0];
  do
  {
    for (uint64_t k = 0; k != v55; ++k)
    {
      if (*(void *)v230 != v198) {
        objc_enumerationMutation(obj);
      }
      uint64_t v60 = *(void *)(*((void *)&v229 + 1) + 8 * k);
      int v61 = [(NSMutableDictionary *)v50 objectForKey:v60];
      id v62 = [v61 bundleIdentifier];
      int v63 = [v62 isEqualToString:v194];

      if (v57)
      {
        int v57 = 1;
        if (v58) {
          goto LABEL_59;
        }
      }
      else
      {
        if (!v61)
        {
          int v57 = 0;
          if ((v56 & 1) == 0) {
            goto LABEL_69;
          }
          goto LABEL_67;
        }
        long long v64 = [v61 bundleIdentifier];
        int v57 = [v64 isEqualToString:v189];

        if (v58)
        {
LABEL_59:
          int v58 = 1;
          if ((v56 & 1) == 0) {
            goto LABEL_69;
          }
          goto LABEL_67;
        }
      }
      if (v61)
      {
        uint64_t v65 = [v61 bundleIdentifier];
        int v58 = [v65 isEqualToString:v187];

        if ((v56 & 1) == 0) {
          goto LABEL_69;
        }
      }
      else
      {
        int v58 = 0;
        if ((v56 & 1) == 0)
        {
LABEL_69:
          if (v61)
          {
            long long v66 = [v61 bundleIdentifier];
            int v56 = [v66 isEqualToString:v188];
          }
          else
          {
            int v56 = 0;
          }
          goto LABEL_72;
        }
      }
LABEL_67:
      int v56 = 1;
LABEL_72:
      uint64_t v67 = [v61 results];
      if ([v67 count]) {
        int v68 = v63;
      }
      else {
        int v68 = 1;
      }

      BOOL v69 = v68 == 1;
      int v50 = v203;
      if (v69)
      {
        if (v63)
        {
          bottomPlacedSections = v192->_bottomPlacedSections;
          if (!bottomPlacedSections)
          {
            uint64_t v71 = objc_opt_new();
            uint64_t v72 = v192->_bottomPlacedSections;
            v192->_bottomPlacedSections = (NSMutableArray *)v71;

            bottomPlacedSections = v192->_bottomPlacedSections;
            int v50 = v203;
          }
          if (([(NSMutableArray *)bottomPlacedSections containsObject:v61] & 1) == 0) {
            [(NSMutableArray *)v192->_bottomPlacedSections addObject:v61];
          }
        }
        [(NSMutableDictionary *)v50 setObject:0 forKeyedSubscript:v60];
      }
    }
    uint64_t v55 = [obj countByEnumeratingWithState:&v229 objects:v247 count:16];
  }
  while (v55);

  int v73 = (v57 | v58) & v56;
  uint64_t v4 = v179;
  id v12 = v184;
  uint64_t v34 = v176;
  if (v73 == 1)
  {
    if (v57) {
      [(NSMutableDictionary *)v50 setObject:0 forKeyedSubscript:v189];
    }
    if (v58) {
      [(NSMutableDictionary *)v50 setObject:0 forKeyedSubscript:v187];
    }
  }
LABEL_91:
  int v74 = [(SPQueryTask *)v192 query];
  int v75 = [v74 cancelled];

  if (v75)
  {

    goto LABEL_224;
  }
  [(SPFederatedQueryTask *)v192 externalID];
  kdebug_trace();
  v76 = [(SPQueryTask *)v192 query];
  float v77 = [v76 queryContext];
  uint64_t v78 = [v77 queryKind];
  id v79 = [(SPFederatedQueryTask *)v192 clientBundleID];
  if (SPQueryKindIsSearchToolSearch_onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken, &__block_literal_global_1034);
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode)
  {
LABEL_96:

    goto LABEL_97;
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolRanking)
  {
    if (([v79 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
      || ([v79 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
    {
      goto LABEL_96;
    }
    char v89 = [v79 hasPrefix:@"com.apple.ondeviceeval"];

    if (v78 == 12 || (v89 & 1) != 0)
    {
LABEL_97:
      p_super = &v203->super.super;
      unint64_t v80 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableDictionary count](v203, "count"));
      v227[0] = MEMORY[0x263EF8330];
      v227[1] = 3221225472;
      v227[2] = __51__SPFederatedQueryTask_sendFinishedDomains_reason___block_invoke;
      v227[3] = &unk_264C76910;
      id v81 = v80;
      id v228 = v81;
      [(NSMutableDictionary *)v203 enumerateKeysAndObjectsUsingBlock:v227];
      v82 = v228;
      goto LABEL_98;
    }
  }
  else
  {
  }
  rankingManager = v192->_rankingManager;
  v82 = [(SPFederatedQueryTask *)v192 itemRanker];
  v91 = [(SPFederatedQueryTask *)v192 preferredBundleIDs];
  uint64_t v92 = [(SPQueryTask *)v192 query];
  uint64_t v195 = [v92 queryIdent];
  BOOL obja = [(SPFederatedQueryTask *)v192 isCJK];
  BOOL v93 = [(SPFederatedQueryTask *)v192 isBullseyeNonCommittedSearch];
  BOOL v94 = [(SPFederatedQueryTask *)v192 isBullseyeCommittedSearch];
  BOOL isPeopleSearch = v192->_isPeopleSearch;
  [(SPQueryTask *)v192 query];
  id v97 = v96 = v4;
  v98 = [v97 queryContext];
  BYTE2(v173) = isPeopleSearch;
  BYTE1(v173) = v94;
  LOBYTE(v173) = v93;
  uint64_t v34 = v176;
  -[SSRankingManager rankSectionsUsingBundleIDToSectionMapping:withRanker:preferredBundleIds:isScopedSearch:queryId:isCJK:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:isPeopleSearch:queryContext:](rankingManager, "rankSectionsUsingBundleIDToSectionMapping:withRanker:preferredBundleIds:isScopedSearch:queryId:isCJK:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:isPeopleSearch:queryContext:", v203, v82, v91, v175, v195, obja, v173, v98);
  id v81 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = v96;
  p_super = &v203->super.super;

LABEL_98:
  if ((v192->_parsecCameLaterThanSRT || v192->_parsecEntityCameEarly)
    && ((unint64_t)(v34 - 5) < 4 || v34 == 1 || v34 == 4 || v192->_parsecEntityCameEarly))
  {
    uint64_t v83 = (void *)[(NSArray *)v192->_sentSections copy];
    uint64_t v84 = [v83 count];
    v223[0] = MEMORY[0x263EF8330];
    v223[1] = 3221225472;
    v223[2] = __51__SPFederatedQueryTask_sendFinishedDomains_reason___block_invoke_336;
    v223[3] = &unk_264C76938;
    id v85 = v83;
    id v224 = v85;
    id v81 = v81;
    id v225 = v81;
    v226 = v192;
    uint64_t v86 = MEMORY[0x237DF3D40](v223);
    unint64_t v87 = (void *)v86;
    if (v84)
    {
      if ((unint64_t)(sDeviceClass - 1) <= 1)
      {
        v88 = *(void (**)(void))(v86 + 16);
        goto LABEL_115;
      }
      if (sDeviceClass == 3)
      {
        v88 = *(void (**)(void))(v86 + 16);
LABEL_115:
        uint64_t v90 = v88();

        id v81 = (id)v90;
      }
      else
      {
        v192->_sendStableSections = 1;
      }
    }
    p_super = &v203->super.super;
  }
  if (!v192->_sendStableSections
    || !v192->_sentTaggedTopHits
    || v192->_sentPriority
    || v192->_receivedLateParsecResults
    || v192->_shouldRecomputeSuggestions)
  {
    if (v192->_sentPriority)
    {
      v101 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235D0B000, v101, OS_LOG_TYPE_DEFAULT, "Sending additional results after priority index results", buf, 2u);
      }
    }
    v192->_sentPriority = 0;
    if ([v81 count])
    {
      int v102 = SPLogForSPLogCategoryQuery();
      os_log_type_t v103 = 2 * (*MEMORY[0x263F67540] == 0);
      if (os_log_type_enabled(v102, v103))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v246 = (uint64_t)v81;
        _os_log_impl(&dword_235D0B000, v102, v103, "rankedSections: %@", buf, 0xCu);
      }

      if (v192->_genreGroupingEnabled)
      {
        uint64_t v104 = v192->_rankingManager;
        unint64_t v105 = +[SPFederatedQueryTask appGenreMap];
        uint64_t v106 = [(SSRankingManager *)v104 groupSectionsByCategory:v81 genreMap:v105 topSections:v12];

        v107 = SPLogForSPLogCategoryQuery();
        os_log_type_t v108 = 2 * (*MEMORY[0x263F67540] == 0);
        if (os_log_type_enabled(v107, v108))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v246 = (uint64_t)v106;
          _os_log_impl(&dword_235D0B000, v107, v108, "rankedSections: %@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v106 = v81;
      }
      long long v221 = 0u;
      long long v222 = 0u;
      long long v219 = 0u;
      long long v220 = 0u;
      id v81 = v106;
      uint64_t v109 = [v81 countByEnumeratingWithState:&v219 objects:v244 count:16];
      if (v109)
      {
        uint64_t v110 = v109;
        uint64_t v111 = *(void *)v220;
        uint64_t v112 = *MEMORY[0x263F78FC8];
        do
        {
          for (uint64_t m = 0; m != v110; ++m)
          {
            if (*(void *)v220 != v111) {
              objc_enumerationMutation(v81);
            }
            uint64_t v114 = *(void **)(*((void *)&v219 + 1) + 8 * m);
            uint64_t v115 = [v114 results];
            uint64_t v116 = [v115 count];

            if (v116)
            {
              uint64_t v117 = [v114 results];
              uint64_t v118 = [v117 objectAtIndex:0];

              if ([v118 placement] == 2
                || ([v114 bundleIdentifier],
                    uint64_t v119 = objc_claimAutoreleasedReturnValue(),
                    int v120 = [v119 isEqualToString:v112],
                    v119,
                    v120))
              {
                [(NSMutableArray *)v192->_bottomPlacedSections addObject:v114];
              }
            }
          }
          uint64_t v110 = [v81 countByEnumeratingWithState:&v219 objects:v244 count:16];
        }
        while (v110);
      }

      if ([(NSMutableArray *)v192->_bottomPlacedSections count])
      {
        v121 = (void *)[v81 mutableCopy];
        long long v215 = 0u;
        long long v216 = 0u;
        long long v217 = 0u;
        long long v218 = 0u;
        v122 = v192->_bottomPlacedSections;
        uint64_t v123 = [(NSMutableArray *)v122 countByEnumeratingWithState:&v215 objects:v243 count:16];
        uint64_t v4 = v179;
        uint64_t v34 = v176;
        if (v123)
        {
          uint64_t v124 = v123;
          uint64_t v125 = *(void *)v216;
          do
          {
            for (uint64_t n = 0; n != v124; ++n)
            {
              if (*(void *)v216 != v125) {
                objc_enumerationMutation(v122);
              }
              [v121 removeObject:*(void *)(*((void *)&v215 + 1) + 8 * n)];
            }
            uint64_t v124 = [(NSMutableArray *)v122 countByEnumeratingWithState:&v215 objects:v243 count:16];
          }
          while (v124);
        }

        uint64_t v127 = [v121 copy];
        id v81 = (id)v127;
        id v12 = v184;
        p_super = &v203->super.super;
      }
      else
      {
        uint64_t v4 = v179;
        id v12 = v184;
        uint64_t v34 = v176;
        p_super = &v203->super.super;
      }
    }
    [v12 addObjectsFromArray:v81];
    [(SPFederatedQueryTask *)v192 externalID];
    kdebug_trace();
    uint64_t v128 = [p_super objectForKey:*MEMORY[0x263F78EB8]];
    v100 = v128;
    if (v128)
    {
      id v129 = [v128 resultSet];
      uint64_t v130 = [v129 firstObject];
      int v131 = [v130 topHit];

      if (!v131)
      {
        [v12 removeObject:v100];
        [v12 addObject:v100];
      }
    }
    if ([v12 count])
    {
      v196 = v100;
      if ([(NSArray *)v192->_corrections count])
      {
        if (v192->_previousQueryKind == 10)
        {
          uint64_t v132 = 0;
        }
        else
        {
          uint64_t v134 = [(NSArray *)v192->_corrections firstObject];
          uint64_t v132 = [v134 suggestion];
        }
      }
      else
      {
        uint64_t v132 = 0;
      }
      uint64_t v135 = v192->_rankingManager;
      topHitSectiouint64_t n = v192->_topHitSection;
      BOOL v137 = v192->_isPeopleSearch;
      v138 = [(SPFederatedQueryTask *)v192 itemRanker];
      uint64_t v139 = [v138 queryTermLength];
      v140 = [(SPFederatedQueryTask *)v192 itemRanker];
      uint64_t v99 = [(SSRankingManager *)v135 applyTopSectionPolicy:v184 withTopHitSection:topHitSection isPeopleSearch:v137 queryKind:v176 correction:v132 queryLength:v139 ranker:v140];

      uint64_t v141 = SPLogForSPLogCategoryQuery();
      os_log_type_t v142 = 2 * (*MEMORY[0x263F67540] == 0);
      if (os_log_type_enabled(v141, v142))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v246 = v99;
        _os_log_impl(&dword_235D0B000, v141, v142, "[query] toSendSections: %@", buf, 0xCu);
      }

      uint64_t v34 = v176;
      uint64_t v133 = v174;
      v100 = v196;
    }
    else
    {
      uint64_t v99 = (uint64_t)v12;
LABEL_170:
      uint64_t v133 = v174;
    }

    id v12 = (id)v99;
    p_super = &v203->super.super;
  }
  else
  {
    if (v4 == 3)
    {
      uint64_t v99 = [(NSArray *)v192->_sentSections mutableCopy];
      v100 = v12;
      goto LABEL_170;
    }
    uint64_t v133 = v174;
  }
  query_analytics_log_timing(v192, "finished", "ranking", v133);
  [(SPFederatedQueryTask *)v192 logPerfToAnalytics:v4];

  self = v192;
LABEL_178:

  int v143 = [(SPQueryTask *)self query];
  char v144 = [v143 cancelled];

  if (v144) {
    goto LABEL_224;
  }
  char v145 = v182 ^ 1;
  if ((unint64_t)(v34 - 4) > 4) {
    char v145 = 1;
  }
  if ((v145 & 1) == 0
    && [v12 count] == 1
    && [v12 containsObject:self->_topHitSection])
  {
    self->_didSendTopHits = 0;
    goto LABEL_224;
  }
  if (self->_enforcePreferredBundleIDs
    || (int v146 = SSPreferLocalResultsOnLocalEngagment(), (unint64_t)(v34 - 5) <= 3) && v146)
  {
    v147 = [(SPFederatedQueryTask *)self preferredBundleIDs];
    uint64_t v148 = [v147 count];

    if (v148)
    {
      v204 = [MEMORY[0x263EFF980] array];
      uint64_t v200 = [MEMORY[0x263EFF980] array];
      long long v211 = 0u;
      long long v212 = 0u;
      long long v213 = 0u;
      long long v214 = 0u;
      id v185 = v12;
      id v149 = v12;
      uint64_t v150 = [v149 countByEnumeratingWithState:&v211 objects:v242 count:16];
      unsigned int v180 = v4;
      if (v150)
      {
        uint64_t v151 = v150;
        int v152 = 0;
        uint64_t v153 = *(void *)v212;
        do
        {
          for (iuint64_t i = 0; ii != v151; ++ii)
          {
            if (*(void *)v212 != v153) {
              objc_enumerationMutation(v149);
            }
            v155 = *(void **)(*((void *)&v211 + 1) + 8 * ii);
            if ([v155 isEqual:self->_topHitSection])
            {
              id v156 = v155;

              int v152 = v156;
            }
            else
            {
              v157 = [(SPFederatedQueryTask *)self preferredBundleIDs];
              os_log_type_t v158 = [v155 bundleIdentifier];
              int v159 = [v157 containsObject:v158];

              if (v159) {
                unsigned int v160 = v204;
              }
              else {
                unsigned int v160 = v200;
              }
              [v160 addObject:v155];
              self = v192;
            }
          }
          uint64_t v151 = [v149 countByEnumeratingWithState:&v211 objects:v242 count:16];
        }
        while (v151);
      }
      else
      {
        int v152 = 0;
      }

      [v149 removeAllObjects];
      uint64_t v4 = v180;
      if (v152) {
        [v149 addObject:v152];
      }
      v210[0] = MEMORY[0x263EF8330];
      v210[1] = 3221225472;
      v210[2] = __51__SPFederatedQueryTask_sendFinishedDomains_reason___block_invoke_340;
      v210[3] = &unk_264C76960;
      v210[4] = self;
      [v204 sortUsingComparator:v210];
      [v149 addObjectsFromArray:v204];
      [v149 addObjectsFromArray:v200];

      id v12 = v185;
    }
  }
  if (!self->_isEntitySearch) {
    goto LABEL_223;
  }
  long long v208 = 0u;
  long long v209 = 0u;
  long long v206 = 0u;
  long long v207 = 0u;
  id v161 = v12;
  uint64_t v162 = [v161 countByEnumeratingWithState:&v206 objects:v241 count:16];
  if (!v162)
  {
LABEL_222:

    goto LABEL_223;
  }
  uint64_t v163 = v162;
  id v186 = v12;
  unsigned int v181 = v4;
  uint64_t v164 = 0;
  uint64_t v165 = *(void *)v207;
  while (2)
  {
    uint64_t v166 = 0;
    uint64_t v201 = v164;
    uint64_t v205 = v164 + v163;
LABEL_211:
    if (*(void *)v207 != v165) {
      objc_enumerationMutation(v161);
    }
    v167 = *(void **)(*((void *)&v206 + 1) + 8 * v166);
    v168 = [v167 bundleIdentifier];
    if (([v168 hasPrefix:@"com.apple.parsec"] & 1) == 0)
    {

LABEL_217:
      if (v163 == ++v166)
      {
        uint64_t v163 = [v161 countByEnumeratingWithState:&v206 objects:v241 count:16];
        uint64_t v164 = v205;
        if (v163) {
          continue;
        }
        uint64_t v4 = v181;
        id v12 = v186;
        goto LABEL_222;
      }
      goto LABEL_211;
    }
    break;
  }
  uint64_t v169 = [v167 resultSet];
  v170 = [v169 firstObject];
  int v171 = [v170 placement];

  if (v171 != 1) {
    goto LABEL_217;
  }
  id v172 = v167;

  uint64_t v4 = v181;
  id v12 = v186;
  if (v172)
  {
    [v161 removeObjectAtIndex:v201 + v166];
    [v161 insertObject:v172 atIndex:0];
    id v161 = v172;
    goto LABEL_222;
  }
LABEL_223:
  [(SPFederatedQueryTask *)v192 prepareAndSend:v12 force:v177 moreComing:v182 reason:v4];
LABEL_224:
}

void __51__SPFederatedQueryTask_sendFinishedDomains_reason___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  id v1 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_235D0B000, v1, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] by-pass L3", v2, 2u);
  }
}

id __51__SPFederatedQueryTask_sendFinishedDomains_reason___block_invoke_336(uint64_t a1, unint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFF9B0]) initWithArray:*(void *)(a1 + 32)];
  [v4 addObjectsFromArray:*(void *)(a1 + 40)];
  unint64_t v5 = [v4 count];
  if (*(void *)(a1 + 32)) {
    BOOL v6 = v5 > a2;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    objc_msgSend(v4, "removeObjectsInRange:", a2, v5 - a2);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v4, "containsObject:", v12, (void)v16) & 1) == 0) {
            [v4 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    *(unsigned char *)(*(void *)(a1 + 48) + 274) = 0;
  }
  uint64_t v13 = objc_msgSend(v4, "array", (void)v16);
  uint64_t v14 = (void *)[v13 mutableCopy];

  return v14;
}

uint64_t __51__SPFederatedQueryTask_sendFinishedDomains_reason___block_invoke_340(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 preferredBundleIDs];
  uint64_t v9 = [v7 bundleIdentifier];

  unint64_t v10 = [v8 indexOfObject:v9];
  int v11 = [*(id *)(a1 + 32) preferredBundleIDs];
  uint64_t v12 = [v6 bundleIdentifier];

  unint64_t v13 = [v11 indexOfObject:v12];
  if (v10 >= v13) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = -1;
  }
  if (v10 > v13) {
    return 1;
  }
  else {
    return v14;
  }
}

- (BOOL)topHitsReadyToSend:(id)a3
{
  return [a3 resultsCount] != 0;
}

- (id)detailTextFromBundleIDs:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (SSEnableLocalDetailText())
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v29 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (!v6) {
      goto LABEL_18;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    uint64_t v9 = *MEMORY[0x263F674E0];
    uint64_t v10 = *MEMORY[0x263F674D8];
    unint64_t v11 = 0x263F67000uLL;
    uint64_t v12 = @"DOMAIN_APPLICATION";
    while (1)
    {
      uint64_t v13 = 0;
      uint64_t v30 = v7;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
        if (objc_msgSend(v14, "isEqualToString:", v9, v29))
        {
          uint64_t v15 = *(void **)(v11 + 1136);
          long long v16 = v12;
          goto LABEL_11;
        }
        if ([v14 isEqualToString:v10])
        {
          uint64_t v15 = *(void **)(v11 + 1136);
          long long v16 = @"DOMAIN_APP_CLIPS";
LABEL_11:
          long long v17 = [v15 localizedSearchStringWithIdentifier:v16];
          if (!v17) {
            goto LABEL_13;
          }
LABEL_12:
          [v4 addObject:v17];
          goto LABEL_13;
        }
        uint64_t v18 = v9;
        uint64_t v19 = v8;
        uint64_t v20 = v10;
        uint64_t v21 = v4;
        id v22 = v5;
        unint64_t v23 = v11;
        uint64_t v24 = v12;
        uint64_t v25 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v14 allowPlaceholder:1 error:0];
        long long v17 = [v25 localizedName];

        uint64_t v12 = v24;
        unint64_t v11 = v23;
        id v5 = v22;
        uint64_t v4 = v21;
        uint64_t v10 = v20;
        uint64_t v8 = v19;
        uint64_t v9 = v18;
        uint64_t v7 = v30;
        if (v17) {
          goto LABEL_12;
        }
LABEL_13:

        ++v13;
      }
      while (v7 != v13);
      uint64_t v26 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
      uint64_t v7 = v26;
      if (!v26)
      {
LABEL_18:

        uint64_t v27 = [v4 componentsJoinedByString:@", "];

        id v3 = v29;
        goto LABEL_20;
      }
    }
  }
  uint64_t v27 = 0;
LABEL_20:

  return v27;
}

- (id)contactSuggestionsWithSearchString:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v30 = *MEMORY[0x263F79030];
  id v3 = -[NSMutableDictionary objectForKey:](self->_categoryToResultMapping, "objectForKey:");
  if (v3)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v27 = v3;
    uint64_t v4 = [v3 results];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (!v5) {
      goto LABEL_20;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    uint64_t v8 = (unsigned char *)MEMORY[0x263F67540];
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        unint64_t v11 = SPLogForSPLogCategoryDefault();
        os_log_type_t v12 = 2 * (*v8 == 0);
        if (os_log_type_enabled(v11, v12))
        {
          uint64_t v13 = [v10 title];
          uint64_t v14 = [v13 text];
          *(_DWORD *)buf = 138412290;
          uint64_t v36 = v14;
          _os_log_impl(&dword_235D0B000, v11, v12, "Check result %@", buf, 0xCu);
        }
        uint64_t v15 = [v10 contactIdentifier];
        if (v15)
        {
          long long v16 = (void *)v15;
          long long v17 = [v10 personIdentifier];
          if (v17)
          {

LABEL_12:
            goto LABEL_13;
          }
          uint64_t v18 = [v10 resultBundleId];
          int v19 = [v18 isEqual:v30];

          if (v19)
          {
            long long v16 = [v10 lastUsedDate];
            [v16 timeIntervalSinceNow];
            if (v20 <= -40996800.0) {
              goto LABEL_12;
            }
            int v21 = [v10 hasTextContentMatch];

            if (v21)
            {
              id v22 = (void *)MEMORY[0x263F78E50];
              unint64_t v23 = [(SPQueryTask *)self query];
              uint64_t v24 = [v23 queryContext];
              long long v16 = [v22 buildResultWithResult:v10 queryContext:v24];

              [v29 addObject:v16];
              goto LABEL_12;
            }
          }
        }
LABEL_13:
        ++v9;
      }
      while (v6 != v9);
      uint64_t v25 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
      uint64_t v6 = v25;
      if (!v25)
      {
LABEL_20:

        id v3 = v27;
        break;
      }
    }
  }

  return v29;
}

- (BOOL)forceAboveFoldResultsWithQuery:(id)a3 topHitSection:(id)a4 sections:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a5;
  if (_os_feature_enabled_impl() && (unint64_t)[v5 count] >= 2)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v5;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v26;
      uint64_t v10 = *MEMORY[0x263F78E88];
      uint64_t v11 = *MEMORY[0x263F78E80];
      uint64_t v23 = *MEMORY[0x263F78FE8];
      char v12 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          if ((v12 & 1) == 0)
          {
            uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            uint64_t v15 = [v14 bundleIdentifier];
            if ([v15 isEqualToString:v10])
            {

LABEL_19:
              BOOL v20 = 1;
              goto LABEL_20;
            }
            long long v16 = [v14 bundleIdentifier];
            char v17 = [v16 isEqualToString:v11];

            if (v17) {
              goto LABEL_19;
            }
            if (a4)
            {
              uint64_t v18 = [v14 bundleIdentifier];
              int v19 = [v18 isEqualToString:v23];

              if (!v19) {
                goto LABEL_19;
              }
            }
          }
          char v12 = 0;
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
        char v12 = 0;
        BOOL v20 = 0;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
LABEL_20:

    id v5 = v22;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (id)suggestionsWithSearchString:(id)a3 sections:(id)a4 topHitSection:(id)a5 highestLocalScore:(double)a6
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v95 = a3;
  id v89 = a4;
  id v9 = a5;
  id v93 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v100 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  BOOL v94 = v9;
  uint64_t v11 = [v9 results];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v113 objects:v122 count:16];
  if (!v12)
  {
    char v14 = 0;
    goto LABEL_19;
  }
  uint64_t v13 = v12;
  char v14 = 0;
  uint64_t v15 = *(void *)v114;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v114 != v15) {
        objc_enumerationMutation(v11);
      }
      char v17 = *(void **)(*((void *)&v113 + 1) + 8 * i);
      uint64_t v18 = [v17 entityIdentifier];

      if (v18)
      {
        int v19 = [v17 entityIdentifier];
        [v10 addObject:v19];
      }
      BOOL v20 = [v17 contactIdentifier];
      if (v20)
      {
      }
      else
      {
        int v21 = [v17 personIdentifier];

        if (!v21) {
          goto LABEL_12;
        }
      }
      id v22 = [v17 title];
      uint64_t v23 = [v22 text];
      uint64_t v24 = SSNormalizedQueryString();

      [v100 addObject:v24];
LABEL_12:
      long long v25 = [v17 rankingItem];
      if (v25)
      {
        long long v26 = [v17 rankingItem];
        unint64_t v27 = ((unint64_t)[v26 bundleIDType] >> 8) & 1;
      }
      else
      {
        LOBYTE(v27) = 0;
      }

      v14 |= v27;
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v113 objects:v122 count:16];
  }
  while (v13);
LABEL_19:

  if (_os_feature_enabled_impl())
  {
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id obj = v89;
    uint64_t v28 = [obj countByEnumeratingWithState:&v109 objects:v121 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v98 = *(void *)v110;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v110 != v98) {
            objc_enumerationMutation(obj);
          }
          long long v31 = *(void **)(*((void *)&v109 + 1) + 8 * j);
          long long v105 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          long long v32 = [v31 results];
          uint64_t v33 = [v32 countByEnumeratingWithState:&v105 objects:v120 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v106;
            do
            {
              for (uint64_t k = 0; k != v34; ++k)
              {
                if (*(void *)v106 != v35) {
                  objc_enumerationMutation(v32);
                }
                int v37 = *(void **)(*((void *)&v105 + 1) + 8 * k);
                uint64_t v38 = [v37 entityIdentifier];

                if (v38)
                {
                  uint64_t v39 = [v37 entityIdentifier];
                  [v10 addObject:v39];
                }
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v105 objects:v120 count:16];
            }
            while (v34);
          }
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v109 objects:v121 count:16];
      }
      while (v29);
    }
  }
  id v40 = self;
  uint64_t v99 = [(SPFederatedQueryTask *)self contactSuggestionsWithSearchString:v95];
  os_log_type_t v41 = [(SSRankingManager *)self->_rankingManager rankingConfiguration];
  uint64_t v42 = [v41 localResultQualityThreshold];
  uint64_t v43 = (void *)v42;
  uint64_t v44 = &unk_26E931408;
  if (v42) {
    uint64_t v44 = (void *)v42;
  }
  id v45 = v44;

  uint32_t v46 = [(SPQueryTask *)self query];
  id obja = [v46 queryContext];

  if (SSCreateAsTypedSuggestion())
  {
    id v47 = objc_alloc(MEMORY[0x263F67A10]);
    char v48 = (void *)[v47 initWithIdentifier:*MEMORY[0x263F79118] suggestion:v95 query:v95 score:6 type:1.0];
    uint64_t v49 = (void *)MEMORY[0x263F78E50];
    int v50 = [(SPQueryTask *)self query];
    long long v51 = [v50 queryContext];
    uint64_t v84 = [v49 buildResultWithSuggestion:v48 queryContext:v51];

    id v40 = self;
  }
  else
  {
    uint64_t v84 = 0;
  }
  id v52 = objc_alloc(MEMORY[0x263F67A10]);
  __int16 v53 = (void *)[v52 initWithIdentifier:*MEMORY[0x263F79120] suggestion:v95 query:v95 score:14 type:1.0];
  uint64_t v54 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v55 = [v54 localizedStringForKey:@"SUGGESTION_DETAIL_WEB" value:&stru_26E92AFF0 table:@"SpotlightServices"];

  unint64_t v87 = (void *)v55;
  [v53 setDetailText:v55];
  int v56 = (void *)MEMORY[0x263F78E50];
  [(SPQueryTask *)v40 query];
  int v58 = v57 = v40;
  id v59 = [v58 queryContext];
  v88 = v53;
  uint64_t v92 = [v56 buildResultWithSuggestion:v53 queryContext:v59];

  serverSuggestionResults = v57->_serverSuggestionResults;
  if (!serverSuggestionResults) {
    serverSuggestionResults = (NSArray *)MEMORY[0x263EFFA68];
  }
  int v61 = (NSArray *)MEMORY[0x263EFFA68];
  uint64_t v90 = serverSuggestionResults;
  localSuggestionResults = v57->_localSuggestionResults;
  if (!localSuggestionResults) {
    localSuggestionResults = v61;
  }
  int v63 = localSuggestionResults;
  v82 = [MEMORY[0x263F78DC8] sharedSuggestionsManager];
  v119[0] = v45;
  v118[0] = @"qualityThreshold";
  v118[1] = @"prefersLocalUserTypedSuggestion";
  uint64_t v83 = objc_msgSend(NSNumber, "numberWithBool:", -[SPFederatedQueryTask prefersLocalUserTypedSuggestion](v57, "prefersLocalUserTypedSuggestion"));
  v119[1] = v83;
  v118[2] = @"suggestionsAreBlended";
  long long v64 = [NSNumber numberWithBool:v57->_suggestionsAreBlended];
  v119[2] = v64;
  v118[3] = @"localFilteringScore";
  uint64_t v65 = [NSNumber numberWithDouble:a6];
  v119[3] = v65;
  v118[4] = @"ForceAboveFoldResults";
  uint64_t v86 = v45;
  long long v66 = objc_msgSend(NSNumber, "numberWithBool:", -[SPFederatedQueryTask forceAboveFoldResultsWithQuery:topHitSection:sections:](v57, "forceAboveFoldResultsWithQuery:topHitSection:sections:", v95, v94, v89));
  v119[4] = v66;
  uint64_t v67 = [NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:5];
  id v85 = v63;
  uint64_t v68 = [v82 orderedSuggestionsWithQueryContext:obja filters:v93 entityFilters:v10 contactFilters:v100 userSuggestion:v84 userWebSuggestion:v92 shortcutSuggestionResults:MEMORY[0x263EFFA68] actionSuggestionResults:MEMORY[0x263EFFA68] contactSuggestionResults:v99 serverSuggestionResults:v90 localSuggestionResults:v63 options:v67];

  BOOL v69 = (void *)v68;
  uint64_t v70 = v89;
  if ((v14 & 1) != 0
    && (unint64_t)[v69 count] >= 3
    && (unint64_t)[v89 count] >= 3)
  {
    uint64_t v71 = [v89 objectAtIndexedSubscript:2];
    uint64_t v72 = [v71 bundleIdentifier];
    int v73 = [v72 isEqualToString:*MEMORY[0x263F78E88]];

    if (v73)
    {
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      int v74 = [v89 objectAtIndexedSubscript:2];
      int v75 = [v74 results];

      uint64_t v76 = [v75 countByEnumeratingWithState:&v101 objects:v117 count:16];
      if (v76)
      {
        uint64_t v77 = v76;
        uint64_t v78 = *(void *)v102;
        while (2)
        {
          for (uint64_t m = 0; m != v77; ++m)
          {
            if (*(void *)v102 != v78) {
              objc_enumerationMutation(v75);
            }
            if ([MEMORY[0x263F78E58] passLikelihoodForTopHitCandidate:*(void *)(*((void *)&v101 + 1) + 8 * m)])
            {
              objc_msgSend(v69, "subarrayWithRange:", 0, 2);
              id v80 = (id)objc_claimAutoreleasedReturnValue();

              uint64_t v70 = v89;
              goto LABEL_60;
            }
          }
          uint64_t v77 = [v75 countByEnumeratingWithState:&v101 objects:v117 count:16];
          if (v77) {
            continue;
          }
          break;
        }
      }

      uint64_t v70 = v89;
    }
  }
  id v80 = v69;
LABEL_60:

  return v80;
}

- (void)addSuggestionsToSectionsForSending:(id)a3 searchString:(id)a4 updatedSections:(BOOL)a5 queryKind:(unint64_t)a6
{
  v20[1] = *MEMORY[0x263EF8340];
  if (a6 - 1 <= 1)
  {
    uint64_t v8 = (objc_class *)MEMORY[0x263F67A10];
    id v9 = a4;
    id v10 = a3;
    id v11 = [v8 alloc];
    uint64_t v12 = (void *)[v11 initWithIdentifier:*MEMORY[0x263F79118] suggestion:v9 query:v9 score:6 type:1.0];

    uint64_t v13 = (void *)MEMORY[0x263F78E50];
    char v14 = [(SPQueryTask *)self query];
    uint64_t v15 = [v14 queryContext];
    long long v16 = [v13 buildResultWithSuggestion:v12 queryContext:v15];

    char v17 = (SFMutableResultSection *)objc_opt_new();
    suggestionsSectiouint64_t n = self->_suggestionsSection;
    self->_suggestionsSectiouint64_t n = v17;

    [(SFMutableResultSection *)self->_suggestionsSection setBundleIdentifier:*MEMORY[0x263F790C0]];
    v20[0] = v16;
    int v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    [(SFMutableResultSection *)self->_suggestionsSection setResults:v19];

    [v10 addObject:self->_suggestionsSection];
  }
}

- (void)addTopHitSectionIfNecessaryToSectionsForSending:(id)a3 updatedSections:(BOOL)a4 isScopedSearch:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (!a5)
  {
    int v9 = SSEnableSpotlightTopHitPersonalizedRanking();
    unint64_t v87 = self;
    if (!v6 || self->_didSendTopHits || [(SFMutableResultSection *)self->_topHitSection resultsCount])
    {
      if (self->_didSendResults)
      {
        id v10 = SPLogForSPLogCategoryDefault();
        os_log_type_t v11 = *MEMORY[0x263F67548] ^ 1;
        if (os_log_type_enabled(v10, v11))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_235D0B000, v10, v11, "Skipping current top hits nomination due to previous dispatch.", buf, 2u);
        }

        self = v87;
        if (v9)
        {
          uint64_t v12 = [(SPQueryTask *)v87 query];
          uint64_t v13 = [v12 queryContext];
          uint64_t v14 = [v13 queryKind];
          uint64_t v15 = v87->_clientBundleID;
          if (SPQueryKindIsSearchToolSearch_onceToken != -1) {
            dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken, &__block_literal_global_1034);
          }
          id v83 = v8;
          if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode) {
            goto LABEL_12;
          }
          if (!SPQueryKindIsSearchToolSearch_isSearchToolRanking)
          {
            char v85 = 0;
            goto LABEL_14;
          }
          if ([(NSString *)v15 hasPrefix:@"com.apple.omniSearch"]
            || [(NSString *)v15 hasPrefix:@"com.apple.intelligenceflow"])
          {
LABEL_12:
            char v16 = 1;
          }
          else
          {
            char v46 = [(NSString *)v15 hasPrefix:@"com.apple.ondeviceeval"];
            if (v14 == 12) {
              char v16 = 1;
            }
            else {
              char v16 = v46;
            }
          }
          char v85 = v16;
LABEL_14:

          id v17 = objc_alloc(MEMORY[0x263F78D68]);
          uint64_t v18 = [(SPQueryTask *)v87 query];
          int v19 = [v18 queryContext];
          uint64_t v86 = (void *)[v17 initWithQueryContext:v19];

          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id obj = [(NSMutableDictionary *)v87->_categoryToResultMapping allValues];
          uint64_t v20 = [obj countByEnumeratingWithState:&v90 objects:v94 count:16];
          if (!v20) {
            goto LABEL_26;
          }
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v91;
          while (1)
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v91 != v22) {
                objc_enumerationMutation(obj);
              }
              uint64_t v24 = *(void **)(*((void *)&v90 + 1) + 8 * i);
              if ([v24 resultsCount])
              {
                long long v25 = [v24 resultSet];
                long long v26 = [v25 objectAtIndexedSubscript:0];
                uint64_t v27 = [v26 rankingItem];
                if (v27)
                {
                  uint64_t v28 = (void *)v27;
                  uint64_t v29 = [v24 resultSet];
                  uint64_t v30 = [v29 objectAtIndexedSubscript:0];
                  long long v31 = [v30 rankingItem];
                  [v31 likelihood];
                  double v33 = v32;

                  if (v33 >= 2.22044605e-16) {
                    continue;
                  }
                  rankingManager = v87->_rankingManager;
                  long long v25 = [(SPQueryTask *)v87 query];
                  long long v26 = [v25 queryContext];
                  [v26 currentTime];
                  double v36 = v35;
                  int v37 = [(SPQueryTask *)v87 query];
                  uint64_t v38 = [v37 queryIdent];
                  uint64_t v39 = [(SPFederatedQueryTask *)v87 itemRanker];
                  LOBYTE(v75) = v85;
                  [(SSRankingManager *)rankingManager calculateLikelihoodAndPriorForSection:v24 currentTime:0 shortcutResult:v38 queryId:v39 ranker:0 nominateLocalTopHit:v86 qu:v36 isSearchToolClient:v75];
                }
              }
            }
            uint64_t v21 = [obj countByEnumeratingWithState:&v90 objects:v94 count:16];
            if (!v21)
            {
LABEL_26:

              id v8 = v83;
              goto LABEL_27;
            }
          }
        }
      }
    }
    else
    {
      [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v48 = id v47 = self;
      uint64_t v86 = [v48 localizedStringForKey:@"DOMAIN_TOPHIT" value:&stru_26E92AFF0 table:@"Search"];

      if (sDeviceClass == 3) {
        uint64_t v49 = 6;
      }
      else {
        uint64_t v49 = 4;
      }
      if (v9)
      {
        id v50 = objc_alloc(MEMORY[0x263F78D68]);
        long long v51 = [(SPQueryTask *)v47 query];
        id v52 = [v51 queryContext];
        id obja = (id)[v50 initWithQueryContext:v52];

        id v80 = v47->_rankingManager;
        v82 = [(NSMutableDictionary *)v47->_categoryToResultMapping allValues];
        id v81 = [(SPFederatedQueryTask *)v47 itemRanker];
        BOOL v79 = [(SPFederatedQueryTask *)v47 isBullseyeNonCommittedSearch];
        BOOL v77 = [(SPFederatedQueryTask *)v47 isBullseyeCommittedSearch];
        id v84 = v8;
        BOOL v53 = v47->_parsecEnabled || v47->_parsecSettingEnabled;
        uint64_t v78 = [(SPQueryTask *)v47 query];
        uint64_t v61 = [v78 queryIdent];
        id v62 = [(SPQueryTask *)v87 query];
        int v63 = [v62 queryContext];
        uint64_t v64 = [v63 queryKind];
        uint64_t v65 = [(SPFederatedQueryTask *)v87 clientBundleID];
        long long v66 = [(SPQueryTask *)v87 query];
        uint64_t v67 = [v66 queryContext];
        [v67 currentTime];
        uint64_t v76 = v61;
        self = v87;
        BYTE1(v75) = v53;
        LOBYTE(v75) = v77;
        uint64_t v68 = -[SSRankingManager nominateLocalTopHitsFromSections:withItemRanker:sectionHeader:maxInitiallyVisibleResults:shortcutResult:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:parsecEnabled:maxNumAppsInTopHitSection:queryId:queryKind:clientBundleID:qu:currentTime:](v80, "nominateLocalTopHitsFromSections:withItemRanker:sectionHeader:maxInitiallyVisibleResults:shortcutResult:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:parsecEnabled:maxNumAppsInTopHitSection:queryId:queryKind:clientBundleID:qu:currentTime:", v82, v81, v86, 1, 0, v79, v75, v49, v76, v64, v65, obja);
        topHitSectiouint64_t n = v87->_topHitSection;
        v87->_topHitSectiouint64_t n = (SFMutableResultSection *)v68;

        id v8 = v84;
      }
      else
      {
        id v54 = v8;
        uint64_t v55 = v47->_rankingManager;
        int v56 = [(NSMutableDictionary *)v47->_categoryToResultMapping allValues];
        int v57 = [(SPFederatedQueryTask *)v47 itemRanker];
        uint64_t v58 = [(SPFederatedQueryTask *)v47 isBullseyeNonCommittedSearch];
        uint64_t v59 = [(SPFederatedQueryTask *)v47 isBullseyeCommittedSearch];
        BOOL v60 = v47->_parsecEnabled || v47->_parsecSettingEnabled;
        LOBYTE(v75) = v60;
        uint64_t v70 = [(SSRankingManager *)v55 makeTopHitSectionUsingSections:v56 withItemRanker:v57 sectionHeader:v86 shortcutResult:0 isBullseyeNonCommittedSearch:v58 isBullseyeCommittedSearch:v59 parsecEnabled:v75 maxNumAppsInTopHitSection:v49];
        uint64_t v71 = v47->_topHitSection;
        v47->_topHitSectiouint64_t n = (SFMutableResultSection *)v70;

        uint64_t v72 = SPLogForSPLogCategoryDefault();
        os_log_type_t v73 = 2 * (*MEMORY[0x263F67540] == 0);
        if (os_log_type_enabled(v72, v73))
        {
          uint64_t v74 = [(SFMutableResultSection *)v87->_topHitSection resultsCount];
          *(_DWORD *)buf = 134217984;
          uint64_t v96 = v74;
          _os_log_impl(&dword_235D0B000, v72, v73, "Top hit section count: %lu  Allow multiple apps: YES", buf, 0xCu);
        }

        id v8 = v54;
LABEL_27:
        self = v87;
      }
    }
    id v40 = [(SFMutableResultSection *)self->_topHitSection results];
    if ([v40 count])
    {
      unint64_t v41 = 0;
      do
      {
        uint64_t v42 = [v40 objectAtIndex:v41];
        uint64_t v43 = [v42 rankingItem];
        objc_msgSend(v43, "setBundleIDType:", objc_msgSend(v43, "bundleIDType") | 0x8000);

        ++v41;
      }
      while (v41 < [v40 count]);
    }
    BOOL v44 = [(SPFederatedQueryTask *)v87 topHitsReadyToSend:v87->_topHitSection];
    id v45 = [(SPQueryTask *)v87 query];
    [v45 internalDebug];

    if (v44)
    {
      [v8 insertObject:v87->_topHitSection atIndex:0];
      v87->_didSendTopHits = 1;
    }
  }
}

- (void)sendFinishedDomains:(int)a3
{
}

- (void)setTimeout:(double)a3
{
  self->_storeStartTime = CFAbsoluteTimeGetCurrent();
  self->_timeOut = a3;
}

- (void)storeWillComplete:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SPLogForSPLogCategoryQuery();
  os_log_type_t v6 = *MEMORY[0x263F67548] ^ 1;
  if (os_log_type_enabled(v5, v6))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_235D0B000, v5, v6, "storeWillComplete %@", (uint8_t *)&v11, 0xCu);
  }

  self->_double timeOut = self->_timeOut * 1.5;
  if (self->_timer)
  {
    if (![(NSMutableArray *)self->_tokens count])
    {
      double v7 = CFAbsoluteTimeGetCurrent() - self->_storeStartTime;
      double timeOut = self->_timeOut;
      if (v7 < timeOut * 1.5)
      {
        timer = self->_timer;
        dispatch_time_t v10 = dispatch_time(0, (uint64_t)((timeOut - v7) * 1000000000.0));
        dispatch_source_set_timer(timer, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
    }
  }
}

- (BOOL)storeSearchProgress:(id)a3 withSections:(id)a4 suggestionResults:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v43 = a4;
  id v42 = a5;
  BOOL v44 = v8;
  if (v8)
  {
    int v9 = SPLogForSPLogCategoryQuery();
    os_log_type_t v10 = *MEMORY[0x263F67548] ^ 1;
    if (os_log_type_enabled(v9, v10))
    {
      int v11 = [(SPQueryTask *)self query];
      id v12 = [v11 queryContext];
      uint64_t v13 = [v12 searchString];
      *(_DWORD *)buf = 138412802;
      int v57 = v13;
      __int16 v58 = 2112;
      uint64_t v59 = v44;
      __int16 v60 = 2048;
      uint64_t v61 = [v43 count];
      _os_log_impl(&dword_235D0B000, v9, v10, "storeSearchProgress, query:\"%@\", token:%@, sectionCount:%ld", buf, 0x20u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_didReceiveCoreSpotlightProgress = 1;
      objc_storeStrong((id *)&self->_localSuggestionResults, a5);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      rankingManager = self->_rankingManager;
      id v15 = v44;
      char v16 = [v15 rankingInfo];
      [(SSRankingManager *)rankingManager updateWithNewRankingInfo:v16];
    }
    unint64_t v41 = self->_categoryToResultMapping;
    objc_sync_enter(v41);
    id v17 = (void *)MEMORY[0x263F78E28];
    unint64_t v18 = [(SPFederatedQueryTask *)self queryIdent];
    int v19 = [(SPQueryTask *)self query];
    uint64_t v20 = [v19 queryContext];
    uint64_t v21 = [v20 searchString];
    [v17 logSections:v43 prefix:@"L1 progress" queryId:v18 query:v21];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v43;
    uint64_t v22 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v51;
      uint64_t v47 = *MEMORY[0x263F79058];
      uint64_t v45 = *MEMORY[0x263F790A0];
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v51 != v23) {
            objc_enumerationMutation(obj);
          }
          long long v25 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if ([v25 resultsCount])
          {
            memset(v49, 0, sizeof(v49));
            long long v26 = [v25 results];
            if ([v26 countByEnumeratingWithState:v49 objects:v54 count:16])
            {
              uint64_t v27 = (void *)**((void **)&v49[0] + 1);
              uint64_t v28 = [**((id **)&v49[0] + 1) personIdentifier];
              if (v28)
              {
                uint64_t v29 = [v27 resultBundleId];
                if ([v29 isEqual:v47])
                {

                  goto LABEL_19;
                }
                uint64_t v30 = [v27 resultBundleId];
                int v31 = [v30 isEqual:v45];

                if (v31) {
LABEL_19:
                }
                  [v25 setBundleIdentifier:v47];
              }
            }

            categoryToResultMapping = self->_categoryToResultMapping;
            double v33 = [v25 bundleIdentifier];
            uint64_t v34 = [(NSMutableDictionary *)categoryToResultMapping objectForKeyedSubscript:v33];

            if (v34)
            {
              [(SPFederatedQueryTask *)self deDuplicateSection:v25 againstSection:v34];
              double v35 = [v25 results];
              [v34 addResultsFromArray:v35];

              double v36 = [v25 bundleIdentifier];
              LODWORD(v35) = [v36 isEqualToString:@"com.apple.application"];

              if (v35) {
                objc_msgSend(v34, "sortRange:options:usingComparator:", 0, objc_msgSend(v34, "resultsCount"), 16, &__block_literal_global_391);
              }
            }
            else
            {
              int v37 = self->_categoryToResultMapping;
              uint64_t v38 = [v25 bundleIdentifier];
              uint64_t v39 = v38;
              if (!v38)
              {
                char v46 = [v25 title];
                uint64_t v39 = v46;
              }
              [(NSMutableDictionary *)v37 setObject:v25 forKeyedSubscript:v39];
              if (!v38) {

              }
              [(NSMutableOrderedSet *)self->_sectionOrderByInsertion addObject:v25];
            }

            continue;
          }
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v22);
    }

    objc_sync_exit(v41);
    [(SPFederatedQueryTask *)self sendFinishedDomains:4];
  }

  return 0;
}

uint64_t __75__SPFederatedQueryTask_storeSearchProgress_withSections_suggestionResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 rankingItem];
  os_log_type_t v6 = [v4 rankingItem];

  if (!v5 || !v6)
  {
LABEL_8:
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  if (([v5 isServerAlternativeResult] & 1) != 0
    || ([v6 isServerAlternativeResult] & 1) == 0)
  {
    if ([v5 isServerAlternativeResult]
      && ![v6 isServerAlternativeResult])
    {
      uint64_t v7 = 1;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v7 = -1;
LABEL_9:

  return v7;
}

- (BOOL)storeCompletedSearch:(id)a3 withSections:(id)a4 suggestionResults:(id)a5
{
  uint64_t v228 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id obj = a4;
  id v173 = a5;
  __uint64_t v174 = v7;
  if (!v7) {
    goto LABEL_175;
  }
  id v8 = SPLogForSPLogCategoryQuery();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(SPQueryTask *)self query];
    os_log_type_t v10 = [v9 queryContext];
    int v11 = [v10 searchString];
    CSRedactString();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v174;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = [obj count];
    _os_log_impl(&dword_235D0B000, v8, OS_LOG_TYPE_DEFAULT, "storeCompletedSearch, query:\"%@\", query:%@, sectionCount:%ld", buf, 0x20u);
  }
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v13 = v174;
    uint64_t v14 = [v13 fbq];
    fbq = self->_fbq;
    self->_fbq = v14;

    objc_msgSend(v13, "web_fbq");
    char v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    web_fbq = self->_web_fbq;
    self->_web_fbq = v16;

    objc_msgSend(v13, "server_features");
    unint64_t v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    server_features = self->_server_features;
    self->_server_features = v18;

    self->_suggestionsAreBlended = [v13 suggestionsAreBlended];
    uint64_t v20 = [v13 querySuggestionResults];
    serverSuggestionResults = self->_serverSuggestionResults;
    self->_serverSuggestionResults = v20;

    rankingManager = self->_rankingManager;
    uint64_t v23 = [v13 rankingInfo];
    [(SSRankingManager *)rankingManager updateWithNewRankingInfo:v23];
  }
  else
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_localSuggestionResults, a5);
  }
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  uint64_t v24 = [(id)objc_opt_class() description];
  SDTraceAdd();

  v170 = self->_categoryToResultMapping;
  objc_sync_enter(v170);
  long long v25 = [(SPQueryTask *)self query];
  long long v26 = [v25 queryContext];
  uint64_t v27 = [v26 queryKind];
  uint64_t v28 = self->_clientBundleID;
  if (SPQueryKindIsSearchToolSearch_onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken, &__block_literal_global_1034);
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode) {
    goto LABEL_12;
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolRanking)
  {
    if (![(NSString *)v28 hasPrefix:@"com.apple.omniSearch"]
      && ![(NSString *)v28 hasPrefix:@"com.apple.intelligenceflow"])
    {
      char v87 = [(NSString *)v28 hasPrefix:@"com.apple.ondeviceeval"];
      if (v27 == 12) {
        char v29 = 1;
      }
      else {
        char v29 = v87;
      }
      goto LABEL_13;
    }
LABEL_12:
    char v29 = 1;
LABEL_13:
    char v175 = v29;
    goto LABEL_14;
  }
  char v175 = 0;
LABEL_14:

  uint64_t v30 = (void *)MEMORY[0x263F78E28];
  unint64_t v31 = [(SPFederatedQueryTask *)self queryIdent];
  double v32 = [(SPQueryTask *)self query];
  double v33 = [v32 queryContext];
  uint64_t v34 = [v33 searchString];
  [v30 logSections:obj prefix:@"L1 complete" queryId:v31 query:v34];

  int v35 = SSEnableSpotlightTopHitPersonalizedRanking();
  int v183 = v35;
  if (v35)
  {
    id v36 = objc_alloc(MEMORY[0x263F78D68]);
    int v37 = [(SPQueryTask *)self query];
    uint64_t v38 = [v37 queryContext];
    uint64_t v176 = (void *)[v36 initWithQueryContext:v38];

    int v35 = v183;
  }
  else
  {
    uint64_t v176 = 0;
  }
  long long v217 = 0u;
  long long v218 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  id obj = obj;
  uint64_t v39 = [obj countByEnumeratingWithState:&v215 objects:v227 count:16];
  if (v39)
  {
    uint64_t v186 = *(void *)v216;
    uint64_t v182 = *MEMORY[0x263F79058];
    uint64_t v178 = *MEMORY[0x263F790A0];
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v216 != v186) {
          objc_enumerationMutation(obj);
        }
        unint64_t v41 = *(void **)(*((void *)&v215 + 1) + 8 * i);
        if ([v41 resultsCount])
        {
          if (v35)
          {
            id v42 = [v41 resultSet];
            id v43 = [v42 objectAtIndexedSubscript:0];
            BOOL v44 = [v43 rankingItem];
            if (!v44) {
              goto LABEL_27;
            }
            uint64_t v45 = [v41 resultSet];
            char v46 = [v45 objectAtIndexedSubscript:0];
            uint64_t v47 = [v46 rankingItem];
            [v47 likelihood];
            BOOL v49 = v48 < 2.22044605e-16;

            if (v49)
            {
              long long v50 = self->_rankingManager;
              id v42 = [(SPQueryTask *)self query];
              id v43 = [v42 queryContext];
              [v43 currentTime];
              double v52 = v51;
              long long v53 = [(SPQueryTask *)self query];
              uint64_t v54 = [v53 queryIdent];
              uint64_t v55 = [(SPFederatedQueryTask *)self itemRanker];
              LOBYTE(v168) = v175;
              [(SSRankingManager *)v50 calculateLikelihoodAndPriorForSection:v41 currentTime:0 shortcutResult:v54 queryId:v55 ranker:0 nominateLocalTopHit:v176 qu:v52 isSearchToolClient:v168];

LABEL_27:
            }
          }
          memset(v214, 0, sizeof(v214));
          int v56 = [v41 results];
          if ([v56 countByEnumeratingWithState:v214 objects:v226 count:16])
          {
            int v57 = (void *)**((void **)&v214[0] + 1);
            __int16 v58 = [**((id **)&v214[0] + 1) personIdentifier];
            if (v58)
            {
              uint64_t v59 = [v57 resultBundleId];
              if ([v59 isEqual:v182])
              {

                goto LABEL_33;
              }
              __int16 v60 = [v57 resultBundleId];
              int v61 = [v60 isEqual:v178];

              if (v61) {
LABEL_33:
              }
                [v41 setBundleIdentifier:v182];
            }
          }

          categoryToResultMapping = self->_categoryToResultMapping;
          int v63 = [v41 bundleIdentifier];
          uint64_t v64 = [(NSMutableDictionary *)categoryToResultMapping objectForKeyedSubscript:v63];

          if (v64)
          {
            [(SPFederatedQueryTask *)self deDuplicateSection:v41 againstSection:v64];
            uint64_t v65 = [v41 results];
            [v64 addResultsFromArray:v65];

            long long v66 = [v41 bundleIdentifier];
            int v67 = [v66 isEqualToString:@"com.apple.application"];

            if ((v67 & (isKindOfClass ^ 1)) != 0) {
              objc_msgSend(v64, "sortRange:options:usingComparator:", 0, objc_msgSend(v64, "resultsCount"), 16, &__block_literal_global_399);
            }
          }
          else
          {
            uint64_t v68 = self->_categoryToResultMapping;
            BOOL v69 = [v41 bundleIdentifier];
            uint64_t v70 = v69;
            if (!v69)
            {
              unsigned int v179 = [v41 title];
              uint64_t v70 = v179;
            }
            [(NSMutableDictionary *)v68 setObject:v41 forKeyedSubscript:v70];
            if (!v69) {

            }
            [(NSMutableOrderedSet *)self->_sectionOrderByInsertion addObject:v41];
          }

          int v35 = v183;
          continue;
        }
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v215 objects:v227 count:16];
    }
    while (v39);
  }

  objc_sync_exit(v170);
  uint64_t v184 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_opt_class(), "searchDomain"));
  int v180 = [(NSMutableArray *)self->_delayedStartTokens containsObject:v184];
  uint64_t v71 = self;
  objc_sync_enter(v71);
  v71->_shouldRecomputeSuggestions = 1;
  uint64_t v72 = SPLogForSPLogCategoryQuery();
  os_log_type_t v73 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v72, v73))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v184;
    _os_log_impl(&dword_235D0B000, v72, v73, "Completed search for query %@", buf, 0xCu);
  }

  [(NSMutableArray *)v71->_tokens removeObject:v184];
  [(NSMutableArray *)v71->_slowTokens removeObject:v184];
  [(NSMutableArray *)self->_delayedStartTokens removeObject:v184];
  [(NSMutableArray *)v71->_finishedTokens addObject:v184];
  uint64_t v74 = SPLogForSPLogCategoryQuery();
  os_log_type_t v75 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v74, v75))
  {
    tokens = v71->_tokens;
    slowTokens = v71->_slowTokens;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = tokens;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = slowTokens;
    _os_log_impl(&dword_235D0B000, v74, v75, "Remaining stores %@ %@", buf, 0x16u);
  }

  *((void *)&v177 + 1) = [(NSMutableArray *)v71->_slowTokens count];
  int v171 = (char *)[(NSMutableArray *)self->_delayedStartTokens count];
  uint64_t v169 = [(NSMutableArray *)v71->_delayedStartQueries count];
  uint64_t v78 = [(NSMutableArray *)v71->_tokens count];
  *(void *)&long long v177 = v78;
  if (__PAIR128__(*((unint64_t *)&v177 + 1), v78) == 0
    && [(NSMutableArray *)v71->_delayedStartQueries count])
  {
    long long v212 = 0u;
    long long v213 = 0u;
    long long v210 = 0u;
    long long v211 = 0u;
    BOOL v79 = v71->_delayedStartQueries;
    uint64_t v80 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v210 objects:v225 count:16];
    if (v80)
    {
      uint64_t v81 = *(void *)v211;
      do
      {
        for (uint64_t j = 0; j != v80; ++j)
        {
          if (*(void *)v211 != v81) {
            objc_enumerationMutation(v79);
          }
          id v83 = *(void **)(*((void *)&v210 + 1) + 8 * j);
          [v83 setDelegate:v71];
          [v83 start];
          uint64_t v84 = [(id)objc_opt_class() searchDomain];
          if ([v83 isStarted])
          {
            delayedStartTokens = self->_delayedStartTokens;
            uint64_t v86 = [NSNumber numberWithUnsignedInt:v84];
            [(NSMutableArray *)delayedStartTokens addObject:v86];
          }
        }
        uint64_t v80 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v210 objects:v225 count:16];
      }
      while (v80);
    }

    [(NSMutableArray *)v71->_delayedStartQueries removeAllObjects];
  }
  if ([(NSMutableArray *)v71->_slowTokens count]) {
    BOOL v181 = 0;
  }
  else {
    BOOL v181 = [(NSMutableArray *)v71->_tokens count] == 0;
  }
  if (v180)
  {
    long long v208 = 0u;
    long long v209 = 0u;
    long long v206 = 0u;
    long long v207 = 0u;
    id obj = obj;
    char v88 = 0;
    uint64_t v89 = [obj countByEnumeratingWithState:&v206 objects:v224 count:16];
    if (v89)
    {
      uint64_t v90 = *(void *)v207;
      do
      {
        for (uint64_t k = 0; k != v89; ++k)
        {
          if (*(void *)v207 != v90) {
            objc_enumerationMutation(obj);
          }
          long long v92 = *(void **)(*((void *)&v206 + 1) + 8 * k);
          long long v202 = 0u;
          long long v203 = 0u;
          long long v204 = 0u;
          long long v205 = 0u;
          long long v93 = [v92 results];
          uint64_t v94 = [v93 countByEnumeratingWithState:&v202 objects:v223 count:16];
          if (v94)
          {
            uint64_t v95 = *(void *)v203;
            while (2)
            {
              for (uint64_t m = 0; m != v94; ++m)
              {
                if (*(void *)v203 != v95) {
                  objc_enumerationMutation(v93);
                }
                if ([*(id *)(*((void *)&v202 + 1) + 8 * m) topHit] == 2)
                {
                  char v88 = 1;
                  goto LABEL_86;
                }
              }
              uint64_t v94 = [v93 countByEnumeratingWithState:&v202 objects:v223 count:16];
              if (v94) {
                continue;
              }
              break;
            }
          }
LABEL_86:
        }
        uint64_t v89 = [obj countByEnumeratingWithState:&v206 objects:v224 count:16];
      }
      while (v89);
    }

    v71->_shouldRecomputeSuggestions = 0;
    uint64_t v97 = [(SPQueryTask *)v71 query];
    char v98 = [v97 cancelled];

    if ((v98 & 1) == 0)
    {
      if ([(NSMutableArray *)v71->_bottomPlacedSections count])
      {
        uint64_t v99 = [obj arrayByAddingObjectsFromArray:v71->_bottomPlacedSections];

        id obj = (id)v99;
      }
      objc_opt_class();
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [obj count];
      }
      if (&v171[v169]) {
        BOOL v104 = 0;
      }
      else {
        BOOL v104 = v177 == 0;
      }
      int v105 = v104;
      HIDWORD(v168) = 2;
      LOBYTE(v168) = v88 & 1;
      -[SPFederatedQueryTask sendResults:reset:partiallyComplete:update:complete:unchanged:delayedTopHit:reason:](v71, "sendResults:reset:partiallyComplete:update:complete:unchanged:delayedTopHit:reason:", obj, 0, 0, v105 ^ 1u, v168);
    }
    goto LABEL_131;
  }
  BOOL v100 = !v71->_didForceSend && v181;
  if (v100)
  {
    if (v71->_parsecEntityCameEarly)
    {
      timer = v71->_timer;
      if (timer)
      {
        dispatch_source_cancel(timer);
        dispatch_source_set_event_handler((dispatch_source_t)v71->_timer, 0);
        long long v102 = v71->_timer;
        v71->_timer = 0;
      }
      uint64_t v103 = 0;
      goto LABEL_101;
    }
    if (!v71->_parsecCameLaterThanSRT)
    {
      uint64_t v166 = v71->_timer;
      if (v166)
      {
        dispatch_source_cancel(v166);
        dispatch_source_set_event_handler((dispatch_source_t)v71->_timer, 0);
        v167 = v71->_timer;
        v71->_timer = 0;
      }
      [(SPFederatedQueryTask *)v71 sendFinishedDomains:0];
      goto LABEL_131;
    }
LABEL_116:
    long long v106 = (void *)MEMORY[0x237DF3B00]();
    v71->_didSendResults = 0;
    v71->_sendStableSections = 1;
    uint64_t v107 = [(NSArray *)v71->_actualSentSections arrayByAddingObjectsFromArray:obj];
    stableSections = v71->_stableSections;
    v71->_stableSections = (NSArray *)v107;

    long long v109 = objc_opt_new();
    long long v200 = 0u;
    long long v201 = 0u;
    long long v198 = 0u;
    long long v199 = 0u;
    id obj = obj;
    uint64_t v110 = [obj countByEnumeratingWithState:&v198 objects:v222 count:16];
    if (v110)
    {
      uint64_t v111 = *(void *)v199;
      do
      {
        for (uint64_t n = 0; n != v110; ++n)
        {
          if (*(void *)v199 != v111) {
            objc_enumerationMutation(obj);
          }
          long long v113 = *(void **)(*((void *)&v198 + 1) + 8 * n);
          if (v113)
          {
            long long v114 = [v113 results];
            [v109 addObjectsFromArray:v114];
          }
        }
        uint64_t v110 = [obj countByEnumeratingWithState:&v198 objects:v222 count:16];
      }
      while (v110);
    }

    if ([v109 count])
    {
      v71->_receivedLateParsecResults = 1;
      long long v115 = (void *)[objc_alloc(MEMORY[0x263F679E8]) initWithResults:v109];
      long long v116 = [MEMORY[0x263F674B0] sharedProxy];
      uint64_t v117 = [(SPQueryTask *)v71 query];
      uint64_t v118 = [v117 queryIdent];
      uint64_t v119 = [(SPXPCConnection *)v71->_connection bundleID];
      [v116 sendFeedbackType:14 feedback:v115 queryId:v118 clientID:v119];
    }
    if (SSDisplayLateServerSuggestions()) {
      BOOL v120 = [(NSArray *)v71->_serverSuggestionResults count] != 0;
    }
    else {
      BOOL v120 = 0;
    }
    v71->_shouldRecomputeSuggestions = v120;
    [(SPFederatedQueryTask *)v71 sendFinishedDomains:3];

    goto LABEL_131;
  }
  if (v71->_parsecCameLaterThanSRT) {
    goto LABEL_116;
  }
  if (!v71->_isEntitySearch
    || (isKindOfClass & 1) == 0
    || ![(NSMutableArray *)v71->_tokens count]
    || [(NSMutableArray *)v71->_slowTokens count])
  {
    goto LABEL_131;
  }
  v71->_parsecEntityCameEarly = 1;
  uint64_t v103 = 5;
LABEL_101:
  [(SPFederatedQueryTask *)v71 sendFinishedDomains:v100 reason:v103];
LABEL_131:
  if (v181)
  {
    uint64_t v121 = [(NSMutableArray *)self->_delayedStartTokens count];
    if (!(v121 + [(NSMutableArray *)v71->_delayedStartQueries count]) && !v71->_sentCompleted)
    {
      [(SPFederatedQueryTask *)v71 sendQueryCompleted];
      bottomPlacedSections = v71->_bottomPlacedSections;
      v71->_bottomPlacedSections = 0;

      v71->_sentCompleted = 1;
    }
  }
  objc_sync_exit(v71);

  if (![(NSMutableArray *)v71->_slowTokens count] && ![(NSMutableArray *)v71->_tokens count])
  {
    id v123 = objc_alloc(MEMORY[0x263F67808]);
    uint64_t v124 = [(SPQueryTask *)v71 query];
    uint64_t v125 = objc_msgSend(v123, "initWithEvent:timeInterval:queryId:", @"com.apple.spotlight.backend.stores.end", 0, objc_msgSend(v124, "queryIdent"));

    int v126 = [MEMORY[0x263F674B0] sharedProxy];
    uint64_t v127 = [(SPQueryTask *)v71 query];
    uint64_t v128 = [v127 queryIdent];
    id v129 = [(SPXPCConnection *)v71->_connection bundleID];
    [v126 sendFeedbackType:21 feedback:v125 queryId:v128 clientID:v129];
  }
  if (![(NSMutableArray *)v71->_slowTokens count] || [(NSMutableArray *)v71->_tokens count]) {
    goto LABEL_143;
  }
  char v130 = v180;
  if (v71->_timer) {
    char v130 = 1;
  }
  if (v130)
  {
LABEL_143:
    double Current = CFAbsoluteTimeGetCurrent();
    double storeStartTime = v71->_storeStartTime;
    BOOL v133 = [(NSMutableArray *)v71->_tokens count] == 0;
    uint64_t v134 = SPLogForSPLogCategoryDefault();
    double v135 = Current - storeStartTime;
    os_log_type_t v136 = 2 * (*MEMORY[0x263F67540] == 0);
    BOOL v137 = os_log_type_enabled(v134, v136);
    if (v133)
    {
      if (v137)
      {
        uint64_t v139 = [(NSMutableArray *)v71->_slowTokens count];
        uint64_t v140 = [(NSMutableArray *)v71->_tokens count];
        uint64_t v141 = v71->_timer;
        *(_DWORD *)buf = 134219008;
        *(void *)&uint8_t buf[4] = v139;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v140;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v141;
        LOWORD(v220) = 1024;
        *(_DWORD *)((char *)&v220 + 2) = v180;
        HIWORD(v220) = 2048;
        double v221 = v135;
        _os_log_impl(&dword_235D0B000, v134, v136, "Not waiting on parsec st:%ld t:%ld ti:%p d:%d (%f)", buf, 0x30u);
      }
    }
    else if (v137)
    {
      v138 = v71->_tokens;
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v138;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(double *)&buf[14] = v135;
      _os_log_impl(&dword_235D0B000, v134, v136, "Not waiting on parsec t:%@ (%f)", buf, 0x16u);
    }
  }
  else
  {
    double v142 = CFAbsoluteTimeGetCurrent();
    int v143 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235D0B000, v143, OS_LOG_TYPE_DEFAULT, "No more fast data stores, waiting for parsec", buf, 2u);
    }

    locatiouint64_t n = 0;
    objc_initWeak(&location, v71);
    uint64_t v144 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    *(_OWORD *)buf = *(_OWORD *)v144;
    *(_OWORD *)&uint8_t buf[16] = *(_OWORD *)(v144 + 16);
    uint64_t v220 = *(void *)(v144 + 32);
    v192[0] = MEMORY[0x263EF8330];
    v192[1] = 3221225472;
    v192[2] = __76__SPFederatedQueryTask_storeCompletedSearch_withSections_suggestionResults___block_invoke_404;
    v192[3] = &unk_264C769A8;
    long long v194 = *(_OWORD *)buf;
    long long v195 = *(_OWORD *)&buf[16];
    uint64_t v196 = v220;
    objc_copyWeak(&v193, &location);
    char v145 = (void (**)(id, void))MEMORY[0x237DF3D40](v192);
    double v146 = v142 - v71->_storeStartTime;
    if (v146 >= v71->_timeOut)
    {
      id v161 = SPLogForSPLogCategoryDefault();
      os_log_type_t v162 = 2 * (*MEMORY[0x263F67540] == 0);
      if (os_log_type_enabled(v161, v162))
      {
        *(_WORD *)v191 = 0;
        _os_log_impl(&dword_235D0B000, v161, v162, "No more fast data stores, send", v191, 2u);
      }

      uint64_t v163 = v71->_timer;
      if (v163)
      {
        dispatch_source_cancel(v163);
        dispatch_source_set_event_handler((dispatch_source_t)v71->_timer, 0);
        uint64_t v164 = v71->_timer;
        v71->_timer = 0;
      }
      v145[2](v145, 0);
      v71->_parsecCameLaterThanSRT = 1;
      v71->_shouldRecomputeSuggestions = 1;
    }
    else
    {
      v147 = SPLogForSPLogCategoryDefault();
      os_log_type_t v148 = 2 * (*MEMORY[0x263F67540] == 0);
      if (os_log_type_enabled(v147, v148))
      {
        *(_WORD *)v191 = 0;
        _os_log_impl(&dword_235D0B000, v147, v148, "No more fast data stores, within parsec timeout", v191, 2u);
      }

      double timeOut = (double)SSPriorityIndexDelayMilliseconds() / 1000.0;
      BOOL v150 = v146 < timeOut && !v71->_sentPriority;
      char v151 = !v150;
      if (!v150)
      {
        if (!v71->_sentPriority)
        {
          int v152 = SPLogForSPLogCategoryDefault();
          os_log_type_t v153 = 2 * (*MEMORY[0x263F67540] == 0);
          if (os_log_type_enabled(v152, v153))
          {
            *(_WORD *)v191 = 0;
            _os_log_impl(&dword_235D0B000, v152, v153, "Send for CoreSpotlight priority path", v191, 2u);
          }

          v145[2](v145, 1);
        }
        double timeOut = v71->_timeOut;
      }
      uint64_t v154 = [(SPQueryTask *)v71 queryProcessor];
      dispatch_source_t v155 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v154);
      id v156 = v71->_timer;
      v71->_timer = (OS_dispatch_source *)v155;

      v157 = v71->_timer;
      dispatch_time_t v158 = dispatch_time(0, (unint64_t)((timeOut - v146) * 1000000000.0));
      dispatch_source_set_timer(v157, v158, 0xFFFFFFFFFFFFFFFFLL, 0);
      int v159 = (void *)[v145 copy];

      unsigned int v160 = v71->_timer;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __76__SPFederatedQueryTask_storeCompletedSearch_withSections_suggestionResults___block_invoke_423;
      handler[3] = &unk_264C769D0;
      char v145 = v159;
      id v189 = v145;
      char v190 = v151;
      dispatch_source_set_event_handler(v160, handler);
      dispatch_resume((dispatch_object_t)v71->_timer);
    }
    objc_destroyWeak(&v193);
    objc_destroyWeak(&location);
  }

LABEL_175:
  return 0;
}

uint64_t __76__SPFederatedQueryTask_storeCompletedSearch_withSections_suggestionResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 rankingItem];
  os_log_type_t v6 = [v4 rankingItem];

  if (!v5 || !v6)
  {
LABEL_8:
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  if (([v5 isServerAlternativeResult] & 1) != 0
    || ([v6 isServerAlternativeResult] & 1) == 0)
  {
    if ([v5 isServerAlternativeResult]
      && ![v6 isServerAlternativeResult])
    {
      uint64_t v7 = 1;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v7 = -1;
LABEL_9:

  return v7;
}

void __76__SPFederatedQueryTask_storeCompletedSearch_withSections_suggestionResults___block_invoke_404(uint64_t a1, char a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v4 = *(_OWORD *)(v3 + 16);
  long long v48 = *(_OWORD *)v3;
  long long v49 = v4;
  uint64_t v50 = *(void *)(v3 + 32);
  uint64_t v6 = *(void *)(v5 + 72);
  long long v7 = *(_OWORD *)(v5 + 56);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(v5 + 40);
  *(_OWORD *)(v3 + 16) = v7;
  uint64_t v38 = v3;
  *(void *)(v3 + 32) = v6;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(v5 + 32));
  if (WeakRetained)
  {
    int v37 = WeakRetained;
    int v9 = [WeakRetained query];
    char v10 = [v9 cancelled];

    WeakRetained = v37;
    if ((v10 & 1) == 0)
    {
      long long v11 = *(_OWORD *)(v38 + 16);
      long long v45 = *(_OWORD *)v38;
      long long v46 = v11;
      uint64_t v47 = *(void *)(v38 + 32);
      uint64_t v12 = *(void *)v38;
      uint64_t spanid = si_tracing_calc_next_spanid();
      uint64_t v14 = *(void *)(v38 + 8);
      *(void *)uint64_t v38 = v12;
      *(void *)(v38 + 8) = spanid;
      *(void *)(v38 + 16) = v14;
      *(unsigned char *)(v38 + 28) = 102;
      *(void *)(v38 + 32) = "sendResultsBlock";
      si_tracing_log_span_begin();
      id v15 = SPLogForSPLogCategoryQuery();
      os_log_type_t v16 = *MEMORY[0x263F67548] ^ 1;
      if (os_log_type_enabled(v15, v16))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235D0B000, v15, v16, "Show local results while waiting for slow queries", buf, 2u);
      }

      if ((a2 & 1) == 0)
      {
        AnalyticsSendEventLazy();
        id v17 = (dispatch_source_t *)(v37 + 232);
        if (!*((void *)v37 + 29))
        {
          char v22 = 0;
          goto LABEL_22;
        }
        goto LABEL_20;
      }
      id v17 = (dispatch_source_t *)(v37 + 232);
      if (!*((void *)v37 + 29))
      {
        char v22 = 1;
        goto LABEL_22;
      }
      unint64_t v18 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235D0B000, v18, OS_LOG_TYPE_DEFAULT, "Timer fired for CoreSpotlight priority path", buf, 2u);
      }

      double v19 = CFAbsoluteTimeGetCurrent() - *((double *)v37 + 27);
      if (v19 >= *((double *)v37 + 28))
      {
        uint64_t v20 = SPLogForSPLogCategoryDefault();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
LABEL_19:

LABEL_20:
          dispatch_source_cancel(*v17);
          dispatch_source_set_event_handler(*v17, 0);
          char v22 = 0;
          uint64_t v23 = *v17;
          *id v17 = 0;
LABEL_21:

LABEL_22:
          uint64_t v24 = [v37 query];
          char v25 = [v24 cancelled];

          if ((v25 & 1) == 0)
          {
            if ((v22 & 1) == 0 && ![*((id *)v37 + 60) count])
            {
              [v37 sendFinishedDomains:1 reason:1];
              v37[278] = 1;
              v37[283] = 1;
              goto LABEL_27;
            }
            [v37 sendFinishedDomains:4];
          }
          if (v22)
          {
LABEL_37:
            si_tracing_log_span_end();
            long long v33 = v46;
            *(_OWORD *)uint64_t v38 = v45;
            *(_OWORD *)(v38 + 16) = v33;
            *(void *)(v38 + 32) = v47;
            WeakRetained = v37;
            goto LABEL_38;
          }
LABEL_27:
          long long v26 = v37;
          objc_sync_enter(v26);
          if ([v26[63] count])
          {
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            id obj = v26[63];
            uint64_t v27 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
            if (v27)
            {
              uint64_t v28 = *(void *)v41;
              do
              {
                for (uint64_t i = 0; i != v27; ++i)
                {
                  if (*(void *)v41 != v28) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v30 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                  [v30 start];
                  id v31 = v26[62];
                  double v32 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_opt_class(), "searchDomain"));
                  [v31 addObject:v32];

                  [v26[63] removeObject:v30];
                }
                uint64_t v27 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
              }
              while (v27);
            }
          }
          objc_sync_exit(v26);

          goto LABEL_37;
        }
        *(_WORD *)buf = 0;
        uint64_t v21 = "Don't reset timer for CoreParsec; past deadline";
      }
      else
      {
        if (![*((id *)v37 + 60) count])
        {
          int v35 = *v17;
          dispatch_time_t v36 = dispatch_time(0, (uint64_t)((*((double *)v37 + 28) - v19) * 1000000000.0));
          dispatch_source_set_timer(v35, v36, 0xFFFFFFFFFFFFFFFFLL, 0);
          uint64_t v23 = SPLogForSPLogCategoryDefault();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_235D0B000, v23, OS_LOG_TYPE_DEFAULT, "Reset timer for CoreParsec", buf, 2u);
          }
          char v22 = 1;
          goto LABEL_21;
        }
        uint64_t v20 = SPLogForSPLogCategoryDefault();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_WORD *)buf = 0;
        uint64_t v21 = "Don't reset timer for CoreParsec; other waiting stores exist";
      }
      _os_log_impl(&dword_235D0B000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
      goto LABEL_19;
    }
  }
LABEL_38:

  long long v34 = v49;
  *(_OWORD *)uint64_t v38 = v48;
  *(_OWORD *)(v38 + 16) = v34;
  *(void *)(v38 + 32) = v50;
}

void *__76__SPFederatedQueryTask_storeCompletedSearch_withSections_suggestionResults___block_invoke_409()
{
  return &unk_26E931278;
}

uint64_t __76__SPFederatedQueryTask_storeCompletedSearch_withSections_suggestionResults___block_invoke_423(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)storeCompletedSearch:(id)a3 withSections:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SPQueryTask *)self query];
  char v9 = [v8 cancelled];

  BOOL v10 = (v9 & 1) == 0
     && [(SPFederatedQueryTask *)self storeCompletedSearch:v6 withSections:v7 suggestionResults:0];

  return v10;
}

+ (BOOL)isCJK
{
  if (isCJK_onceToken != -1) {
    dispatch_once(&isCJK_onceToken, &__block_literal_global_425);
  }
  return isCJK_sIsCJK;
}

void __29__SPFederatedQueryTask_isCJK__block_invoke()
{
  id v0 = [MEMORY[0x263EFF960] preferredLanguages];
  id v1 = [v0 firstObject];
  id v2 = [v1 lowercaseString];

  if (([v2 hasPrefix:@"ja"] & 1) != 0
    || ([v2 hasPrefix:@"zh"] & 1) != 0
    || [v2 hasPrefix:@"ko"])
  {
    isCJK_sIsCJK = 1;
  }
}

- (id)correctedQueryWithCorrection:(id)a3
{
  long long v4 = (objc_class *)MEMORY[0x263F78DB0];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithSearchString:v5];

  id v7 = [(SPQueryTask *)self query];
  id v8 = [v7 queryContext];

  [v6 setWhyQuery:18];
  [v6 setQueryKind:10];
  char v9 = [(SPQueryTask *)self query];
  objc_msgSend(v6, "setQueryIdent:", objc_msgSend(v9, "queryIdent"));

  BOOL v10 = [v8 keyboardLanguage];
  [v6 setKeyboardLanguage:v10];

  long long v11 = [v8 keyboardPrimaryLanguage];
  [v6 setKeyboardPrimaryLanguage:v11];

  [v8 scaleFactor];
  objc_msgSend(v6, "setScaleFactor:");
  uint64_t v12 = [v8 searchDomains];
  [v6 setSearchDomains:v12];

  id v13 = [v8 disabledDomains];
  [v6 setDisabledDomains:v13];

  uint64_t v14 = [(SPQueryTask *)self query];
  id v15 = [v14 disabledApps];
  [v6 setDisabledApps:v15];

  os_log_type_t v16 = [(SPQueryTask *)self query];
  id v17 = [v16 disabledBundles];
  [v6 setDisabledBundles:v17];

  unint64_t v18 = [v8 markedTextArray];
  [v6 setMarkedTextArray:v18];

  double v19 = [(SPQueryTask *)self query];
  objc_msgSend(v6, "setPromoteLocalResults:", objc_msgSend(v19, "promoteLocalResults"));

  uint64_t v20 = [(SPQueryTask *)self query];
  objc_msgSend(v6, "setPromoteParsecResults:", objc_msgSend(v20, "promoteParsecResults"));

  uint64_t v21 = [(SPQueryTask *)self query];
  objc_msgSend(v6, "setNoTokenize:", objc_msgSend(v21, "noTokenize"));

  objc_msgSend(v6, "setDeviceAuthenticationState:", objc_msgSend(v8, "deviceAuthenticationState"));
  char v22 = [v8 queryUnderstandingOutput];
  [v6 setQueryUnderstandingOutput:v22];

  uint64_t v23 = [(SPFederatedQueryTask *)self clientBundleID];
  [v6 setClientBundleID:v23];

  uint64_t v24 = [[SPFederatedQueryTask alloc] initWithQueryContext:v6 externalID:[(SPFederatedQueryTask *)self externalID]];
  char v25 = [(SPQueryTask *)self query];
  long long v26 = [v25 queryContext];
  -[SPFederatedQueryTask setPreviousQueryKind:](v24, "setPreviousQueryKind:", [v26 queryKind]);

  uint64_t v27 = [(SPQueryTask *)self query];
  uint64_t v28 = [v27 infinitePatience];
  char v29 = [(SPQueryTask *)v24 query];
  [v29 setInfinitePatience:v28];

  uint64_t v30 = [(SPQueryTask *)self query];
  uint64_t v31 = [v30 noTokenize];
  double v32 = [(SPQueryTask *)v24 query];
  [v32 setNoTokenize:v31];

  long long v33 = [(SPQueryTask *)self query];
  uint64_t v34 = [v33 promoteParsecResults];
  int v35 = [(SPQueryTask *)v24 query];
  [v35 setPromoteParsecResults:v34];

  dispatch_time_t v36 = [(SPQueryTask *)self query];
  uint64_t v37 = [v36 promoteLocalResults];
  uint64_t v38 = [(SPQueryTask *)v24 query];
  [v38 setPromoteLocalResults:v37];

  uint64_t v39 = [(SPQueryTask *)self query];
  uint64_t v40 = [v39 contentFilters];
  long long v41 = [(SPQueryTask *)v24 query];
  [v41 setContentFilters:v40];

  long long v42 = [(SPQueryTask *)self query];
  uint64_t v43 = [v42 maxCount];
  BOOL v44 = [(SPQueryTask *)v24 query];
  [v44 setMaxCount:v43];

  long long v45 = [(SPFederatedQueryTask *)self message];
  [(SPFederatedQueryTask *)v24 setMessage:v45];

  long long v46 = [(SPQueryTask *)self query];
  uint64_t v47 = [v46 isWideScreen];
  long long v48 = [(SPQueryTask *)v24 query];
  [v48 setIsWideScreen:v47];

  long long v49 = [(SPQueryTask *)self query];
  uint64_t v50 = [v49 internalDebug];
  double v51 = [(SPQueryTask *)v24 query];
  [v51 setInternalDebug:v50];

  [(SPFederatedQueryTask *)v24 setIsRewrite:1];
  return v24;
}

- (void)dealloc
{
  uint64_t v3 = [(SPFederatedQueryTask *)self message];
  int v4 = [v3 needsReply];

  if (v4)
  {
    id v5 = [(SPFederatedQueryTask *)self message];
    [v5 sendReply:MEMORY[0x263EFFA78]];
  }
  id v6 = [(SPQueryTask *)self query];
  int v7 = [v6 cancelled];

  if (v7) {
    query_analytics_log_complete(self, "cancel", self->_startTime);
  }
  v8.receiver = self;
  v8.super_class = (Class)SPFederatedQueryTask;
  [(SPFederatedQueryTask *)&v8 dealloc];
}

- (id)waitForQueryCorrections
{
  correctionsSeuint64_t m = self->_correctionsSem;
  dispatch_time_t v4 = dispatch_time(0, 500000000);
  dispatch_semaphore_wait(correctionsSem, v4);
  corrections = self->_corrections;
  return corrections;
}

- (void)addQueryCorrections:(id)a3
{
  objc_storeStrong((id *)&self->_corrections, a3);
  id v5 = a3;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_correctionsSem);
}

- (BOOL)parsecAvailable
{
  if (!self->_parsecEnabled) {
    return 0;
  }
  BOOL result = [(SPParsecQuery *)self->_parsecQuery available];
  self->_parsecEnabled = result;
  return result;
}

- (void)_processResponse:(id)a3 toQuery:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v9 kind] == 2 || objc_msgSend(v9, "kind") == 3)
  {
    int v7 = [v9 sections];
    objc_super v8 = [v9 localSuggestionResults];
    [(SPFederatedQueryTask *)self storeSearchProgress:v6 withSections:v7 suggestionResults:v8];
  }
  else
  {
    int v7 = [v9 sections];
    objc_super v8 = [v9 localSuggestionResults];
    [(SPFederatedQueryTask *)self storeCompletedSearch:v6 withSections:v7 suggestionResults:v8];
  }
}

- (void)queryTask:(id)a3 gotResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(SPQueryTask *)self queryProcessor];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SPFederatedQueryTask_queryTask_gotResponse___block_invoke;
  block[3] = &unk_264C769F8;
  block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_block_t v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(v8, v11);
}

uint64_t __46__SPFederatedQueryTask_queryTask_gotResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processResponse:*(void *)(a1 + 40) toQuery:*(void *)(a1 + 48)];
}

- (void)addAndStartQuery
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  uint64_t v3 = ((uint64_t (*)(void, SEL))*MEMORY[0x263F55710])(MEMORY[0x263F55710], a2);
  long long v4 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v5 + 160) = *(_OWORD *)v3;
  *(_OWORD *)(v5 + 176) = v4;
  uint64_t v101 = *(void *)(v3 + 32);
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "-[SPFederatedQueryTask addAndStartQuery]";
  si_tracing_log_span_begin();
  if ((sPrepareCacheForSearchContinuationStarted & 1) == 0)
  {
    sPrepareCacheForSearchContinuationStarted = 1;
    [(id)objc_opt_class() prepareCacheForSearchContinuation];
  }
  [(SPFederatedQueryTask *)self startSetup];
  id v9 = [(SPQueryTask *)self query];
  id v10 = [v9 queryContext];

  os_log_type_t v75 = v10;
  dispatch_block_t v11 = [v10 searchEntities];
  if ([v11 count])
  {
    uint64_t v12 = [v10 searchEntities];
    id v13 = [v12 lastObject];
    uint64_t v74 = [v13 currentSearchString];
  }
  else
  {
    uint64_t v74 = [v10 searchString];
  }

  id v14 = SPLogForSPLogCategoryDefault();
  os_log_type_t v15 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v14, v15))
  {
    os_log_type_t v16 = [v10 searchDomains];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v74;
    __int16 v105 = 2112;
    long long v106 = v16;
    _os_log_impl(&dword_235D0B000, v14, v15, "#query Starting query for %@ on domains %@", buf, 0x16u);
  }
  id v17 = SPLogForSPLogCategoryDefault();
  os_log_type_t v18 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v17, v18))
  {
    double v19 = [v10 searchDomains];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v74;
    __int16 v105 = 2112;
    long long v106 = v19;
    _os_log_impl(&dword_235D0B000, v17, v18, "#query Starting query '%@' on domains:%@", buf, 0x16u);
  }
  if ([(NSString *)self->_clientBundleID isEqual:*MEMORY[0x263F67510]])
  {
    if ([v74 length])
    {
      if ([(NSString *)self->_lastQuery length]
        && (([v74 hasPrefix:self->_lastQuery] & 1) != 0
         || [(NSString *)self->_lastQuery hasPrefix:v74]))
      {
        uint64_t v20 = [v74 length];
        NSUInteger v21 = [(NSString *)self->_lastQuery length];
        NSUInteger v22 = v20 - v21;
        if ((uint64_t)(v20 - v21) < 0) {
          NSUInteger v22 = v21 - v20;
        }
        uint64_t v88 = MEMORY[0x263EF8330];
        uint64_t v89 = 3221225472;
        uint64_t v90 = __40__SPFederatedQueryTask_addAndStartQuery__block_invoke_2;
        long long v91 = &__block_descriptor_40_e19___NSDictionary_8__0l;
        NSUInteger v92 = v22;
        AnalyticsSendEventLazy();
      }
      else
      {
        lastQuery = self->_lastQuery;
        if (lastQuery)
        {
          uint64_t v24 = [(NSString *)lastQuery commonPrefixWithString:v74 options:2];
        }
        else
        {
          uint64_t v24 = &stru_26E92AFF0;
        }
        uint64_t v93 = MEMORY[0x263EF8330];
        uint64_t v94 = 3221225472;
        uint64_t v95 = __40__SPFederatedQueryTask_addAndStartQuery__block_invoke;
        uint64_t v96 = &unk_264C76A20;
        id v97 = v74;
        char v98 = v24;
        AnalyticsSendEventLazy();
      }
    }
    char v25 = (NSString *)[v74 copy];
    long long v26 = self->_lastQuery;
    self->_lastQuery = v25;
  }
  id v73 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  uint64_t v27 = [v10 searchDomains];
  uint64_t v28 = [v27 arrayByAddingObject:&unk_26E931348];

  uint64_t v72 = [v28 arrayByAddingObject:&unk_26E931360];

  uint64_t v29 = [v10 deviceAuthenticationState];
  if ([v74 length]
    || ([v10 searchEntities],
        uint64_t v30 = objc_claimAutoreleasedReturnValue(),
        BOOL v31 = [v30 count] == 0,
        v30,
        !v31))
  {
    uint64_t v32 = [v75 queryKind];
    long long v33 = self->_clientBundleID;
    if (SPQueryKindIsSearchToolSearch_onceToken != -1) {
      dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken, &__block_literal_global_1034);
    }
    if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode) {
      goto LABEL_28;
    }
    if (SPQueryKindIsSearchToolSearch_isSearchToolRanking)
    {
      if ([(NSString *)v33 hasPrefix:@"com.apple.omniSearch"]
        || [(NSString *)v33 hasPrefix:@"com.apple.intelligenceflow"])
      {
LABEL_28:

LABEL_29:
        uint64_t v34 = [(SPFederatedQueryTask *)self _queriesForSearchTool];
LABEL_30:
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        id v35 = v34;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v84 objects:v103 count:16];
        if (!v36) {
          goto LABEL_45;
        }
        uint64_t v37 = *(void *)v85;
        while (1)
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v85 != v37) {
              objc_enumerationMutation(v35);
            }
            uint64_t v39 = *(void **)(*((void *)&v84 + 1) + 8 * i);
            [v39 setDelegate:self];
            int v40 = [(id)objc_opt_class() searchDomain];
            if (!v29 && v40 == 6)
            {
              [(SPFederatedQueryTask *)self addDelayedStartQuery:v39];
              continue;
            }
            if (v40 == 1)
            {
              long long v41 = &OBJC_IVAR___SPFederatedQueryTask__csQuery;
            }
            else
            {
              if (v40 != 2) {
                continue;
              }
              long long v41 = &OBJC_IVAR___SPFederatedQueryTask__parsecQuery;
            }
            objc_storeStrong((id *)((char *)&self->super.super.isa + *v41), v39);
          }
          uint64_t v36 = [v35 countByEnumeratingWithState:&v84 objects:v103 count:16];
          if (!v36)
          {
LABEL_45:

            [v35 removeObjectsInArray:self->_delayedStartQueries];
            [(SPFederatedQueryTask *)self setQueries:v35];

            goto LABEL_46;
          }
        }
      }
      int v51 = [(NSString *)v33 hasPrefix:@"com.apple.ondeviceeval"];
      if (v32 == 12) {
        int v52 = 1;
      }
      else {
        int v52 = v51;
      }

      if (v52) {
        goto LABEL_29;
      }
    }
    else
    {
    }
    uint64_t v34 = [(SPFederatedQueryTask *)self _queriesForUserQuery:v29 != 0];
    goto LABEL_30;
  }
LABEL_46:
  if ([(NSArray *)self->_queries count])
  {
    id v42 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    uint64_t v43 = [(SPQueryTask *)self query];
    char v44 = [v43 infinitePatience];

    if (v44)
    {
      long long v45 = SPLogForSPLogCategoryDefault();
      os_log_type_t v46 = 2 * (*MEMORY[0x263F67540] == 0);
      double v47 = 0.0;
      if (!os_log_type_enabled(v45, v46))
      {
LABEL_83:

        self->_parsecEnabled = +[SPParsecQuery isParsecEnabled];
        int v61 = [(SPQueryTask *)self query];
        -[SPCSSearchQuery setMaxCount:](self->_csQuery, "setMaxCount:", [v61 maxCount]);

        uint64_t v62 = [(SPQueryTask *)self query];
        -[SPCSSearchQuery setContentFilters:](self->_csQuery, "setContentFilters:", [v62 contentFilters]);

        int v63 = [(SPFederatedQueryTask *)self itemRanker];
        [(SPCSSearchQuery *)self->_csQuery setItemRanker:v63];

        [(SPCSSearchQuery *)self->_csQuery setPreviousQueryKind:self->_previousQueryKind];
        [(SPCSSearchQuery *)self->_csQuery setIsCJK:self->_isCJK];
        [(SPCSSearchQuery *)self->_csQuery setIsPeopleSearch:self->_isPeopleSearch];
        [(SPCSSearchQuery *)self->_csQuery setIsPhotosSearch:self->_isPhotosSearch];
        [(SPCSSearchQuery *)self->_csQuery setParsecAvailable:[(SPFederatedQueryTask *)self parsecAvailable]];
        uint64_t v64 = [(SPQueryTask *)self query];
        [v64 currentTime];
        -[SPCSSearchQuery setCurrentTime:](self->_csQuery, "setCurrentTime:");

        uint64_t v65 = SPLogForSPLogCategoryDefault();
        os_log_type_t v66 = 2 * (*MEMORY[0x263F67540] == 0);
        if (os_log_type_enabled(v65, v66))
        {
          qos_class_t v67 = qos_class_self();
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v67;
          _os_log_impl(&dword_235D0B000, v65, v66, "QOS addAndStartQuery: %d", buf, 8u);
        }

        *(void *)buf = 0;
        objc_initWeak((id *)buf, self);
        uint64_t v68 = [(SPQueryTask *)self queryProcessor];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __40__SPFederatedQueryTask_addAndStartQuery__block_invoke_450;
        block[3] = &unk_264C76A90;
        objc_copyWeak(v79, (id *)buf);
        block[4] = self;
        v79[1] = *(id *)&v47;
        id v69 = v42;
        id v77 = v69;
        id v78 = v74;
        dispatch_block_t v70 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
        tracing_dispatch_async();

        objc_destroyWeak(v79);
        objc_destroyWeak((id *)buf);

        goto LABEL_86;
      }
      *(_WORD *)buf = 0;
      long long v48 = "Query with infinite patience";
    }
    else
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v53 = self->_queries;
      uint64_t v54 = [(NSArray *)v53 countByEnumeratingWithState:&v80 objects:v102 count:16];
      if (v54)
      {
        uint64_t v55 = *(void *)v81;
        double v47 = 0.0;
        do
        {
          for (uint64_t j = 0; j != v54; ++j)
          {
            if (*(void *)v81 != v55) {
              objc_enumerationMutation(v53);
            }
            int v57 = *(void **)(*((void *)&v80 + 1) + 8 * j);
            if (objc_opt_respondsToSelector())
            {
              objc_msgSend(v57, "timeOut:", objc_msgSend((id)objc_opt_class(), "searchDomain") == 7);
              double v59 = v58;
              if (v58 > 0.0)
              {
                [v42 addObject:v57];
                if (v59 >= v47) {
                  double v60 = v47;
                }
                else {
                  double v60 = v59;
                }
                if (v47 <= 0.0) {
                  double v47 = v59;
                }
                else {
                  double v47 = v60;
                }
              }
            }
          }
          uint64_t v54 = [(NSArray *)v53 countByEnumeratingWithState:&v80 objects:v102 count:16];
        }
        while (v54);
      }
      else
      {
        double v47 = 0.0;
      }

      long long v45 = SPLogForSPLogCategoryDefault();
      os_log_type_t v46 = 2 * (*MEMORY[0x263F67540] == 0);
      if (!os_log_type_enabled(v45, v46)) {
        goto LABEL_83;
      }
      *(_WORD *)buf = 0;
      long long v48 = "Query with timeout";
    }
    _os_log_impl(&dword_235D0B000, v45, v46, v48, buf, 2u);
    goto LABEL_83;
  }
  long long v49 = SPLogForSPLogCategoryQuery();
  os_log_type_t v50 = *MEMORY[0x263F67548] ^ 1;
  if (os_log_type_enabled(v49, v50))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235D0B000, v49, v50, "#query No stores for query!", buf, 2u);
  }

  [(SPFederatedQueryTask *)self sendQueryCompleted];
LABEL_86:

  si_tracing_log_span_end();
  long long v71 = v100;
  *(_OWORD *)uint64_t v3 = v99;
  *(_OWORD *)(v3 + 16) = v71;
  *(void *)(v3 + 32) = v101;
}

id __40__SPFederatedQueryTask_addAndStartQuery__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  long long v4 = @"keystrokes";
  id v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "length") - objc_msgSend(*(id *)(a1 + 40), "length"));
  v5[0] = v1;
  id v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

id __40__SPFederatedQueryTask_addAndStartQuery__block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  long long v4 = @"keystrokes";
  id v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  id v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

void __40__SPFederatedQueryTask_addAndStartQuery__block_invoke_450(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v15 = *(_OWORD *)v3;
  long long v16 = *(_OWORD *)(v3 + 16);
  uint64_t v17 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v6 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v4;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v6;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "SDClient:  Starting query";
  si_tracing_log_span_begin();
  id v7 = objc_alloc(MEMORY[0x263F67808]);
  uint64_t v8 = [*(id *)(a1 + 32) query];
  id v9 = objc_msgSend(v7, "initWithEvent:timeInterval:queryId:", @"com.apple.spotlight.backend.stores.start", 0, objc_msgSend(v8, "queryIdent"));

  id v10 = [MEMORY[0x263F674B0] sharedProxy];
  dispatch_block_t v11 = [*(id *)(a1 + 32) query];
  objc_msgSend(v10, "sendFeedbackType:feedback:queryId:clientID:", 21, v9, objc_msgSend(v11, "queryIdent"), *(void *)(*(void *)(a1 + 32) + 448));

  if (*(double *)(a1 + 64) > 0.0) {
    objc_msgSend(*(id *)(a1 + 32), "setTimeout:");
  }
  if (WeakRetained)
  {
    [WeakRetained[80] count];
    uint64_t v12 = WeakRetained;
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    tracing_dispatch_apply();
  }
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v15;
  *(_OWORD *)(v3 + 16) = v16;
  *(void *)(v3 + 32) = v17;
}

__n128 __40__SPFederatedQueryTask_addAndStartQuery__block_invoke_2_455(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  __n128 v16 = *(__n128 *)v4;
  long long v17 = *(_OWORD *)(v4 + 16);
  uint64_t v18 = *(void *)(v4 + 32);
  uint64_t v5 = *(void *)v4;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v7 = *(void *)(v4 + 8);
  *(void *)uint64_t v4 = v5;
  *(void *)(v4 + 8) = spanid;
  *(void *)(v4 + 16) = v7;
  *(unsigned char *)(v4 + 28) = 102;
  *(void *)(v4 + 32) = "SDClient:  Issuing query for store";
  si_tracing_log_span_begin();
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 640) objectAtIndex:a2];
  id v9 = [*(id *)(a1 + 40) query];
  char v10 = [v9 cancelled];

  if ((v10 & 1) == 0)
  {
    dispatch_block_t v11 = (void *)MEMORY[0x237DF3B00]();
    [v8 activate];
    [v8 start];
    if ([v8 isStarted])
    {
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_opt_class(), "searchDomain"));
      pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
      int v13 = [*(id *)(a1 + 48) containsObject:v8];
      id v14 = *(void **)(a1 + 40);
      if (v13) {
        [v14 addSlowQueryToken:v12];
      }
      else {
        [v14 addQueryToken:v12];
      }
      pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
    }
  }

  si_tracing_log_span_end();
  __n128 result = v16;
  *(__n128 *)uint64_t v4 = v16;
  *(_OWORD *)(v4 + 16) = v17;
  *(void *)(v4 + 32) = v18;
  return result;
}

+ (id)contactEntityFromQueryContext:(id)a3
{
  uint64_t v3 = [a3 searchEntities];
  uint64_t v4 = [v3 firstObject];

  if ([v4 isContactEntitySearch]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)initForSession:(id)a3 withQuery:(id)a4
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SPQueryTask *)self init];
  id v9 = v8;
  if (v8)
  {
    [(SPQueryTask *)v8 setQuery:v7];
    [(SPFederatedQueryTask *)v9 setSession:v6];
    char v10 = [(SPQueryTask *)v9 query];
    [(SPFederatedQueryTask *)v9 _updateQueryContext:v10];

    dispatch_block_t v11 = [v7 queryContext];
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263F67808]), "initWithEvent:timeInterval:queryId:", @"com.apple.spotlight.backend.query.start", 0, objc_msgSend(v11, "queryIdent"));
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F67808]), "initWithEvent:timeInterval:queryId:", @"com.apple.spotlight.backend.suggestions.start", 0, objc_msgSend(v11, "queryIdent"));
    uint64_t v14 = [v11 queryIdent];
    long long v15 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v16 = [v15 bundleIdentifier];
    clientBundleID = v9->_clientBundleID;
    v9->_clientBundleID = (NSString *)v16;

    uint64_t v18 = [MEMORY[0x263F674B0] sharedProxy];
    NSUInteger v92 = (void *)v12;
    [v18 sendFeedbackType:21 feedback:v12 queryId:v14 clientID:v9->_clientBundleID];
    uint64_t v90 = v18;
    long long v91 = (void *)v13;
    uint64_t v89 = v14;
    [v18 sendFeedbackType:21 feedback:v13 queryId:v14 clientID:v9->_clientBundleID];
    v9->_unsigned int externalID = atomic_fetch_add(&__queryTokenGen, 1u);
    uint64_t v19 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:8];
    tokens = v9->_tokens;
    v9->_tokens = (NSMutableArray *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:8];
    slowTokens = v9->_slowTokens;
    v9->_slowTokens = (NSMutableArray *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:8];
    delayedStartQueries = v9->_delayedStartQueries;
    v9->_delayedStartQueries = (NSMutableArray *)v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:8];
    delayedStartTokens = v9->_delayedStartTokens;
    v9->_delayedStartTokens = (NSMutableArray *)v25;

    uint64_t v27 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:8];
    finishedTokens = v9->_finishedTokens;
    v9->_finishedTokens = (NSMutableArray *)v27;

    uint64_t v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    categoryToResultMapping = v9->_categoryToResultMapping;
    v9->_categoryToResultMapping = v29;

    uint64_t v31 = objc_opt_new();
    sectionOrderByInsertiouint64_t n = v9->_sectionOrderByInsertion;
    v9->_sectionOrderByInsertiouint64_t n = (NSMutableOrderedSet *)v31;

    id v93 = v7;
    long long v33 = [v7 queryContext];
    uint64_t v34 = [v33 disabledDomains];
    v9->_parsecSettingEnabled = [v34 containsObject:&unk_26E931318] ^ 1;

    +[SPParsecQuery parsecEnabled:v9->_parsecSettingEnabled];
    id v35 = objc_opt_new();
    [(SPFederatedQueryTask *)v9 setCategoryEngagements:v35];

    v9->_isRewrite = 0;
    v9->_isNLPSearch = 0;
    dispatch_semaphore_t v36 = dispatch_semaphore_create(0);
    correctionsSeuint64_t m = v9->_correctionsSem;
    v9->_correctionsSeuint64_t m = (OS_dispatch_semaphore *)v36;

    uint64_t v38 = [v11 searchString];
    uint64_t v39 = [v11 searchEntities];
    uint64_t v40 = [v39 count];

    uint64_t v96 = v11;
    id v94 = v6;
    if (v40)
    {
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v41 = [v11 searchEntities];
      uint64_t v42 = [v41 countByEnumeratingWithState:&v97 objects:v101 count:16];
      if (!v42) {
        goto LABEL_20;
      }
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v98;
      while (1)
      {
        uint64_t v45 = 0;
        os_log_type_t v46 = v38;
        do
        {
          if (*(void *)v98 != v44) {
            objc_enumerationMutation(v41);
          }
          double v47 = *(void **)(*((void *)&v97 + 1) + 8 * v45);
          char v48 = [v47 isAppEntitySearch];
          long long v49 = &OBJC_IVAR___SPFederatedQueryTask__isScopedAppSearch;
          if ((v48 & 1) != 0
            || (char v50 = [v47 isContactEntitySearch],
                long long v49 = &OBJC_IVAR___SPFederatedQueryTask__isPeopleSearch,
                (v50 & 1) != 0)
            || (char v51 = [v47 isPhotosEntitySearch],
                long long v49 = &OBJC_IVAR___SPFederatedQueryTask__isPhotosSearch,
                (v51 & 1) != 0))
          {
            p_isNLPSearch = (BOOL *)v9 + *v49;
LABEL_12:
            BOOL *p_isNLPSearch = 1;
            goto LABEL_13;
          }
          char v55 = [v47 isNLPEntitySearch];
          p_isNLPSearch = &v9->_isNLPSearch;
          if (v55) {
            goto LABEL_12;
          }
LABEL_13:
          if ([v47 isCommandEntitySearch])
          {
            v9->_isEntitySearch = 1;
            long long v53 = [(SPQueryTask *)v9 query];
            [v53 setInfinitePatience:1];
          }
          uint64_t v54 = [v96 searchString];
          [v47 updateSearchString:v54];

          uint64_t v38 = [v47 currentSearchString];

          ++v45;
          os_log_type_t v46 = v38;
        }
        while (v43 != v45);
        uint64_t v56 = [v41 countByEnumeratingWithState:&v97 objects:v101 count:16];
        uint64_t v43 = v56;
        if (!v56)
        {
LABEL_20:

          dispatch_block_t v11 = v96;
          break;
        }
      }
    }
    int v57 = [v11 keyboardPrimaryLanguage];
    double v58 = [v57 lowercaseString];

    double v59 = [MEMORY[0x263EFF960] currentLocale];
    double v60 = [v59 objectForKey:*MEMORY[0x263EFF508]];

    if (![v58 hasPrefix:@"en"]
      || (int v61 = [v60 hasPrefix:@"en"], v62 = v60, v61))
    {
      uint64_t v62 = v58;
    }
    id v63 = v62;
    uint64_t v95 = v60;
    if (+[SPFederatedQueryTask isCJK]
      || ([v58 hasPrefix:@"ja"] & 1) != 0
      || ([v58 hasPrefix:@"zh"] & 1) != 0)
    {
      char v64 = 1;
    }
    else
    {
      char v64 = [v58 hasPrefix:@"ko"];
    }
    v9->_BOOL isCJK = v64;
    [MEMORY[0x263F78E28] prepareTopHitsParametersForLanguage:v63];
    uint64_t v65 = [objc_alloc(MEMORY[0x263F78E28]) initWithQuery:v38];
    rankingManager = v9->_rankingManager;
    v9->_rankingManager = (SSRankingManager *)v65;

    qos_class_t v67 = (void *)CFPreferencesCopyAppValue(@"SearchRankingUseCreationDateL2", @"com.apple.searchd");
    uint64_t v68 = (void *)CFPreferencesCopyAppValue(@"SearchRankingL2YWeight", @"com.apple.searchd");
    if (v9->_isPeopleSearch)
    {
      id v69 = [(SPFederatedQueryTask *)v9 itemRanker];
      [v69 setIsPeopleSearch:1];
    }
    id v70 = objc_alloc(MEMORY[0x263F78D58]);
    BOOL isCJK = v9->_isCJK;
    [v67 doubleValue];
    double v73 = v72;
    [v68 doubleValue];
    double v75 = v74;
    uint64_t v76 = [(SPQueryTask *)v9 query];
    [v76 currentTime];
    id v78 = (void *)[v70 initWithSearchString:v38 queryID:v89 language:v63 isCJK:isCJK experimentalWeight1:v73 experimentalWeight2:v75 currentTime:v77];
    [(SPFederatedQueryTask *)v9 setItemRanker:v78];

    [(SPFederatedQueryTask *)v9 setIsInternalDevice:os_variant_has_internal_diagnostics()];
    v9->_parsecCameLaterThanSRT = 0;
    v9->_parsecEntityCameEarly = 0;
    v9->_shouldRecomputeSuggestions = 1;
    BOOL v79 = [v96 searchEntities];
    uint64_t v80 = [v79 count];

    if (v80)
    {
      long long v81 = [v96 searchEntities];
      long long v82 = [v81 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        long long v84 = [v96 searchEntities];
        long long v85 = [v84 firstObject];
        uint64_t v86 = [v85 preferredBundleIDs];
        preferredBundleIDs = v9->_preferredBundleIDs;
        v9->_preferredBundleIDs = (NSArray *)v86;

        v9->_enforcePreferredBundleIDs = 1;
      }
    }

    id v7 = v93;
    id v6 = v94;
  }

  return v9;
}

- (void)updateResultsWithContactHeader
{
  id v11 = [(SPQueryTask *)self previousQueryContext];
  uint64_t v3 = [(id)objc_opt_class() contactEntityFromQueryContext:v11];
  uint64_t v4 = [(SPQueryTask *)self query];
  uint64_t v5 = [v4 queryContext];

  id v6 = [(id)objc_opt_class() contactEntityFromQueryContext:v5];
  if (updateResultsWithContactHeader_onceToken != -1) {
    dispatch_once(&updateResultsWithContactHeader_onceToken, &__block_literal_global_477);
  }
  if (updateResultsWithContactHeader_isPeopleViewService
    || v6 && (!v3 || ([v6 hasSameContactAsContactEntity:v3] & 1) == 0))
  {
    id v7 = objc_alloc(MEMORY[0x263F674A8]);
    uint64_t v8 = (void *)[v7 initWithSections:MEMORY[0x263EFFA68]];
    id v9 = [(SPQueryTask *)self query];
    LODWORD(v10) = 0;
    -[SPFederatedQueryTask searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:](self, "searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", v9, v8, 1, 1, 0, 0, 0.0, v10, 0, 0, 0);
  }
}

void __54__SPFederatedQueryTask_updateResultsWithContactHeader__block_invoke()
{
  id v1 = [MEMORY[0x263F08AB0] processInfo];
  id v0 = [v1 processName];
  updateResultsWithContactHeader_isPeopleViewService = [v0 isEqualToString:@"PeopleViewService"];
}

- (void)_updateQueryContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 queryIdent];
  uint64_t v5 = [v3 queryContext];
  [v5 setQueryIdent:v4];

  uint64_t v6 = [v3 promoteLocalResults];
  id v7 = [v3 queryContext];
  [v7 setPromoteLocalResults:v6];

  uint64_t v8 = [v3 promoteParsecResults];
  id v9 = [v3 queryContext];
  [v9 setPromoteParsecResults:v8];

  uint64_t v10 = [v3 disabledBundles];
  id v11 = [v3 queryContext];
  [v11 setDisabledBundles:v10];

  uint64_t v12 = [v3 disabledApps];
  uint64_t v13 = [v3 queryContext];
  [v13 setDisabledApps:v12];

  uint64_t v14 = [v3 internalValidation];
  long long v15 = [v3 queryContext];
  [v15 setInternalValidation:v14];

  [v3 currentTime];
  double v17 = v16;
  id v18 = [v3 queryContext];

  [v18 setCurrentTime:v17];
}

- (void)start
{
  __assert_rtn("-[SPFederatedQueryTask start]", "SPFederatedQueryTask.m", 3869, "self.started == NO");
}

void __29__SPFederatedQueryTask_start__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 40));
  if ([*(id *)(a1 + 32) started]) {
    __29__SPFederatedQueryTask_start__block_invoke_cold_1();
  }
  id v3 = SPLogForSPLogCategoryQuery();
  os_log_type_t v4 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = [*(id *)(a1 + 32) query];
    uint64_t v6 = [v5 queryContext];
    id v7 = [v6 searchString];
    int v15 = 138412290;
    double v16 = v7;
    _os_log_impl(&dword_235D0B000, v3, v4, "Started search on %@", (uint8_t *)&v15, 0xCu);
  }
  [*(id *)(a1 + 32) setStarted:1];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  [*(id *)(a1 + 32) setMutableSections:v8];

  id v9 = objc_alloc(MEMORY[0x263F67808]);
  uint64_t v10 = [*(id *)(a1 + 32) query];
  id v11 = objc_msgSend(v9, "initWithEvent:timeInterval:queryId:", @"com.apple.searchd.frontend.query.start", 0, objc_msgSend(v10, "queryIdent"));

  [*(id *)(a1 + 32) activate];
  [*(id *)(a1 + 32) addAndStartQuery];
  [*(id *)(a1 + 32) updateResultsWithContactHeader];
  if (WeakRetained)
  {
    uint64_t v12 = SPLogForSPLogCategoryTelemetry();
    uint64_t v13 = v12;
    os_signpost_id_t v14 = WeakRetained[48];
    if (v14 && os_signpost_enabled(v12))
    {
      LOWORD(v15) = 0;
      _os_signpost_emit_with_name_impl(&dword_235D0B000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v14, "queryUI", " enableTelemetry=YES ", (uint8_t *)&v15, 2u);
    }

    kdebug_trace();
  }
}

- (void)activate
{
  if (self->_active)
  {
    id v2 = SPLogForSPLogCategoryDefault();
    os_log_type_t v3 = *MEMORY[0x263F67548] ^ 1;
    if (os_log_type_enabled(v2, v3))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_235D0B000, v2, v3, "already active, ignoring", v5, 2u);
    }
  }
  else
  {
    self->_active = 1;
    os_log_type_t v4 = (void *)MEMORY[0x263F78D58];
    [v4 preheat];
  }
}

- (void)clear
{
  locatiouint64_t n = 0;
  objc_initWeak(&location, self);
  os_log_type_t v3 = [(SPQueryTask *)self queryProcessor];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __29__SPFederatedQueryTask_clear__block_invoke;
  v5[3] = &unk_264C76AE0;
  objc_copyWeak(&v6, &location);
  dispatch_block_t v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v5);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __29__SPFederatedQueryTask_clear__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = WeakRetained[80];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "activate", (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [MEMORY[0x263F78D58] preheat];
  }
}

- (void)cancel
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F02A98] sharedInstance];
  [v3 logWithBundleID:@"com.apple.SpotlightUI" indexOperation:4 itemCount:1 reason:@"UserInput"];

  uint64_t v4 = [(SPQueryTask *)self query];
  [v4 cancel];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(SPFederatedQueryTask *)self queries];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) cancel];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(SPFederatedQueryTask *)self activate];
}

+ (void)activate
{
  sPrepareCacheForSearchContinuationStarted = 1;
  id v3 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SPFederatedQueryTask_activate__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);

  MEMORY[0x237DF3590]();
  +[SPCSSearchQuery activate];
  +[SPDictionaryQuery activate];
}

uint64_t __32__SPFederatedQueryTask_activate__block_invoke()
{
  id v0 = [MEMORY[0x263F78D00] sharedResourcesManager];
  [v0 loadAllParametersForClient:@"Spotlight"];

  if (!sSRResources)
  {
    id v1 = [MEMORY[0x263F78D00] sharedResourcesManager];
    uint64_t v2 = [v1 resourcesForClient:@"Spotlight" options:&unk_26E9312A0];
    id v3 = (void *)sSRResources;
    sSRResources = v2;

    SSDefaultsSetResources();
  }
  [MEMORY[0x263F78E28] reloadRankingParametersFromTrial];
  [MEMORY[0x263F78D58] preheat];
  uint64_t v4 = [MEMORY[0x263F78D30] sharedModelManager];
  [v4 activate];

  uint64_t v5 = objc_opt_class();
  return [v5 prepareCacheForSearchContinuation];
}

+ (void)deactivate
{
  uint64_t v2 = dispatch_get_global_queue(25, 0);
  dispatch_async(v2, &__block_literal_global_507);

  MEMORY[0x237DF3580]();
  +[SPCSSearchQuery deactivate];
  +[SPDictionaryQuery deactivate];
}

uint64_t __34__SPFederatedQueryTask_deactivate__block_invoke()
{
  id v0 = [MEMORY[0x263F78D00] sharedResourcesManager];
  [v0 loadAllParametersForClient:@"Spotlight"];

  if (!sSRResources)
  {
    id v1 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __34__SPFederatedQueryTask_deactivate__block_invoke_cold_1(v1);
    }

    uint64_t v2 = [MEMORY[0x263F78D00] sharedResourcesManager];
    uint64_t v3 = [v2 resourcesForClient:@"Spotlight" options:&unk_26E9312C8];
    uint64_t v4 = (void *)sSRResources;
    sSRResources = v3;

    SSDefaultsSetResources();
  }
  [MEMORY[0x263F78E28] reloadRankingParametersFromTrial];
  [MEMORY[0x263F78E28] deactivate];
  uint64_t v5 = [MEMORY[0x263F78D30] sharedModelManager];
  [v5 deactivate];

  uint64_t v6 = [MEMORY[0x263F78D30] sharedModelManager];
  [v6 triggerUpdate];

  return MDPurgeTokenizers();
}

- (id)searchString
{
  uint64_t v2 = [(SPQueryTask *)self query];
  uint64_t v3 = [v2 queryContext];
  uint64_t v4 = [v3 searchString];

  return v4;
}

- (void)mergeSections
{
  uint64_t v4 = self;
  uint64_t v207 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(SPQueryTask *)self queryProcessor];
  dispatch_assert_queue_V2(v5);

  id v161 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  char v151 = v4;
  uint64_t v7 = [(SPQueryTask *)v4 mutableSections];
  uint64_t v8 = [v7 firstObject];

  uint64_t v9 = [v8 bundleIdentifier];
  LOBYTE(v4) = [v9 isEqualToString:@"com.apple.spotlight.tophits"];

  if ((v4 & 1) == 0)
  {

    uint64_t v8 = 0;
  }
  int v152 = v8;
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  long long v10 = [v151 mutableSections];
  long long v11 = (void *)[v10 copy];

  id obj = v11;
  uint64_t v163 = [v11 countByEnumeratingWithState:&v193 objects:v206 count:16];
  if (v163)
  {
    uint64_t v162 = *(void *)v194;
    uint64_t v171 = *MEMORY[0x263F78FF0];
    uint64_t v170 = *MEMORY[0x263F78E88];
    id v153 = v6;
    uint64_t v154 = *MEMORY[0x263F78FD8];
    do
    {
      for (uint64_t i = 0; i != v163; ++i)
      {
        if (*(void *)v194 != v162) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v193 + 1) + 8 * i);
        if (![v13 resultsCount]) {
          continue;
        }
        os_signpost_id_t v14 = [v13 title];
        uint64_t v164 = i;
        if (v14)
        {
          uint64_t v15 = v13;
          double v16 = [v13 title];
          uint64_t v17 = [v16 uppercaseString];
        }
        else
        {
          double v16 = [v13 bundleIdentifier];
          if (!v16)
          {
            id v19 = 0;
            goto LABEL_14;
          }
          uint64_t v15 = v13;
          uint64_t v17 = [v13 bundleIdentifier];
        }
        id v18 = (void *)v17;
        id v19 = [v161 objectForKey:v17];

        long long v13 = v15;
LABEL_14:

        if (([v19 doNotFold] & 1) != 0 || objc_msgSend(v13, "doNotFold"))
        {

LABEL_17:
          [v6 addObject:v13];
          uint64_t v20 = [v13 title];

          if (v20)
          {
            [v13 title];
            NSUInteger v22 = v21 = v13;
            uint64_t v23 = [v22 uppercaseString];
            [v161 setObject:v21 forKey:v23];

            uint64_t i = v164;
            goto LABEL_142;
          }
          uint64_t v24 = [v13 bundleIdentifier];

          uint64_t i = v164;
          if (v24)
          {
            uint64_t v25 = [v13 bundleIdentifier];
            long long v26 = v13;
            NSUInteger v22 = (void *)v25;
            [v161 setObject:v26 forKey:v25];
            goto LABEL_142;
          }
          continue;
        }
        if (!v19) {
          goto LABEL_17;
        }
        id v27 = v19;
        uint64_t v28 = [v6 indexOfObject:v27];
        uint64_t v169 = v27;
        if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_141;
        }
        uint64_t v29 = v28;
        unint64_t v30 = [v13 maxInitiallyVisibleResults];
        if (v30 <= [v27 maxInitiallyVisibleResults]) {
          uint64_t v31 = v27;
        }
        else {
          uint64_t v31 = v13;
        }
        objc_msgSend(v27, "setMaxInitiallyVisibleResults:", objc_msgSend(v31, "maxInitiallyVisibleResults"));
        v157 = v13;
        objc_msgSend(v13, "setMaxInitiallyVisibleResults:", objc_msgSend(v27, "maxInitiallyVisibleResults"));
        [v6 replaceObjectAtIndex:v29 withObject:v27];
        id v172 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        uint64_t v32 = [v27 resultSet];
        [v32 objectAtIndexedSubscript:0];
        v34 = long long v33 = v27;
        id v35 = [v34 sectionBundleIdentifier];
        dispatch_semaphore_t v36 = v35;
        uint64_t v37 = v154;
        if (v35)
        {
          id v156 = v35;
        }
        else
        {
          uint64_t v38 = [v33 resultSet];
          uint64_t v39 = [v38 objectAtIndexedSubscript:0];
          id v156 = [v39 applicationBundleIdentifier];
        }
        uint64_t v40 = [v157 resultSet];
        long long v41 = [v40 objectAtIndexedSubscript:0];
        uint64_t v42 = [v41 sectionBundleIdentifier];
        uint64_t v43 = v42;
        if (v42)
        {
          id v155 = v42;
        }
        else
        {
          uint64_t v44 = [v157 resultSet];
          uint64_t v45 = [v44 objectAtIndexedSubscript:0];
          id v155 = [v45 applicationBundleIdentifier];
        }
        if (([v156 isEqualToString:@"com.apple.Maps"] & 1) != 0
          || [v155 isEqualToString:@"com.apple.Maps"])
        {
          os_log_type_t v46 = v157;
          if ([v156 isEqualToString:@"com.apple.Maps"])
          {
            double v47 = [v169 results];
            id v48 = (id)[v47 copy];

            [v169 clearResults];
            long long v49 = [v157 results];

            if (v49)
            {
              char v50 = [v157 results];
              [v169 addResultsFromArray:v50];
            }
            [v157 clearResults];
            if (v48) {
              [v157 addResultsFromArray:v48];
            }
            uint64_t v51 = [v157 domain];
            objc_msgSend(v157, "setDomain:", objc_msgSend(v169, "domain"));
            [v169 setDomain:v51];
            uint64_t v52 = [v157 title];
            long long v53 = [v169 title];
            [v157 setTitle:v53];

            uint64_t v54 = (void *)v52;
            [v169 setTitle:v52];
LABEL_77:
          }
          goto LABEL_78;
        }
        if ([v169 domain] != 2)
        {
          char v55 = [v169 resultSet];
          uint64_t v56 = [v55 objectAtIndexedSubscript:0];
          int v57 = [v56 applicationBundleIdentifier];
          double v58 = v57;
          if (v57)
          {
            id v48 = v57;
          }
          else
          {
            double v59 = [v169 resultSet];
            double v60 = [v59 objectAtIndexedSubscript:0];
            id v48 = [v60 sectionBundleIdentifier];
          }
          int v61 = [v157 resultSet];
          uint64_t v62 = [v61 objectAtIndexedSubscript:0];
          id v63 = [v62 applicationBundleIdentifier];
          char v64 = v63;
          if (v63)
          {
            id v160 = v63;
          }
          else
          {
            uint64_t v65 = [v157 resultSet];
            os_log_type_t v66 = [v65 objectAtIndexedSubscript:0];
            id v160 = [v66 sectionBundleIdentifier];
          }
          qos_class_t v67 = [v157 title];
          uint64_t v165 = [v67 uppercaseString];

          long long v191 = 0u;
          long long v192 = 0u;
          long long v189 = 0u;
          long long v190 = 0u;
          id v167 = [v152 resultSet];
          uint64_t v68 = [v167 countByEnumeratingWithState:&v189 objects:v205 count:16];
          if (!v68)
          {
            uint64_t v54 = v160;
            goto LABEL_76;
          }
          uint64_t v69 = v68;
          uint64_t v70 = *(void *)v190;
          id v159 = v48;
          uint64_t v54 = v160;
          while (1)
          {
            for (uint64_t j = 0; j != v69; ++j)
            {
              if (*(void *)v190 != v70) {
                objc_enumerationMutation(v167);
              }
              double v72 = *(void **)(*((void *)&v189 + 1) + 8 * j);
              double v73 = [v72 title];
              if (!v73) {
                goto LABEL_72;
              }
              if (v48)
              {
                uint64_t v3 = [v72 resultBundleId];
                if ([v3 isEqualToString:v48]) {
                  goto LABEL_60;
                }
              }
              if (v54)
              {
                uint64_t v2 = [v72 resultBundleId];
                if ([v2 isEqualToString:v54])
                {

                  if (v48) {
LABEL_60:
                  }

LABEL_71:
                  [v172 addObject:v73];
                  goto LABEL_72;
                }
                if (!v165)
                {
                  char v74 = 0;
LABEL_67:

                  goto LABEL_68;
                }
              }
              else if (!v165)
              {
                char v74 = 0;
                goto LABEL_68;
              }
              double v75 = v2;
              uint64_t v76 = v3;
              double v77 = [v72 sectionHeader];
              id v78 = [v77 uppercaseString];
              char v74 = [v78 isEqual:v165];

              uint64_t v3 = v76;
              uint64_t v2 = v75;
              id v48 = v159;
              uint64_t v54 = v160;
              if (v160) {
                goto LABEL_67;
              }
LABEL_68:
              if (v48) {

              }
              if (v74) {
                goto LABEL_71;
              }
LABEL_72:
            }
            uint64_t v69 = [v167 countByEnumeratingWithState:&v189 objects:v205 count:16];
            if (!v69)
            {
LABEL_76:

              os_log_type_t v46 = v157;
              goto LABEL_77;
            }
          }
        }
        os_log_type_t v46 = v157;
LABEL_78:
        id v168 = v3;
        BOOL v79 = [v46 bundleIdentifier];
        int v80 = [v79 isEqualToString:*MEMORY[0x263F67500]];

        if (v80)
        {
          uint64_t v166 = v2;
          long long v81 = objc_opt_new();
          long long v185 = 0u;
          long long v186 = 0u;
          long long v187 = 0u;
          long long v188 = 0u;
          long long v82 = [v169 resultSet];
          uint64_t v83 = [v82 countByEnumeratingWithState:&v185 objects:v204 count:16];
          if (v83)
          {
            uint64_t v84 = v83;
            uint64_t v85 = *(void *)v186;
            do
            {
              for (uint64_t k = 0; k != v84; ++k)
              {
                if (*(void *)v186 != v85) {
                  objc_enumerationMutation(v82);
                }
                long long v87 = *(void **)(*((void *)&v185 + 1) + 8 * k);
                uint64_t v88 = [v87 resultBundleId];
                if (v88)
                {
                  uint64_t v89 = (void *)v88;
                  uint64_t v90 = [v87 completion];

                  if (v90)
                  {
                    long long v91 = [v87 resultBundleId];
                    v203[0] = v91;
                    NSUInteger v92 = [v87 completion];
                    v203[1] = v92;
                    id v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:v203 count:2];

                    [v81 setObject:v87 forKeyedSubscript:v93];
                  }
                }
              }
              uint64_t v84 = [v82 countByEnumeratingWithState:&v185 objects:v204 count:16];
            }
            while (v84);
          }

          long long v183 = 0u;
          long long v184 = 0u;
          long long v181 = 0u;
          long long v182 = 0u;
          id v94 = [v157 resultSet];
          uint64_t v95 = [v94 countByEnumeratingWithState:&v181 objects:v202 count:16];
          if (v95)
          {
            uint64_t v96 = v95;
            uint64_t v97 = *(void *)v182;
            do
            {
              for (uint64_t m = 0; m != v96; ++m)
              {
                if (*(void *)v182 != v97) {
                  objc_enumerationMutation(v94);
                }
                long long v99 = *(void **)(*((void *)&v181 + 1) + 8 * m);
                uint64_t v100 = [v99 resultBundleId];
                if (v100)
                {
                  uint64_t v101 = (void *)v100;
                  uint64_t v102 = [v99 completion];

                  if (v102)
                  {
                    uint64_t v103 = [v99 resultBundleId];
                    v201[0] = v103;
                    BOOL v104 = [v99 completion];
                    v201[1] = v104;
                    __int16 v105 = [MEMORY[0x263EFF8C0] arrayWithObjects:v201 count:2];
                    long long v106 = [v81 objectForKeyedSubscript:v105];

                    if (!v106) {
                      [v169 addResults:v99];
                    }
                  }
                }
              }
              uint64_t v96 = [v94 countByEnumeratingWithState:&v181 objects:v202 count:16];
            }
            while (v96);
          }

          uint64_t v37 = v154;
          uint64_t v2 = v166;
        }
        long long v179 = 0u;
        long long v180 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        uint64_t v107 = [v169 resultSet];
        uint64_t v108 = [v107 countByEnumeratingWithState:&v177 objects:v200 count:16];
        if (v108)
        {
          uint64_t v109 = v108;
          uint64_t v110 = *(void *)v178;
          do
          {
            uint64_t v111 = 0;
            do
            {
              if (*(void *)v178 != v110) {
                objc_enumerationMutation(v107);
              }
              long long v112 = *(void **)(*((void *)&v177 + 1) + 8 * v111);
              long long v113 = [v112 resultBundleId];
              int v114 = [v113 isEqualToString:v37];

              if (v114)
              {
                uint64_t v115 = [v112 contentURL];
              }
              else
              {
                long long v116 = [v112 resultBundleId];
                int v117 = [v116 isEqualToString:v171];

                if (v117
                  || ([v112 contentType],
                      uint64_t v118 = objc_claimAutoreleasedReturnValue(),
                      int v119 = [v118 isEqualToString:v170],
                      v118,
                      v119))
                {
                  uint64_t v115 = [v112 identifier];
                }
                else
                {
                  uint64_t v121 = [v112 title];
                  if (!v121) {
                    goto LABEL_114;
                  }
                  v122 = (void *)v121;
                  id v123 = [v112 title];
                  uint64_t v124 = [v123 text];

                  if (!v124) {
                    goto LABEL_114;
                  }
                  uint64_t v115 = [v112 title];
                }
              }
              BOOL v120 = (void *)v115;
              if (v115)
              {
                [v172 addObject:v115];
              }
LABEL_114:
              ++v111;
            }
            while (v109 != v111);
            uint64_t v125 = [v107 countByEnumeratingWithState:&v177 objects:v200 count:16];
            uint64_t v109 = v125;
          }
          while (v125);
        }

        long long v175 = 0u;
        long long v176 = 0u;
        long long v173 = 0u;
        long long v174 = 0u;
        int v126 = [v157 resultSet];
        uint64_t v127 = [v126 countByEnumeratingWithState:&v173 objects:v199 count:16];
        if (!v127) {
          goto LABEL_140;
        }
        uint64_t v128 = v127;
        uint64_t v129 = *(void *)v174;
        do
        {
          uint64_t v130 = 0;
          do
          {
            if (*(void *)v174 != v129) {
              objc_enumerationMutation(v126);
            }
            int v131 = *(void **)(*((void *)&v173 + 1) + 8 * v130);
            uint64_t v132 = [v131 resultBundleId];
            int v133 = [v132 isEqualToString:v37];

            if (v133)
            {
              uint64_t v134 = [v131 contentURL];
            }
            else
            {
              double v135 = [v131 resultBundleId];
              int v136 = [v135 isEqualToString:v171];

              if (v136
                || ([v131 contentType],
                    BOOL v137 = objc_claimAutoreleasedReturnValue(),
                    int v138 = [v137 isEqualToString:v170],
                    v137,
                    v138))
              {
                uint64_t v134 = [v131 identifier];
              }
              else
              {
                uint64_t v139 = [v131 title];
                if (!v139) {
                  goto LABEL_133;
                }
                uint64_t v140 = [v131 title];
                uint64_t v141 = [v140 text];

                if (!v141)
                {
                  uint64_t v139 = 0;
                  goto LABEL_133;
                }
                uint64_t v134 = [v131 title];
              }
            }
            uint64_t v139 = (void *)v134;
            if (v134 && ([v172 containsObject:v134] & 1) == 0) {
              [v169 addResults:v131];
            }
LABEL_133:

            ++v130;
          }
          while (v128 != v130);
          uint64_t v142 = [v126 countByEnumeratingWithState:&v173 objects:v199 count:16];
          uint64_t v128 = v142;
        }
        while (v142);
LABEL_140:

        id v6 = v153;
        uint64_t v3 = v168;
LABEL_141:
        uint64_t i = v164;
        NSUInteger v22 = v169;

LABEL_142:
      }
      uint64_t v163 = [obj countByEnumeratingWithState:&v193 objects:v206 count:16];
    }
    while (v163);
  }

  if (_os_feature_enabled_impl() && [v6 count]) {
    [v151 relatedContentSectionMerging:v6];
  }
  uint64_t v143 = [v6 count];
  [v151 setMutableSections:v6];
  uint64_t v144 = SPLogForSPLogCategoryDefault();
  os_log_type_t v145 = *MEMORY[0x263F67548] ^ 1;
  BOOL v146 = os_log_type_enabled(v144, v145);
  if (v143)
  {
    if (v146)
    {
      *(_DWORD *)buf = 138412290;
      id v198 = v6;
      os_log_type_t v147 = v145;
      os_log_type_t v148 = "Merge sections %@";
      id v149 = v144;
      uint32_t v150 = 12;
LABEL_153:
      _os_log_impl(&dword_235D0B000, v149, v147, v148, buf, v150);
    }
  }
  else if (v146)
  {
    *(_WORD *)buf = 0;
    os_log_type_t v147 = v145;
    os_log_type_t v148 = "Empty after updates";
    id v149 = v144;
    uint32_t v150 = 2;
    goto LABEL_153;
  }
}

- (void)relatedContentSectionMerging:(id)a3
{
  uint64_t v4 = relatedContentSectionMerging__onceToken;
  id v5 = a3;
  id v7 = v5;
  if (v4 == -1)
  {
    id v6 = v5;
  }
  else
  {
    dispatch_once(&relatedContentSectionMerging__onceToken, &__block_literal_global_514);
    id v6 = v7;
  }
  [(SPFederatedQueryTask *)self mergeRelatedContentFromSections:v6 bundlesToMerge:relatedContentSectionMerging__webBundles mergedSectionId:sSectionMergingBlendedWeb];
  [(SPFederatedQueryTask *)self mergeRelatedContentFromSections:v7 bundlesToMerge:relatedContentSectionMerging__musicBundles mergedSectionId:sSectionMergingBlendedMusic];
}

void __53__SPFederatedQueryTask_relatedContentSectionMerging___block_invoke()
{
  v12[2] = *MEMORY[0x263EF8340];
  id v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F78F88];
  v12[0] = *MEMORY[0x263F78FD8];
  v12[1] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)relatedContentSectionMerging__webBundles;
  relatedContentSectionMerging__webBundles = v3;

  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = *MEMORY[0x263F78FC0];
  v11[0] = *MEMORY[0x263F78F30];
  v11[1] = v6;
  uint64_t v7 = *MEMORY[0x263F78F48];
  v11[2] = *MEMORY[0x263F78F70];
  v11[3] = v7;
  v11[4] = *MEMORY[0x263F78F58];
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:5];
  uint64_t v9 = [v5 setWithArray:v8];
  long long v10 = (void *)relatedContentSectionMerging__musicBundles;
  relatedContentSectionMerging__musicBundles = v9;
}

- (void)mergeRelatedContentFromSections:(id)a3 bundlesToMerge:(id)a4 mergedSectionId:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = [MEMORY[0x263EFF980] array];
  if ([v7 count])
  {
    unint64_t v11 = 0;
    do
    {
      long long v12 = [v7 objectAtIndexedSubscript:v11];
      long long v13 = [v12 bundleIdentifier];
      os_signpost_id_t v14 = [v12 results];
      if ([v14 count])
      {
        int v15 = [v8 containsObject:v13];

        if (v15) {
          [v10 addObject:v12];
        }
      }
      else
      {
      }
      ++v11;
    }
    while (v11 < [v7 count]);
  }
  if ([v10 count])
  {
    double v16 = [v10 objectAtIndexedSubscript:0];
    if ((unint64_t)[v10 count] >= 2)
    {
      uint64_t v42 = v16;
      id v43 = v9;
      uint64_t v17 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = v10;
        _os_log_impl(&dword_235D0B000, v17, OS_LOG_TYPE_DEFAULT, "[release2023SectionMerging] Merging sections %@", buf, 0xCu);
      }

      id v18 = [MEMORY[0x263EFF980] array];
      id v19 = [MEMORY[0x263EFF980] array];
      if ([v10 count])
      {
        unint64_t v20 = 0;
        do
        {
          uint64_t v21 = objc_msgSend(v10, "objectAtIndexedSubscript:", v20, v42);
          unint64_t v22 = [v21 maxInitiallyVisibleResults];
          if (!v22)
          {
            uint64_t v23 = [v21 results];
            unint64_t v24 = [v23 count];

            if (v24 >= 3) {
              unint64_t v22 = 3;
            }
            else {
              unint64_t v22 = v24;
            }
          }
          uint64_t v25 = [v21 results];
          unint64_t v26 = [v25 count];

          if (v22 <= v26)
          {
            id v27 = [v21 results];
            uint64_t v28 = objc_msgSend(v27, "subarrayWithRange:", 0, v22);
            [v18 addObjectsFromArray:v28];
          }
          uint64_t v29 = [v21 results];
          unint64_t v30 = [v29 count];

          if (v30 > v22)
          {
            uint64_t v31 = [v21 results];
            uint64_t v32 = [v21 results];
            long long v33 = objc_msgSend(v31, "subarrayWithRange:", v22, objc_msgSend(v32, "count") - v22);
            [v19 addObjectsFromArray:v33];
          }
          [v21 clearResults];

          ++v20;
        }
        while (v20 < [v10 count]);
      }
      double v16 = v42;
      objc_msgSend(v42, "addResultsFromArray:", v18, v42);
      [v16 addResultsFromArray:v19];
      objc_msgSend(v16, "setMaxInitiallyVisibleResults:", objc_msgSend(v18, "count"));

      id v9 = v43;
    }
    if ([v9 isEqualToString:sSectionMergingBlendedWeb])
    {
      uint64_t v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v35 = [v34 localizedStringForKey:@"DOMAIN_TITLE_BLENDED_WEB" value:&stru_26E92AFF0 table:@"SpotlightServices"];
      [v16 setTitle:v35];

      if ((unint64_t)[v10 count] >= 2)
      {
        dispatch_semaphore_t v36 = (void *)MEMORY[0x263F78FD8];
LABEL_31:
        [v16 setPreMergeBundleIdentifier:*v36];
        goto LABEL_32;
      }
    }
    else
    {
      if (![v9 isEqualToString:sSectionMergingBlendedMusic])
      {
LABEL_33:
        uint64_t v40 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          long long v41 = [v16 bundleIdentifier];
          *(_DWORD *)buf = 138412546;
          uint64_t v45 = v41;
          __int16 v46 = 2112;
          id v47 = v9;
          _os_log_impl(&dword_235D0B000, v40, OS_LOG_TYPE_DEFAULT, "[release2023SectionMerging] Section %@ becomes %@", buf, 0x16u);
        }
        [v16 setBundleIdentifier:v9];

        goto LABEL_36;
      }
      uint64_t v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v38 = [v37 localizedStringForKey:@"DOMAIN_TITLE_BLENDED_MUSIC" value:&stru_26E92AFF0 table:@"SpotlightServices"];
      [v16 setTitle:v38];

      if ((unint64_t)[v10 count] >= 2)
      {
        dispatch_semaphore_t v36 = (void *)MEMORY[0x263F78F30];
        goto LABEL_31;
      }
    }
    uint64_t v39 = [v16 bundleIdentifier];
    [v16 setPreMergeBundleIdentifier:v39];

LABEL_32:
    [v16 setMaxInitiallyVisibleResults:3];
    goto LABEL_33;
  }
LABEL_36:
}

- (void)truncateSuggestionsSectionToFit:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [(SPQueryTask *)self maxUISuggestions];
  uint64_t v6 = [v4 resultSet];
  id v7 = objc_alloc(MEMORY[0x263EFF9B0]);
  unint64_t v8 = [v4 resultsCount];
  if (v8 >= v5) {
    unint64_t v9 = v5;
  }
  else {
    unint64_t v9 = v8;
  }
  long long v10 = (void *)[v7 initWithCapacity:v9];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    os_signpost_id_t v14 = 0;
    int64_t v15 = 0;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v11);
        }
        id v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v18, "type", (void)v21) == 21)
        {
          if (v14) {
            id v19 = v14;
          }
          else {
            id v19 = v18;
          }
          id v20 = v19;

          os_signpost_id_t v14 = v20;
        }
        else if (v15 < v5)
        {
          [v10 addObject:v18];
          ++v15;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);

    if (v14)
    {
      if (v15 && v15 >= v5) {
        [v10 replaceObjectAtIndex:v15 - 1 withObject:v14];
      }
      else {
        [v10 addObject:v14];
      }
    }
  }
  else
  {

    os_signpost_id_t v14 = 0;
  }
  objc_msgSend(v4, "setResultSet:", v10, (void)v21);
}

- (void)handleOptionsForNewSections:(id)a3
{
  uint64_t v230 = *MEMORY[0x263EF8340];
  id v157 = a3;
  id v4 = SPLogForSPLogCategoryDefault();
  os_log_type_t v5 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = [MEMORY[0x263F08B88] currentThread];
    *(_DWORD *)buf = 134218240;
    id v227 = v6;
    __int16 v228 = 1024;
    int v229 = [v157 count];
    _os_log_impl(&dword_235D0B000, v4, v5, "[%p] handleOptions for sections (%d)", buf, 0x12u);
  }
  id v7 = SPLogForSPLogCategoryDefault();
  unint64_t v8 = (unsigned char *)MEMORY[0x263F67548];
  os_log_type_t v9 = *MEMORY[0x263F67548] ^ 1;
  if (os_log_type_enabled(v7, v9))
  {
    *(_DWORD *)buf = 138412290;
    id v227 = v157;
    _os_log_impl(&dword_235D0B000, v7, v9, "handleOptionsForNewSections: %@", buf, 0xCu);
  }

  if ([v157 count])
  {
    long long v10 = [(SPQueryTask *)self queryProcessor];
    dispatch_assert_queue_V2(v10);

    id v11 = SPLogForSPLogCategoryDefault();
    os_log_type_t v12 = *v8 ^ 1;
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 138412290;
      id v227 = v157;
      _os_log_impl(&dword_235D0B000, v11, v12, "handleOptionsForNewSections: %@", buf, 0xCu);
    }

    long long v178 = [MEMORY[0x263EFF9A0] dictionary];
    long long v173 = [MEMORY[0x263EFF9A0] dictionary];
    long long v176 = [MEMORY[0x263EFF9A0] dictionary];
    long long v177 = [MEMORY[0x263EFF9A0] dictionary];
    long long v175 = [MEMORY[0x263EFF9A0] dictionary];
    long long v174 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v13 = [(SPQueryTask *)self query];
    os_signpost_id_t v14 = [v13 queryContext];
    int64_t v15 = [v14 searchEntities];
    uint64_t v16 = [v15 firstObject];

    id v156 = v16;
    int v17 = [v16 isServerEntitySearch];
    long long v213 = 0u;
    long long v214 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    id v155 = self;
    id v18 = [(SPQueryTask *)self mutableSections];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v213 objects:v225 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v214;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v214 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = *(void **)(*((void *)&v213 + 1) + 8 * i);
          long long v24 = [v23 bundleIdentifier];
          int v25 = [v24 hasPrefix:@"com.apple.parsec."];

          if (v25)
          {
            uint64_t v26 = [v23 results];
            id v27 = [v26 firstObject];
            objc_msgSend(v23, "setDoNotFold:", objc_msgSend(v27, "doNotFold"));
          }
          createDedupeDicts(v23, v173, v178, v176, v177, v175, v174, v17);
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v213 objects:v225 count:16];
      }
      while (v20);
    }

    long long v211 = 0u;
    long long v212 = 0u;
    long long v209 = 0u;
    long long v210 = 0u;
    id obj = v157;
    uint64_t v28 = [obj countByEnumeratingWithState:&v209 objects:v224 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v210;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v210 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void **)(*((void *)&v209 + 1) + 8 * j);
          long long v33 = [v32 bundleIdentifier];
          int v34 = [v33 hasPrefix:@"com.apple.parsec."];

          if (v34)
          {
            id v35 = [v32 results];
            dispatch_semaphore_t v36 = [v35 firstObject];
            objc_msgSend(v32, "setDoNotFold:", objc_msgSend(v36, "doNotFold"));
          }
          createDedupeDicts(v32, v173, v178, v176, v177, v175, v174, v17);
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v209 objects:v224 count:16];
      }
      while (v29);
    }

    uint64_t v37 = [obj count];
    if (v37)
    {
      uint64_t v38 = v37;
      id v169 = (id)*MEMORY[0x263F79000];
      uint64_t v167 = *MEMORY[0x263F79020];
      uint64_t v154 = *MEMORY[0x263F78E88];
      uint64_t v171 = *MEMORY[0x263F78EB0];
      uint64_t v165 = *MEMORY[0x263F78F80];
      uint64_t v39 = *MEMORY[0x263F78F78];
      while (1)
      {
        uint64_t v40 = objc_msgSend(obj, "objectAtIndex:", --v38, v154);
        long long v41 = [v40 bundleIdentifier];
        int v42 = [v41 hasPrefix:@"com.apple.parsec."];

        if (v42)
        {
          id v43 = [v40 results];
          uint64_t v44 = [v43 count];

          if (!v44) {
            goto LABEL_78;
          }
          uint64_t v158 = v38;
          uint64_t v45 = [v40 results];
          __int16 v46 = (void *)[v45 copy];

          [v40 clearResults];
          long long v207 = 0u;
          long long v208 = 0u;
          long long v205 = 0u;
          long long v206 = 0u;
          id v47 = v46;
          uint64_t v48 = [v47 countByEnumeratingWithState:&v205 objects:v223 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v206;
            do
            {
              for (uint64_t k = 0; k != v49; ++k)
              {
                if (*(void *)v206 != v50) {
                  objc_enumerationMutation(v47);
                }
                uint64_t v52 = *(void **)(*((void *)&v205 + 1) + 8 * k);
                long long v53 = [v40 bundleIdentifier];
                int v54 = [v53 hasPrefix:@"com.apple.parsec."];

                if (!v54) {
                  goto LABEL_41;
                }
                uint64_t v55 = [v52 storeIdentifier];
                if (v55)
                {
                  uint64_t v56 = (void *)v55;
                  int v57 = [v52 storeIdentifier];
                  double v58 = [v178 objectForKey:v57];

                  if (v58) {
                    goto LABEL_40;
                  }
                }
                uint64_t v59 = [v52 calendarIdentifier];
                if (!v59) {
                  goto LABEL_41;
                }
                double v60 = (void *)v59;
                int v61 = [v52 calendarIdentifier];
                double v58 = [v176 objectForKey:v61];

                if (v58)
                {
LABEL_40:
                  handleHiddenResult();
                }
                else
                {
LABEL_41:
                  [v40 addResults:v52];
                }
              }
              uint64_t v49 = [v47 countByEnumeratingWithState:&v205 objects:v223 count:16];
            }
            while (v49);
          }
          uint64_t v38 = v158;
          goto LABEL_77;
        }
        uint64_t v62 = [v40 bundleIdentifier];
        int v63 = [v62 isEqualToString:@"com.apple.dictionary"];

        if (v63)
        {
          char v64 = [v40 results];
          uint64_t v65 = [v64 count];

          if (!v65) {
            goto LABEL_78;
          }
          os_log_type_t v66 = [v40 results];
          qos_class_t v67 = (void *)[v66 copy];

          [v40 clearResults];
          long long v203 = 0u;
          long long v204 = 0u;
          long long v201 = 0u;
          long long v202 = 0u;
          id v47 = v67;
          uint64_t v68 = [v47 countByEnumeratingWithState:&v201 objects:v222 count:16];
          if (v68)
          {
            uint64_t v69 = v68;
            uint64_t v70 = v38;
            uint64_t v71 = *(void *)v202;
            do
            {
              for (uint64_t m = 0; m != v69; ++m)
              {
                if (*(void *)v202 != v71) {
                  objc_enumerationMutation(v47);
                }
                double v73 = *(void **)(*((void *)&v201 + 1) + 8 * m);
                char v74 = [v73 identifier];
                if (!v74
                  || ([v177 objectForKey:v74],
                      double v75 = objc_claimAutoreleasedReturnValue(),
                      v75,
                      !v75))
                {
                  [v40 addResults:v73];
                }
              }
              uint64_t v69 = [v47 countByEnumeratingWithState:&v201 objects:v222 count:16];
            }
            while (v69);
            goto LABEL_76;
          }
          goto LABEL_77;
        }
        uint64_t v76 = [v40 bundleIdentifier];
        if ([v76 isEqualToString:v169]) {
          break;
        }
        double v77 = [v40 bundleIdentifier];
        int v78 = [v77 isEqualToString:v167];

        if (v78) {
          goto LABEL_61;
        }
        uint64_t v96 = [v40 bundleIdentifier];
        int v97 = [v96 isEqualToString:*MEMORY[0x263F67500]];

        if (v97)
        {
          uint64_t v159 = v38;
          id v161 = objc_alloc_init(MEMORY[0x263F089C8]);
          long long v193 = 0u;
          long long v194 = 0u;
          long long v195 = 0u;
          long long v196 = 0u;
          long long v98 = [v40 results];
          uint64_t v99 = [v98 countByEnumeratingWithState:&v193 objects:v220 count:16];
          if (v99)
          {
            uint64_t v100 = v99;
            uint64_t v101 = 0;
            uint64_t v102 = *(void *)v194;
            do
            {
              for (uint64_t n = 0; n != v100; ++n)
              {
                if (*(void *)v194 != v102) {
                  objc_enumerationMutation(v98);
                }
                BOOL v104 = *(void **)(*((void *)&v193 + 1) + 8 * n);
                __int16 v105 = [v104 identifier];
                int v106 = [v105 hasPrefix:v171];

                if (v106)
                {
                  uint64_t v107 = [v104 sectionBundleIdentifier];
                  char v108 = [v107 isEqualToString:v169];

                  uint64_t v109 = v39;
                  if ((v108 & 1) != 0
                    || (objc_msgSend(v104, "sectionBundleIdentifier", v39),
                        uint64_t v110 = objc_claimAutoreleasedReturnValue(),
                        int v111 = [v110 isEqualToString:v167],
                        v110,
                        uint64_t v109 = v165,
                        v111))
                  {
                    uint64_t v112 = [v175 objectForKey:v109];
                    if (v112)
                    {
                      long long v113 = (void *)v112;
                      handleHiddenResult();
                      [v161 addIndex:v101 + n];
                    }
                  }
                }
              }
              uint64_t v100 = [v98 countByEnumeratingWithState:&v193 objects:v220 count:16];
              v101 += n;
            }
            while (v100);
          }

          int v114 = [v40 resultSet];
          [v114 removeObjectsAtIndexes:v161];

          [(SPFederatedQueryTask *)v155 truncateSuggestionsSectionToFit:v40];
          uint64_t v38 = v159;
          goto LABEL_80;
        }
        uint64_t v115 = [v40 bundleIdentifier];
        int v116 = [v115 isEqualToString:v154];

        if (v116)
        {
          int v117 = [v40 results];
          uint64_t v118 = [v117 count];

          if (v118)
          {
            int v119 = [v40 results];
            BOOL v120 = (void *)[v119 copy];

            [v40 clearResults];
            long long v191 = 0u;
            long long v192 = 0u;
            long long v189 = 0u;
            long long v190 = 0u;
            id v47 = v120;
            uint64_t v121 = [v47 countByEnumeratingWithState:&v189 objects:v219 count:16];
            if (v121)
            {
              uint64_t v122 = v121;
              uint64_t v70 = v38;
              uint64_t v123 = *(void *)v190;
              do
              {
                for (iuint64_t i = 0; ii != v122; ++ii)
                {
                  if (*(void *)v190 != v123) {
                    objc_enumerationMutation(v47);
                  }
                  uint64_t v125 = *(void **)(*((void *)&v189 + 1) + 8 * ii);
                  int v126 = [v125 applicationBundleIdentifier];
                  uint64_t v127 = [v174 objectForKey:v126];
                  uint64_t v128 = (void *)v127;
                  if (v126) {
                    BOOL v129 = v127 == 0;
                  }
                  else {
                    BOOL v129 = 1;
                  }
                  if (v129) {
                    [v40 addResults:v125];
                  }
                  else {
                    handleHiddenResult();
                  }
                }
                uint64_t v122 = [v47 countByEnumeratingWithState:&v189 objects:v219 count:16];
              }
              while (v122);
              goto LABEL_76;
            }
LABEL_77:
          }
        }
LABEL_78:
        if (![v40 resultsCount]) {
          [obj removeObjectAtIndex:v38];
        }
LABEL_80:

        if (!v38) {
          goto LABEL_112;
        }
      }

LABEL_61:
      BOOL v79 = [v40 results];
      uint64_t v80 = [v79 count];

      if (!v80) {
        goto LABEL_78;
      }
      uint64_t v70 = v38;
      long long v81 = [v40 results];
      long long v82 = (void *)[v81 copy];

      [v40 clearResults];
      long long v199 = 0u;
      long long v200 = 0u;
      long long v197 = 0u;
      long long v198 = 0u;
      id v47 = v82;
      uint64_t v83 = [v47 countByEnumeratingWithState:&v197 objects:v221 count:16];
      if (v83)
      {
        uint64_t v84 = v83;
        uint64_t v85 = *(void *)v198;
        do
        {
          for (juint64_t j = 0; jj != v84; ++jj)
          {
            if (*(void *)v198 != v85) {
              objc_enumerationMutation(v47);
            }
            long long v87 = *(void **)(*((void *)&v197 + 1) + 8 * jj);
            uint64_t v88 = [v87 identifier];
            int v89 = [v88 hasPrefix:v171];

            if (v89)
            {
              uint64_t v90 = [v87 sectionBundleIdentifier];
              char v91 = [v90 isEqualToString:v169];

              uint64_t v92 = v39;
              if ((v91 & 1) == 0
                && (objc_msgSend(v87, "sectionBundleIdentifier", v39),
                    id v93 = objc_claimAutoreleasedReturnValue(),
                    int v94 = [v93 isEqualToString:v167],
                    v93,
                    uint64_t v92 = v165,
                    !v94)
                || ([v175 objectForKey:v92], (uint64_t v95 = objc_claimAutoreleasedReturnValue()) == 0))
              {
                [v40 addResults:v87];
                uint64_t v95 = 0;
              }
            }
            else
            {
              [v40 addResults:v87];
            }
          }
          uint64_t v84 = [v47 countByEnumeratingWithState:&v197 objects:v221 count:16];
        }
        while (v84);
      }
LABEL_76:
      uint64_t v38 = v70;
      goto LABEL_77;
    }
LABEL_112:
    [v178 removeAllObjects];
    [v173 removeAllObjects];
    [v176 removeAllObjects];
    [v177 removeAllObjects];
    [v175 removeAllObjects];
    [v174 removeAllObjects];
    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    id v162 = obj;
    uint64_t v166 = [v162 countByEnumeratingWithState:&v185 objects:v218 count:16];
    if (!v166) {
      goto LABEL_146;
    }
    id obja = *(id *)v186;
    uint64_t v160 = *MEMORY[0x263F674E0];
LABEL_114:
    uint64_t v130 = 0;
    while (1)
    {
      if (*(id *)v186 != obja) {
        objc_enumerationMutation(v162);
      }
      int v131 = *(void **)(*((void *)&v185 + 1) + 8 * v130);
      uint64_t v132 = [v131 bundleIdentifier];
      if ([v132 isEqualToString:@"com.apple.spotlight.tophits"]) {
        goto LABEL_120;
      }
      int v133 = [v131 bundleIdentifier];
      if ([v133 isEqualToString:v160]) {
        break;
      }
      char v151 = [v131 bundleIdentifier];
      char v152 = [v151 isEqualToString:*MEMORY[0x263F67500]];

      if (v152) {
        goto LABEL_121;
      }
LABEL_141:
      if (++v130 == v166)
      {
        uint64_t v153 = [v162 countByEnumeratingWithState:&v185 objects:v218 count:16];
        uint64_t v166 = v153;
        if (!v153)
        {
LABEL_146:

          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __52__SPFederatedQueryTask_handleOptionsForNewSections___block_invoke;
          block[3] = &unk_264C76B08;
          id v180 = v162;
          dispatch_sync(MEMORY[0x263EF83A0], block);

          goto LABEL_147;
        }
        goto LABEL_114;
      }
    }

LABEL_120:
LABEL_121:
    uint64_t v168 = v130;
    id v172 = objc_alloc_init(MEMORY[0x263F089C8]);
    long long v181 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    uint64_t v134 = v131;
    id v170 = [v131 results];
    uint64_t v135 = [v170 countByEnumeratingWithState:&v181 objects:v217 count:16];
    if (v135)
    {
      uint64_t v136 = v135;
      uint64_t v137 = 0;
      uint64_t v138 = *(void *)v182;
      do
      {
        for (kuint64_t k = 0; kk != v136; ++kk)
        {
          if (*(void *)v182 != v138) {
            objc_enumerationMutation(v170);
          }
          uint64_t v140 = *(void **)(*((void *)&v181 + 1) + 8 * kk);
          uint64_t v141 = updateDedupeDictsForResult(v140, v173, v178, v176, v177, v175, v174);
          uint64_t v142 = v141;
          if (v141)
          {
            uint64_t v143 = [v141 inlineCard];
            uint64_t v144 = [v140 inlineCard];
            os_log_type_t v145 = (void *)v144;
            if (v143) {
              BOOL v146 = 1;
            }
            else {
              BOOL v146 = v144 == 0;
            }
            if (!v146) {
              [v142 setInlineCard:v144];
            }
            os_log_type_t v147 = [v142 compactCard];

            os_log_type_t v148 = [v140 compactCard];

            if (v147) {
              BOOL v149 = 1;
            }
            else {
              BOOL v149 = v148 == 0;
            }
            if (!v149) {
              [v142 setCompactCard:v148];
            }
            handleHiddenResult();
            [v172 addIndex:v137 + kk];
          }
        }
        uint64_t v136 = [v170 countByEnumeratingWithState:&v181 objects:v217 count:16];
        v137 += kk;
      }
      while (v136);
    }

    uint32_t v150 = [v134 resultSet];
    [v150 removeObjectsAtIndexes:v172];

    uint64_t v130 = v168;
    goto LABEL_141;
  }
LABEL_147:
}

void __52__SPFederatedQueryTask_handleOptionsForNewSections___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v1 = [*(id *)(a1 + 32) count];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v18 = *MEMORY[0x263F674E0];
    while (1)
    {
      uint64_t v3 = [*(id *)(a1 + 32) objectAtIndex:--v2];
      id v4 = [v3 bundleIdentifier];
      if ([v4 isEqualToString:@"com.apple.spotlight.tophits"]) {
        goto LABEL_6;
      }
      os_log_type_t v5 = [v3 bundleIdentifier];
      if ([v5 isEqualToString:v18]) {
        break;
      }
      uint64_t v16 = [v3 bundleIdentifier];
      char v17 = [v16 isEqualToString:*MEMORY[0x263F67500]];

      if (v17) {
        goto LABEL_7;
      }
LABEL_21:

      if (!v2) {
        return;
      }
    }

LABEL_6:
LABEL_7:
    uint64_t v20 = v2;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [v3 results];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
          if ([v11 isLocalApplicationResult])
          {
            if (sSRResources_block_invoke_2_onceToken != -1) {
              dispatch_once(&sSRResources_block_invoke_2_onceToken, &__block_literal_global_529);
            }
            os_log_type_t v12 = (void *)sSRResources_block_invoke_2_sbsservice;
            uint64_t v13 = [v11 applicationBundleIdentifier];
            os_signpost_id_t v14 = [v12 folderPathToIconWithBundleIdentifier:v13];

            if ((unint64_t)[v14 count] >= 2)
            {
              int64_t v15 = [v14 firstObject];
              [v11 setAuxiliaryTopText:v15];
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }

    uint64_t v2 = v20;
    goto LABEL_21;
  }
}

uint64_t __52__SPFederatedQueryTask_handleOptionsForNewSections___block_invoke_2()
{
  sSRResources_block_invoke_2_sbsservice = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)addSections:(id)a3 delayedTopHit:(BOOL)a4
{
  id v8 = a3;
  -[SPFederatedQueryTask handleOptionsForNewSections:](self, "handleOptionsForNewSections:");
  if (a4)
  {
    if (![v8 count]) {
      goto LABEL_6;
    }
    uint64_t v6 = [(SPQueryTask *)self mutableSections];
    uint64_t v7 = [v8 firstObject];
    [v6 insertObject:v7 atIndex:0];
  }
  else
  {
    uint64_t v6 = [(SPQueryTask *)self mutableSections];
    [v6 addObjectsFromArray:v8];
  }

LABEL_6:
  [(SPFederatedQueryTask *)self mergeSections];
}

- (id)unsafeSessionEntityString
{
  uint64_t v2 = [(SPFederatedQueryTask *)self mutableSessionEntityString];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (BOOL)readyToUpdate
{
  return [(SPQueryTask *)self unsafeState] != 0;
}

- (id)displayedText
{
  uint64_t v3 = [(SPQueryTask *)self query];
  id v4 = [v3 queryContext];

  if ([v4 hasMarkedText])
  {
    os_log_type_t v5 = [v4 markedTextArray];
    uint64_t v6 = [v5 componentsJoinedByString:&stru_26E92AFF0];
  }
  else
  {
    uint64_t v6 = [(SPFederatedQueryTask *)self searchString];
  }

  return v6;
}

- (void)processAppResults:(id)a3 maxAppResults:(unint64_t)a4 section:(id)a5 topHitsIndex:(unint64_t *)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = [v10 bundleIdentifier];
  int v12 = [v11 isEqualToString:@"com.apple.spotlight.tophits"];

  uint64_t v13 = [v10 bundleIdentifier];
  char v14 = [v13 isEqualToString:*MEMORY[0x263F674E0]];

  if ((v14 & 1) != 0 || v12)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v22 = v10;
    int64_t v15 = [v10 results];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
LABEL_5:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v23 + 1) + 8 * v19);
        if ([v20 isLocalApplicationResult] && (objc_msgSend(v20, "isAppClip") & 1) == 0)
        {
          long long v21 = [v20 title];
          [v21 setMaxLines:1];

          if (v12)
          {
            ++*a6;
            objc_msgSend(v9, "insertObject:atIndex:", v20);
          }
          else
          {
            [v9 addObject:v20];
          }
          if ([v9 count] >= a4) {
            break;
          }
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v17) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    id v10 = v22;
    [v22 setMaxInitiallyVisibleResults:a4];
  }
}

- (id)unsafeSections
{
  uint64_t v3 = SPLogForSPLogCategoryDefault();
  os_log_type_t v4 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235D0B000, v3, v4, "unsafeSections", buf, 2u);
  }

  os_log_type_t v5 = [(SPQueryTask *)self mutableSections];
  uint64_t v6 = (void *)[v5 mutableCopy];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;

  id v10 = [v9 firstObject];
  id v11 = [v10 bundleIdentifier];
  int v12 = [v11 isEqual:@"com.apple.spotlight.tophits"];

  if (v12)
  {
    uint64_t v13 = [v9 firstObject];
    if (v13)
    {
      char v14 = (void *)v13;
      unint64_t v15 = [(SPQueryTask *)self maxTopHitAppResults];
      uint64_t v26 = 0;
      [(SPFederatedQueryTask *)self processAppResults:0 maxAppResults:v15 section:v14 topHitsIndex:&v26];
      uint64_t v16 = [v14 resultSet];
      unint64_t v17 = [v16 count];

      if (v17 > v15)
      {
        uint64_t v18 = [v14 resultSet];
        uint64_t v19 = [v14 resultSet];
        objc_msgSend(v18, "removeObjectsInRange:", v15, objc_msgSend(v19, "count") - v15);
      }
    }
  }
  uint64_t v20 = (void *)MEMORY[0x263F78E40];
  long long v21 = [(SPQueryTask *)self query];
  long long v22 = [v21 queryContext];
  long long v23 = [(SPFederatedQueryTask *)self showMoreInAppInfo];
  long long v24 = objc_msgSend(v20, "buildSectionsWithSections:queryContext:searchInAppInfo:renderState:", v9, v22, v23, -[SPQueryTask unsafeState](self, "unsafeState"));

  return v24;
}

- (void)searchQuery:(id)a3 gotResultSet:(id)a4 replace:(BOOL)a5 partiallyComplete:(BOOL)a6 priorityFastPath:(BOOL)a7 update:(BOOL)a8 complete:(BOOL)a9 delayedTopHit:(BOOL)a10 unchanged:(BOOL)a11 forceStable:(BOOL)a12 blendingDuration:(double)a13 geoEntityString:(id)a14 supportedAppScopes:(id)a15 showMoreInAppInfo:(id)a16
{
  BOOL v18 = a7;
  BOOL v19 = a6;
  BOOL v20 = a5;
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v75 = a4;
  id v77 = a14;
  id v24 = a15;
  id v76 = a16;
  long long v25 = [(SPQueryTask *)self queryProcessor];
  dispatch_assert_queue_V2(v25);

  uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x263F67808]), "initWithEvent:timeInterval:queryId:", @"com.apple.searchd.frontend.query.end", 0, objc_msgSend(v23, "queryIdent"));
  id v27 = [MEMORY[0x263F674A0] sharedManager];
  double v73 = (void *)v26;
  objc_msgSend(v27, "reportFeedback:queryId:", v26, objc_msgSend(v23, "queryIdent"));

  staleResultsTimer = self->_staleResultsTimer;
  if (staleResultsTimer)
  {
    dispatch_source_cancel(staleResultsTimer);
    uint64_t v29 = self->_staleResultsTimer;
    self->_staleResultsTimer = 0;
  }
  if (v19 || a8 || v18 || a9)
  {
    uint64_t v30 = 2;
    if (!v19) {
      uint64_t v30 = 3;
    }
    if (v18) {
      uint64_t v30 = 1;
    }
    if (a9) {
      uint64_t v31 = 4;
    }
    else {
      uint64_t v31 = v30;
    }
    [(SPQueryTask *)self setUnsafeState:v31];
  }
  uint64_t v32 = [v24 count];
  id v33 = v24;
  int v34 = v75;
  id v35 = v77;
  if (v32) {
    [(SPFederatedQueryTask *)self setSupportedAppScopes:v33];
  }
  char v74 = v33;
  if ([v76 count]) {
    [(SPFederatedQueryTask *)self setShowMoreInAppInfo:v76];
  }
  if (![(SPQueryTask *)self forceStableResults] && !a12
    || ([v75 stableSections], (uint64_t v36 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v38 = [v75 resultSections];
    if (!v20) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  uint64_t v37 = (void *)v36;
  uint64_t v38 = [v75 stableSections];

  if (v20)
  {
LABEL_25:
    uint64_t v39 = [(SPQueryTask *)self mutableSections];
    [v39 removeAllObjects];

    [(SPFederatedQueryTask *)self setMutableSessionEntityString:0];
  }
LABEL_26:
  if (v77) {
    [(SPFederatedQueryTask *)self setMutableSessionEntityString:v77];
  }
  if ([v38 count])
  {
    if (!a11)
    {
      uint64_t v40 = (void *)[v38 mutableCopy];
      [(SPFederatedQueryTask *)self addSections:v40 delayedTopHit:a10];

      kdebug_trace();
      if ([(SPFederatedQueryTask *)self newQuery])
      {
        [(SPFederatedQueryTask *)self setNewQuery:0];
        uint64_t v41 = [v23 creationStamp];
        int v42 = [MEMORY[0x263F086E0] mainBundle];
        id v43 = [v42 bundleIdentifier];
        sp_analytics_log_timing_with_bundle_id((uint64_t)"com.apple.searchd.query.client", "ttfr", v41, v43);

        id v35 = v77;
      }
    }
  }
  uint64_t v44 = [(SPFederatedQueryTask *)self unsafeSections];
  uint64_t v45 = SPLogForSPLogCategoryDefault();
  os_log_type_t v46 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v45, v46))
  {
    *(_DWORD *)buf = 138412290;
    double v82 = *(double *)&v44;
    _os_log_impl(&dword_235D0B000, v45, v46, "sections: %@", buf, 0xCu);
  }

  if (!a11 && [(SPFederatedQueryTask *)self readyToUpdate])
  {
    if (![(SPFederatedQueryTask *)self didReceiveCompleteCallback])
    {
      kdebug_trace();
      id v47 = SPLogForSPLogCategoryTelemetry();
      uint64_t v48 = v47;
      os_signpost_id_t externalID = self->_externalID;
      if (externalID && os_signpost_enabled(v47))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_235D0B000, v48, OS_SIGNPOST_INTERVAL_END, externalID, "queryUI", " enableTelemetry=YES ", buf, 2u);
      }
    }
    uint64_t v50 = [(SPFederatedQueryTask *)self session];
    uint64_t v51 = (void *)MEMORY[0x263F78E18];
    uint64_t v52 = [v23 queryContext];
    long long v53 = [v52 queryIntent];
    objc_msgSend(v50, "finishRanking:blendingDuration:spotlightQueryIntent:", v44, objc_msgSend(v51, "spotlightQueryIntent:", v53), a13);

    [(SPFederatedQueryTask *)self setDidReceiveCompleteCallback:1];
    if (v20) {
      int v54 = "session reset";
    }
    else {
      int v54 = "session complete";
    }
    uint64_t v55 = [v23 creationStamp];
    uint64_t v56 = [MEMORY[0x263F086E0] mainBundle];
    int v57 = [v56 bundleIdentifier];
    unint64_t v58 = sp_analytics_log_timing_with_bundle_id((uint64_t)"com.apple.searchd.query.client", v54, v55, v57);

    uint64_t v59 = SPLogForSPLogCategoryDefault();
    os_log_type_t v60 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v59, v60))
    {
      *(_DWORD *)buf = 134217984;
      double v82 = (double)v58 / 1000000000.0;
      _os_log_impl(&dword_235D0B000, v59, v60, "- SearchAgent time %gs", buf, 0xCu);
    }

    int v34 = v75;
    id v35 = v77;
  }
  int v61 = [v23 queryContext];
  int v62 = [v61 fetchL2Signals];

  if (v62)
  {
    int v63 = (void *)MEMORY[0x263F08910];
    char v64 = [(SPQueryTask *)self mutableSections];
    id v79 = 0;
    uint64_t v65 = [v63 archivedDataWithRootObject:v64 requiringSecureCoding:1 error:&v79];
    id v66 = v79;

    if (v66)
    {
      qos_class_t v67 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        -[SPFederatedQueryTask searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:]((uint64_t)v66, v67);
      }
      uint64_t v68 = 0;
    }
    else
    {
      uint64_t v69 = (void *)MEMORY[0x263F08928];
      uint64_t v70 = (void *)MEMORY[0x263EFFA08];
      v80[0] = objc_opt_class();
      v80[1] = objc_opt_class();
      v80[2] = objc_opt_class();
      v80[3] = objc_opt_class();
      v80[4] = objc_opt_class();
      v80[5] = objc_opt_class();
      v80[6] = objc_opt_class();
      uint64_t v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:7];
      double v72 = [v70 setWithArray:v71];
      id v78 = 0;
      uint64_t v68 = [v69 unarchivedObjectOfClasses:v72 fromData:v65 error:&v78];
      id v66 = v78;

      if (!v66)
      {
        int v34 = v75;
        goto LABEL_57;
      }
      qos_class_t v67 = SPLogForSPLogCategoryDefault();
      int v34 = v75;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        -[SPFederatedQueryTask searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:]((uint64_t)v66, v67);
      }
    }

LABEL_57:
    [(SPQueryTask *)self updateResultsThroughDelegate:0 state:[(SPQueryTask *)self unsafeState] unchanged:a11 sections:v68];

    id v35 = v77;
    goto LABEL_58;
  }
  [(SPQueryTask *)self updateResultsThroughDelegate:0 state:[(SPQueryTask *)self unsafeState] unchanged:a11 sections:v44];
LABEL_58:
}

- (void)searchQueryEncounteredError:(id)a3
{
  id v4 = a3;
  os_log_type_t v5 = [(SPQueryTask *)self queryProcessor];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    [(SPFederatedQueryTask *)(uint64_t)v4 searchQueryEncounteredError:v6];
  }
}

- (id)retainAndMergeSections:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(SPFederatedQueryTask *)self session];
  id v8 = [(SPQueryTask *)self query];
  id v9 = [v8 queryContext];
  unint64_t v10 = [v9 queryKind] - 5;

  if (v10 < 4)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    id v11 = &_os_log_internal;
    int v12 = "Skipped 1";
    goto LABEL_11;
  }
  if (!v7)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    id v11 = &_os_log_internal;
    int v12 = "Skipped 2";
    goto LABEL_11;
  }
  if (a4 != 1)
  {
    uint64_t v13 = [(SPQueryTask *)self query];
    [v7 setLastSections:v6 forQuery:v13];
LABEL_13:

    goto LABEL_14;
  }
  if (self->_staleResultsFired)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    id v11 = &_os_log_internal;
    int v12 = "Skipped 3";
    goto LABEL_11;
  }
  if ([v6 count] == 1)
  {
    uint64_t v13 = [v6 objectAtIndex:0];
    unint64_t v15 = [v13 bundleIdentifier];
    int v16 = [v15 isEqual:@"com.apple.spotlight.tophits"];

    if (v16)
    {
      unint64_t v17 = [(SPQueryTask *)self query];
      BOOL v18 = (void *)[v7 copyStaleSectionsForQuery:v17];

      if ([v18 count])
      {
        BOOL v19 = (void *)[v18 mutableCopy];
        BOOL v20 = [v18 objectAtIndex:0];
        long long v21 = [(SPQueryTask *)self queryProcessor];
        long long v22 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v21);
        staleResultsTimer = self->_staleResultsTimer;
        self->_staleResultsTimer = v22;

        id v24 = self->_staleResultsTimer;
        dispatch_time_t v25 = dispatch_time(0, 750000000);
        dispatch_source_set_timer(v24, v25, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        *(void *)buf = 0;
        objc_initWeak((id *)buf, self);
        uint64_t v26 = self->_staleResultsTimer;
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __56__SPFederatedQueryTask_retainAndMergeSections_forState___block_invoke;
        handler[3] = &unk_264C76B30;
        objc_copyWeak(v33, (id *)buf);
        v33[1] = (id)1;
        id v27 = v6;
        id v32 = v27;
        dispatch_source_set_event_handler(v26, handler);
        dispatch_activate((dispatch_object_t)self->_staleResultsTimer);
        uint64_t v28 = [v20 bundleIdentifier];
        LODWORD(v26) = [v28 isEqual:@"com.apple.spotlight.tophits"];

        BOOL v29 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
        if (v26)
        {
          if (v29)
          {
            *(_WORD *)uint64_t v30 = 0;
            _os_log_impl(&dword_235D0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Merged - case 1!", v30, 2u);
          }
          [v19 replaceObjectAtIndex:0 withObject:v13];
        }
        else
        {
          if (v29)
          {
            *(_WORD *)uint64_t v30 = 0;
            _os_log_impl(&dword_235D0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Merged - case 2!", v30, 2u);
          }
          [v19 insertObject:v13 atIndex:0];
        }

        objc_destroyWeak(v33);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_235D0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Skipped 6", buf, 2u);
        }
        BOOL v19 = v6;
      }

      id v6 = v19;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235D0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Skipped 5", buf, 2u);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v11 = &_os_log_internal;
    int v12 = "Skipped 4";
LABEL_11:
    _os_log_impl(&dword_235D0B000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
  }
LABEL_14:

  return v6;
}

void __56__SPFederatedQueryTask_retainAndMergeSections_forState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_235D0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Clear stale results -- timeout", v4, 2u);
    }
    *((unsigned char *)WeakRetained + 208) = 1;
    dispatch_source_cancel(*((dispatch_source_t *)WeakRetained + 25));
    uint64_t v3 = (void *)*((void *)WeakRetained + 25);
    *((void *)WeakRetained + 25) = 0;

    [WeakRetained updateResultsThroughDelegate:0 state:*(void *)(a1 + 48) unchanged:0 sections:*(void *)(a1 + 32)];
  }
}

- (unint64_t)queryIdent
{
  uint64_t v2 = [(SPQueryTask *)self query];
  unint64_t v3 = [v2 queryIdent];

  return v3;
}

- (void)allowAnonymousDataCollection:(BOOL)a3
{
  self->_allowAnonymousDataCollectiouint64_t n = a3;
}

- (SPClientSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (SPClientSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (NSDictionary)searchThroughCEPData
{
  return self->_searchThroughCEPData;
}

- (void)setSearchThroughCEPData:(id)a3
{
}

- (NSDictionary)server_features
{
  return self->_server_features;
}

- (void)setServer_features:(id)a3
{
}

- (NSMutableDictionary)categoryToResultMapping
{
  return self->_categoryToResultMapping;
}

- (void)setCategoryToResultMapping:(id)a3
{
}

- (NSMutableOrderedSet)sectionOrderByInsertion
{
  return self->_sectionOrderByInsertion;
}

- (void)setSectionOrderByInsertion:(id)a3
{
}

- (SPXPCConnection)connection
{
  return self->_connection;
}

- (unsigned)externalID
{
  return self->_externalID;
}

- (SPXPCMessage)message
{
  return (SPXPCMessage *)objc_getProperty(self, a2, 384, 1);
}

- (void)setMessage:(id)a3
{
}

- (NSString)fbq
{
  return (NSString *)objc_getProperty(self, a2, 392, 1);
}

- (NSString)web_fbq
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (NSMutableDictionary)categoryEngagements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 408, 1);
}

- (void)setCategoryEngagements:(id)a3
{
}

- (double)blendingTime
{
  return self->_blendingTime;
}

- (void)setBlendingTime:(double)a3
{
  self->_double blendingTime = a3;
}

- (BOOL)isRewrite
{
  return self->_isRewrite;
}

- (void)setIsRewrite:(BOOL)a3
{
  self->_isRewrite = a3;
}

- (BOOL)needsReRunForFuzzy
{
  return self->_needsReRunForFuzzy;
}

- (void)setNeedsReRunForFuzzy:(BOOL)a3
{
  self->_needsReRunForFuzzy = a3;
}

- (NSString)geoUserSessionEntityString
{
  return self->_geoUserSessionEntityString;
}

- (void)setGeoUserSessionEntityString:(id)a3
{
}

- (PRSRankingItemRanker)itemRanker
{
  return self->_itemRanker;
}

- (void)setItemRanker:(id)a3
{
}

- (BOOL)allowAnonymousDataCollection
{
  return self->_allowAnonymousDataCollection;
}

- (void)setAllowAnonymousDataCollection:(BOOL)a3
{
  self->_allowAnonymousDataCollectiouint64_t n = a3;
}

- (unint64_t)previousQueryKind
{
  return self->_previousQueryKind;
}

- (void)setPreviousQueryKind:(unint64_t)a3
{
  self->_previousQueryKind = a3;
}

- (BOOL)isCJK
{
  return self->_isCJK;
}

- (void)setIsCJK:(BOOL)a3
{
  self->_BOOL isCJK = a3;
}

- (BOOL)prefersLocalUserTypedSuggestion
{
  return self->_prefersLocalUserTypedSuggestion;
}

- (void)setPrefersLocalUserTypedSuggestion:(BOOL)a3
{
  self->_prefersLocalUserTypedSuggestiouint64_t n = a3;
}

- (BOOL)didReceiveCoreSpotlightProgress
{
  return self->_didReceiveCoreSpotlightProgress;
}

- (void)setDidReceiveCoreSpotlightProgress:(BOOL)a3
{
  self->_didReceiveCoreSpotlightProgress = a3;
}

- (double)storeStartTime
{
  return self->_storeStartTime;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (NSString)mutableSessionEntityString
{
  return self->_mutableSessionEntityString;
}

- (void)setMutableSessionEntityString:(id)a3
{
}

- (NSArray)showMoreInAppInfo
{
  return self->_showMoreInAppInfo;
}

- (void)setShowMoreInAppInfo:(id)a3
{
}

- (BOOL)didReceiveCompleteCallback
{
  return self->_didReceiveCompleteCallback;
}

- (void)setDidReceiveCompleteCallback:(BOOL)a3
{
  self->_didReceiveCompleteCallbacuint64_t k = a3;
}

- (BOOL)newQuery
{
  return self->_newQuery;
}

- (void)setNewQuery:(BOOL)a3
{
  self->_newQuery = a3;
}

- (NSArray)supportedAppScopes
{
  return (NSArray *)objc_getProperty(self, a2, 472, 1);
}

- (void)setSupportedAppScopes:(id)a3
{
}

- (NSMutableArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
}

- (NSMutableArray)slowTokens
{
  return self->_slowTokens;
}

- (void)setSlowTokens:(id)a3
{
}

- (NSMutableArray)delayedStartTokens
{
  return self->_delayedStartTokens;
}

- (void)setDelayedStartTokens:(id)a3
{
}

- (NSMutableArray)delayedStartQueries
{
  return self->_delayedStartQueries;
}

- (void)setDelayedStartQueries:(id)a3
{
}

- (NSMutableArray)finishedTokens
{
  return self->_finishedTokens;
}

- (void)setFinishedTokens:(id)a3
{
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (double)startTimeIntervalSinceReferenceDate
{
  return self->_startTimeIntervalSinceReferenceDate;
}

- (SFMutableResultSection)topHitSection
{
  return self->_topHitSection;
}

- (SFMutableResultSection)suggestionsSection
{
  return self->_suggestionsSection;
}

- (int64_t)initiallyVisibleSectionSentCount
{
  return self->_initiallyVisibleSectionSentCount;
}

- (int64_t)initiallyHiddenSectionSentCount
{
  return self->_initiallyHiddenSectionSentCount;
}

- (NSArray)corrections
{
  return self->_corrections;
}

- (void)setCorrections:(id)a3
{
}

- (NSArray)serverSuggestionResults
{
  return self->_serverSuggestionResults;
}

- (void)setServerSuggestionResults:(id)a3
{
}

- (NSArray)localSuggestionResults
{
  return self->_localSuggestionResults;
}

- (void)setLocalSuggestionResults:(id)a3
{
}

- (BOOL)suggestionsAreBlended
{
  return self->_suggestionsAreBlended;
}

- (void)setSuggestionsAreBlended:(BOOL)a3
{
  self->_suggestionsAreBlended = a3;
}

- (NSArray)preferredBundleIDs
{
  return self->_preferredBundleIDs;
}

- (void)setPreferredBundleIDs:(id)a3
{
}

- (BOOL)enforcePreferredBundleIDs
{
  return self->_enforcePreferredBundleIDs;
}

- (void)setEnforcePreferredBundleIDs:(BOOL)a3
{
  self->_enforcePreferredBundleIDs = a3;
}

- (OS_dispatch_semaphore)correctionsSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 600, 1);
}

- (void)setCorrectionsSem:(id)a3
{
}

- (SSRankingManager)rankingManager
{
  return self->_rankingManager;
}

- (void)setRankingManager:(id)a3
{
}

- (BOOL)isInternalDevice
{
  return self->_isInternalDevice;
}

- (void)setIsInternalDevice:(BOOL)a3
{
  self->_isInternalDevice = a3;
}

- (NSNumber)experimentalWeight
{
  return self->_experimentalWeight;
}

- (void)setExperimentalWeight:(id)a3
{
}

- (void)setIsScopedAppSearch:(BOOL)a3
{
  self->_isScopedAppSearch = a3;
}

- (void)setIsPeopleSearch:(BOOL)a3
{
  self->_BOOL isPeopleSearch = a3;
}

- (void)setIsEntitySearch:(BOOL)a3
{
  self->_isEntitySearch = a3;
}

- (void)setIsPhotosSearch:(BOOL)a3
{
  self->_isPhotosSearch = a3;
}

- (void)setIsNLPSearch:(BOOL)a3
{
  self->_isNLPSearch = a3;
}

- (BOOL)genreGroupingEnabled
{
  return self->_genreGroupingEnabled;
}

- (void)setGenreGroupingEnabled:(BOOL)a3
{
  self->_genreGroupingEnabled = a3;
}

- (OS_xpc_object)perfDictionary
{
  return self->_perfDictionary;
}

- (void)setPerfDictionary:(id)a3
{
}

- (NSMutableArray)matchInfo
{
  return self->_matchInfo;
}

- (void)setMatchInfo:(id)a3
{
}

- (NSArray)queries
{
  return (NSArray *)objc_getProperty(self, a2, 640, 1);
}

- (void)setQueries:(id)a3
{
}

- (SPParsecQuery)parsecQuery
{
  return self->_parsecQuery;
}

- (void)setParsecQuery:(id)a3
{
}

- (SPCSSearchQuery)csQuery
{
  return self->_csQuery;
}

- (void)setCsQuery:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csQuery, 0);
  objc_storeStrong((id *)&self->_parsecQuery, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_storeStrong((id *)&self->_perfDictionary, 0);
  objc_storeStrong((id *)&self->_experimentalWeight, 0);
  objc_storeStrong((id *)&self->_rankingManager, 0);
  objc_storeStrong((id *)&self->_correctionsSem, 0);
  objc_storeStrong((id *)&self->_preferredBundleIDs, 0);
  objc_storeStrong((id *)&self->_localSuggestionResults, 0);
  objc_storeStrong((id *)&self->_serverSuggestionResults, 0);
  objc_storeStrong((id *)&self->_corrections, 0);
  objc_storeStrong((id *)&self->_suggestionsSection, 0);
  objc_storeStrong((id *)&self->_topHitSection, 0);
  objc_storeStrong((id *)&self->_finishedTokens, 0);
  objc_storeStrong((id *)&self->_delayedStartQueries, 0);
  objc_storeStrong((id *)&self->_delayedStartTokens, 0);
  objc_storeStrong((id *)&self->_slowTokens, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_supportedAppScopes, 0);
  objc_storeStrong((id *)&self->_showMoreInAppInfo, 0);
  objc_storeStrong((id *)&self->_mutableSessionEntityString, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_itemRanker, 0);
  objc_storeStrong((id *)&self->_geoUserSessionEntityString, 0);
  objc_storeStrong((id *)&self->_categoryEngagements, 0);
  objc_storeStrong((id *)&self->_web_fbq, 0);
  objc_storeStrong((id *)&self->_fbq, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_sectionOrderByInsertion, 0);
  objc_storeStrong((id *)&self->_categoryToResultMapping, 0);
  objc_storeStrong((id *)&self->_server_features, 0);
  objc_storeStrong((id *)&self->_searchThroughCEPData, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_lastQuery, 0);
  objc_storeStrong((id *)&self->_bundlesSupportingAppScoping, 0);
  objc_storeStrong((id *)&self->_topHitsManager, 0);
  objc_storeStrong((id *)&self->_actualSentSections, 0);
  objc_storeStrong((id *)&self->_sentSections, 0);
  objc_storeStrong((id *)&self->_stableSections, 0);
  objc_storeStrong((id *)&self->_bottomPlacedSections, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_staleResultsTimer, 0);
}

void __29__SPFederatedQueryTask_start__block_invoke_cold_1()
{
  __assert_rtn("-[SPFederatedQueryTask start]_block_invoke", "SPFederatedQueryTask.m", 3883, "self.started == NO");
}

void __34__SPFederatedQueryTask_deactivate__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_235D0B000, log, OS_LOG_TYPE_ERROR, "Resources object is nil at [SPProxyQuery deactivate]", v1, 2u);
}

- (void)searchQuery:(uint64_t)a1 gotResultSet:(NSObject *)a2 replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235D0B000, a2, OS_LOG_TYPE_ERROR, "mutable section unarchiving error %@", (uint8_t *)&v2, 0xCu);
}

- (void)searchQuery:(uint64_t)a1 gotResultSet:(NSObject *)a2 replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235D0B000, a2, OS_LOG_TYPE_ERROR, "mutable section archiving error %@", (uint8_t *)&v2, 0xCu);
}

- (void)searchQueryEncounteredError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  os_log_type_t v5 = [a2 query];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_235D0B000, a3, OS_LOG_TYPE_ERROR, "Received search error %@ for query %@", (uint8_t *)&v6, 0x16u);
}

@end