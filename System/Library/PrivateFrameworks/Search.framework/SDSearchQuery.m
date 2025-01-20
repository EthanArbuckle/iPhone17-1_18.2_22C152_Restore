@interface SDSearchQuery
+ (BOOL)isCJK;
+ (BOOL)sectionSupportsShowMoreInApp:(id)a3;
+ (id)appGenreMap;
+ (id)searchContinuationCompatibilitySet;
+ (void)initialize;
+ (void)invalidateCacheForSearchContinuation;
+ (void)prepareCacheForSearchContinuation;
- (BOOL)allowAnonymousDataCollection;
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
- (BOOL)parsecAvailable;
- (BOOL)prefersLocalUserTypedSuggestion;
- (BOOL)storeCompletedSearch:(id)a3 withSections:(id)a4;
- (BOOL)storeCompletedSearch:(id)a3 withSections:(id)a4 suggestionResults:(id)a5;
- (BOOL)storeSearchProgress:(id)a3 withSections:(id)a4 suggestionResults:(id)a5;
- (BOOL)suggestionsAreBlended;
- (BOOL)topHitsReadyToSend:(id)a3;
- (NSArray)corrections;
- (NSArray)localSuggestionResults;
- (NSArray)preferredBundleIDs;
- (NSArray)serverSuggestionResults;
- (NSDictionary)searchThroughCEPData;
- (NSDictionary)server_features;
- (NSMutableArray)delayedStartStores;
- (NSMutableArray)delayedStartTokens;
- (NSMutableArray)finishedTokens;
- (NSMutableArray)matchInfo;
- (NSMutableArray)slowTokens;
- (NSMutableArray)tokens;
- (NSMutableDictionary)categoryEngagements;
- (NSMutableDictionary)categoryToResultMapping;
- (NSMutableOrderedSet)sectionOrderByInsertion;
- (NSNumber)experimentalWeight;
- (NSString)fbq;
- (NSString)geoUserSessionEntityString;
- (NSString)web_fbq;
- (OS_dispatch_semaphore)correctionsSem;
- (OS_xpc_object)perfDictionary;
- (PRSRankingItemRanker)itemRanker;
- (SDSearchQuery)initWithQueryContext:(id)a3 externalID:(unsigned int)a4 connection:(id)a5;
- (SFMutableResultSection)suggestionsSection;
- (SFMutableResultSection)topHitSection;
- (SPXPCConnection)connection;
- (SPXPCMessage)message;
- (SSRankingManager)rankingManager;
- (__CFArray)copyMatchInfo;
- (double)blendingTime;
- (double)startTimeIntervalSinceReferenceDate;
- (double)storeStartTime;
- (id)contactSuggestionsWithSearchString:(id)a3;
- (id)correctedQueryWithCorrection:(id)a3;
- (id)dedupeLocalSectionsByBundleId:(id)a3;
- (id)detailTextFromBundleIDs:(id)a3;
- (id)orderedCategories:(id)a3;
- (id)suggestionsWithSearchString:(id)a3 sections:(id)a4 topHitSection:(id)a5 highestLocalScore:(double)a6;
- (id)waitForQueryCorrections;
- (int64_t)initiallyHiddenSectionSentCount;
- (int64_t)initiallyVisibleSectionSentCount;
- (unint64_t)previousQueryKind;
- (unint64_t)startTime;
- (unsigned)externalID;
- (void)addDelayedStartStore:(id)a3;
- (void)addDictionarySections:(id)a3;
- (void)addMatchInfo:(_MDPlistContainer *)a3;
- (void)addQueryCorrections:(id)a3;
- (void)addQueryToken:(id)a3;
- (void)addSlowQueryToken:(id)a3;
- (void)addSuggestionsToSectionsForSending:(id)a3 searchString:(id)a4 updatedSections:(BOOL)a5 queryKind:(unint64_t)a6;
- (void)addTopHitSectionIfNecessaryToSectionsForSending:(id)a3 updatedSections:(BOOL)a4 isScopedSearch:(BOOL)a5;
- (void)cancel;
- (void)deDuplicateMailResults:(id)a3;
- (void)deDuplicateSection:(id)a3 againstSection:(id)a4;
- (void)dealloc;
- (void)logPerfToAnalytics:(int)a3;
- (void)prepareAndSend:(id)a3 force:(BOOL)a4 moreComing:(BOOL)a5 reason:(int)a6;
- (void)sendCompletions:(id)a3;
- (void)sendError:(id)a3;
- (void)sendFinishedDomains:(BOOL)a3 reason:(int)a4;
- (void)sendFinishedDomains:(int)a3;
- (void)sendFinishedDomainsZKW:(BOOL)a3;
- (void)sendLogValuesForDebuggingRanking:(id)a3;
- (void)sendQueryCompleted;
- (void)sendQueryReset;
- (void)sendResults:(id)a3 reset:(BOOL)a4 partiallyComplete:(BOOL)a5 update:(BOOL)a6 complete:(BOOL)a7 delayedTopHit:(BOOL)a8 reason:(int)a9;
- (void)sendResults:(id)a3 reset:(BOOL)a4 partiallyComplete:(BOOL)a5 update:(BOOL)a6 complete:(BOOL)a7 unchanged:(BOOL)a8 delayedTopHit:(BOOL)a9 reason:(int)a10;
- (void)sendResultsForKeys:(id)a3 toSendSections:(id)a4;
- (void)sendSuggestions:(id)a3;
- (void)sendTTRLogsWithSections:(id)a3;
- (void)serverSideDedupe:(id)a3;
- (void)setAllowAnonymousDataCollection:(BOOL)a3;
- (void)setBlendingTime:(double)a3;
- (void)setBundlesSupportingAppScoping:(id)a3;
- (void)setCategoryEngagements:(id)a3;
- (void)setCategoryToResultMapping:(id)a3;
- (void)setCorrections:(id)a3;
- (void)setCorrectionsSem:(id)a3;
- (void)setDelayedStartStores:(id)a3;
- (void)setDelayedStartTokens:(id)a3;
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
- (void)setNeedsReRunForFuzzy:(BOOL)a3;
- (void)setPerfDictionary:(id)a3;
- (void)setPreferredBundleIDs:(id)a3;
- (void)setPrefersLocalUserTypedSuggestion:(BOOL)a3;
- (void)setPreviousQueryKind:(unint64_t)a3;
- (void)setRankingManager:(id)a3;
- (void)setSearchThroughCEPData:(id)a3;
- (void)setSectionOrderByInsertion:(id)a3;
- (void)setServerSuggestionResults:(id)a3;
- (void)setServer_features:(id)a3;
- (void)setSlowTokens:(id)a3;
- (void)setSuggestionsAreBlended:(BOOL)a3;
- (void)setTimeout:(double)a3;
- (void)setTokens:(id)a3;
- (void)start;
- (void)storeWillComplete:(id)a3;
@end

@implementation SDSearchQuery

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"com.apple.application", @"com.apple.mobilesafari", @"com.apple.Preferences", @"com.apple.MobileAddressBook", @"com.apple.shortcuts", 0);
    v3 = (void *)qword_1000A8D98;
    qword_1000A8D98 = (uint64_t)v2;

    uint64_t v4 = +[NSMutableSet setWithObjects:@"com.apple.mobilecal", @"com.apple.Health", @"com.apple.Music", @"com.apple.podcasts", @"com.apple.reminders", @"com.apple.MobileAddressBook", @"com.apple.mobilenotes", @"com.apple.mobilemail", @"com.apple.MobileSMS", @"com.apple.Maps", @"com.apple.DocumentsApp", 0];
    v5 = (void *)qword_1000A8DA0;
    qword_1000A8DA0 = v4;

    v6 = (void *)qword_1000A8DA8;
    qword_1000A8DA8 = (uint64_t)&off_100099000;

    qword_1000A8DB0 = (int)MGGetSInt32Answer();
  }
}

+ (id)appGenreMap
{
  os_unfair_lock_lock(&stru_1000A8DB8);
  id v2 = [(id)qword_1000A8DA8 copy];
  os_unfair_lock_unlock(&stru_1000A8DB8);

  return v2;
}

+ (id)searchContinuationCompatibilitySet
{
  os_unfair_lock_lock(&stru_1000A8DB8);
  id v2 = [(id)qword_1000A8DA0 copy];
  os_unfair_lock_unlock(&stru_1000A8DB8);

  return v2;
}

- (void)start
{
  v3 = SPLogForSPLogCategoryTelemetry();
  uint64_t v4 = v3;
  os_signpost_id_t externalID = self->_externalID;
  if (externalID && os_signpost_enabled(v3))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, externalID, "spotlightLatency", " enableTelemetry=YES ", v7, 2u);
  }

  self->_startTime = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  +[NSDate timeIntervalSinceReferenceDate];
  self->_startTimeIntervalSinceReferenceDate = v6;
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

- (void)addDelayedStartStore:(id)a3
{
}

- (void)cancel
{
  SDTraceAdd();
  v27.receiver = self;
  v27.super_class = (Class)SDSearchQuery;
  [(SDSearchQuery *)&v27 cancel];
  v3 = [(SDSearchQuery *)self itemRanker];
  [v3 cancel];

  [(SSRankingManager *)self->_rankingManager cancel];
  id v4 = [(NSMutableArray *)self->_slowTokens copy];
  id v5 = [(NSMutableArray *)self->_tokens copy];
  slowTokens = self->_slowTokens;
  self->_slowTokens = 0;

  tokens = self->_tokens;
  self->_tokens = 0;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * (void)v12) cancel];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v10);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v5;
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v17), "cancel", (void)v19);
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v15);
  }

  categoryToResultMapping = self->_categoryToResultMapping;
  self->_categoryToResultMapping = 0;

  self->_sentTaggedTopHits = 0;
  [(SDSearchQuery *)self setMessage:0];
}

- (void)sendSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)SPXPCMessage) initWithName:@"Suggestions"];
  CFStringRef v17 = @"QID";
  double v6 = +[NSNumber numberWithUnsignedInt:self->_externalID];
  v18 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v5 setInfo:v7];

  if (v4) {
    id v8 = v4;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;
  [v5 setRootObject:v8];
  id v10 = SPLogForSPLogCategoryDefault();
  os_log_type_t v11 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v10, v11))
  {
    v16[0] = 67109120;
    v16[1] = qos_class_self();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "QOS sendSuggestions 1: %d", (uint8_t *)v16, 8u);
  }

  if (([(SDSearchQuery *)self cancelled] & 1) == 0)
  {
    id v12 = objc_msgSend(objc_alloc((Class)SFClientTimingFeedback), "initWithEvent:timeInterval:queryId:", @"com.apple.searchd.backend.suggestions.end", 0, -[SDSearchQuery queryIdent](self, "queryIdent"));
    [(SPXPCConnection *)self->_connection sendMessage:v5];
    id v13 = +[SPFeedbackProxy sharedProxy];
    id v14 = [(SDSearchQuery *)self queryIdent];
    id v15 = [(SPXPCConnection *)self->_connection bundleID];
    [v13 sendFeedbackType:21 feedback:v12 queryId:v14 clientID:v15];
  }
}

+ (void)prepareCacheForSearchContinuation
{
  id v2 = +[SDController backgroundWorkQueue];
  tracing_dispatch_async();
}

+ (void)invalidateCacheForSearchContinuation
{
  id v2 = +[SDController backgroundWorkQueue];
  tracing_dispatch_async();
}

+ (BOOL)sectionSupportsShowMoreInApp:(id)a3
{
  id v3 = a3;
  id v4 = +[SDSearchQuery searchContinuationCompatibilitySet];
  id v5 = [v3 bundleIdentifier];

  LOBYTE(v3) = [v4 containsObject:v5];
  return (char)v3;
}

- (void)setBundlesSupportingAppScoping:(id)a3
{
  self->_bundlesSupportingAppScoping = [a3 allObjects];

  _objc_release_x1();
}

- (BOOL)isBullseyeNonCommittedSearch
{
  id v3 = [(SDSearchQuery *)self queryContext];
  id v4 = [v3 queryKind];

  return v4 == (id)2 || v4 == (id)10 && self->_previousQueryKind == 2;
}

- (BOOL)isBullseyeCommittedSearch
{
  id v3 = [(SDSearchQuery *)self queryContext];
  id v4 = (char *)[v3 queryKind];

  if ((unint64_t)(v4 - 5) < 4) {
    return 1;
  }
  if (v4 == (char *)10) {
    return self->_previousQueryKind - 5 < 4;
  }
  return 0;
}

- (void)sendTTRLogsWithSections:(id)a3
{
  rankingManager = self->_rankingManager;
  id v5 = a3;
  double v6 = [(SDSearchQuery *)self queryContext];
  v7 = [v6 searchString];
  id v8 = [(SDSearchQuery *)self queryContext];
  -[SSRankingManager sendTTRLogsWithSections:searchString:queryKind:isCommittedSearch:parsecCameLaterThanSRT:](rankingManager, "sendTTRLogsWithSections:searchString:queryKind:isCommittedSearch:parsecCameLaterThanSRT:", v5, v7, [v8 queryKind], -[SDSearchQuery isBullseyeCommittedSearch](self, "isBullseyeCommittedSearch"), self->_parsecCameLaterThanSRT);

  id v9 = [(SSRankingManager *)self->_rankingManager logValues];
  id v10 = [v9 length];

  if (v10)
  {
    id v11 = [(SSRankingManager *)self->_rankingManager logValues];
    [(SDSearchQuery *)self sendLogValuesForDebuggingRanking:v11];
  }
}

- (void)deDuplicateMailResults:(id)a3
{
  id v17 = a3;
  id v3 = objc_alloc((Class)NSMutableSet);
  id v4 = [v17 resultSet];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  double v6 = objc_opt_new();
  v7 = [v17 resultSet];
  id v8 = (char *)[v7 count];

  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      id v10 = [v17 resultSet];
      id v11 = [v10 objectAtIndexedSubscript:i];

      id v12 = [v11 rankingItem];
      id v13 = v12;
      if (v12)
      {
        [v12 attributes];
        uint64_t v14 = SSCompactRankingAttrsGetValue();
        if (v14)
        {
          id v15 = (void *)v14;
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
  uint64_t v16 = [v17 resultSet];
  [v16 removeObjectsAtIndexes:v6];
}

- (void)deDuplicateSection:(id)a3 againstSection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc((Class)NSMutableSet);
  id v8 = [v6 resultSet];
  id v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  id v10 = [v5 bundleIdentifier];
  if (([v10 isEqual:PRSRankingAppsBundleString] & 1) == 0)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v11 = [v5 bundleIdentifier];
  id v12 = [v6 bundleIdentifier];
  unsigned int v13 = [v11 isEqual:v12];

  if (v13)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v10 = [v6 results];
    id v14 = [v10 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v45;
      while (2)
      {
        id v17 = 0;
        do
        {
          if (*(void *)v45 != v16) {
            objc_enumerationMutation(v10);
          }
          v18 = [*(id *)(*((void *)&v44 + 1) + 8 * (void)v17) rankingItem];
          unsigned __int8 v19 = [v18 isServerAlternativeResult];

          if (v19)
          {

            long long v20 = v5;
            id v5 = v6;
            goto LABEL_13;
          }
          id v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v10 countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
    goto LABEL_11;
  }
LABEL_12:
  long long v20 = v6;
LABEL_13:
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v21 = [v20 resultSet];
  id v22 = [v21 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v41;
    do
    {
      long long v25 = 0;
      do
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = [*(id *)(*((void *)&v40 + 1) + 8 * (void)v25) identifier];
        if (v26) {
          [v9 addObject:v26];
        }

        long long v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v23);
  }

  id v27 = objc_alloc_init((Class)NSMutableIndexSet);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v28 = objc_msgSend(v5, "resultSet", 0);
  id v29 = [v28 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = 0;
    uint64_t v32 = *(void *)v37;
    do
    {
      v33 = 0;
      do
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(v28);
        }
        v34 = [*(id *)(*((void *)&v36 + 1) + 8 * (void)v33) identifier];
        if (v34 && [v9 containsObject:v34]) {
          [v27 addIndex:(char *)v33 + v31];
        }

        v33 = (char *)v33 + 1;
      }
      while (v30 != v33);
      id v30 = [v28 countByEnumeratingWithState:&v36 objects:v48 count:16];
      v31 += (uint64_t)v33;
    }
    while (v30);
  }

  v35 = [v5 resultSet];
  [v35 removeObjectsAtIndexes:v27];
}

- (id)dedupeLocalSectionsByBundleId:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  id v5 = objc_alloc_init((Class)NSMutableIndexSet);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "bundleIdentifier", (void)v16);
        unsigned int v13 = v12;
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
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    id v14 = [v6 mutableCopy];
    [v14 removeObjectsAtIndexes:v5];

    id v6 = v14;
  }

  return v6;
}

- (void)serverSideDedupe:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  v193 = objc_opt_new();
  v199 = objc_opt_new();
  v204 = objc_opt_new();
  v211 = objc_opt_new();
  v198 = objc_opt_new();
  id v7 = self;
  id v8 = objc_opt_new();
  v202 = +[NSCharacterSet characterSetWithCharactersInString:@"_"];
  int v224 = SSEnableSpotlightTopHitPersonalizedRanking();
  uint64_t v9 = [(SDSearchQuery *)self dedupeLocalSectionsByBundleId:v4];

  v222 = v5;
  v213 = v6;
  if ([v9 count])
  {
    uint64_t v10 = [v9 objectAtIndex:0];
    id v11 = [v10 bundleIdentifier];
    if ([v11 isEqual:@"com.apple.spotlight.tophits"])
    {
      id v12 = [v10 resultSet];
      unsigned int v13 = [v12 firstObject];
      id v14 = [v13 sectionBundleIdentifier];
      int v15 = sub_100012A60(v14);

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
  v187 = +[NSDate now];
  long long v240 = 0u;
  long long v241 = 0u;
  long long v242 = 0u;
  long long v243 = 0u;
  id obj = v9;
  id v195 = [obj countByEnumeratingWithState:&v240 objects:v259 count:16];
  if (v195)
  {
    uint64_t v194 = *(void *)v241;
    uint64_t v190 = PRSRankingMailBundleString;
    uint64_t v223 = PRSRankingUserTypedURLBundleString;
    uint64_t v216 = PRSRankingSafariBundleString;
    uint64_t v206 = PRSRankingParsecWebIndexBundleString;
    uint64_t v215 = PRSRankingCalendarBundleString;
    uint64_t v205 = MDItemIdentifier;
    uint64_t v186 = MDItemStartDate;
    uint64_t v210 = PRSRankingPeopleFindMyBundleString;
    uint64_t v203 = MDItemContactIdentifier;
    uint64_t v209 = PRSRankingAppsBundleString;
    uint64_t v184 = SSSectionIdentifierTopHits;
    uint64_t v208 = SSSectionIdentifierSyndicatedLinks;
    uint64_t v214 = PRSRankingShortcutsBundleString;
    uint64_t v201 = MDItemRunnableShortcutsAssociatedSettingsPreference;
    uint64_t v212 = PRSRankingSettingsBundleString;
    uint64_t v207 = PRSRankingPeoplePurchaseRequestBundleString;
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
        if ([(SDSearchQuery *)v7 isBullseyeCommittedSearch])
        {
          long long v18 = [v17 bundleIdentifier];
          unsigned __int8 v19 = [v18 isEqualToString:@"com.apple.spotlight.tophits"];

          if (v19) {
            goto LABEL_206;
          }
        }
        id v225 = objc_alloc_init((Class)NSMutableIndexSet);
        long long v20 = [v17 results];
        long long v21 = [v20 firstObject];
        id v22 = [v21 sectionBundleIdentifier];
        unsigned int v23 = [v22 isEqualToString:v190];

        if (v23)
        {
          [(SDSearchQuery *)v7 deDuplicateMailResults:v17];
          uint64_t v24 = v225;
          goto LABEL_205;
        }
        long long v25 = v17;
        v229 = v17;
        if (v17 != v189)
        {
          long long v26 = [v17 resultSet];
          id v27 = [v26 firstObject];
          v28 = [v27 sectionBundleIdentifier];
          id v29 = [v189 resultSet];
          id v30 = [v29 firstObject];
          uint64_t v31 = [v30 sectionBundleIdentifier];
          if ([v28 isEqualToString:v31])
          {
            unsigned __int8 v32 = [(SDSearchQuery *)v7 isBullseyeCommittedSearch];

            long long v25 = v229;
            if ((v32 & 1) == 0) {
              [(SDSearchQuery *)v7 deDuplicateSection:v229 againstSection:v189];
            }
          }
          else
          {

            long long v25 = v229;
          }
        }
        v33 = [v25 resultSet];
        id v34 = [v33 count];

        if (!v34)
        {
          id v41 = 0;
          id v8 = v217;
          goto LABEL_204;
        }
        unint64_t v35 = 0;
        unint64_t v36 = 0;
        unsigned int v219 = 0;
        long long v37 = 0;
        id v8 = v217;
        do
        {
          unint64_t v38 = v36;
          long long v39 = [v25 resultSet];
          long long v40 = [v39 objectAtIndexedSubscript:v35];

          id v41 = +[NSNumber numberWithUnsignedInt:v38];

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
            unsigned int v46 = [v45 isEqualToString:v206];

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
          id v48 = [v47 countByEnumeratingWithState:&v236 objects:v258 count:16];
          if (!v48)
          {

            v226 = 0;
            long long v40 = v231;
            goto LABEL_62;
          }
          id v49 = v48;
          id v230 = 0;
          v226 = 0;
          uint64_t v50 = *(void *)v237;
          do
          {
            v51 = 0;
            id v227 = v49;
            do
            {
              if (*(void *)v237 != v50) {
                objc_enumerationMutation(v47);
              }
              v52 = [*(id *)(*((void *)&v236 + 1) + 8 * (void)v51) absoluteString];
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
                    sub_100012AB0(v60, v61, v62, v63, v25);
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
                    unsigned int v66 = [v65 isEqualToString:v223];

                    if (v66) {
                      +[SSTopHitNominationManager setTopHitCandidate:v64];
                    }
                    v226 = v58;
                    id v5 = v222;
                    long long v25 = v229;
                  }
                  else
                  {
                    v226 = v58;
                  }
                }
                long long v47 = v57;
                id v49 = v227;
                goto LABEL_56;
              }
              v257[0] = v231;
              v257[1] = v25;
              id v58 = +[NSArray arrayWithObjects:v257 count:2];
              [v5 setObject:v58 forKey:v53];
LABEL_56:

LABEL_57:
              v51 = (char *)v51 + 1;
            }
            while (v49 != v51);
            id v49 = [v47 countByEnumeratingWithState:&v236 objects:v258 count:16];
          }
          while (v49);

          id v8 = v217;
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

          id v72 = [v71 countByEnumeratingWithState:&v232 objects:v256 count:16];
          if (!v72)
          {
            id v230 = 0;
            goto LABEL_77;
          }
          id v73 = v72;
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
                long long v25 = v229;
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
                long long v25 = v229;
                v255[1] = v229;
                v81 = +[NSArray arrayWithObjects:v255 count:2];
                [v5 setObject:v81 forKey:v77];
LABEL_71:

                long long v40 = v231;
              }

              if (v73 != (id)++v75) {
                continue;
              }
              break;
            }
            id v73 = [v71 countByEnumeratingWithState:&v232 objects:v256 count:16];
            if (v73) {
              continue;
            }
            break;
          }
LABEL_77:

          id v8 = v217;
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
            v93 = +[NSArray arrayWithObjects:v254 count:2];
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
            unsigned __int8 v90 = [v89 isEqualToString:v223];

            if (v90)
            {
              v253[0] = v231;
              v253[1] = v25;
              v91 = +[NSArray arrayWithObjects:v253 count:2];
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
              v99 = +[NSArray arrayWithObjects:v252 count:2];
              v100 = [v40 storeIdentifier];
              [v213 setObject:v99 forKeyedSubscript:v100];

              long long v25 = v229;
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
          unsigned int v102 = [v101 isEqualToString:v215];

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
              v125 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:");
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

            id v8 = v217;
            v118 = v228;
          }
          else
          {
            v248[0] = v231;
            v248[1] = v41;
            v118 = +[NSArray arrayWithObjects:v248 count:2];
            [v193 setObject:v118 forKeyedSubscript:v105];
          }

          long long v40 = v231;
LABEL_127:
          v127 = [v40 sectionBundleIdentifier];
          unsigned int v128 = [v127 isEqualToString:v210];

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
          unsigned int v132 = [v131 isEqualToString:v209];

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
          unsigned int v175 = [v174 isEqualToString:v184];

          v137 = v211;
          if (!v175)
          {
            id v230 = v133;
            long long v25 = v229;
            goto LABEL_198;
          }
LABEL_145:

          id v230 = v133;
          long long v25 = v229;
          long long v40 = v231;
LABEL_146:
          v138 = [v40 sectionBundleIdentifier];
          unsigned int v139 = [v138 isEqualToString:v208];

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
          unsigned int v143 = [v142 isEqualToString:v214];

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
                unsigned int v149 = [v148 isEqualToString:v212];

                if (v149)
                {
                  v150 = [v146 objectAtIndexedSubscript:1];
                  handleHiddenResult();
                  [v150 removeResults:v147];

                  id v230 = 0;
                }
                id v5 = v222;
                long long v25 = v229;
              }
              else
              {
                v247[0] = v40;
                v247[1] = v25;
                v147 = +[NSArray arrayWithObjects:v247 count:2];
                [v137 setObject:v147 forKeyedSubscript:v144];
              }
            }
          }
          v151 = [v40 sectionBundleIdentifier];
          unsigned int v152 = [v151 isEqualToString:v212];

          if (v152)
          {
            v153 = [v40 identifier];
            v154 = [v137 objectForKeyedSubscript:v153];
            v155 = v154;
            if (v154)
            {
              id v156 = [v154 objectAtIndexedSubscript:0];
              v157 = [v156 sectionBundleIdentifier];
              unsigned int v158 = [v157 isEqualToString:v214];

              if (v158)
              {
                id v156 = v156;

                id v230 = v156;
              }
              id v5 = v222;
              long long v25 = v229;
            }
            else
            {
              v246[0] = v40;
              v246[1] = v25;
              id v156 = +[NSArray arrayWithObjects:v246 count:2];
              [v137 setObject:v156 forKeyedSubscript:v153];
            }
          }
          v159 = [v40 sectionBundleIdentifier];
          unsigned int v160 = [v159 isEqualToString:v207];

          if (v160)
          {
            v161 = [v40 identifier];
            id v162 = [v161 rangeOfCharacterFromSet:v202];
            if (v162 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v163 = (unint64_t)v162;
              if (v162 < [v161 length])
              {
                v164 = [v161 substringToIndex:v163];
                v165 = objc_msgSend(v161, "substringWithRange:", v163 + 1, (char *)objc_msgSend(v161, "length") + ~v163);
                if ([v164 length] && objc_msgSend(v165, "length"))
                {
                  id v221 = v41;
                  v166 = [v8 objectForKeyedSubscript:v165];
                  [v166 objectAtIndexedSubscript:1];
                  v168 = v167 = v8;
                  v169 = [v166 objectAtIndexedSubscript:0];
                  long long v25 = v229;
                  if (v166)
                  {
                    if ([v164 compare:v168] == (id)1)
                    {
                      v244 = v40;
                      v245 = v164;
                      v170 = +[NSArray arrayWithObjects:&v244 count:2];
                      [v217 setObject:v170 forKeyedSubscript:v165];

                      id v171 = v40;
                      id v172 = v171;
                      long long v25 = v229;
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
                    v173 = +[NSArray arrayWithObjects:&v244 count:2];
                    [v167 setObject:v173 forKeyedSubscript:v165];
                  }

                  id v8 = v217;
                  id v41 = v221;
                  long long v40 = v231;
                }
                else
                {
                  long long v25 = v229;
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
          id v182 = [v181 count];

          unint64_t v36 = v35;
          long long v37 = v41;
        }
        while ((unint64_t)v182 > v35);
LABEL_204:
        v183 = [v25 resultSet];
        uint64_t v24 = v225;
        [v183 removeObjectsAtIndexes:v225];

        id v7 = v185;
LABEL_205:

        id v6 = v213;
LABEL_206:
        uint64_t v16 = v200 + 1;
      }
      while ((id)(v200 + 1) != v195);
      id v195 = [obj countByEnumeratingWithState:&v240 objects:v259 count:16];
    }
    while (v195);
  }
}

- (void)addDictionarySections:(id)a3
{
  id v4 = a3;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v48 = self;
  id v5 = self->_actualSentSections;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v66;
    uint64_t v9 = SSSectionIdentifierTopHits;
    uint64_t v10 = PRSRankingParsecDictionaryBundleString;
    id v46 = v4;
    long long v47 = v5;
    uint64_t v45 = SSSectionIdentifierTopHits;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v66 != v8) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        if ([v12 resultsCount])
        {
          unsigned int v13 = [v12 bundleIdentifier];
          unsigned int v14 = [v13 isEqualToString:v9];

          if (v14)
          {
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            int v15 = [v12 resultSet];
            id v16 = [v15 countByEnumeratingWithState:&v61 objects:v72 count:16];
            if (v16)
            {
              id v17 = v16;
              uint64_t v18 = *(void *)v62;
              while (2)
              {
                for (j = 0; j != v17; j = (char *)j + 1)
                {
                  if (*(void *)v62 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  long long v20 = [*(id *)(*((void *)&v61 + 1) + 8 * (void)j) sectionBundleIdentifier];
                  unsigned __int8 v21 = [v20 isEqualToString:v10];

                  if (v21)
                  {
                    int v24 = 1;
                    id v4 = v46;
                    id v5 = v47;
                    goto LABEL_22;
                  }
                }
                id v17 = [v15 countByEnumeratingWithState:&v61 objects:v72 count:16];
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
            id v22 = [v12 bundleIdentifier];
            unsigned int v23 = [v22 isEqualToString:v10];

            if (v23)
            {
              long long v59 = 0u;
              long long v60 = 0u;
              long long v57 = 0u;
              long long v58 = 0u;
              int v15 = [v12 resultSet];
              id v41 = [v15 countByEnumeratingWithState:&v57 objects:v71 count:16];
              if (v41)
              {
                id v42 = v41;
                uint64_t v43 = *(void *)v58;
                id v4 = v46;
                while (2)
                {
                  for (k = 0; k != v42; k = (char *)k + 1)
                  {
                    if (*(void *)v58 != v43) {
                      objc_enumerationMutation(v15);
                    }
                    if ((int)[*(id *)(*((void *)&v57 + 1) + 8 * (void)k) topHit] > 0)
                    {
                      int v24 = 1;
                      goto LABEL_22;
                    }
                  }
                  id v42 = [v15 countByEnumeratingWithState:&v57 objects:v71 count:16];
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
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v65 objects:v73 count:16];
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
  long long v25 = (NSArray *)v4;
  id v26 = [(NSArray *)v25 countByEnumeratingWithState:&v53 objects:v70 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v54;
    uint64_t v29 = PRSRankingDictionaryBundleString;
LABEL_26:
    uint64_t v30 = 0;
    while (1)
    {
      if (*(void *)v54 != v28) {
        objc_enumerationMutation(v25);
      }
      uint64_t v31 = *(void **)(*((void *)&v53 + 1) + 8 * v30);
      unsigned __int8 v32 = [v31 bundleIdentifier];
      unsigned int v33 = [v32 isEqualToString:v29];

      if (v33) {
        break;
      }
      if (v27 == (id)++v30)
      {
        id v27 = [(NSArray *)v25 countByEnumeratingWithState:&v53 objects:v70 count:16];
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
    id v34 = [v31 resultSet];
    id v35 = [v34 countByEnumeratingWithState:&v49 objects:v69 count:16];
    if (!v35)
    {
LABEL_41:

      goto LABEL_44;
    }
    id v36 = v35;
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
      if (v36 == (id)++v38)
      {
        id v36 = [v34 countByEnumeratingWithState:&v49 objects:v69 count:16];
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
  BOOL v352 = a8;
  BOOL v361 = a4;
  BOOL v362 = a7;
  BOOL v360 = a6;
  BOOL v355 = a5;
  id v11 = (NSArray *)a3;
  id v12 = [(SDSearchQuery *)self queryContext];
  id v13 = [v12 queryKind];
  unsigned int v14 = [(SDSearchQuery *)self connection];
  id v15 = [v14 bundleID];
  if (qword_1000A8E08 != -1) {
    dispatch_once(&qword_1000A8E08, &stru_100092AB0);
  }
  if (byte_1000A8E05) {
    goto LABEL_4;
  }
  if (byte_1000A8E04)
  {
    if (([v15 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
      || ([v15 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
    {
LABEL_4:
      char v16 = 1;
      goto LABEL_5;
    }
    unsigned __int8 v22 = [v15 hasPrefix:@"com.apple.ondeviceeval"];
    if (v13 == (id)12) {
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

  char v379 = v16;
  if ((v16 & 1) == 0) {
    [(SDSearchQuery *)self serverSideDedupe:v11];
  }
  BOOL v17 = a9;
  v387 = self;
  v353 = [(NSArray *)v11 count];
  if (v353)
  {
    p_sentSections = &self->_sentSections;
    if ([(NSArray *)self->_sentSections count])
    {
      unsigned int v19 = [(SDSearchQuery *)self didReceiveCoreSpotlightProgress];
      if (a10 <= 1 && v19)
      {
        [(SSBullseyeTopHitsManager *)self->_topHitsManager resetVisibilityCounts];
        sub_1000160C0(self->_actualSentSections);
        long long v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        actualSentSections = self->_actualSentSections;
        self->_actualSentSections = v20;
      }
      else if (a10 == 3)
      {
        long long v25 = [(NSArray *)v11 firstObject];
        id v26 = [v25 bundleIdentifier];
        id v27 = [(NSArray *)*p_sentSections firstObject];
        uint64_t v28 = [v27 bundleIdentifier];
        unsigned int v29 = [v26 isEqual:v28];

        if (v29)
        {
          self = v387;
          [(SSBullseyeTopHitsManager *)v387->_topHitsManager resetVisibilityCounts];
          id v30 = [(NSArray *)v11 copy];
        }
        else
        {
          id v30 = 0;
          self = v387;
        }
        sub_1000160C0(self->_actualSentSections);
        uint64_t v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
        unsigned __int8 v32 = self->_actualSentSections;
        self->_actualSentSections = v31;

        BOOL v17 = a9;
        if (v30) {
          goto LABEL_34;
        }
      }
      if ((v379 & 1) != 0 || [(SDSearchQuery *)self isBullseyeCommittedSearch])
      {
        id v33 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithCapacity:", -[NSArray count](*p_sentSections, "count"));
        id v34 = v33;
        if (v17)
        {
          [v33 addObjectsFromArray:v11];
          id v35 = *p_sentSections;
        }
        else
        {
          [v33 addObjectsFromArray:*p_sentSections];
          id v35 = v11;
        }
        [v34 addObjectsFromArray:v35];
        id v30 = [v34 array];

        goto LABEL_34;
      }
      id v24 = [(NSArray *)*p_sentSections arrayByAddingObjectsFromArray:v11];
    }
    else
    {
      id v24 = [(NSArray *)v11 copy];
    }
    id v30 = v24;
LABEL_34:
    objc_storeStrong((id *)p_sentSections, v30);

    int v23 = 1;
    goto LABEL_35;
  }
  int v23 = v360 || v362 || v361 || v355;
LABEL_35:
  int v357 = v23;
  id v36 = [(SDSearchQuery *)self queryContext];
  id v37 = [v36 queryKind];
  uint64_t v38 = [(SDSearchQuery *)self connection];
  id v39 = [v38 bundleID];
  if (qword_1000A8E08 != -1) {
    dispatch_once(&qword_1000A8E08, &stru_100092AB0);
  }
  if (byte_1000A8E05) {
    goto LABEL_38;
  }
  if (byte_1000A8E04)
  {
    if (([v39 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
      || ([v39 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
    {
LABEL_38:

      v388 = 0;
      v414 = 0;
      v415 = 0;
      v413 = 0;
      id v386 = 0;
      double v40 = -1.79769313e308;
      goto LABEL_39;
    }
    unsigned __int8 v50 = [v39 hasPrefix:@"com.apple.ondeviceeval"];

    v388 = 0;
    double v40 = -1.79769313e308;
    if (v37 == (id)12 || (v50 & 1) != 0)
    {
      self = v387;
      v414 = 0;
      v415 = 0;
      v413 = 0;
      id v386 = 0;
      goto LABEL_39;
    }
  }
  else
  {
  }
  uint64_t v367 = SSMaxSectionsBelowSuggestions();
  long long v462 = 0u;
  long long v463 = 0u;
  long long v464 = 0u;
  long long v465 = 0u;
  long long v51 = v11;
  id v416 = [(NSArray *)v51 countByEnumeratingWithState:&v462 objects:v485 count:16];
  if (!v416)
  {
    v414 = 0;
    v415 = 0;
    v413 = 0;
    id v386 = 0;
    double v40 = -1.79769313e308;
    goto LABEL_105;
  }
  v414 = 0;
  v415 = 0;
  id v386 = 0;
  uint64_t v406 = *(void *)v463;
  v413 = 0;
  uint64_t v400 = SSPeopleBundleIdentifier;
  id v395 = (id)SSContactsBundleIdentifier;
  uint64_t v390 = SSSectionIdentifierSuggestions;
  double v40 = -1.79769313e308;
  uint64_t v389 = SSSectionIdentifierTopHits;
  id obj = v51;
  do
  {
    for (i = 0; i != v416; i = (char *)i + 1)
    {
      if (*(void *)v463 != v406) {
        objc_enumerationMutation(obj);
      }
      long long v53 = *(void **)(*((void *)&v462 + 1) + 8 * i);
      long long v54 = [v53 bundleIdentifier];
      unsigned int v55 = [v54 isEqual:v400];

      if (v55)
      {
        id v56 = v53;

        v415 = v56;
      }
      long long v57 = [v53 bundleIdentifier];
      unsigned int v58 = [v57 isEqual:v395];

      if (v58)
      {
        id v59 = v53;

        v414 = v59;
      }
      long long v60 = [v53 bundleIdentifier];
      unsigned int v61 = [v60 isEqual:v390];

      if (v61)
      {
        id v62 = v53;

        v413 = v62;
      }
      long long v63 = [v53 bundleIdentifier];
      if ([v63 isEqualToString:v389])
      {
        long long v64 = [v53 results];
        id v65 = [v64 count];

        if (v65 != (id)1) {
          goto LABEL_71;
        }
        long long v63 = v386;
        id v386 = v53;
      }

LABEL_71:
      long long v460 = 0u;
      long long v461 = 0u;
      long long v458 = 0u;
      long long v459 = 0u;
      long long v66 = [v53 results];
      id v67 = [v66 countByEnumeratingWithState:&v458 objects:v484 count:16];
      if (v67)
      {
        id v68 = v67;
        char v69 = 0;
        uint64_t v70 = *(void *)v459;
        do
        {
          for (j = 0; j != v68; j = (char *)j + 1)
          {
            if (*(void *)v459 != v70) {
              objc_enumerationMutation(v66);
            }
            id v72 = *(void **)(*((void *)&v458 + 1) + 8 * (void)j);
            unsigned int v73 = [v72 type];
            unsigned int v74 = [v72 type];
            if (v73 != 36)
            {
              unsigned int v79 = v74;
              if ([v72 type] != 2 && v79 != 37) {
                continue;
              }
            }
            uint64_t v75 = [v72 rankingItem];
            v76 = [v75 L2FeatureVector];
            [v76 originalL2Score];
            double v78 = v77;

            if (v40 < v78) {
              double v40 = v78;
            }
            char v69 = 1;
          }
          id v68 = [v66 countByEnumeratingWithState:&v458 objects:v484 count:16];
        }
        while (v68);

        if ((v69 & 1) != 0
          && ([(SDSearchQuery *)v387 isNLPSearch]
           || [(SDSearchQuery *)v387 isPeopleSearch]))
        {
          objc_msgSend(v53, "setMaxInitiallyVisibleResults:", objc_msgSend(v53, "resultsCount"));
        }
      }
      else
      {
      }
    }
    long long v51 = obj;
    id v416 = [(NSArray *)obj countByEnumeratingWithState:&v462 objects:v485 count:16];
  }
  while (v416);
LABEL_105:

  self = v387;
  if (a10 != 4)
  {
    v100 = [(SDSearchQuery *)v387 queryContext];
    uint64_t v101 = +[SSShortcutsRankingManager moveShortcutsToRelatedAppSectionsForAllSections:isAsYouTypeTopHitSearch:sectionBuilderBlock:](SSShortcutsRankingManager, "moveShortcutsToRelatedAppSectionsForAllSections:isAsYouTypeTopHitSearch:sectionBuilderBlock:", v51, [v100 queryKind] == (id)2, &stru_100092880);

    long long v51 = (NSArray *)v101;
  }
  long long v456 = 0u;
  long long v457 = 0u;
  long long v454 = 0u;
  long long v455 = 0u;
  id v11 = v51;
  id v102 = [(NSArray *)v11 countByEnumeratingWithState:&v454 objects:v483 count:16];
  if (!v102)
  {
    v388 = 0;
    goto LABEL_185;
  }
  id v103 = v102;
  v388 = 0;
  uint64_t v104 = *(void *)v455;
  id v105 = (id)SSContactsBundleIdentifier;
  uint64_t v106 = SSPeopleBundleIdentifier;
  id v396 = (id)SSContactsBundleIdentifier;
  uint64_t v401 = *(void *)v455;
  uint64_t v407 = SSPeopleBundleIdentifier;
  v366 = v11;
  while (2)
  {
    uint64_t v107 = 0;
    while (2)
    {
      if (*(void *)v455 != v104) {
        objc_enumerationMutation(v11);
      }
      v108 = *(void **)(*((void *)&v454 + 1) + 8 * v107);
      v109 = [v108 bundleIdentifier];
      unsigned int v110 = [v109 isEqual:v105];

      if (v110) {
        BOOL v111 = v415 == 0;
      }
      else {
        BOOL v111 = 1;
      }
      if (!v111) {
        goto LABEL_171;
      }
      v112 = [v108 bundleIdentifier];
      unsigned int v113 = [v112 isEqual:v106];

      if (v113 && v414 != 0) {
        goto LABEL_171;
      }
      id v115 = [v108 resultsCount];
      if (!v115) {
        goto LABEL_171;
      }
      id v116 = v115;
      if ([(SDSearchQuery *)self isScopedAppSearch])
      {
        [v108 setMaxInitiallyVisibleResults:50];
        unint64_t v417 = 50;
        goto LABEL_161;
      }
      if (!+[SDSearchQuery sectionSupportsShowMoreInApp:v108])
      {
        v125 = [v108 bundleIdentifier];
        char IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();

        if (IsSyndicatedPhotos)
        {
          unint64_t v417 = 14;
          self = v387;
        }
        else
        {
          self = v387;
          unint64_t v417 = (unint64_t)[(SDSearchQuery *)v387 maxCount];
        }
        goto LABEL_161;
      }
      unint64_t v417 = (unint64_t)[v108 maxInitiallyVisibleResults];
      if (v379 & 1) != 0 || (SPHideSearchThroughSuggestions()) {
        goto LABEL_149;
      }
      long long v452 = 0u;
      long long v453 = 0u;
      long long v450 = 0u;
      long long v451 = 0u;
      v117 = [v108 resultSet];
      id v118 = [v117 countByEnumeratingWithState:&v450 objects:v482 count:16];
      if (!v118)
      {
LABEL_148:

        goto LABEL_149;
      }
      id v119 = v118;
      uint64_t v120 = *(void *)v451;
      while (2)
      {
        uint64_t v121 = 0;
LABEL_131:
        if (*(void *)v451 != v120) {
          objc_enumerationMutation(v117);
        }
        v122 = *(void **)(*((void *)&v450 + 1) + 8 * v121);
        if ([v122 isFuzzyMatch])
        {
LABEL_137:
          if (v119 == (id)++v121)
          {
            id v119 = [v117 countByEnumeratingWithState:&v450 objects:v482 count:16];
            if (v119) {
              continue;
            }
            self = v387;
            id v105 = v396;
            uint64_t v104 = v401;
            goto LABEL_148;
          }
          goto LABEL_131;
        }
        break;
      }
      v123 = [v122 userActivityType];
      id v124 = v123;
      if (v123 && ![v123 isEqualToString:CSSearchableItemActionType])
      {

        goto LABEL_137;
      }

      uint64_t v127 = (uint64_t)v388;
      if (!v388) {
        uint64_t v127 = objc_opt_new();
      }
      v388 = (void *)v127;
      uint64_t v128 = [v108 title];
      self = v387;
      id v105 = v396;
      uint64_t v104 = v401;
      if (v128)
      {
        v129 = (void *)v128;
        uint64_t v130 = [v108 bundleIdentifier];

        if (v130)
        {
          v131 = [v108 bundleIdentifier];
          [v388 addObject:v131];

          v117 = [v108 title];
          [v388 addObject:v117];
          goto LABEL_148;
        }
      }
LABEL_149:
      if (v367)
      {
        id v374 = v116;
        unsigned int v132 = objc_opt_new();
        v133 = objc_opt_new();
        [v133 setActivityType:CSQueryContinuationActionType];
        id v370 = v133;
        [v132 setUserActivityData:v133];
        long long v448 = 0u;
        long long v449 = 0u;
        long long v446 = 0u;
        long long v447 = 0u;
        v134 = [v108 results];
        id v135 = [v134 countByEnumeratingWithState:&v446 objects:v481 count:16];
        if (v135)
        {
          id v136 = v135;
          uint64_t v137 = *(void *)v447;
          do
          {
            for (k = 0; k != v136; k = (char *)k + 1)
            {
              if (*(void *)v447 != v137) {
                objc_enumerationMutation(v134);
              }
              unsigned int v139 = *(void **)(*((void *)&v446 + 1) + 8 * (void)k);
              uint64_t v140 = [v139 moreResultsPunchout];
              uint64_t v141 = (void *)v140;
              if (v140) {
                v142 = (void *)v140;
              }
              else {
                v142 = v132;
              }
              [v139 setMoreResultsPunchout:v142];
            }
            id v136 = [v134 countByEnumeratingWithState:&v446 objects:v481 count:16];
          }
          while (v136);
        }

        self = v387;
        id v11 = v366;
        id v105 = v396;
        uint64_t v104 = v401;
        id v116 = v374;
      }
LABEL_161:
      unsigned int v143 = SPLogForSPLogCategoryQuery();
      os_log_type_t v144 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v143, v144))
      {
        v145 = [v108 title];
        unsigned int v146 = [v108 domain];
        *(_DWORD *)buf = 138413058;
        *(void *)&buf[4] = v145;
        __int16 v477 = 2048;
        *(void *)v478 = v146;
        *(_WORD *)&v478[8] = 2048;
        unint64_t v479 = v417;
        LOWORD(v480[0]) = 2048;
        *(void *)((char *)v480 + 2) = v116;
        _os_log_impl((void *)&_mh_execute_header, v143, v144, "Sending section title:%@, domain:%ld, maxCount:%ld, resultCount:%ld", buf, 0x2Au);

        self = v387;
      }

      v147 = [v108 resultSet];
      if ((unint64_t)[v147 count] <= v417)
      {
        uint64_t v106 = v407;
        goto LABEL_170;
      }
      id v148 = [(SDSearchQuery *)self queryContext];
      id v149 = [v148 queryKind];
      v150 = [(SDSearchQuery *)self connection];
      id v151 = [v150 bundleID];
      if (qword_1000A8E08 != -1) {
        dispatch_once(&qword_1000A8E08, &stru_100092AB0);
      }
      if (byte_1000A8E05)
      {
LABEL_167:

        id v105 = v396;
        uint64_t v104 = v401;
        uint64_t v106 = v407;
        goto LABEL_168;
      }
      if (!byte_1000A8E04)
      {

        id v105 = v396;
        uint64_t v104 = v401;
        uint64_t v106 = v407;
LABEL_180:
        v147 = [v108 resultSet];
        id v148 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithOrderedSet:range:copyItems:", v147, 0, v417, 1);
        [v108 setResultSet:v148];
LABEL_168:

LABEL_170:
        goto LABEL_171;
      }
      if (([v151 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
        || ([v151 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
      {
        goto LABEL_167;
      }
      unsigned __int8 v375 = [v151 hasPrefix:@"com.apple.ondeviceeval"];

      if (v149 == (id)12)
      {
        id v105 = v396;
        uint64_t v104 = v401;
        uint64_t v106 = v407;
        goto LABEL_171;
      }
      id v105 = v396;
      uint64_t v104 = v401;
      uint64_t v106 = v407;
      if ((v375 & 1) == 0) {
        goto LABEL_180;
      }
LABEL_171:
      if ((id)++v107 != v103) {
        continue;
      }
      break;
    }
    id v152 = [(NSArray *)v11 countByEnumeratingWithState:&v454 objects:v483 count:16];
    id v103 = v152;
    if (v152) {
      continue;
    }
    break;
  }
LABEL_185:

LABEL_39:
  if (!v357)
  {
    long long v49 = 0;
LABEL_232:
    v179 = v415;
    goto LABEL_318;
  }
  id v41 = SPLogForSPLogCategoryQuery();
  os_log_type_t v42 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v41, v42))
  {
    NSUInteger v43 = [(NSArray *)v11 count];
    *(_DWORD *)buf = 134219008;
    *(void *)&buf[4] = v43;
    __int16 v477 = 1024;
    *(_DWORD *)v478 = v362;
    *(_WORD *)&v478[4] = 1024;
    *(_DWORD *)&v478[6] = v361;
    LOWORD(v479) = 1024;
    *(_DWORD *)((char *)&v479 + 2) = v355;
    HIWORD(v479) = 1024;
    v480[0] = v360;
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "Sending results, sectionCount:%ld, complete:%d, reset:%d, partiallyComplete:%d, update:%d", buf, 0x24u);
  }

  if (qword_1000A8DD0 != -1) {
    dispatch_once(&qword_1000A8DD0, &stru_1000928A0);
  }
  long long v44 = v353;
  uint64_t v45 = SPMaxCountTopHits();
  SPMinTopHitThresholdForBigResult();
  double v47 = v46;
  v365 = v11;
  if ([(SDSearchQuery *)self isBullseyeCommittedSearch])
  {
    if (self->_isPeopleSearch) {
      unint64_t v48 = SPMaxSectionsBeforeShowMoreWithScopedSearch();
    }
    else {
      unint64_t v48 = SPMaxSectionsBeforeShowMore();
    }
  }
  else
  {
    unint64_t v48 = SSMaxSectionsBelowSuggestions();
  }
  if ((unint64_t)v353 >= v48) {
    id v80 = (id)v48;
  }
  else {
    id v80 = v353;
  }
  if (!self->_topHitsManager)
  {
    id v81 = objc_alloc((Class)SSBullseyeTopHitsManager);
    uint64_t v82 = *(void *)&self->SPSearchQuery_opaque[OBJC_IVAR___SPSearchQuery__queryID];
    categoryToResultMapping = v387->_categoryToResultMapping;
    topHitSection = v387->_topHitSection;
    v85 = [(SDSearchQuery *)v387 queryContext];
    v86 = categoryToResultMapping;
    self = v387;
    v87 = (SSBullseyeTopHitsManager *)[v81 initWithQueryId:v82 categoryToResultMapping:v86 currentTopHitSection:topHitSection queryContext:v85 ranker:v387->_itemRanker];
    topHitsManager = v387->_topHitsManager;
    v387->_topHitsManager = v87;
  }
  if (v379)
  {
LABEL_99:
    long long v44 = v365;
  }
  else if (v353)
  {
    v89 = [(SDSearchQuery *)self queryContext];
    unsigned __int8 v90 = [v89 searchEntities];
    if (v90)
    {
      [(SDSearchQuery *)self queryContext];
      unsigned int v92 = v91 = self;
      v93 = [v92 searchEntities];
      if ([v93 count])
      {
        v94 = [(SDSearchQuery *)v91 queryContext];
        [v94 searchEntities];
        id v95 = v80;
        id v97 = v96 = v45;
        v98 = [v97 lastObject];
        unsigned int v99 = [v98 isScopedSearch] ^ 1;

        uint64_t v45 = v96;
        id v80 = v95;
      }
      else
      {
        unsigned int v99 = 1;
      }

      self = v387;
    }
    else
    {
      unsigned int v99 = 1;
    }

    if (v360 || !v99) {
      goto LABEL_99;
    }
    v153 = [(NSArray *)self->_actualSentSections firstObject];
    v154 = v153;
    if (v153)
    {
      v155 = [v153 bundleIdentifier];
      unsigned __int8 v156 = [v155 isEqual:@"com.apple.spotlight.tophits"];

      if ((v156 & 1) == 0)
      {

        v154 = 0;
      }
      self = v387;
    }
    v157 = self->_topHitsManager;
    BOOL v158 = [(SDSearchQuery *)self isBullseyeCommittedSearch]
        || [(SDSearchQuery *)self isEntitySearch];
    id v445 = v154;
    long long v44 = [(SSBullseyeTopHitsManager *)v157 tagOrFilterHiddenSectionsForClient:v365 isCommittedSearch:v158 maxVisibleSections:v80 maxTopHitsCount:v45 minThresholdForBigResult:&v445 topHitSection:v47];
    id v159 = v445;

    if (v159 && [v159 resultsCount]) {
      self->_sentTaggedTopHits = 1;
    }
  }
  [(SDSearchQuery *)self queryIdent];
  unsigned int v160 = v44;
  v161 = v160;
  if (v160) {
    id v162 = v160;
  }
  else {
    id v162 = (NSArray *)&__NSArray0__struct;
  }
  if (a10 != 4)
  {
    id v172 = v162;
    goto LABEL_226;
  }
  if (![(NSArray *)v162 count])
  {
    id v172 = 0;
    goto LABEL_226;
  }
  unint64_t v163 = [(NSArray *)v162 objectAtIndex:0];
  v164 = [v163 bundleIdentifier];
  unsigned int v165 = [v164 isEqualToString:@"com.apple.spotlight.tophits"];

  if (!v165)
  {
LABEL_224:

    id v172 = 0;
    goto LABEL_225;
  }
  v166 = [v163 resultSet];
  v167 = [v166 objectAtIndexedSubscript:0];
  v168 = [v167 sectionBundleIdentifier];

  if (!v168 || !sub_100012A60(v168))
  {
LABEL_223:

    goto LABEL_224;
  }
  if (!SSIsCounterFactual())
  {
    int v173 = SSPriorityIndexFastPathEnabled();
    id v174 = objc_alloc((Class)NSUUID);
    if (v173)
    {
      id v175 = [v174 initWithUUIDString:priorityIndexDidTakeFastPathUUID];
      SSDefaultsLogForTrigger();

      goto LABEL_218;
    }
    id v176 = [v174 initWithUUIDString:priorityIndexDidNotTakeFastPathUUID];
    SSDefaultsLogForTrigger();

    id v171 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
LABEL_221:
      _os_log_impl((void *)&_mh_execute_header, v171, OS_LOG_TYPE_DEFAULT, "Withholding priority index fast path because it's disabled", buf, 2u);
    }
LABEL_222:

    goto LABEL_223;
  }
  id v169 = objc_alloc((Class)NSUUID);
  id v170 = [v169 initWithUUIDString:priorityIndexDidTakeFastPathUUID];
  SSDefaultsLogForTrigger();

  if (!SSPriorityIndexFastPathEnabled())
  {
    id v171 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      goto LABEL_221;
    }
    goto LABEL_222;
  }
LABEL_218:
  *(void *)buf = v163;
  id v172 = +[NSArray arrayWithObjects:buf count:1];

LABEL_225:
  self = v387;
LABEL_226:

  if (!v172)
  {
    v178 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v178, OS_LOG_TYPE_DEFAULT, "Withholding early priority index results", buf, 2u);
    }

    [(SSBullseyeTopHitsManager *)self->_topHitsManager resetVisibilityCounts];
    long long v49 = 0;
    id v11 = v365;
    goto LABEL_232;
  }
  id v418 = objc_alloc_init((Class)NSMutableArray);
  if (a10 == 4)
  {
    id obja = 0;
    id v177 = 0;
    goto LABEL_238;
  }
  v180 = [(SDSearchQuery *)self queryContext];
  id v181 = [(NSArray *)v180 queryKind];
  id v182 = [(SDSearchQuery *)self connection];
  id v183 = [v182 bundleID];
  if (qword_1000A8E08 != -1) {
    dispatch_once(&qword_1000A8E08, &stru_100092AB0);
  }
  if (byte_1000A8E05)
  {
LABEL_236:

    id obja = 0;
    id v177 = 0;
    goto LABEL_237;
  }
  if (byte_1000A8E04)
  {
    if (([v183 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
      || ([v183 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
    {
      goto LABEL_236;
    }
    unsigned __int8 v235 = [v183 hasPrefix:@"com.apple.ondeviceeval"];

    id v177 = 0;
    if (v181 == (id)12 || (v235 & 1) != 0)
    {
      id obja = 0;
      self = v387;
      goto LABEL_238;
    }
  }
  else
  {
  }
  unsigned int v257 = +[SSQueryIntentManager isEnabled];
  if (a10 == 2)
  {
    self = v387;
  }
  else
  {
    self = v387;
    if (v257 && [(SDSearchQuery *)v387 isBullseyeNonCommittedSearch])
    {
      v258 = [(SDSearchQuery *)v387 queryContext];
      v259 = [(SSRankingManager *)v387->_rankingManager rankingConfiguration];
      +[SSQueryIntentManager setQueryIntentForQueryContext:v258 sections:v172 rankingInfo:v259];

      v260 = [(SDSearchQuery *)v387 queryContext];
      uint64_t v261 = +[SSQueryIntentManager applySectionPolicyForQueryContext:v260 sections:v172];

      id v172 = (NSArray *)v261;
    }
  }
  v382 = v172;
  if (!v413)
  {
    id obja = 0;
    id v177 = 0;
    goto LABEL_403;
  }
  long long v443 = 0u;
  long long v444 = 0u;
  long long v441 = 0u;
  long long v442 = 0u;
  v398 = v172;
  id v403 = [(NSArray *)v398 countByEnumeratingWithState:&v441 objects:v475 count:16];
  if (!v403)
  {
    id obja = 0;
    id v177 = 0;
    goto LABEL_402;
  }
  id obja = 0;
  id v177 = 0;
  id v262 = *(id *)v442;
  id v263 = (id)SSSectionIdentifierTopHits;
  uint64_t v393 = SSShortcutsBundleIdentifier;
  id v372 = (id)SSSectionIdentifierTopHits;
  id v377 = *(id *)v442;
  while (2)
  {
    uint64_t v264 = 0;
    while (2)
    {
      if (*(id *)v442 != v262) {
        objc_enumerationMutation(v398);
      }
      uint64_t v411 = v264;
      v265 = *(void **)(*((void *)&v441 + 1) + 8 * v264);
      v266 = [v265 bundleIdentifier];
      unsigned int v267 = [v266 isEqual:v263];

      if (v267)
      {
        id v268 = v265;

        long long v439 = 0u;
        long long v440 = 0u;
        long long v437 = 0u;
        long long v438 = 0u;
        v269 = [v268 results];
        id v270 = [v269 countByEnumeratingWithState:&v437 objects:v474 count:16];
        if (v270)
        {
          id v271 = v270;
          uint64_t v272 = *(void *)v438;
          while (1)
          {
            for (m = 0; m != v271; m = (char *)m + 1)
            {
              if (*(void *)v438 != v272) {
                objc_enumerationMutation(v269);
              }
              v274 = *(void **)(*((void *)&v437 + 1) + 8 * (void)m);
              if (!v177)
              {
                v278 = [*(id *)(*((void *)&v437 + 1) + 8 * (void)m) contactIdentifier];
                if (v278)
                {

LABEL_386:
                  v280 = [v274 contactIdentifier];
                  id v277 = v280;
                  if (v280)
                  {
                    id v277 = v280;
                    id v177 = v277;
                  }
                  else
                  {
                    id v177 = [v274 personIdentifier];
                  }
LABEL_389:

                  continue;
                }
                v279 = [v274 personIdentifier];

                if (v279) {
                  goto LABEL_386;
                }
              }
              v275 = [v274 sectionBundleIdentifier];
              unsigned int v276 = [v275 isEqualToString:@"com.apple.application"];

              if (v276 && ![v418 count])
              {
                id v277 = [v274 resultBundleId];
                [v418 addObject:v277];
                goto LABEL_389;
              }
            }
            id v271 = [v269 countByEnumeratingWithState:&v437 objects:v474 count:16];
            if (!v271)
            {
              id v386 = v268;
              self = v387;
              id v263 = v372;
              id v262 = v377;
              goto LABEL_396;
            }
          }
        }
        id v386 = v268;
LABEL_396:
      }
      else
      {
        v281 = [v265 bundleIdentifier];
        unsigned int v282 = [v281 isEqual:v393];

        if (v282)
        {
          v269 = obja;
          id obja = v265;
          goto LABEL_396;
        }
      }
      uint64_t v264 = v411 + 1;
      if ((id)(v411 + 1) != v403) {
        continue;
      }
      break;
    }
    id v403 = [(NSArray *)v398 countByEnumeratingWithState:&v441 objects:v475 count:16];
    if (v403) {
      continue;
    }
    break;
  }
LABEL_402:

LABEL_403:
  v283 = [v415 resultSet];
  id v284 = [v283 count];

  if (!v284) {
    goto LABEL_473;
  }
  id v285 = objc_alloc_init((Class)NSMutableArray);
  v412 = objc_opt_new();
  v364 = objc_opt_new();
  v286 = [v415 results];
  id v287 = [v286 copy];

  v288 = [v414 results];
  id v289 = [v288 copy];

  long long v435 = 0u;
  long long v436 = 0u;
  long long v433 = 0u;
  long long v434 = 0u;
  id v378 = v289;
  id v290 = [v378 countByEnumeratingWithState:&v433 objects:v473 count:16];
  if (v290)
  {
    id v291 = v290;
    char v404 = 0;
    uint64_t v292 = *(void *)v434;
    do
    {
      for (n = 0; n != v291; n = (char *)n + 1)
      {
        if (*(void *)v434 != v292) {
          objc_enumerationMutation(v378);
        }
        v294 = *(void **)(*((void *)&v433 + 1) + 8 * (void)n);
        v295 = [v294 contactIdentifier];

        if (v295)
        {
          v296 = [v294 contactIdentifier];
          [v412 setObject:v294 forKey:v296];

          if ((v404 & 1) != 0
            || ([v294 contactIdentifier],
                v297 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v298 = [v297 isEqualToString:v177],
                v297,
                (v298 & 1) == 0))
          {
            [v285 addObject:v294];
          }
          else
          {
            char v404 = 1;
          }
        }
        self = v387;
      }
      id v291 = [v378 countByEnumeratingWithState:&v433 objects:v473 count:16];
    }
    while (v291);
  }
  else
  {
    char v404 = 0;
  }

  if (qword_1000A8DE0 != -1) {
    dispatch_once(&qword_1000A8DE0, &stru_1000928C0);
  }
  id v399 = v285;
  long long v431 = 0u;
  long long v432 = 0u;
  long long v429 = 0u;
  long long v430 = 0u;
  id v373 = v287;
  id v299 = [v373 countByEnumeratingWithState:&v429 objects:v472 count:16];
  if (!v299)
  {
    id v301 = 0;
    goto LABEL_444;
  }
  id v300 = v299;
  id v301 = 0;
  uint64_t v302 = *(void *)v430;
  while (2)
  {
    uint64_t v303 = 0;
    while (2)
    {
      if (*(void *)v430 != v302) {
        objc_enumerationMutation(v373);
      }
      v304 = *(void **)(*((void *)&v429 + 1) + 8 * v303);
      v305 = [v304 personIdentifier];

      if (v305)
      {
        v306 = (void *)qword_1000A8DD8;
        v307 = [v304 personIdentifier];
        id v428 = v301;
        id v308 = [v306 unifiedContactWithIdentifier:v307 keysToFetch:qword_1000A8DE8 error:&v428];
        id v309 = v428;
        v310 = v301;
        id v301 = v309;

        if (v301)
        {
          if ([v301 code] != (id)200)
          {
            v311 = SPLogForSPLogCategoryDefault();
            if (os_log_type_enabled(v311, OS_LOG_TYPE_DEFAULT))
            {
              id v312 = [v301 localizedDescription];
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v312;
              _os_log_impl((void *)&_mh_execute_header, v311, OS_LOG_TYPE_DEFAULT, "*warn* CNContactStore fetch error: %@", buf, 0xCu);
            }
            goto LABEL_439;
          }
        }
        else
        {
          v313 = [v304 personIdentifier];
          v314 = [v412 objectForKey:v313];

          if (v314)
          {
            id v301 = 0;
          }
          else
          {
            v315 = [v304 personIdentifier];
            [v412 setObject:v304 forKey:v315];

            v316 = [v304 title];
            v317 = [v316 text];
            v311 = SSNormalizedQueryString();

            if (([v364 containsObject:v311] & 1) == 0)
            {
              [v364 addObject:v311];
              if ((v404 & 1) == 0)
              {
                v318 = [v304 personIdentifier];
                unsigned __int8 v319 = [v318 isEqualToString:v177];

                if (v319)
                {
                  id v301 = 0;
                  char v404 = 1;
                  goto LABEL_439;
                }
              }
              [v399 addObject:v304];
            }
            id v301 = 0;
LABEL_439:
          }
        }
      }
      if (v300 != (id)++v303) {
        continue;
      }
      break;
    }
    id v300 = [v373 countByEnumeratingWithState:&v429 objects:v472 count:16];
    if (v300) {
      continue;
    }
    break;
  }
LABEL_444:

  id v320 = [v399 count];
  if ((unint64_t)v320 >= SPMaxVisibleResultsCountPerSection()) {
    id v321 = (id)SPMaxVisibleResultsCountPerSection();
  }
  else {
    id v321 = [v399 count];
  }
  id v405 = v321;
  v359 = v301;
  long long v426 = 0u;
  long long v427 = 0u;
  long long v424 = 0u;
  long long v425 = 0u;
  id v172 = v382;
  id v322 = [(NSArray *)v172 countByEnumeratingWithState:&v424 objects:v471 count:16];
  if (v322)
  {
    id v323 = v322;
    uint64_t v394 = 0;
    uint64_t v324 = *(void *)v425;
    uint64_t v325 = SSContactsBundleIdentifier;
    uint64_t v369 = SSPeopleBundleIdentifier;
    uint64_t v326 = -1;
    v383 = v172;
    do
    {
      for (ii = 0; ii != v323; ii = (char *)ii + 1)
      {
        if (*(void *)v425 != v324) {
          objc_enumerationMutation(v383);
        }
        v328 = *(void **)(*((void *)&v424 + 1) + 8 * (void)ii);
        v329 = [v328 bundleIdentifier];
        unsigned int v330 = [v329 isEqual:v325];

        if (v330)
        {
          [v328 setMaxInitiallyVisibleResults:v405];
          [v328 setResults:v399];
        }
        else
        {
          v331 = [v328 bundleIdentifier];
          unsigned int v332 = [v331 isEqual:v369];

          if (v332) {
            uint64_t v333 = (uint64_t)ii + v394;
          }
          else {
            uint64_t v333 = v326;
          }
          if (v332) {
            BOOL v334 = v414 == 0;
          }
          else {
            BOOL v334 = 0;
          }
          if (v334)
          {
            [v328 setBundleIdentifier:v325];
            [v328 setMaxInitiallyVisibleResults:v405];
            [v328 setResults:v399];
            self = v387;
            v335 = v388;
            if (!v388) {
              v335 = objc_opt_new();
            }
            v336 = [v328 bundleIdentifier];
            [v335 addObject:v336];

            v337 = [v328 title];
            v388 = v335;
            [v335 addObject:v337];
          }
          else
          {
            uint64_t v326 = v333;
            self = v387;
          }
        }
      }
      v394 += (uint64_t)v323;
      id v172 = v383;
      id v323 = [(NSArray *)v383 countByEnumeratingWithState:&v424 objects:v471 count:16];
    }
    while (v323);

    if (v326 < 0)
    {
      v338 = v412;
      v339 = v364;
    }
    else
    {
      v338 = v412;
      v339 = v364;
      if (v414)
      {
        id v340 = [(NSArray *)v383 mutableCopy];
        [v340 removeObjectAtIndex:v326];
        v341 = (NSArray *)v340;

        id v172 = v341;
        goto LABEL_471;
      }
    }
  }
  else
  {
    v338 = v412;
    v339 = v364;
LABEL_471:
  }
LABEL_473:
  if (v413)
  {
    long long v422 = 0u;
    long long v423 = 0u;
    long long v420 = 0u;
    long long v421 = 0u;
    v180 = v172;
    id v342 = [(NSArray *)v180 countByEnumeratingWithState:&v420 objects:v470 count:16];
    if (v342)
    {
      id v343 = v342;
      uint64_t v344 = *(void *)v421;
      uint64_t v345 = SSSectionIdentifierSuggestions;
      do
      {
        for (jj = 0; jj != v343; jj = (char *)jj + 1)
        {
          if (*(void *)v421 != v344) {
            objc_enumerationMutation(v180);
          }
          v347 = *(void **)(*((void *)&v420 + 1) + 8 * (void)jj);
          v348 = [v347 bundleIdentifier];
          unsigned int v349 = [v348 isEqual:v345];

          if (v349)
          {
            v350 = [(SDSearchQuery *)v387 suggestionsWithSearchString:*(void *)&v387->SPSearchQuery_opaque[OBJC_IVAR___SPSearchQuery__searchString] sections:v180 topHitSection:v386 highestLocalScore:v40];
            [v347 setResults:v350];
          }
        }
        id v343 = [(NSArray *)v180 countByEnumeratingWithState:&v420 objects:v470 count:16];
      }
      while (v343);
      id v172 = v180;
      self = v387;
    }
    else
    {
      id v172 = v180;
    }
LABEL_237:
  }
LABEL_238:
  uint64_t v184 = [(SDSearchQuery *)self queryContext];
  id v185 = [v184 queryKind];
  uint64_t v186 = [(SDSearchQuery *)self connection];
  id v187 = [v186 bundleID];
  if (qword_1000A8E08 != -1) {
    dispatch_once(&qword_1000A8E08, &stru_100092AB0);
  }
  if (byte_1000A8E05)
  {
LABEL_241:

    goto LABEL_242;
  }
  if (!byte_1000A8E04)
  {

    v188 = (id *)v387;
    goto LABEL_243;
  }
  if (([v187 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
    || ([v187 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
  {
    goto LABEL_241;
  }
  unsigned __int8 v205 = [v187 hasPrefix:@"com.apple.ondeviceeval"];

  if (v185 == (id)12 || (v205 & 1) != 0)
  {
LABEL_242:
    v188 = (id *)v387;
    uint64_t v184 = [(SDSearchQuery *)v387 queryContext];
    +[SSRankingManager processSearchToolFinalResults:v172 queryContext:v184];
    uint64_t v186 = v172;
    id v172 = (NSArray *)objc_claimAutoreleasedReturnValue();
LABEL_243:

    goto LABEL_244;
  }
  v188 = (id *)v387;
LABEL_244:
  id v189 = +[SSTopHitNominationManager postProcessSectionsBasedOnTopHitSection:v172 withTopHitSection:v386];

  +[SSTopHitNominationManager finalizeTopHitsInSections:v189 withTopHitSection:v386];
  +[SSRankingManager fillRankingPosition:v189];
  if (a10 != 2) {
    goto LABEL_249;
  }
  uint64_t v190 = [v188 queryContext];
  id v191 = [v190 queryKind];
  v192 = [v188 connection];
  id v193 = [v192 bundleID];
  if (qword_1000A8E08 != -1) {
    dispatch_once(&qword_1000A8E08, &stru_100092AB0);
  }
  if (byte_1000A8E05)
  {
LABEL_248:

    v188 = (id *)v387;
    goto LABEL_249;
  }
  if (byte_1000A8E04)
  {
    if (([v193 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
      || ([v193 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
    {
      goto LABEL_248;
    }
    unsigned __int8 v236 = [v193 hasPrefix:@"com.apple.ondeviceeval"];

    v188 = (id *)v387;
    if (v191 == (id)12 || (v236 & 1) != 0)
    {
LABEL_249:
      objc_storeStrong(v188 + 19, v189);
      goto LABEL_250;
    }
  }
  else
  {

    v188 = (id *)v387;
  }
  [v188 addDictionarySections:v189];
LABEL_250:
  uint64_t v194 = [v188 queryContext];
  id v195 = [v194 queryKind];
  v196 = v188;
  id v197 = v195;
  v198 = [v196 connection];
  id v199 = [v198 bundleID];
  if (qword_1000A8E08 != -1) {
    dispatch_once(&qword_1000A8E08, &stru_100092AB0);
  }
  v402 = v189;
  if (byte_1000A8E05)
  {
LABEL_253:
    uint64_t v200 = v199;
    goto LABEL_254;
  }
  if (byte_1000A8E04)
  {
    if (([v199 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
      || ([v199 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
    {
      goto LABEL_253;
    }
    unsigned __int8 v206 = [v199 hasPrefix:@"com.apple.ondeviceeval"];

    if (v197 == (id)12 || (v206 & 1) != 0) {
      goto LABEL_255;
    }
  }
  else
  {
  }
  uint64_t v194 = +[SDFeedbackInterceptor sharedInstance];
  long long v237 = v387->_actualSentSections;
  uint64_t v409 = *(void *)&v387->SPSearchQuery_opaque[OBJC_IVAR___SPSearchQuery__searchString];
  id v397 = [(SDSearchQuery *)v387 queryIdent];
  BOOL allowAnonymousDataCollection = v387->_allowAnonymousDataCollection;
  itemRanker = v387->_itemRanker;
  v198 = [(SSRankingManager *)v387->_rankingManager rankingConfiguration];
  unsigned __int8 v239 = [(SDSearchQuery *)v387 internalDebug];
  uint64_t v200 = [(SDSearchQuery *)v387 queryContext];
  id v199 = [v200 keyboardPrimaryLanguage];
  long long v240 = [(SDSearchQuery *)v387 connection];
  long long v241 = [v240 bundleID];
  LOBYTE(v351) = v239;
  [v194 willSendSections:v237 forQuery:v409 queryIdentifier:v397 allowAnonymousDataCollection:allowAnonymousDataCollection withRankerUsed:itemRanker withRankingConfiguration:v198 internalDebug:v351 keyboardPrimaryLanguage:v199 clientID:v241];

  id v189 = v402;
LABEL_254:

LABEL_255:
  if ([(SDSearchQuery *)v387 isInternalDevice] && v362) {
    [(SDSearchQuery *)v387 sendTTRLogsWithSections:v387->_actualSentSections];
  }
  unint64_t v201 = (unint64_t)[v189 count];
  if (v201 % 7) {
    unint64_t v202 = v201 / 7 + 1;
  }
  else {
    unint64_t v202 = v201 / 7;
  }
  unint64_t v203 = 6;
  do
  {
    if (v202 % dword_1000A8DC8) {
      break;
    }
    unint64_t v202 = v201 % v203 ? v201 / v203 + 1 : v201 / v203;
  }
  while (v203-- > 4);
  if (v201)
  {
    BOOL v358 = 0;
    goto LABEL_283;
  }
  if (v387->_sendStableSections)
  {
    BOOL v358 = [(NSArray *)v387->_stableSections count] != 0;
    unint64_t v202 = 1;
LABEL_283:
    id v408 = [objc_alloc((Class)SPXPCMessage) initWithName:@"SearchResults" batchSize:v202];
    v468[0] = @"TBC";
    id v380 = +[NSNumber numberWithUnsignedInteger:v202];
    v469[0] = v380;
    v468[1] = @"QID";
    uint64_t v207 = +[NSNumber numberWithUnsignedInt:v387->_externalID];
    id v376 = (id)v207;
    CFStringRef fbq = (const __CFString *)v387->_fbq;
    if (!fbq) {
      CFStringRef fbq = &stru_100094088;
    }
    v469[1] = v207;
    v469[2] = fbq;
    web_CFStringRef fbq = (const __CFString *)v387->_web_fbq;
    v468[2] = @"FBQ";
    v468[3] = @"WFBQ";
    if (!web_fbq) {
      web_CFStringRef fbq = &stru_100094088;
    }
    v469[3] = web_fbq;
    v468[4] = @"QDR";
    id v371 = +[NSNumber numberWithBool:v361];
    v469[4] = v371;
    v468[5] = @"QDP";
    v368 = +[NSNumber numberWithBool:v355];
    v469[5] = v368;
    v468[6] = @"QFP";
    v363 = +[NSNumber numberWithInt:a10 == 4];
    v469[6] = v363;
    v468[7] = @"QDU";
    v356 = +[NSNumber numberWithBool:v360];
    v469[7] = v356;
    v468[8] = @"QDC";
    uint64_t v210 = +[NSNumber numberWithBool:v362];
    v469[8] = v210;
    v468[9] = @"DTH";
    v354 = +[NSNumber numberWithBool:a9];
    v469[9] = v354;
    v468[10] = @"QNC";
    v211 = +[NSNumber numberWithBool:v352];
    v469[10] = v211;
    v468[11] = @"QFS";
    uint64_t v212 = +[NSNumber numberWithBool:v358];
    v469[11] = v212;
    v468[12] = @"BT";
    v213 = +[NSNumber numberWithDouble:v387->_blendingTime];
    v469[12] = v213;
    v468[13] = @"GES";
    uint64_t v214 = [(SDSearchQuery *)v387 geoUserSessionEntityString];
    uint64_t v215 = (void *)v214;
    if (v214) {
      CFStringRef v216 = (const __CFString *)v214;
    }
    else {
      CFStringRef v216 = &stru_100094088;
    }
    bundlesSupportingAppScoping = v387->_bundlesSupportingAppScoping;
    if (!bundlesSupportingAppScoping) {
      bundlesSupportingAppScoping = (NSArray *)&__NSArray0__struct;
    }
    v469[13] = v216;
    v469[14] = bundlesSupportingAppScoping;
    v468[14] = @"SAS";
    v468[15] = @"SMIA";
    int v218 = v388;
    if (!v388) {
      int v218 = &__NSArray0__struct;
    }
    v469[15] = v218;
    unsigned int v219 = +[NSDictionary dictionaryWithObjects:v469 forKeys:v468 count:16];
    [v408 setInfo:v219];

    v220 = v402;
    id v419 = v402;
    id v221 = v408;
    v222 = v387;
    tracing_dispatch_apply();
    if (([(SDSearchQuery *)v387 cancelled] & 1) == 0) {
      [(SPXPCConnection *)v387->_connection sendMessage:v221];
    }
  }
  else
  {
    id v221 = [objc_alloc((Class)SPXPCMessage) initWithName:@"SearchResults"];
    v466[0] = @"QID";
    uint64_t v242 = +[NSNumber numberWithUnsignedInt:v387->_externalID];
    v410 = (void *)v242;
    CFStringRef v243 = (const __CFString *)v387->_fbq;
    if (!v243) {
      CFStringRef v243 = &stru_100094088;
    }
    v467[0] = v242;
    v467[1] = v243;
    CFStringRef v244 = (const __CFString *)v387->_web_fbq;
    v466[1] = @"FBQ";
    v466[2] = @"WFBQ";
    if (!v244) {
      CFStringRef v244 = &stru_100094088;
    }
    v467[2] = v244;
    v466[3] = @"QDR";
    v392 = +[NSNumber numberWithBool:v361];
    v467[3] = v392;
    v466[4] = @"QDP";
    id v381 = +[NSNumber numberWithBool:v355];
    v467[4] = v381;
    v466[5] = @"QFP";
    v245 = +[NSNumber numberWithInt:a10 == 4];
    v467[5] = v245;
    v466[6] = @"QDU";
    v246 = +[NSNumber numberWithBool:v360];
    v467[6] = v246;
    v466[7] = @"QDC";
    v247 = +[NSNumber numberWithBool:v362];
    v467[7] = v247;
    v466[8] = @"QNC";
    v248 = +[NSNumber numberWithBool:v352];
    v467[8] = v248;
    v466[9] = @"BT";
    id v249 = +[NSNumber numberWithDouble:v387->_blendingTime];
    v467[9] = v249;
    v466[10] = @"GES";
    uint64_t v250 = [(SDSearchQuery *)v387 geoUserSessionEntityString];
    id v251 = (void *)v250;
    CFStringRef v252 = &stru_100094088;
    if (v250) {
      CFStringRef v252 = (const __CFString *)v250;
    }
    v253 = v387->_bundlesSupportingAppScoping;
    if (!v253) {
      v253 = (NSArray *)&__NSArray0__struct;
    }
    v467[10] = v252;
    v467[11] = v253;
    v466[11] = @"SAS";
    v466[12] = @"SMIA";
    v254 = v388;
    if (!v388) {
      v254 = &__NSArray0__struct;
    }
    v467[12] = v254;
    v255 = +[NSDictionary dictionaryWithObjects:v467 forKeys:v466 count:13];
    [v221 setInfo:v255];

    v222 = v387;
    if (([(SDSearchQuery *)v387 cancelled] & 1) == 0) {
      [(SPXPCConnection *)v387->_connection sendMessage:v221];
    }
    v220 = v402;
  }

  stableSections = v222->_stableSections;
  v222->_stableSections = 0;

  id v224 = [(SDSearchQuery *)v222 queryContext];
  id v225 = [v224 queryKind];
  v226 = v222;
  id v227 = v225;
  v228 = [(SDSearchQuery *)v226 connection];
  id v229 = [v228 bundleID];
  if (qword_1000A8E08 != -1) {
    dispatch_once(&qword_1000A8E08, &stru_100092AB0);
  }
  if (byte_1000A8E05)
  {
LABEL_300:

    goto LABEL_301;
  }
  if (byte_1000A8E04)
  {
    if (([v229 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
      || ([v229 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
    {
      goto LABEL_300;
    }
    unsigned __int8 v234 = [v229 hasPrefix:@"com.apple.ondeviceeval"];

    BOOL v111 = v227 == (id)12;
    id v230 = v387;
    v179 = v415;
    if (v111 || (v234 & 1) != 0) {
      goto LABEL_303;
    }
  }
  else
  {

    id v230 = v387;
    v179 = v415;
  }
  id v224 = objc_msgSend(objc_alloc((Class)SFClientTimingFeedback), "initWithEvent:timeInterval:queryId:", @"com.apple.searchd.backend.query.end", 0, -[SDSearchQuery queryIdent](v230, "queryIdent"));
  if (!v360)
  {
    v228 = +[SPFeedbackProxy sharedProxy];
    id v256 = [(SDSearchQuery *)v230 queryIdent];
    id v229 = [(SPXPCConnection *)v230->_connection bundleID];
    [v228 sendFeedbackType:21 feedback:v224 queryId:v256 clientID:v229];
LABEL_301:

    id v230 = v387;
    v179 = v415;
  }

LABEL_303:
  if ([(NSMutableArray *)v230->_slowTokens count]
    || [(NSMutableArray *)v230->_tokens count]
    || [(NSMutableArray *)v230->_delayedStartTokens count])
  {
    BOOL v231 = 0;
  }
  else if ([(NSMutableArray *)v230->_delayedStartStores count])
  {
    BOOL v231 = 0;
  }
  else
  {
    BOOL v231 = v362;
  }
  if (v361)
  {
    [(SDSearchQuery *)v230 externalID];
    kdebug_trace();
  }
  if (v362)
  {
    [(SDSearchQuery *)v230 externalID];
    kdebug_trace();
  }
  if (v231)
  {
    long long v232 = v230->_categoryToResultMapping;
    v230->_categoryToResultMapping = 0;

    [(SDSearchQuery *)v230 setServer_features:0];
    [(SDSearchQuery *)v230 setTokens:0];
    [(SDSearchQuery *)v230 setSlowTokens:0];
  }
  if (a10 == 4)
  {
    long long v233 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v233, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v233, OS_LOG_TYPE_DEFAULT, "Sending early priority index results", buf, 2u);
    }

    v230->_sentPriority = 1;
  }

  id v11 = v365;
  long long v49 = obja;
LABEL_318:
}

- (void)sendResults:(id)a3 reset:(BOOL)a4 partiallyComplete:(BOOL)a5 update:(BOOL)a6 complete:(BOOL)a7 delayedTopHit:(BOOL)a8 reason:(int)a9
{
  HIDWORD(v9) = a9;
  LOBYTE(v9) = a8;
  -[SDSearchQuery sendResults:reset:partiallyComplete:update:complete:unchanged:delayedTopHit:reason:](self, "sendResults:reset:partiallyComplete:update:complete:unchanged:delayedTopHit:reason:", a3, a4, a5, a6, a7, 0, v9);
}

- (void)sendError:(id)a3
{
  id v4 = a3;
  id v9 = [objc_alloc((Class)SPXPCMessage) initWithName:@"SearchError"];
  id v5 = +[NSNumber numberWithInt:self->_externalID];
  id v6 = [v4 code];

  id v7 = +[NSNumber numberWithInteger:v6];
  uint64_t v8 = +[NSDictionary dictionaryWithObjectsAndKeys:v5, @"QID", v7, @"ERR", 0];
  [v9 setInfo:v8];

  if (([(SDSearchQuery *)self cancelled] & 1) == 0) {
    [(SPXPCConnection *)self->_connection sendMessage:v9];
  }
}

- (void)sendQueryCompleted
{
  id v3 = SPLogForSPLogCategoryDefault();
  os_log_type_t v4 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v3, v4))
  {
    *(_DWORD *)buf = 67109120;
    qos_class_t v18 = qos_class_self();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "QOS sendQueryCompleted 1: %d", buf, 8u);
  }

  +[NSDate timeIntervalSinceReferenceDate];
  SDTraceAdd();
  id v5 = SPLogForSPLogCategoryDefault();
  os_log_type_t v6 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v5, v6))
  {
    qos_class_t v7 = qos_class_self();
    *(_DWORD *)buf = 67109120;
    qos_class_t v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "QOS sendQueryCompleted 2: %d", buf, 8u);
  }

  uint64_t v8 = SPLogForSPLogCategoryQuery();
  os_log_type_t v9 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v8, v9))
  {
    unsigned int externalID = self->_externalID;
    *(_DWORD *)buf = 67109120;
    qos_class_t v18 = externalID;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Completed query %d", buf, 8u);
  }

  id v11 = SPLogForSPLogCategoryTelemetry();
  id v12 = v11;
  os_signpost_id_t v13 = self->_externalID;
  if (v13 && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, v13, "spotlightLatency", " enableTelemetry=YES ", buf, 2u);
  }

  connection = self->_connection;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  _DWORD v16[2] = sub_1000168DC;
  v16[3] = &unk_1000921B0;
  v16[4] = self;
  [(SPXPCConnection *)connection barrier:v16];
  categoryToResultMapping = self->_categoryToResultMapping;
  self->_categoryToResultMapping = 0;

  [(SDSearchQuery *)self setTokens:0];
  [(SDSearchQuery *)self setSlowTokens:0];
  [(SDSearchQuery *)self setDelayedStartTokens:0];
  [(SDSearchQuery *)self setDelayedStartStores:0];
  self->_parsecCameLaterThanSRT = 0;
  self->_parsecEntityCameEarly = 0;
  self->_receivedLateParsecResults = 0;
  self->_shouldRecomputeSuggestions = 1;
  self->_sentTaggedTopHits = 0;
}

- (void)sendQueryReset
{
  [(SDSearchQuery *)self externalID];
  kdebug_trace();
  id v3 = SPLogForSPLogCategoryQuery();
  os_log_type_t v4 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v3, v4))
  {
    unsigned int externalID = self->_externalID;
    v9[0] = 67109120;
    v9[1] = externalID;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Reset query %d", (uint8_t *)v9, 8u);
  }

  id v6 = [objc_alloc((Class)SPXPCMessage) initWithName:@"SearchReset"];
  qos_class_t v7 = +[NSNumber numberWithInt:self->_externalID];
  uint64_t v8 = +[NSDictionary dictionaryWithObject:v7 forKey:@"QID"];
  [v6 setInfo:v8];

  [(SPXPCConnection *)self->_connection sendMessage:v6];
}

- (void)sendLogValuesForDebuggingRanking:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)SPXPCMessage) initWithName:@"DebugRanking"];
  v8[0] = @"QID";
  id v6 = +[NSNumber numberWithUnsignedInt:self->_externalID];
  v8[1] = @"RD";
  v9[0] = v6;
  v9[1] = v4;
  qos_class_t v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v5 setInfo:v7];

  if (([(SDSearchQuery *)self cancelled] & 1) == 0) {
    [(SPXPCConnection *)self->_connection sendMessage:v5];
  }
}

- (id)orderedCategories:(id)a3
{
  id v4 = a3;
  id v19 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        os_log_type_t v9 = [(NSMutableDictionary *)self->_categoryToResultMapping objectForKey:v8];
        uint64_t v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 domain]);
        id v11 = [(SDSearchQuery *)self queryContext];
        id v12 = [v11 searchDomains];
        id v13 = [v12 indexOfObject:v10];

        unsigned int v14 = +[NSNumber numberWithUnsignedLongLong:v13];
        [v19 setObject:v14 forKey:v8];
      }
      id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  id v15 = [v19 keysSortedByValueWithOptions:1 usingComparator:&stru_100092928];

  return v15;
}

- (void)sendResultsForKeys:(id)a3 toSendSections:(id)a4
{
  id v6 = a4;
  qos_class_t v7 = [(SDSearchQuery *)self orderedCategories:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [(NSMutableDictionary *)self->_categoryToResultMapping objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * (void)v11)];
        [v6 addObject:v12];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)prepareAndSend:(id)a3 force:(BOOL)a4 moreComing:(BOOL)a5 reason:(int)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  if (v8) {
    self->_BOOL didForceSend = 1;
  }
  if (!a5)
  {
    unint64_t v22 = (unint64_t)[(NSMutableArray *)self->_slowTokens count];
    id v23 = [(NSMutableArray *)self->_delayedStartTokens count];
    id v24 = (char *)[(NSMutableArray *)self->_delayedStartStores count];
    unint64_t v25 = (unint64_t)[(NSMutableArray *)self->_tokens count];
    if (&v24[(void)v23]) {
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
    unsigned int v29 = SPLogForSPLogCategoryQuery();
    os_log_type_t v30 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = v27;
      uint64_t v32 = v28;
      bottomPlacedSections = self->_bottomPlacedSections;
      id v34 = [(NSMutableDictionary *)self->_categoryToResultMapping allKeys];
      *(_DWORD *)buf = 138412546;
      unint64_t v48 = bottomPlacedSections;
      uint64_t v28 = v32;
      uint64_t v27 = v31;
      __int16 v49 = 2112;
      unsigned __int8 v50 = v34;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "#query send bottomRankedCategories %@ from %@", buf, 0x16u);
    }
    id v35 = SPLogForSPLogCategoryQuery();
    os_log_type_t v36 = 2 * (gSPLogDebugAsDefault == 0);
    BOOL v37 = os_log_type_enabled(v35, v36);
    if (v22)
    {
      if (v37)
      {
        slowTokens = self->_slowTokens;
        tokens = self->_tokens;
        *(_DWORD *)buf = 138412546;
        unint64_t v48 = slowTokens;
        __int16 v49 = 2112;
        unsigned __int8 v50 = tokens;
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "#query still waiting for %@ and %@", buf, 0x16u);
      }

      id v35 = SPLogForSPLogCategoryQuery();
      os_log_type_t v40 = 2 * (gSPLogDebugAsDefault == 0);
      if (!os_log_type_enabled(v35, v40)) {
        goto LABEL_37;
      }
      id v41 = self->_bottomPlacedSections;
      *(_DWORD *)buf = 138412290;
      unint64_t v48 = v41;
      os_log_type_t v42 = "#query _bottomRankedCategories %@";
      NSUInteger v43 = v35;
      os_log_type_t v44 = v40;
      uint32_t v45 = 12;
    }
    else
    {
      if (!v37)
      {
LABEL_37:

        BOOL didForceSend = self->_didForceSend;
        LODWORD(v46) = a6;
        id v19 = self;
        id v20 = v10;
        BOOL v17 = v28;
        uint64_t v21 = v27;
        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
      os_log_type_t v42 = "#query No waiting stores";
      NSUInteger v43 = v35;
      os_log_type_t v44 = v36;
      uint32_t v45 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v43, v44, v42, buf, v45);
    goto LABEL_37;
  }
  if (a6 == 5)
  {
    unint64_t v11 = (unint64_t)[(NSMutableArray *)self->_slowTokens count];
    id v12 = [(NSMutableArray *)self->_delayedStartTokens count];
    long long v13 = (char *)[(NSMutableArray *)self->_delayedStartStores count];
    unint64_t v14 = (unint64_t)[(NSMutableArray *)self->_tokens count];
    if (&v13[(void)v12]) {
      BOOL v15 = 0;
    }
    else {
      BOOL v15 = (v14 | v11) == 0;
    }
    BOOL v17 = !v15 && v14 == 0;
    BOOL didForceSend = self->_didForceSend;
    LODWORD(v46) = 5;
    id v19 = self;
    id v20 = v10;
    uint64_t v21 = 1;
    goto LABEL_38;
  }
  if (([(SDSearchQuery *)self infinitePatience] & 1) == 0
    && [v10 count])
  {
    BOOL v17 = a6 == 4;
    BOOL didForceSend = self->_didForceSend;
    LODWORD(v46) = a6;
    id v19 = self;
    id v20 = v10;
    uint64_t v21 = 0;
LABEL_38:
    [(SDSearchQuery *)v19 sendResults:v20 reset:didForceSend partiallyComplete:v17 update:0 complete:v21 delayedTopHit:0 reason:v46];
  }
}

- (void)sendFinishedDomainsZKW:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NSMutableArray *)self->_tokens count];
  BOOL v6 = v5 != 0;
  if (!v5 && !v3) {
    BOOL v6 = [(NSMutableArray *)self->_slowTokens count] != 0;
  }
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v8 = self->_sectionOrderByInsertion;
  id v9 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v13, "resultsCount", (void)v14)) {
          [v7 addObject:v13];
        }
      }
      id v10 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(NSMutableOrderedSet *)self->_sectionOrderByInsertion removeAllObjects];
  [(SDSearchQuery *)self prepareAndSend:v7 force:v3 moreComing:v6 reason:0];
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
    BOOL v3 = (&off_100092AD0)[a3];
  }
  sub_100017670(self, v3, self->_startTime);
}

- (void)addMatchInfo:(_MDPlistContainer *)a3
{
  id obj = self;
  objc_sync_enter(obj);
  matchInfo = obj->_matchInfo;
  if (!matchInfo)
  {
    id v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    BOOL v6 = obj->_matchInfo;
    obj->_matchInfo = v5;

    matchInfo = obj->_matchInfo;
  }
  [(NSMutableArray *)matchInfo addObject:a3];
  objc_sync_exit(obj);
}

- (__CFArray)copyMatchInfo
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (__CFArray *)[(NSMutableArray *)v2->_matchInfo copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)sendFinishedDomains:(BOOL)a3 reason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned int v5 = a3;
  id v7 = SPLogForSPLogCategoryDefault();
  os_log_type_t v8 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v7, v8))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "sendFinishedDomains", buf, 2u);
  }

  id v9 = [(NSMutableArray *)self->_slowTokens count];
  id v10 = [(NSMutableArray *)self->_tokens count];
  int v11 = ((uint64_t)v9 > 0) & ~v5;
  if ((uint64_t)v10 > 0) {
    int v11 = 1;
  }
  if (v4 == 4) {
    int v11 = 1;
  }
  unsigned int v168 = v5;
  unsigned int v169 = v11;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  long long v218 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  long long v13 = [(NSMutableDictionary *)self->_categoryToResultMapping allValues];
  uint64_t v14 = (uint64_t)[v13 countByEnumeratingWithState:&v218 objects:v230 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v219;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v219 != v15) {
          objc_enumerationMutation(v13);
        }
        if ([*(id *)(*((void *)&v218 + 1) + 8 * i) resultsCount])
        {
          uint64_t v14 = 1;
          goto LABEL_17;
        }
      }
      uint64_t v14 = (uint64_t)[v13 countByEnumeratingWithState:&v218 objects:v230 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  long long v17 = [(SDSearchQuery *)self queryContext];
  uint64_t v18 = [v17 searchEntities];
  id v177 = self;
  id v170 = v12;
  if (v18)
  {
    id v19 = [(SDSearchQuery *)self queryContext];
    id v20 = [v19 searchEntities];
    if ([v20 count])
    {
      uint64_t v21 = [(SDSearchQuery *)self queryContext];
      unint64_t v22 = [v21 searchEntities];
      id v23 = [v22 lastObject];
      unsigned int v183 = v14;
      uint64_t v24 = v4;
      id v25 = [v23 isScopedSearch];

      self = v177;
      id v26 = v25;
      uint64_t v4 = v24;
      uint64_t v14 = v183;
    }
    else
    {
      id v26 = 0;
    }

    id v12 = v170;
  }
  else
  {
    id v26 = 0;
  }

  uint64_t v27 = objc_opt_new();
  [(SSRankingManager *)self->_rankingManager setLogValues:v27];

  if ([(SDSearchQuery *)self cancelled]) {
    goto LABEL_224;
  }
  uint64_t v28 = [(SDSearchQuery *)self queryContext];
  unsigned int v29 = (char *)[v28 queryKind];

  if (v4 != 4 && -[NSArray count](self->_actualSentSections, "count") && ![v12 count])
  {
    os_log_type_t v30 = [(NSArray *)self->_actualSentSections objectAtIndex:0];
    uint64_t v31 = [v30 bundleIdentifier];
    unsigned int v32 = [v31 isEqualToString:@"com.apple.spotlight.tophits"];

    if (v32)
    {
      [v12 addObject:v30];

      goto LABEL_31;
    }
  }
  [(SDSearchQuery *)self addTopHitSectionIfNecessaryToSectionsForSending:v12 updatedSections:v14 isScopedSearch:v26];
LABEL_31:
  id v33 = [(SDSearchQuery *)self queryContext];
  id v34 = [v33 searchString];
  [(SDSearchQuery *)self addSuggestionsToSectionsForSending:v12 searchString:v34 updatedSections:v14 | v169 ^ 1 queryKind:v29];

  if (((v169 ^ 1) & 1) == 0
    && v4 >= 2
    && v4 != 3
    && (v4 != 4 || !self->_didReceiveCoreSpotlightProgress)
    && self->_didSendResults
    || !self->_categoryToResultMapping)
  {
    p_super = SPLogForSPLogCategoryDefault();
    os_log_type_t v46 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(p_super, v46))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, p_super, v46, "Skipped ranking; already sent", buf, 2u);
    }
    goto LABEL_177;
  }
  self->_didSendResults = 1;
  __uint64_t v163 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v164 = v29;
  unsigned int v165 = v4;
  unsigned int v162 = v26;
  if (v4 == 4)
  {
    id v35 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v214 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    long long v217 = 0u;
    os_log_type_t v36 = [(NSMutableDictionary *)self->_categoryToResultMapping allKeys];
    id v37 = [v36 countByEnumeratingWithState:&v214 objects:v229 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v215;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(void *)v215 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void *)(*((void *)&v214 + 1) + 8 * (void)j);
          os_log_type_t v42 = [(NSMutableDictionary *)self->_categoryToResultMapping objectForKey:v41];
          NSUInteger v43 = [v42 bundleIdentifier];
          if (sub_100012A60(v43)) {
            [(NSMutableDictionary *)v35 setObject:v42 forKey:v41];
          }
        }
        id v38 = [v36 countByEnumeratingWithState:&v214 objects:v229 count:16];
      }
      while (v38);
    }

    id v12 = v170;
    unsigned int v29 = v164;
    os_log_type_t v44 = v35;
    uint64_t v4 = 4;
  }
  else
  {
    os_log_type_t v44 = self->_categoryToResultMapping;
  }
  long long v212 = 0u;
  long long v213 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  double v47 = [(NSMutableDictionary *)v44 allKeys];
  id v48 = [v47 countByEnumeratingWithState:&v210 objects:v228 count:16];
  uint64_t v184 = v44;
  if (!v48)
  {

    goto LABEL_91;
  }
  id v49 = v48;
  id obj = v47;
  LOBYTE(v50) = 0;
  LOBYTE(v51) = 0;
  unsigned int v52 = 0;
  uint64_t v178 = PRSRankingRelatedSearchesBundleString;
  uint64_t v180 = *(void *)v211;
  uint64_t v175 = PRSRankingParsecSongBundleString;
  uint64_t v173 = PRSRankingParsecAlbumBundleString;
  uint64_t v174 = PRSRankingRecommendationSongBundleString;
  do
  {
    for (k = 0; k != v49; k = (char *)k + 1)
    {
      if (*(void *)v211 != v180) {
        objc_enumerationMutation(obj);
      }
      uint64_t v54 = *(void *)(*((void *)&v210 + 1) + 8 * (void)k);
      unsigned int v55 = [(NSMutableDictionary *)v44 objectForKey:v54];
      id v56 = [v55 bundleIdentifier];
      unsigned int v57 = [v56 isEqualToString:v178];

      if (v51)
      {
        unsigned int v51 = 1;
        if (v52) {
          goto LABEL_59;
        }
      }
      else
      {
        if (!v55)
        {
          unsigned int v51 = 0;
          if ((v50 & 1) == 0) {
            goto LABEL_69;
          }
          goto LABEL_67;
        }
        unsigned int v58 = [v55 bundleIdentifier];
        unsigned int v51 = [v58 isEqualToString:v175];

        if (v52)
        {
LABEL_59:
          unsigned int v52 = 1;
          if ((v50 & 1) == 0) {
            goto LABEL_69;
          }
          goto LABEL_67;
        }
      }
      if (v55)
      {
        id v59 = [v55 bundleIdentifier];
        unsigned int v52 = [v59 isEqualToString:v173];

        if ((v50 & 1) == 0) {
          goto LABEL_69;
        }
      }
      else
      {
        unsigned int v52 = 0;
        if ((v50 & 1) == 0)
        {
LABEL_69:
          if (v55)
          {
            long long v60 = [v55 bundleIdentifier];
            unsigned int v50 = [v60 isEqualToString:v174];
          }
          else
          {
            unsigned int v50 = 0;
          }
          goto LABEL_72;
        }
      }
LABEL_67:
      unsigned int v50 = 1;
LABEL_72:
      unsigned int v61 = [v55 results];
      if ([v61 count]) {
        int v62 = v57;
      }
      else {
        int v62 = 1;
      }

      BOOL v63 = v62 == 1;
      os_log_type_t v44 = v184;
      if (v63)
      {
        if (v57)
        {
          bottomPlacedSections = v177->_bottomPlacedSections;
          if (!bottomPlacedSections)
          {
            uint64_t v65 = objc_opt_new();
            long long v66 = v177->_bottomPlacedSections;
            v177->_bottomPlacedSections = (NSMutableArray *)v65;

            bottomPlacedSections = v177->_bottomPlacedSections;
            os_log_type_t v44 = v184;
          }
          if (([(NSMutableArray *)bottomPlacedSections containsObject:v55] & 1) == 0) {
            [(NSMutableArray *)v177->_bottomPlacedSections addObject:v55];
          }
        }
        [(NSMutableDictionary *)v44 setObject:0 forKeyedSubscript:v54];
      }
    }
    id v49 = [obj countByEnumeratingWithState:&v210 objects:v228 count:16];
  }
  while (v49);

  int v67 = (v51 | v52) & v50;
  uint64_t v4 = v165;
  self = v177;
  id v12 = v170;
  unsigned int v29 = v164;
  if (v67 == 1)
  {
    if (v51) {
      [(NSMutableDictionary *)v44 setObject:0 forKeyedSubscript:v175];
    }
    if (v52) {
      [(NSMutableDictionary *)v44 setObject:0 forKeyedSubscript:v173];
    }
  }
LABEL_91:
  if ([(SDSearchQuery *)self cancelled])
  {

    goto LABEL_224;
  }
  [(SDSearchQuery *)self externalID];
  kdebug_trace();
  id v68 = [(SDSearchQuery *)self queryContext];
  id v69 = [v68 queryKind];
  uint64_t v70 = [(SDSearchQuery *)self connection];
  id v71 = [v70 bundleID];
  if (qword_1000A8E08 != -1) {
    dispatch_once(&qword_1000A8E08, &stru_100092AB0);
  }
  if (byte_1000A8E05)
  {
LABEL_96:

    goto LABEL_97;
  }
  if (byte_1000A8E04)
  {
    if (([v71 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
      || ([v71 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
    {
      goto LABEL_96;
    }
    unsigned __int8 v80 = [v71 hasPrefix:@"com.apple.ondeviceeval"];

    if (v69 == (id)12 || (v80 & 1) != 0)
    {
LABEL_97:
      p_super = &v184->super.super;
      v208[0] = _NSConcreteStackBlock;
      v208[1] = 3221225472;
      v208[2] = sub_100018EC4;
      v208[3] = &unk_100092950;
      id v72 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableDictionary count](v184, "count"));
      id v209 = v72;
      [(NSMutableDictionary *)v184 enumerateKeysAndObjectsUsingBlock:v208];
      unsigned int v73 = v209;
      goto LABEL_98;
    }
  }
  else
  {
  }
  rankingManager = self->_rankingManager;
  unsigned int v73 = [(SDSearchQuery *)self itemRanker];
  v83 = [(SDSearchQuery *)self preferredBundleIDs];
  id v84 = [(SDSearchQuery *)self queryIdent];
  BOOL v85 = [(SDSearchQuery *)self isCJK];
  unsigned __int8 v86 = [(SDSearchQuery *)self isBullseyeNonCommittedSearch];
  unsigned __int8 v87 = [(SDSearchQuery *)self isBullseyeCommittedSearch];
  BOOL isPeopleSearch = self->_isPeopleSearch;
  v89 = [(SDSearchQuery *)self queryContext];
  BYTE2(v161) = isPeopleSearch;
  BYTE1(v161) = v87;
  unsigned int v29 = v164;
  LOBYTE(v161) = v86;
  -[SSRankingManager rankSectionsUsingBundleIDToSectionMapping:withRanker:preferredBundleIds:isScopedSearch:queryId:isCJK:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:isPeopleSearch:queryContext:](rankingManager, "rankSectionsUsingBundleIDToSectionMapping:withRanker:preferredBundleIds:isScopedSearch:queryId:isCJK:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:isPeopleSearch:queryContext:", v184, v73, v83, v162, v84, v85, v161, v89);
  id v72 = (id)objc_claimAutoreleasedReturnValue();

  self = v177;
  p_super = &v184->super.super;
LABEL_98:

  id v12 = v170;
  if ((self->_parsecCameLaterThanSRT || self->_parsecEntityCameEarly)
    && ((unint64_t)(v29 - 5) < 4 || v29 == (char *)1 || v29 == (char *)4 || self->_parsecEntityCameEarly))
  {
    id v74 = [(NSArray *)self->_sentSections copy];
    id v75 = [v74 count];
    v204[0] = _NSConcreteStackBlock;
    v204[1] = 3221225472;
    v204[2] = sub_100018F34;
    v204[3] = &unk_100092978;
    id v76 = v74;
    id v205 = v76;
    id v72 = v72;
    id v206 = v72;
    uint64_t v207 = self;
    float v77 = objc_retainBlock(v204);
    double v78 = v77;
    if (v75)
    {
      if ((unint64_t)(qword_1000A8DB0 - 1) <= 1)
      {
        unsigned int v79 = (void (*)(void))v77[2];
        goto LABEL_115;
      }
      if (qword_1000A8DB0 == 3)
      {
        unsigned int v79 = (void (*)(void))v77[2];
LABEL_115:
        uint64_t v81 = v79();

        id v72 = (id)v81;
      }
      else
      {
        self->_sendStableSections = 1;
      }
    }
    p_super = &v184->super.super;
  }
  if (!self->_sendStableSections
    || !self->_sentTaggedTopHits
    || self->_sentPriority
    || self->_receivedLateParsecResults
    || self->_shouldRecomputeSuggestions)
  {
    if (self->_sentPriority)
    {
      unsigned int v92 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "Sending additional results after priority index results", buf, 2u);
      }
    }
    self->_sentPriority = 0;
    if ([v72 count])
    {
      v93 = SPLogForSPLogCategoryQuery();
      os_log_type_t v94 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v93, v94))
      {
        *(_DWORD *)buf = 138412290;
        id v227 = v72;
        _os_log_impl((void *)&_mh_execute_header, v93, v94, "rankedSections: %@", buf, 0xCu);
      }

      if (self->_genreGroupingEnabled)
      {
        id v95 = self->_rankingManager;
        uint64_t v96 = +[SDSearchQuery appGenreMap];
        id v97 = [(SSRankingManager *)v95 groupSectionsByCategory:v72 genreMap:v96 topSections:v170];

        v98 = SPLogForSPLogCategoryQuery();
        os_log_type_t v99 = 2 * (gSPLogDebugAsDefault == 0);
        if (os_log_type_enabled(v98, v99))
        {
          *(_DWORD *)buf = 138412290;
          id v227 = v97;
          _os_log_impl((void *)&_mh_execute_header, v98, v99, "rankedSections: %@", buf, 0xCu);
        }
      }
      else
      {
        id v97 = v72;
      }
      long long v202 = 0u;
      long long v203 = 0u;
      long long v200 = 0u;
      long long v201 = 0u;
      id v72 = v97;
      id v100 = [v72 countByEnumeratingWithState:&v200 objects:v225 count:16];
      if (v100)
      {
        id v101 = v100;
        uint64_t v102 = *(void *)v201;
        uint64_t v103 = PRSRankingRelatedSearchesBundleString;
        do
        {
          for (m = 0; m != v101; m = (char *)m + 1)
          {
            if (*(void *)v201 != v102) {
              objc_enumerationMutation(v72);
            }
            id v105 = *(void **)(*((void *)&v200 + 1) + 8 * (void)m);
            uint64_t v106 = [v105 results];
            id v107 = [v106 count];

            if (v107)
            {
              v108 = [v105 results];
              v109 = [v108 objectAtIndex:0];

              if ([v109 placement] == 2
                || ([v105 bundleIdentifier],
                    unsigned int v110 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v111 = [v110 isEqualToString:v103],
                    v110,
                    v111))
              {
                [(NSMutableArray *)v177->_bottomPlacedSections addObject:v105];
              }
            }
          }
          id v101 = [v72 countByEnumeratingWithState:&v200 objects:v225 count:16];
        }
        while (v101);
      }

      self = v177;
      if ([(NSMutableArray *)v177->_bottomPlacedSections count])
      {
        id v112 = [v72 mutableCopy];
        long long v196 = 0u;
        long long v197 = 0u;
        long long v198 = 0u;
        long long v199 = 0u;
        unsigned int v113 = v177->_bottomPlacedSections;
        id v114 = [(NSMutableArray *)v113 countByEnumeratingWithState:&v196 objects:v224 count:16];
        uint64_t v4 = v165;
        unsigned int v29 = v164;
        if (v114)
        {
          id v115 = v114;
          uint64_t v116 = *(void *)v197;
          do
          {
            for (n = 0; n != v115; n = (char *)n + 1)
            {
              if (*(void *)v197 != v116) {
                objc_enumerationMutation(v113);
              }
              [v112 removeObject:*(void *)(*((void *)&v196 + 1) + 8 * (void)n)];
            }
            id v115 = [(NSMutableArray *)v113 countByEnumeratingWithState:&v196 objects:v224 count:16];
          }
          while (v115);
        }

        id v118 = [v112 copy];
        id v72 = v118;
        id v12 = v170;
      }
      else
      {
        uint64_t v4 = v165;
        id v12 = v170;
        unsigned int v29 = v164;
      }
      p_super = &v184->super.super;
    }
    [v12 addObjectsFromArray:v72];
    [(SDSearchQuery *)self externalID];
    kdebug_trace();
    id v119 = [p_super objectForKey:PRSRankingDictionaryBundleString];
    v91 = v119;
    if (v119)
    {
      uint64_t v120 = [v119 resultSet];
      uint64_t v121 = [v120 firstObject];
      unsigned int v122 = [v121 topHit];

      if (!v122)
      {
        [v12 removeObject:v91];
        [v12 addObject:v91];
      }
    }
    if ([v12 count])
    {
      v179 = v91;
      if ([(NSArray *)self->_corrections count] && self->_previousQueryKind != 10)
      {
        id v124 = [(NSArray *)self->_corrections firstObject];
        v123 = [v124 suggestion];
      }
      else
      {
        v123 = 0;
      }
      v125 = self->_rankingManager;
      topHitSection = self->_topHitSection;
      BOOL v127 = self->_isPeopleSearch;
      uint64_t v128 = [(SDSearchQuery *)self itemRanker];
      id v129 = [v128 queryTermLength];
      uint64_t v130 = [(SDSearchQuery *)self itemRanker];
      id v90 = [(SSRankingManager *)v125 applyTopSectionPolicy:v170 withTopHitSection:topHitSection isPeopleSearch:v127 queryKind:v164 correction:v123 queryLength:v129 ranker:v130];

      v131 = SPLogForSPLogCategoryQuery();
      os_log_type_t v132 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v131, v132))
      {
        *(_DWORD *)buf = 138412290;
        id v227 = v90;
        _os_log_impl((void *)&_mh_execute_header, v131, v132, "[query] toSendSections: %@", buf, 0xCu);
      }

      self = v177;
      v91 = v179;
      unsigned int v29 = v164;
    }
    else
    {
      id v90 = v12;
    }
LABEL_175:

    id v12 = v90;
    p_super = &v184->super.super;
  }
  else if (v4 == 3)
  {
    id v90 = [(NSArray *)self->_sentSections mutableCopy];
    v91 = v170;
    goto LABEL_175;
  }
  sub_1000190D4(self, "finished", "ranking", v163);
  [(SDSearchQuery *)self logPerfToAnalytics:v4];

LABEL_177:
  if ([(SDSearchQuery *)self cancelled]) {
    goto LABEL_224;
  }
  char v133 = v169 ^ 1;
  if ((unint64_t)(v29 - 4) > 4) {
    char v133 = 1;
  }
  if ((v133 & 1) == 0
    && [v12 count] == (id)1
    && [v12 containsObject:self->_topHitSection])
  {
    self->_didSendTopHits = 0;
    goto LABEL_224;
  }
  if (self->_enforcePreferredBundleIDs
    || (int v134 = SSPreferLocalResultsOnLocalEngagment(), (unint64_t)(v29 - 5) <= 3) && v134)
  {
    id v135 = [(SDSearchQuery *)self preferredBundleIDs];
    id v136 = [v135 count];

    if (v136)
    {
      id v185 = +[NSMutableArray array];
      id v181 = +[NSMutableArray array];
      long long v192 = 0u;
      long long v193 = 0u;
      long long v194 = 0u;
      long long v195 = 0u;
      id v171 = v12;
      id v137 = v12;
      id v138 = [v137 countByEnumeratingWithState:&v192 objects:v223 count:16];
      unsigned int v166 = v4;
      if (v138)
      {
        id v139 = v138;
        uint64_t v140 = 0;
        uint64_t v141 = *(void *)v193;
        do
        {
          for (iuint64_t i = 0; ii != v139; iuint64_t i = (char *)ii + 1)
          {
            if (*(void *)v193 != v141) {
              objc_enumerationMutation(v137);
            }
            unsigned int v143 = *(void **)(*((void *)&v192 + 1) + 8 * (void)ii);
            if ([v143 isEqual:self->_topHitSection])
            {
              id v144 = v143;

              uint64_t v140 = v144;
            }
            else
            {
              v145 = [(SDSearchQuery *)self preferredBundleIDs];
              unsigned int v146 = [v143 bundleIdentifier];
              unsigned int v147 = [v145 containsObject:v146];

              if (v147) {
                id v148 = v185;
              }
              else {
                id v148 = v181;
              }
              [v148 addObject:v143];
              self = v177;
            }
          }
          id v139 = [v137 countByEnumeratingWithState:&v192 objects:v223 count:16];
        }
        while (v139);
      }
      else
      {
        uint64_t v140 = 0;
      }

      [v137 removeAllObjects];
      uint64_t v4 = v166;
      if (v140) {
        [v137 addObject:v140];
      }
      v191[0] = _NSConcreteStackBlock;
      v191[1] = 3221225472;
      v191[2] = sub_1000191E4;
      v191[3] = &unk_1000929A0;
      v191[4] = self;
      [v185 sortUsingComparator:v191];
      [v137 addObjectsFromArray:v185];
      [v137 addObjectsFromArray:v181];

      id v12 = v171;
    }
  }
  if (!self->_isEntitySearch) {
    goto LABEL_223;
  }
  long long v189 = 0u;
  long long v190 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  id v149 = v12;
  v150 = (char *)[v149 countByEnumeratingWithState:&v187 objects:v222 count:16];
  if (!v150)
  {
LABEL_222:

    goto LABEL_223;
  }
  id v151 = v150;
  id v172 = v12;
  unsigned int v167 = v4;
  id v152 = 0;
  uint64_t v153 = *(void *)v188;
  while (2)
  {
    uint64_t v154 = 0;
    id v182 = v152;
    uint64_t v186 = &v151[(void)v152];
LABEL_210:
    if (*(void *)v188 != v153) {
      objc_enumerationMutation(v149);
    }
    v155 = *(void **)(*((void *)&v187 + 1) + 8 * v154);
    unsigned __int8 v156 = [v155 bundleIdentifier];
    if (([v156 hasPrefix:@"com.apple.parsec"] & 1) == 0)
    {

      goto LABEL_217;
    }
    v157 = [v155 resultSet];
    BOOL v158 = [v157 firstObject];
    unsigned int v159 = [v158 placement];

    BOOL v63 = v159 == 1;
    self = v177;
    if (!v63)
    {
LABEL_217:
      if (v151 == (char *)++v154)
      {
        id v151 = (char *)[v149 countByEnumeratingWithState:&v187 objects:v222 count:16];
        id v152 = v186;
        if (v151) {
          continue;
        }
        uint64_t v4 = v167;
        id v12 = v172;
        goto LABEL_222;
      }
      goto LABEL_210;
    }
    break;
  }
  id v160 = v155;

  uint64_t v4 = v167;
  id v12 = v172;
  if (v160)
  {
    [v149 removeObjectAtIndex:&v182[v154]];
    [v149 insertObject:v160 atIndex:0];
    id v149 = v160;
    goto LABEL_222;
  }
LABEL_223:
  [(SDSearchQuery *)self prepareAndSend:v12 force:v168 moreComing:v169 reason:v4];
LABEL_224:
}

- (BOOL)topHitsReadyToSend:(id)a3
{
  return [a3 resultsCount] != 0;
}

- (id)detailTextFromBundleIDs:(id)a3
{
  id v3 = a3;
  if (SSEnableLocalDetailText())
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v29 = v3;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (!v6) {
      goto LABEL_18;
    }
    id v7 = v6;
    uint64_t v8 = *(void *)v32;
    uint64_t v9 = SPApplicationBundleIdGeneralApplication;
    uint64_t v10 = SPApplicationBundleIdGeneralAppClips;
    int v11 = &MDItemInstantMessageAddresses_ptr;
    CFStringRef v12 = @"DOMAIN_APPLICATION";
    while (1)
    {
      long long v13 = 0;
      id v30 = v7;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v13);
        if (objc_msgSend(v14, "isEqualToString:", v9, v29))
        {
          uint64_t v15 = v11[199];
          CFStringRef v16 = v12;
          goto LABEL_11;
        }
        if ([v14 isEqualToString:v10])
        {
          uint64_t v15 = v11[199];
          CFStringRef v16 = @"DOMAIN_APP_CLIPS";
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
        id v21 = v4;
        id v22 = v5;
        id v23 = v11;
        CFStringRef v24 = v12;
        id v25 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v14 allowPlaceholder:1 error:0];
        long long v17 = [v25 localizedName];

        CFStringRef v12 = v24;
        int v11 = v23;
        id v5 = v22;
        id v4 = v21;
        uint64_t v10 = v20;
        uint64_t v8 = v19;
        uint64_t v9 = v18;
        id v7 = v30;
        if (v17) {
          goto LABEL_12;
        }
LABEL_13:

        long long v13 = (char *)v13 + 1;
      }
      while (v7 != v13);
      id v26 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
      id v7 = v26;
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
  id v26 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v27 = SSContactsBundleIdentifier;
  id v3 = -[NSMutableDictionary objectForKey:](self->_categoryToResultMapping, "objectForKey:");
  if (v3)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v24 = v3;
    id v4 = [v3 results];
    id v5 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (!v5) {
      goto LABEL_20;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v8);
        uint64_t v10 = SPLogForSPLogCategoryDefault();
        os_log_type_t v11 = 2 * (gSPLogDebugAsDefault == 0);
        if (os_log_type_enabled(v10, v11))
        {
          CFStringRef v12 = [v9 title];
          long long v13 = [v12 text];
          *(_DWORD *)buf = 138412290;
          long long v33 = v13;
          _os_log_impl((void *)&_mh_execute_header, v10, v11, "Check result %@", buf, 0xCu);
        }
        uint64_t v14 = [v9 contactIdentifier];
        if (v14)
        {
          uint64_t v15 = (void *)v14;
          CFStringRef v16 = [v9 personIdentifier];
          if (v16)
          {

LABEL_12:
            goto LABEL_13;
          }
          long long v17 = [v9 resultBundleId];
          unsigned int v18 = [v17 isEqual:v27];

          if (v18)
          {
            uint64_t v15 = [v9 lastUsedDate];
            [v15 timeIntervalSinceNow];
            if (v19 <= -40996800.0) {
              goto LABEL_12;
            }
            unsigned int v20 = [v9 hasTextContentMatch];

            if (v20)
            {
              id v21 = [(SDSearchQuery *)self queryContext];
              uint64_t v15 = +[SSSuggestionResultBuilder buildResultWithResult:v9 queryContext:v21];

              [v26 addObject:v15];
              goto LABEL_12;
            }
          }
        }
LABEL_13:
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v22 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
      id v6 = v22;
      if (!v22)
      {
LABEL_20:

        id v3 = v24;
        break;
      }
    }
  }

  return v26;
}

- (BOOL)forceAboveFoldResultsWithQuery:(id)a3 topHitSection:(id)a4 sections:(id)a5
{
  id v5 = a5;
  if (_os_feature_enabled_impl() && (unint64_t)[v5 count] >= 2)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v5;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v26;
      uint64_t v10 = PRSRankingAppsBundleString;
      uint64_t v11 = PRSRankingAppClipsBundleString;
      uint64_t v23 = PRSRankingSearchSuggestionsBundleString;
      char v12 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
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
            CFStringRef v16 = [v14 bundleIdentifier];
            unsigned __int8 v17 = [v16 isEqualToString:v11];

            if (v17) {
              goto LABEL_19;
            }
            if (a4)
            {
              unsigned int v18 = [v14 bundleIdentifier];
              unsigned int v19 = [v18 isEqualToString:v23];

              if (!v19) {
                goto LABEL_19;
              }
            }
          }
          char v12 = 0;
        }
        id v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
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
  id v89 = a3;
  id v83 = a4;
  id v9 = a5;
  id v87 = objc_alloc_init((Class)NSMutableArray);
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v94 = objc_alloc_init((Class)NSMutableArray);
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  v88 = v9;
  uint64_t v11 = [v9 results];
  id v12 = [v11 countByEnumeratingWithState:&v107 objects:v116 count:16];
  if (!v12)
  {
    char v14 = 0;
    goto LABEL_19;
  }
  id v13 = v12;
  char v14 = 0;
  uint64_t v15 = *(void *)v108;
  do
  {
    for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v108 != v15) {
        objc_enumerationMutation(v11);
      }
      unsigned __int8 v17 = *(void **)(*((void *)&v107 + 1) + 8 * i);
      unsigned int v18 = [v17 entityIdentifier];

      if (v18)
      {
        unsigned int v19 = [v17 entityIdentifier];
        [v10 addObject:v19];
      }
      BOOL v20 = [v17 contactIdentifier];
      if (v20)
      {
      }
      else
      {
        id v21 = [v17 personIdentifier];

        if (!v21) {
          goto LABEL_12;
        }
      }
      id v22 = [v17 title];
      uint64_t v23 = [v22 text];
      id v24 = SSNormalizedQueryString();

      [v94 addObject:v24];
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
    id v13 = [v11 countByEnumeratingWithState:&v107 objects:v116 count:16];
  }
  while (v13);
LABEL_19:

  if (_os_feature_enabled_impl())
  {
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id obj = v83;
    id v28 = [obj countByEnumeratingWithState:&v103 objects:v115 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v92 = *(void *)v104;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v104 != v92) {
            objc_enumerationMutation(obj);
          }
          long long v31 = *(void **)(*((void *)&v103 + 1) + 8 * (void)j);
          long long v99 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          long long v32 = [v31 results];
          id v33 = [v32 countByEnumeratingWithState:&v99 objects:v114 count:16];
          if (v33)
          {
            id v34 = v33;
            uint64_t v35 = *(void *)v100;
            do
            {
              for (k = 0; k != v34; k = (char *)k + 1)
              {
                if (*(void *)v100 != v35) {
                  objc_enumerationMutation(v32);
                }
                id v37 = *(void **)(*((void *)&v99 + 1) + 8 * (void)k);
                id v38 = [v37 entityIdentifier];

                if (v38)
                {
                  uint64_t v39 = [v37 entityIdentifier];
                  [v10 addObject:v39];
                }
              }
              id v34 = [v32 countByEnumeratingWithState:&v99 objects:v114 count:16];
            }
            while (v34);
          }
        }
        id v29 = [obj countByEnumeratingWithState:&v103 objects:v115 count:16];
      }
      while (v29);
    }
  }
  os_log_type_t v40 = self;
  v93 = [(SDSearchQuery *)self contactSuggestionsWithSearchString:v89];
  uint64_t v41 = [(SSRankingManager *)self->_rankingManager rankingConfiguration];
  uint64_t v42 = [v41 localResultQualityThreshold];
  NSUInteger v43 = (void *)v42;
  os_log_type_t v44 = &off_100099118;
  if (v42) {
    os_log_type_t v44 = (_UNKNOWN **)v42;
  }
  uint32_t v45 = v44;

  id obja = [(SDSearchQuery *)self queryContext];
  if (SSCreateAsTypedSuggestion())
  {
    id v46 = objc_alloc((Class)SFSearchSuggestion);
    id v47 = [v46 initWithIdentifier:SSSuggestionIdentifierActualSearch suggestion:v89 query:v89 score:6 type:1.0];
    id v48 = [(SDSearchQuery *)self queryContext];
    double v78 = +[SSSuggestionResultBuilder buildResultWithSuggestion:v47 queryContext:v48];

    os_log_type_t v40 = self;
  }
  else
  {
    double v78 = 0;
  }
  id v49 = objc_alloc((Class)SFSearchSuggestion);
  id v50 = [v49 initWithIdentifier:SSSuggestionIdentifierSearchWeb suggestion:v89 query:v89 score:14 type:1.0];
  unsigned int v51 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v52 = [v51 localizedStringForKey:@"SUGGESTION_DETAIL_WEB" value:&stru_100094088 table:@"SpotlightServices"];

  uint64_t v81 = (void *)v52;
  [v50 setDetailText:v52];
  [(SDSearchQuery *)v40 queryContext];
  v54 = long long v53 = v40;
  uint64_t v82 = v50;
  unsigned __int8 v86 = +[SSSuggestionResultBuilder buildResultWithSuggestion:v50 queryContext:v54];

  serverSuggestionResults = v53->_serverSuggestionResults;
  if (!serverSuggestionResults) {
    serverSuggestionResults = (NSArray *)&__NSArray0__struct;
  }
  id v84 = serverSuggestionResults;
  localSuggestionResults = v53->_localSuggestionResults;
  if (!localSuggestionResults) {
    localSuggestionResults = (NSArray *)&__NSArray0__struct;
  }
  unsigned int v57 = localSuggestionResults;
  id v76 = +[SSBullseyeSuggestionsManager sharedSuggestionsManager];
  v113[0] = v45;
  v112[0] = @"qualityThreshold";
  v112[1] = @"prefersLocalUserTypedSuggestion";
  float v77 = +[NSNumber numberWithBool:[(SDSearchQuery *)v53 prefersLocalUserTypedSuggestion]];
  v113[1] = v77;
  v112[2] = @"suggestionsAreBlended";
  unsigned int v58 = +[NSNumber numberWithBool:v53->_suggestionsAreBlended];
  v113[2] = v58;
  v112[3] = @"localFilteringScore";
  +[NSNumber numberWithDouble:a6];
  id v59 = v80 = v45;
  v113[3] = v59;
  v112[4] = @"ForceAboveFoldResults";
  long long v60 = +[NSNumber numberWithBool:[(SDSearchQuery *)v53 forceAboveFoldResultsWithQuery:v89 topHitSection:v88 sections:v83]];
  v113[4] = v60;
  unsigned int v61 = +[NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:5];
  unsigned int v79 = v57;
  uint64_t v62 = [v76 orderedSuggestionsWithQueryContext:obja filters:v87 entityFilters:v10 contactFilters:v94 userSuggestion:v78 userWebSuggestion:v86 shortcutSuggestionResults:&__NSArray0__struct actionSuggestionResults:&__NSArray0__struct contactSuggestionResults:v93 serverSuggestionResults:v84 localSuggestionResults:v57 options:v61];

  BOOL v63 = (void *)v62;
  long long v64 = v83;
  if ((v14 & 1) != 0
    && (unint64_t)[v63 count] >= 3
    && (unint64_t)[v83 count] >= 3)
  {
    uint64_t v65 = [v83 objectAtIndexedSubscript:2];
    long long v66 = [v65 bundleIdentifier];
    unsigned int v67 = [v66 isEqualToString:PRSRankingAppsBundleString];

    if (v67)
    {
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v68 = [v83 objectAtIndexedSubscript:2];
      id v69 = [v68 results];

      id v70 = [v69 countByEnumeratingWithState:&v95 objects:v111 count:16];
      if (v70)
      {
        id v71 = v70;
        uint64_t v72 = *(void *)v96;
        while (2)
        {
          for (m = 0; m != v71; m = (char *)m + 1)
          {
            if (*(void *)v96 != v72) {
              objc_enumerationMutation(v69);
            }
            if (+[SSTopHitNominationManager passLikelihoodForTopHitCandidate:*(void *)(*((void *)&v95 + 1) + 8 * (void)m)])
            {
              objc_msgSend(v63, "subarrayWithRange:", 0, 2);
              id v74 = (id)objc_claimAutoreleasedReturnValue();

              long long v64 = v83;
              goto LABEL_60;
            }
          }
          id v71 = [v69 countByEnumeratingWithState:&v95 objects:v111 count:16];
          if (v71) {
            continue;
          }
          break;
        }
      }

      long long v64 = v83;
    }
  }
  id v74 = v63;
LABEL_60:

  return v74;
}

- (void)addSuggestionsToSectionsForSending:(id)a3 searchString:(id)a4 updatedSections:(BOOL)a5 queryKind:(unint64_t)a6
{
  if (a6 - 1 <= 1)
  {
    id v8 = a4;
    id v9 = a3;
    id v10 = objc_alloc((Class)SFSearchSuggestion);
    id v11 = [v10 initWithIdentifier:SSSuggestionIdentifierActualSearch suggestion:v8 query:v8 score:6 type:1.0];

    id v12 = [(SDSearchQuery *)self queryContext];
    id v13 = +[SSSuggestionResultBuilder buildResultWithSuggestion:v11 queryContext:v12];

    char v14 = (SFMutableResultSection *)objc_opt_new();
    suggestionsSection = self->_suggestionsSection;
    self->_suggestionsSection = v14;

    [(SFMutableResultSection *)self->_suggestionsSection setBundleIdentifier:SSSectionIdentifierSuggestions];
    unsigned __int8 v17 = v13;
    CFStringRef v16 = +[NSArray arrayWithObjects:&v17 count:1];
    [(SFMutableResultSection *)self->_suggestionsSection setResults:v16];

    [v9 addObject:self->_suggestionsSection];
  }
}

- (void)addTopHitSectionIfNecessaryToSectionsForSending:(id)a3 updatedSections:(BOOL)a4 isScopedSearch:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (!a5)
  {
    int v9 = SSEnableSpotlightTopHitPersonalizedRanking();
    uint64_t v72 = self;
    if (!v6 || self->_didSendTopHits || [(SFMutableResultSection *)self->_topHitSection resultsCount])
    {
      if (self->_didSendResults)
      {
        id v10 = SPLogForSPLogCategoryDefault();
        os_log_type_t v11 = gSPLogInfoAsDefault ^ 1;
        if (os_log_type_enabled(v10, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, v11, "Skipping current top hits nomination due to previous dispatch.", buf, 2u);
        }

        if (v9)
        {
          id v70 = v8;
          id v12 = objc_alloc((Class)QUData);
          id v13 = [(SDSearchQuery *)self queryContext];
          id v71 = [v12 initWithQueryContext:v13];

          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id obj = [(NSMutableDictionary *)self->_categoryToResultMapping allValues];
          id v14 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
          if (!v14) {
            goto LABEL_21;
          }
          id v15 = v14;
          uint64_t v16 = *(void *)v76;
          while (1)
          {
            for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v76 != v16) {
                objc_enumerationMutation(obj);
              }
              unsigned int v18 = *(void **)(*((void *)&v75 + 1) + 8 * i);
              if ([v18 resultsCount])
              {
                unsigned int v19 = [v18 resultSet];
                BOOL v20 = [v19 objectAtIndexedSubscript:0];
                uint64_t v21 = [v20 rankingItem];
                if (v21)
                {
                  id v22 = (void *)v21;
                  uint64_t v23 = [v18 resultSet];
                  id v24 = [v23 objectAtIndexedSubscript:0];
                  long long v25 = [v24 rankingItem];
                  [v25 likelihood];
                  double v27 = v26;

                  if (v27 >= 2.22044605e-16) {
                    continue;
                  }
                  rankingManager = v72->_rankingManager;
                  unsigned int v19 = [(SDSearchQuery *)v72 queryContext];
                  [v19 currentTime];
                  double v30 = v29;
                  id v31 = [(SDSearchQuery *)v72 queryIdent];
                  BOOL v20 = [(SDSearchQuery *)v72 itemRanker];
                  LOBYTE(v63) = 0;
                  [(SSRankingManager *)rankingManager calculateLikelihoodAndPriorForSection:v18 currentTime:0 shortcutResult:v31 queryId:v20 ranker:0 nominateLocalTopHit:v71 qu:v30 isSearchToolClient:v63];
                }
              }
            }
            id v15 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
            if (!v15)
            {
LABEL_21:

              goto LABEL_22;
            }
          }
        }
      }
    }
    else
    {
      id v37 = +[NSBundle bundleForClass:objc_opt_class()];
      id v71 = [v37 localizedStringForKey:@"DOMAIN_TOPHIT" value:&stru_100094088 table:@"Search"];

      if (qword_1000A8DB0 == 3) {
        uint64_t v38 = 6;
      }
      else {
        uint64_t v38 = 4;
      }
      if (v9)
      {
        id v39 = objc_alloc((Class)QUData);
        os_log_type_t v40 = [(SDSearchQuery *)self queryContext];
        id obja = [v39 initWithQueryContext:v40];

        long long v66 = self->_rankingManager;
        id v68 = [(NSMutableDictionary *)self->_categoryToResultMapping allValues];
        unsigned int v67 = [(SDSearchQuery *)self itemRanker];
        unsigned int v65 = [(SDSearchQuery *)self isBullseyeNonCommittedSearch];
        unsigned __int8 v64 = [(SDSearchQuery *)self isBullseyeCommittedSearch];
        uint64_t v41 = self;
        uint64_t v69 = v38;
        id v70 = v8;
        BOOL v42 = self->_parsecEnabled || self->_parsecSettingEnabled;
        id v50 = [(SDSearchQuery *)self queryIdent];
        unsigned int v51 = [(SDSearchQuery *)self queryContext];
        id v52 = [v51 queryKind];
        long long v53 = [(SDSearchQuery *)v41 connection];
        uint64_t v54 = [v53 bundleID];
        unsigned int v55 = [(SDSearchQuery *)v41 queryContext];
        [v55 currentTime];
        BYTE1(v63) = v42;
        LOBYTE(v63) = v64;
        uint64_t v56 = -[SSRankingManager nominateLocalTopHitsFromSections:withItemRanker:sectionHeader:maxInitiallyVisibleResults:shortcutResult:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:parsecEnabled:maxNumAppsInTopHitSection:queryId:queryKind:clientBundleID:qu:currentTime:](v66, "nominateLocalTopHitsFromSections:withItemRanker:sectionHeader:maxInitiallyVisibleResults:shortcutResult:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:parsecEnabled:maxNumAppsInTopHitSection:queryId:queryKind:clientBundleID:qu:currentTime:", v68, v67, v71, 1, 0, v65, v63, v69, v50, v52, v54, obja);
        topHitSection = v41->_topHitSection;
        v41->_topHitSection = (SFMutableResultSection *)v56;

LABEL_22:
        id v8 = v70;
      }
      else
      {
        id v43 = v8;
        os_log_type_t v44 = self->_rankingManager;
        uint32_t v45 = [(NSMutableDictionary *)self->_categoryToResultMapping allValues];
        id v46 = [(SDSearchQuery *)self itemRanker];
        BOOL v47 = [(SDSearchQuery *)self isBullseyeNonCommittedSearch];
        BOOL v48 = [(SDSearchQuery *)self isBullseyeCommittedSearch];
        BOOL v49 = self->_parsecEnabled || self->_parsecSettingEnabled;
        LOBYTE(v63) = v49;
        unsigned int v58 = [(SSRankingManager *)v44 makeTopHitSectionUsingSections:v45 withItemRanker:v46 sectionHeader:v71 shortcutResult:0 isBullseyeNonCommittedSearch:v47 isBullseyeCommittedSearch:v48 parsecEnabled:v63 maxNumAppsInTopHitSection:v38];
        id v59 = self->_topHitSection;
        self->_topHitSection = v58;

        long long v60 = SPLogForSPLogCategoryDefault();
        os_log_type_t v61 = 2 * (gSPLogDebugAsDefault == 0);
        if (os_log_type_enabled(v60, v61))
        {
          id v62 = [(SFMutableResultSection *)self->_topHitSection resultsCount];
          *(_DWORD *)buf = 134217984;
          id v81 = v62;
          _os_log_impl((void *)&_mh_execute_header, v60, v61, "Top hit section count: %lu  Allow multiple apps: YES", buf, 0xCu);
        }

        id v8 = v43;
      }

      self = v72;
    }
    long long v32 = [(SFMutableResultSection *)self->_topHitSection results];
    if ([v32 count])
    {
      unint64_t v33 = 0;
      do
      {
        id v34 = [v32 objectAtIndex:v33];
        uint64_t v35 = [v34 rankingItem];
        objc_msgSend(v35, "setBundleIDType:", (unint64_t)objc_msgSend(v35, "bundleIDType") | 0x8000);

        ++v33;
      }
      while (v33 < (unint64_t)[v32 count]);
    }
    unsigned __int8 v36 = [(SDSearchQuery *)v72 topHitsReadyToSend:v72->_topHitSection];
    [(SDSearchQuery *)v72 internalDebug];
    if (v36)
    {
      [v8 insertObject:v72->_topHitSection atIndex:0];
      v72->_didSendTopHits = 1;
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
  id v4 = a3;
  id v5 = SPLogForSPLogCategoryQuery();
  os_log_type_t v6 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v5, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "storeWillComplete %@", (uint8_t *)&v11, 0xCu);
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

- (void)sendCompletions:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)SPXPCMessage) initWithName:@"LocalSuggestions"];
  CFStringRef v18 = @"QID";
  os_log_type_t v6 = +[NSNumber numberWithUnsignedInt:self->_externalID];
  unsigned int v19 = v6;
  double v7 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  [v5 setInfo:v7];

  id v8 = SPLogForSPLogCategoryDefault();
  os_log_type_t v9 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v8, v9))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Send completions %@", (uint8_t *)&v16, 0xCu);
  }

  dispatch_time_t v10 = SPLogForSPLogCategoryDefault();
  os_log_type_t v11 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v10, v11))
  {
    qos_class_t v12 = qos_class_self();
    int v16 = 67109120;
    LODWORD(v17) = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "QOS sendQueryCompleted 1: %d", (uint8_t *)&v16, 8u);
  }

  [v5 setRootObject:v4];
  id v13 = SPLogForSPLogCategoryDefault();
  os_log_type_t v14 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v13, v14))
  {
    qos_class_t v15 = qos_class_self();
    int v16 = 67109120;
    LODWORD(v17) = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "QOS sendQueryCompleted 2: %d", (uint8_t *)&v16, 8u);
  }

  if (([(SDSearchQuery *)self cancelled] & 1) == 0) {
    [(SPXPCConnection *)self->_connection sendMessage:v5];
  }
}

- (BOOL)storeSearchProgress:(id)a3 withSections:(id)a4 suggestionResults:(id)a5
{
  id v8 = a3;
  id v44 = a4;
  id v43 = a5;
  uint32_t v45 = v8;
  if (v8)
  {
    os_log_type_t v9 = SPLogForSPLogCategoryQuery();
    os_log_type_t v10 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v9, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      os_log_type_t v11 = *(void **)&self->SPSearchQuery_opaque[OBJC_IVAR___SPSearchQuery__searchString];
      *(_DWORD *)buf = 138412802;
      unsigned int v58 = v11;
      __int16 v59 = 2112;
      long long v60 = v45;
      __int16 v61 = 2048;
      id v62 = [v44 count];
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "storeSearchProgress, query:\"%@\", token:%@, sectionCount:%ld", buf, 0x20u);
    }

    if (![v45 type])
    {
      self->_didReceiveCoreSpotlightProgress = 1;
      objc_storeStrong((id *)&self->_localSuggestionResults, a5);
    }
    BOOL v42 = [v45 store];
    if (objc_opt_respondsToSelector())
    {
      qos_class_t v12 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v38 = [(SDSearchQuery *)self queryContext];
        id v39 = [v38 searchString];
        os_log_type_t v40 = [v45 rankingInfo];
        *(_DWORD *)buf = 138412802;
        unsigned int v58 = v39;
        __int16 v59 = 2112;
        long long v60 = v42;
        __int16 v61 = 2112;
        id v62 = v40;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "query %@: Store %@ got new ranking_info: %@", buf, 0x20u);
      }
      rankingManager = self->_rankingManager;
      os_log_type_t v14 = [v45 rankingInfo];
      [(SSRankingManager *)rankingManager updateWithNewRankingInfo:v14];
    }
    uint64_t v41 = self->_categoryToResultMapping;
    objc_sync_enter(v41);
    id v15 = [(SDSearchQuery *)self queryIdent];
    int v16 = [(SDSearchQuery *)self queryContext];
    id v17 = [v16 searchString];
    +[SSRankingManager logSections:v44 prefix:@"L1 progress" queryId:v15 query:v17];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = v44;
    id v18 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v52;
      uint64_t v48 = SSPeopleBundleIdentifier;
      uint64_t v46 = SSSectionIdentifierPeopleSuggestions;
      do
      {
        for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v52 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if (objc_msgSend(v21, "resultsCount", v41))
          {
            memset(v50, 0, sizeof(v50));
            id v22 = [v21 results];
            if ([v22 countByEnumeratingWithState:v50 objects:v55 count:16])
            {
              uint64_t v23 = (void *)**((void **)&v50[0] + 1);
              id v24 = [**((id **)&v50[0] + 1) personIdentifier];
              if (v24)
              {
                long long v25 = [v23 resultBundleId];
                if ([v25 isEqual:v48])
                {

                  goto LABEL_21;
                }
                double v26 = [v23 resultBundleId];
                unsigned int v27 = [v26 isEqual:v46];

                if (v27) {
LABEL_21:
                }
                  [v21 setBundleIdentifier:v48];
              }
            }

            categoryToResultMapping = self->_categoryToResultMapping;
            double v29 = [v21 bundleIdentifier];
            double v30 = [(NSMutableDictionary *)categoryToResultMapping objectForKeyedSubscript:v29];

            if (v30)
            {
              [(SDSearchQuery *)self deDuplicateSection:v21 againstSection:v30];
              id v31 = [v21 results];
              [v30 addResultsFromArray:v31];

              long long v32 = [v21 bundleIdentifier];
              unsigned int v33 = [v32 isEqualToString:@"com.apple.application"];

              if (v33) {
                objc_msgSend(v30, "sortRange:options:usingComparator:", 0, objc_msgSend(v30, "resultsCount"), 16, &stru_1000929C0);
              }
            }
            else
            {
              id v34 = self->_categoryToResultMapping;
              uint64_t v35 = [v21 bundleIdentifier];
              unsigned __int8 v36 = v35;
              if (!v35)
              {
                BOOL v47 = [v21 title];
                unsigned __int8 v36 = v47;
              }
              [(NSMutableDictionary *)v34 setObject:v21 forKeyedSubscript:v36];
              if (!v35) {

              }
              [(NSMutableOrderedSet *)self->_sectionOrderByInsertion addObject:v21];
            }

            continue;
          }
        }
        id v18 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v18);
    }

    objc_sync_exit(v41);
    [(SDSearchQuery *)self sendFinishedDomains:4];
  }
  return 0;
}

- (BOOL)storeCompletedSearch:(id)a3 withSections:(id)a4 suggestionResults:(id)a5
{
  id v8 = a3;
  id obj = a4;
  id v167 = a5;
  uint64_t v9 = si_tracing_current_span();
  long long v10 = *(_OWORD *)(v9 + 16);
  long long v213 = *(_OWORD *)v9;
  long long v214 = v10;
  uint64_t v215 = *(void *)(v9 + 32);
  uint64_t v11 = *(void *)v9;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v13 = *(void *)(v9 + 8);
  *(void *)uint64_t v9 = v11;
  *(void *)(v9 + 8) = spanid;
  *(void *)(v9 + 16) = v13;
  *(unsigned char *)(v9 + 28) = 102;
  *(void *)(v9 + 32) = "-[SDSearchQuery storeCompletedSearch:withSections:suggestionResults:]";
  si_tracing_log_span_begin();
  uint64_t v169 = v9;
  id v170 = v8;
  if (!v8) {
    goto LABEL_172;
  }
  os_log_type_t v14 = SPLogForSPLogCategoryQuery();
  id v181 = self;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = *(id *)&self->SPSearchQuery_opaque[OBJC_IVAR___SPSearchQuery__searchString];
    int v16 = v15;
    if (v15)
    {
      id v17 = (char *)[v15 length];
      if ((unint64_t)v17 > 4)
      {
        uint64_t v19 = [v16 substringToIndex:3];
        BOOL v20 = [v16 substringFromIndex:v17 - 1];
        id v18 = +[NSString stringWithFormat:@"%@...%@<%lu chars>", v19, v20, v17];
      }
      else
      {
        id v18 = v16;
      }
    }
    else
    {
      id v18 = 0;
    }

    id v21 = v18;
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v170;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = [obj count];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "storeCompletedSearch, query:\"%@\", token:%@, sectionCount:%ld", buf, 0x20u);
  }
  objc_opt_class();
  id v22 = v170;
  uint64_t v23 = v181;
  int isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    uint64_t v24 = [v170 fbq];
    CFStringRef fbq = v181->_fbq;
    v181->_CFStringRef fbq = (NSString *)v24;

    uint64_t v26 = objc_msgSend(v170, "web_fbq");
    web_CFStringRef fbq = v181->_web_fbq;
    v181->_web_CFStringRef fbq = (NSString *)v26;

    uint64_t v28 = objc_msgSend(v170, "server_features");
    server_features = v181->_server_features;
    v181->_server_features = (NSDictionary *)v28;

    v181->_suggestionsAreBlended = [v170 suggestionsAreBlended];
    uint64_t v30 = [v170 querySuggestionResults];
    serverSuggestionResults = v181->_serverSuggestionResults;
    v181->_serverSuggestionResults = (NSArray *)v30;

    id v22 = v170;
    uint64_t v23 = v181;
  }
  else
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  if (![v22 type])
  {
    objc_storeStrong((id *)&v23->_localSuggestionResults, a5);
    id v22 = v170;
  }
  unsigned int v168 = [v22 store];
  +[NSDate timeIntervalSinceReferenceDate];
  long long v32 = [(id)objc_opt_class() description];
  SDTraceAdd();

  unsigned int v33 = (id *)v181;
  if (objc_opt_respondsToSelector())
  {
    id v34 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v159 = [(SDSearchQuery *)v181 queryContext];
      id v160 = [v159 searchString];
      uint64_t v161 = [v170 rankingInfo];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v160;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v168;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v161;
      _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "query %@: Store %@ got new ranking_info: %@", buf, 0x20u);
    }
    rankingManager = v181->_rankingManager;
    unsigned __int8 v36 = [v170 rankingInfo];
    [(SSRankingManager *)rankingManager updateWithNewRankingInfo:v36];

    unsigned int v33 = (id *)v181;
  }
  id v164 = v33[28];
  objc_sync_enter(v164);
  id v37 = [v33 queryIdent];
  uint64_t v38 = [v33 queryContext];
  id v39 = [v38 searchString];
  +[SSRankingManager logSections:obj prefix:@"L1 complete" queryId:v37 query:v39];

  int v40 = SSEnableSpotlightTopHitPersonalizedRanking();
  int v178 = v40;
  if (v40)
  {
    id v41 = objc_alloc((Class)QUData);
    BOOL v42 = [(SDSearchQuery *)v181 queryContext];
    id v171 = [v41 initWithQueryContext:v42];

    int v40 = v178;
  }
  else
  {
    id v171 = 0;
  }
  long long v211 = 0u;
  long long v212 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  id obj = obj;
  id v43 = [obj countByEnumeratingWithState:&v209 objects:v224 count:16];
  if (v43)
  {
    uint64_t v180 = *(void *)v210;
    uint64_t v176 = SSPeopleBundleIdentifier;
    uint64_t v172 = SSSectionIdentifierPeopleSuggestions;
    do
    {
      for (uint64_t i = 0; i != v43; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v210 != v180) {
          objc_enumerationMutation(obj);
        }
        uint32_t v45 = *(void **)(*((void *)&v209 + 1) + 8 * i);
        if ([v45 resultsCount])
        {
          if (v40)
          {
            uint64_t v46 = [v45 resultSet];
            BOOL v47 = [v46 objectAtIndexedSubscript:0];
            uint64_t v48 = [v47 rankingItem];
            if (!v48) {
              goto LABEL_31;
            }
            BOOL v49 = [v45 resultSet];
            id v50 = [v49 objectAtIndexedSubscript:0];
            long long v51 = [v50 rankingItem];
            [v51 likelihood];
            BOOL v53 = v52 < 2.22044605e-16;

            if (v53)
            {
              long long v54 = v181->_rankingManager;
              uint64_t v46 = [(SDSearchQuery *)v181 queryContext];
              [v46 currentTime];
              double v56 = v55;
              BOOL v47 = [(SDSearchQuery *)v181 queryContext];
              id v57 = [v47 queryIdent];
              unsigned int v58 = [(SDSearchQuery *)v181 itemRanker];
              LOBYTE(v162) = 0;
              [(SSRankingManager *)v54 calculateLikelihoodAndPriorForSection:v45 currentTime:0 shortcutResult:v57 queryId:v58 ranker:0 nominateLocalTopHit:v171 qu:v56 isSearchToolClient:v162];

LABEL_31:
            }
          }
          memset(v208, 0, sizeof(v208));
          __int16 v59 = [v45 results];
          if ([v59 countByEnumeratingWithState:v208 objects:v223 count:16])
          {
            long long v60 = (void *)**((void **)&v208[0] + 1);
            __int16 v61 = [**((id **)&v208[0] + 1) personIdentifier];
            if (v61)
            {
              id v62 = [v60 resultBundleId];
              if ([v62 isEqual:v176])
              {

                goto LABEL_37;
              }
              uint64_t v63 = [v60 resultBundleId];
              unsigned int v64 = [v63 isEqual:v172];

              if (v64) {
LABEL_37:
              }
                [v45 setBundleIdentifier:v176];
            }
          }

          categoryToResultMapping = v181->_categoryToResultMapping;
          long long v66 = [v45 bundleIdentifier];
          unsigned int v67 = [(NSMutableDictionary *)categoryToResultMapping objectForKeyedSubscript:v66];

          if (v67)
          {
            [(SDSearchQuery *)v181 deDuplicateSection:v45 againstSection:v67];
            id v68 = [v45 results];
            [v67 addResultsFromArray:v68];

            uint64_t v69 = [v45 bundleIdentifier];
            unsigned int v70 = [v69 isEqualToString:@"com.apple.application"];

            if ((v70 & (isKindOfClass ^ 1)) != 0) {
              objc_msgSend(v67, "sortRange:options:usingComparator:", 0, objc_msgSend(v67, "resultsCount"), 16, &stru_1000929E0);
            }
          }
          else
          {
            id v71 = v181->_categoryToResultMapping;
            uint64_t v72 = [v45 bundleIdentifier];
            unsigned int v73 = v72;
            if (!v72)
            {
              uint64_t v174 = [v45 title];
              unsigned int v73 = v174;
            }
            [(NSMutableDictionary *)v71 setObject:v45 forKeyedSubscript:v73];
            if (!v72) {

            }
            [(NSMutableOrderedSet *)v181->_sectionOrderByInsertion addObject:v45];
          }

          int v40 = v178;
          continue;
        }
      }
      id v43 = [obj countByEnumeratingWithState:&v209 objects:v224 count:16];
    }
    while (v43);
  }

  objc_sync_exit(v164);
  unsigned int v175 = [(NSMutableArray *)v181->_delayedStartTokens containsObject:v170];
  id v74 = v181;
  objc_sync_enter(v74);
  v74->_shouldRecomputeSuggestions = 1;
  long long v75 = SPLogForSPLogCategoryQuery();
  os_log_type_t v76 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v75, v76))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v168;
    _os_log_impl((void *)&_mh_execute_header, v75, v76, "Completed search for store %@", buf, 0xCu);
  }

  [(NSMutableArray *)v74->_tokens removeObject:v170];
  [(NSMutableArray *)v74->_slowTokens removeObject:v170];
  [(NSMutableArray *)v181->_delayedStartTokens removeObject:v170];
  [(NSMutableArray *)v74->_finishedTokens addObject:v170];
  long long v77 = SPLogForSPLogCategoryQuery();
  os_log_type_t v78 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v77, v78))
  {
    tokens = v74->_tokens;
    slowTokens = v74->_slowTokens;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = tokens;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = slowTokens;
    _os_log_impl((void *)&_mh_execute_header, v77, v78, "Remaining stores %@ %@", buf, 0x16u);
  }

  *((void *)&v173 + 1) = [(NSMutableArray *)v74->_slowTokens count];
  id v165 = [(NSMutableArray *)v181->_delayedStartTokens count];
  __uint64_t v163 = (char *)[(NSMutableArray *)v74->_delayedStartStores count];
  id v81 = [(NSMutableArray *)v74->_tokens count];
  *(void *)&long long v173 = v81;
  if (__PAIR128__(*((unint64_t *)&v173 + 1), (unint64_t)v81) == 0
    && [(NSMutableArray *)v74->_delayedStartStores count])
  {
    long long v206 = 0u;
    long long v207 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    uint64_t v82 = v74->_delayedStartStores;
    id v83 = [(NSMutableArray *)v82 countByEnumeratingWithState:&v204 objects:v222 count:16];
    if (v83)
    {
      uint64_t v84 = *(void *)v205;
      do
      {
        for (j = 0; j != v83; j = (char *)j + 1)
        {
          if (*(void *)v205 != v84) {
            objc_enumerationMutation(v82);
          }
          unsigned __int8 v86 = [*(id *)(*((void *)&v204 + 1) + 8 * (void)j) performQuery:v74];
          if (v86) {
            [(NSMutableArray *)v181->_delayedStartTokens addObject:v86];
          }
        }
        id v83 = [(NSMutableArray *)v82 countByEnumeratingWithState:&v204 objects:v222 count:16];
      }
      while (v83);
    }

    [(NSMutableArray *)v74->_delayedStartStores removeAllObjects];
  }
  if ([(NSMutableArray *)v74->_slowTokens count]) {
    BOOL v177 = 0;
  }
  else {
    BOOL v177 = [(NSMutableArray *)v74->_tokens count] == 0;
  }
  if (v175)
  {
    long long v202 = 0u;
    long long v203 = 0u;
    long long v200 = 0u;
    long long v201 = 0u;
    id obj = obj;
    char v87 = 0;
    id v88 = [obj countByEnumeratingWithState:&v200 objects:v221 count:16];
    if (v88)
    {
      uint64_t v89 = *(void *)v201;
      do
      {
        for (k = 0; k != v88; k = (char *)k + 1)
        {
          if (*(void *)v201 != v89) {
            objc_enumerationMutation(obj);
          }
          v91 = *(void **)(*((void *)&v200 + 1) + 8 * (void)k);
          long long v196 = 0u;
          long long v197 = 0u;
          long long v198 = 0u;
          long long v199 = 0u;
          uint64_t v92 = [v91 results];
          id v93 = [v92 countByEnumeratingWithState:&v196 objects:v220 count:16];
          if (v93)
          {
            uint64_t v94 = *(void *)v197;
            while (2)
            {
              for (m = 0; m != v93; m = (char *)m + 1)
              {
                if (*(void *)v197 != v94) {
                  objc_enumerationMutation(v92);
                }
                if ([*(id *)(*((void *)&v196 + 1) + 8 * (void)m) topHit] == 2)
                {
                  char v87 = 1;
                  goto LABEL_84;
                }
              }
              id v93 = [v92 countByEnumeratingWithState:&v196 objects:v220 count:16];
              if (v93) {
                continue;
              }
              break;
            }
          }
LABEL_84:
        }
        id v88 = [obj countByEnumeratingWithState:&v200 objects:v221 count:16];
      }
      while (v88);
    }

    v74->_shouldRecomputeSuggestions = 0;
    long long v96 = v181;
    if (([(SDSearchQuery *)v74 cancelled] & 1) == 0)
    {
      if ([(NSMutableArray *)v74->_bottomPlacedSections count])
      {
        uint64_t v97 = [obj arrayByAddingObjectsFromArray:v74->_bottomPlacedSections];

        id obj = (id)v97;
        long long v96 = v181;
      }
      if ([v170 type] == (id)4) {
        [obj count];
      }
      if (&v163[(void)v165]) {
        BOOL v102 = 0;
      }
      else {
        BOOL v102 = v173 == 0;
      }
      int v103 = v102;
      HIDWORD(v162) = 2;
      LOBYTE(v162) = v87 & 1;
      -[SDSearchQuery sendResults:reset:partiallyComplete:update:complete:unchanged:delayedTopHit:reason:](v74, "sendResults:reset:partiallyComplete:update:complete:unchanged:delayedTopHit:reason:", obj, 0, 0, v103 ^ 1u, v162);
    }
    goto LABEL_128;
  }
  BOOL v98 = !v74->_didForceSend && v177;
  if (v98)
  {
    if (v74->_parsecEntityCameEarly)
    {
      timer = v74->_timer;
      if (timer)
      {
        dispatch_source_cancel(timer);
        dispatch_source_set_event_handler((dispatch_source_t)v74->_timer, 0);
        long long v100 = v74->_timer;
        v74->_timer = 0;
      }
      uint64_t v101 = 0;
      long long v96 = v181;
LABEL_99:
      [(SDSearchQuery *)v74 sendFinishedDomains:v98 reason:v101];
      goto LABEL_128;
    }
    if (!v74->_parsecCameLaterThanSRT)
    {
      v157 = v74->_timer;
      if (v157)
      {
        dispatch_source_cancel(v157);
        dispatch_source_set_event_handler((dispatch_source_t)v74->_timer, 0);
        BOOL v158 = v74->_timer;
        v74->_timer = 0;
      }
      [(SDSearchQuery *)v74 sendFinishedDomains:0];
      long long v96 = v181;
      goto LABEL_128;
    }
LABEL_113:
    v74->_didSendResults = 0;
    v74->_sendStableSections = 1;
    uint64_t v105 = [(NSArray *)v74->_actualSentSections arrayByAddingObjectsFromArray:obj];
    stableSections = v74->_stableSections;
    v74->_stableSections = (NSArray *)v105;

    long long v107 = objc_opt_new();
    long long v194 = 0u;
    long long v195 = 0u;
    long long v192 = 0u;
    long long v193 = 0u;
    id obj = obj;
    id v108 = [obj countByEnumeratingWithState:&v192 objects:v219 count:16];
    if (v108)
    {
      uint64_t v109 = *(void *)v193;
      do
      {
        for (n = 0; n != v108; n = (char *)n + 1)
        {
          if (*(void *)v193 != v109) {
            objc_enumerationMutation(obj);
          }
          unsigned int v111 = *(void **)(*((void *)&v192 + 1) + 8 * (void)n);
          if (v111)
          {
            id v112 = [v111 results];
            [v107 addObjectsFromArray:v112];
          }
        }
        id v108 = [obj countByEnumeratingWithState:&v192 objects:v219 count:16];
      }
      while (v108);
    }

    if ([v107 count])
    {
      v74->_receivedLateParsecResults = 1;
      id v113 = [objc_alloc((Class)SFResultsReceivedAfterTimeoutFeedback) initWithResults:v107];
      id v114 = +[SPFeedbackProxy sharedProxy];
      id v115 = [(SDSearchQuery *)v74 queryIdent];
      uint64_t v116 = [(SPXPCConnection *)v74->_connection bundleID];
      [v114 sendFeedbackType:14 feedback:v113 queryId:v115 clientID:v116];
    }
    if (SSDisplayLateServerSuggestions()) {
      BOOL v117 = [(NSArray *)v74->_serverSuggestionResults count] != 0;
    }
    else {
      BOOL v117 = 0;
    }
    v74->_shouldRecomputeSuggestions = v117;
    [(SDSearchQuery *)v74 sendFinishedDomains:3];

    long long v96 = v181;
    goto LABEL_128;
  }
  if (v74->_parsecCameLaterThanSRT) {
    goto LABEL_113;
  }
  if ((v74->_isEntitySearch & isKindOfClass) == 1)
  {
    long long v96 = v181;
    if (![(NSMutableArray *)v74->_tokens count] || [(NSMutableArray *)v74->_slowTokens count]) {
      goto LABEL_128;
    }
    v74->_parsecEntityCameEarly = 1;
    uint64_t v101 = 5;
    goto LABEL_99;
  }
  long long v96 = v181;
LABEL_128:
  if (v177)
  {
    id v118 = [(NSMutableArray *)v96->_delayedStartTokens count];
    if (!((char *)[(NSMutableArray *)v74->_delayedStartStores count] + (void)v118) && !v74->_sentCompleted)
    {
      [(SDSearchQuery *)v74 sendQueryCompleted];
      bottomPlacedSections = v74->_bottomPlacedSections;
      v74->_bottomPlacedSections = 0;

      v74->_sentCompleted = 1;
    }
  }
  objc_sync_exit(v74);

  if (![(NSMutableArray *)v74->_slowTokens count] && ![(NSMutableArray *)v74->_tokens count])
  {
    id v120 = objc_msgSend(objc_alloc((Class)SFClientTimingFeedback), "initWithEvent:timeInterval:queryId:", @"com.apple.searchd.backend.stores.end", 0, -[SDSearchQuery queryIdent](v74, "queryIdent"));
    uint64_t v121 = +[SPFeedbackProxy sharedProxy];
    id v122 = [(SDSearchQuery *)v74 queryIdent];
    v123 = [(SPXPCConnection *)v74->_connection bundleID];
    [v121 sendFeedbackType:21 feedback:v120 queryId:v122 clientID:v123];
  }
  if (![(NSMutableArray *)v74->_slowTokens count] || [(NSMutableArray *)v74->_tokens count]) {
    goto LABEL_140;
  }
  char v124 = v175;
  if (v74->_timer) {
    char v124 = 1;
  }
  if (v124)
  {
LABEL_140:
    double v125 = CFAbsoluteTimeGetCurrent() - v74->_storeStartTime;
    if ([(NSMutableArray *)v74->_tokens count])
    {
      id v126 = SPLogForSPLogCategoryDefault();
      os_log_type_t v127 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v126, v127))
      {
        uint64_t v128 = v74->_tokens;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v128;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(double *)&buf[14] = v125;
        _os_log_impl((void *)&_mh_execute_header, v126, v127, "Not waiting on parsec t:%@ (%f)", buf, 0x16u);
      }
    }
    else
    {
      id v126 = SPLogForSPLogCategoryDefault();
      os_log_type_t v129 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v126, v129))
      {
        id v130 = [(NSMutableArray *)v74->_slowTokens count];
        id v131 = [(NSMutableArray *)v74->_tokens count];
        os_log_type_t v132 = v74->_timer;
        *(_DWORD *)buf = 134219008;
        *(void *)&uint8_t buf[4] = v130;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v131;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v132;
        LOWORD(v217) = 1024;
        *(_DWORD *)((char *)&v217 + 2) = v175;
        HIWORD(v217) = 2048;
        double v218 = v125;
        _os_log_impl((void *)&_mh_execute_header, v126, v129, "Not waiting on parsec st:%ld t:%ld ti:%p d:%d (%f)", buf, 0x30u);
      }
    }
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    int v134 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "No more fast data stores, waiting for parsec", buf, 2u);
    }

    id location = 0;
    objc_initWeak(&location, v74);
    *(_OWORD *)buf = *(_OWORD *)v169;
    *(_OWORD *)&buf[16] = *(_OWORD *)(v169 + 16);
    uint64_t v217 = *(void *)(v169 + 32);
    v186[0] = _NSConcreteStackBlock;
    v186[1] = 3221225472;
    v186[2] = sub_10001CFBC;
    v186[3] = &unk_100092A48;
    long long v188 = *(_OWORD *)buf;
    long long v189 = *(_OWORD *)&buf[16];
    uint64_t v190 = v217;
    objc_copyWeak(&v187, &location);
    v186[4] = v74;
    id v135 = objc_retainBlock(v186);
    double v136 = Current - v74->_storeStartTime;
    if (v136 >= v74->_timeOut)
    {
      id v151 = SPLogForSPLogCategoryDefault();
      os_log_type_t v152 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v151, v152))
      {
        *(_WORD *)id v185 = 0;
        _os_log_impl((void *)&_mh_execute_header, v151, v152, "No more fast data stores, send", v185, 2u);
      }

      uint64_t v153 = v74->_timer;
      if (v153)
      {
        dispatch_source_cancel(v153);
        dispatch_source_set_event_handler((dispatch_source_t)v74->_timer, 0);
        uint64_t v154 = v74->_timer;
        v74->_timer = 0;
      }
      ((void (*)(void *, void))v135[2])(v135, 0);
      v74->_parsecCameLaterThanSRT = 1;
      v74->_shouldRecomputeSuggestions = 1;
    }
    else
    {
      id v137 = SPLogForSPLogCategoryDefault();
      os_log_type_t v138 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v137, v138))
      {
        *(_WORD *)id v185 = 0;
        _os_log_impl((void *)&_mh_execute_header, v137, v138, "No more fast data stores, within parsec timeout", v185, 2u);
      }

      double timeOut = (double)SSPriorityIndexDelayMilliseconds() / 1000.0;
      BOOL v140 = v136 < timeOut && !v74->_sentPriority;
      char v141 = !v140;
      if (!v140)
      {
        if (!v74->_sentPriority)
        {
          v142 = SPLogForSPLogCategoryDefault();
          os_log_type_t v143 = 2 * (gSPLogDebugAsDefault == 0);
          if (os_log_type_enabled(v142, v143))
          {
            *(_WORD *)id v185 = 0;
            _os_log_impl((void *)&_mh_execute_header, v142, v143, "Send for CoreSpotlight priority path", v185, 2u);
          }

          ((void (*)(void *, uint64_t))v135[2])(v135, 1);
        }
        double timeOut = v74->_timeOut;
      }
      id v144 = +[SDController workQueue];
      dispatch_source_t v145 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v144);
      unsigned int v146 = v74->_timer;
      v74->_timer = (OS_dispatch_source *)v145;

      unsigned int v147 = v74->_timer;
      dispatch_time_t v148 = dispatch_time(0, (unint64_t)((timeOut - v136) * 1000000000.0));
      dispatch_source_set_timer(v147, v148, 0xFFFFFFFFFFFFFFFFLL, 0);
      id v149 = [v135 copy];

      v150 = v74->_timer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10001D554;
      handler[3] = &unk_100092A70;
      id v135 = v149;
      id v183 = v135;
      char v184 = v141;
      dispatch_source_set_event_handler(v150, handler);
      dispatch_resume((dispatch_object_t)v74->_timer);
    }
    objc_destroyWeak(&v187);
    objc_destroyWeak(&location);
  }

LABEL_172:
  si_tracing_log_span_end();
  long long v155 = v214;
  *(_OWORD *)uint64_t v169 = v213;
  *(_OWORD *)(v169 + 16) = v155;
  *(void *)(v169 + 32) = v215;

  return 0;
}

- (BOOL)storeCompletedSearch:(id)a3 withSections:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SDSearchQuery *)self cancelled]) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = [(SDSearchQuery *)self storeCompletedSearch:v6 withSections:v7 suggestionResults:0];
  }

  return v8;
}

+ (BOOL)isCJK
{
  if (qword_1000A8DF8 != -1) {
    dispatch_once(&qword_1000A8DF8, &stru_100092A90);
  }
  return byte_1000A8DF0;
}

- (SDSearchQuery)initWithQueryContext:(id)a3 externalID:(unsigned int)a4 connection:(id)a5
{
  id v89 = a3;
  id v86 = a5;
  uint64_t v8 = si_tracing_current_span();
  long long v9 = *(_OWORD *)(v8 + 16);
  long long v96 = *(_OWORD *)v8;
  long long v97 = v9;
  uint64_t v98 = *(void *)(v8 + 32);
  uint64_t v10 = *(void *)v8;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v12 = *(void *)(v8 + 8);
  *(void *)uint64_t v8 = v10;
  *(void *)(v8 + 8) = spanid;
  *(void *)(v8 + 16) = v12;
  *(unsigned char *)(v8 + 28) = 102;
  *(void *)(v8 + 32) = "-[SDSearchQuery initWithQueryContext:externalID:connection:]";
  si_tracing_log_span_begin();
  uint64_t v82 = v8;
  id v84 = objc_msgSend(objc_alloc((Class)SFClientTimingFeedback), "initWithEvent:timeInterval:queryId:", @"com.apple.searchd.backend.query.start", 0, objc_msgSend(v89, "queryIdent"));
  id v83 = objc_msgSend(objc_alloc((Class)SFClientTimingFeedback), "initWithEvent:timeInterval:queryId:", @"com.apple.searchd.backend.suggestions.start", 0, objc_msgSend(v89, "queryIdent"));
  id v85 = [v89 queryIdent];
  char v87 = [v86 bundleID];
  id v88 = +[SPFeedbackProxy sharedProxy];
  [v88 sendFeedbackType:21 feedback:v84 queryId:v85 clientID:v87];
  [v88 sendFeedbackType:21 feedback:v83 queryId:v85 clientID:v87];
  v95.receiver = self;
  v95.super_class = (Class)SDSearchQuery;
  uint64_t v13 = [(SDSearchQuery *)&v95 initWithSearchQueryContext:v89];
  if (v13)
  {
    if (v86)
    {
      os_log_type_t v14 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:8];
      tokens = v13->_tokens;
      v13->_tokens = v14;

      int v16 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:8];
      slowTokens = v13->_slowTokens;
      v13->_slowTokens = v16;

      id v18 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:8];
      delayedStartStores = v13->_delayedStartStores;
      v13->_delayedStartStores = v18;

      BOOL v20 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:8];
      delayedStartTokens = v13->_delayedStartTokens;
      v13->_delayedStartTokens = v20;

      id v22 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:8];
      finishedTokens = v13->_finishedTokens;
      v13->_finishedTokens = v22;

      uint64_t v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      categoryToResultMapping = v13->_categoryToResultMapping;
      v13->_categoryToResultMapping = v24;

      uint64_t v26 = objc_opt_new();
      sectionOrderByInsertion = v13->_sectionOrderByInsertion;
      v13->_sectionOrderByInsertion = (NSMutableOrderedSet *)v26;

      v13->_unsigned int externalID = a4;
      objc_storeStrong((id *)&v13->_connection, a5);
      uint64_t v28 = [v89 disabledDomains];
      v13->_parsecSettingEnabled = [v28 containsObject:&off_100098AF8] ^ 1;

      double v29 = objc_opt_new();
      [(SDSearchQuery *)v13 setCategoryEngagements:v29];

      v13->_isRewrite = 0;
      v13->_isNLPSearch = 0;
      dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
      correctionsSem = v13->_correctionsSem;
      v13->_correctionsSem = (OS_dispatch_semaphore *)v30;

      uint64_t v32 = OBJC_IVAR___SPSearchQuery__searchString;
      id v33 = *(id *)&v13->SPSearchQuery_opaque[OBJC_IVAR___SPSearchQuery__searchString];
      id v34 = [v89 searchEntities];
      id v35 = [v34 count];

      if (v35)
      {
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        unsigned __int8 v36 = [v89 searchEntities];
        id v37 = [v36 countByEnumeratingWithState:&v91 objects:v99 count:16];
        if (!v37) {
          goto LABEL_21;
        }
        uint64_t v38 = *(void *)v92;
        while (1)
        {
          id v39 = 0;
          int v40 = v33;
          do
          {
            if (*(void *)v92 != v38) {
              objc_enumerationMutation(v36);
            }
            id v41 = *(void **)(*((void *)&v91 + 1) + 8 * (void)v39);
            unsigned __int8 v42 = [v41 isAppEntitySearch];
            id v43 = &OBJC_IVAR___SDSearchQuery__isScopedAppSearch;
            if ((v42 & 1) != 0
              || (unsigned __int8 v44 = [v41 isContactEntitySearch],
                  id v43 = &OBJC_IVAR___SDSearchQuery__isPeopleSearch,
                  (v44 & 1) != 0)
              || (unsigned __int8 v45 = [v41 isPhotosEntitySearch],
                  id v43 = &OBJC_IVAR___SDSearchQuery__isPhotosSearch,
                  (v45 & 1) != 0))
            {
              p_isNLPSearch = (BOOL *)&v13->SPSearchQuery_opaque[*v43];
LABEL_13:
              BOOL *p_isNLPSearch = 1;
              goto LABEL_14;
            }
            unsigned __int8 v47 = [v41 isNLPEntitySearch];
            p_isNLPSearch = &v13->_isNLPSearch;
            if (v47) {
              goto LABEL_13;
            }
LABEL_14:
            if ([v41 isCommandEntitySearch])
            {
              v13->_isEntitySearch = 1;
              [(SDSearchQuery *)v13 setInfinitePatience:1];
            }
            [v41 updateSearchString:*(void *)&v13->SPSearchQuery_opaque[v32]];
            id v33 = [v41 currentSearchString];

            id v39 = (char *)v39 + 1;
            int v40 = v33;
          }
          while (v37 != v39);
          id v48 = [v36 countByEnumeratingWithState:&v91 objects:v99 count:16];
          id v37 = v48;
          if (!v48)
          {
LABEL_21:

            break;
          }
        }
      }
      BOOL v49 = [v89 keyboardPrimaryLanguage];
      id v50 = [v49 lowercaseString];

      long long v51 = +[NSLocale currentLocale];
      id v90 = [v51 objectForKey:NSLocaleLanguageCode];

      if (![v50 hasPrefix:@"en"]
        || (unsigned __int8 v52 = [v90 hasPrefix:@"en"], v53 = v90, (v52 & 1) != 0))
      {
        BOOL v53 = v50;
      }
      id v54 = v53;
      if (+[SDSearchQuery isCJK]
        || ([v50 hasPrefix:@"ja"] & 1) != 0
        || ([v50 hasPrefix:@"zh"] & 1) != 0)
      {
        unsigned __int8 v55 = 1;
      }
      else
      {
        unsigned __int8 v55 = [v50 hasPrefix:@"ko"];
      }
      v13->_BOOL isCJK = v55;
      +[SSRankingManager prepareTopHitsParametersForLanguage:v54];
      double v56 = (SSRankingManager *)[objc_alloc((Class)SSRankingManager) initWithQuery:v33];
      rankingManager = v13->_rankingManager;
      v13->_rankingManager = v56;

      unsigned int v58 = (void *)CFPreferencesCopyAppValue(@"SearchRankingUseCreationDateL2", @"com.apple.searchd");
      __int16 v59 = (void *)CFPreferencesCopyAppValue(@"SearchRankingL2YWeight", @"com.apple.searchd");
      if (v13->_isPeopleSearch)
      {
        long long v60 = [(SDSearchQuery *)v13 itemRanker];
        [v60 setIsPeopleSearch:1];
      }
      id v61 = objc_alloc((Class)PRSRankingItemRanker);
      BOOL isCJK = v13->_isCJK;
      [v58 doubleValue];
      double v64 = v63;
      [v59 doubleValue];
      double v66 = v65;
      [(SDSearchQuery *)v13 currentTime];
      id v68 = [v61 initWithSearchString:v33 queryID:v85 language:v54 isCJK:isCJK experimentalWeight1:v64 experimentalWeight2:v66 currentTime:v67];
      [(SDSearchQuery *)v13 setItemRanker:v68];

      [(SDSearchQuery *)v13 setIsInternalDevice:os_variant_has_internal_diagnostics()];
      v13->_parsecCameLaterThanSRT = 0;
      v13->_parsecEntityCameEarly = 0;
      v13->_shouldRecomputeSuggestions = 1;
      uint64_t v69 = [v89 searchEntities];
      id v70 = [v69 count];

      if (v70)
      {
        id v71 = [v89 searchEntities];
        uint64_t v72 = [v71 firstObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v74 = [v89 searchEntities];
          long long v75 = [v74 firstObject];
          uint64_t v76 = [v75 preferredBundleIDs];
          preferredBundleIDs = v13->_preferredBundleIDs;
          v13->_preferredBundleIDs = (NSArray *)v76;

          v13->_enforcePreferredBundleIDs = 1;
        }
      }
    }
    os_log_type_t v78 = +[SDController datastoreForDomain:2];
    v13->_parsecEnabled = [v78 parsecEnabled];
  }
  unsigned int v79 = v13;

  si_tracing_log_span_end();
  long long v80 = v97;
  *(_OWORD *)uint64_t v82 = v96;
  *(_OWORD *)(v82 + 16) = v80;
  *(void *)(v82 + 32) = v98;

  return v79;
}

- (id)correctedQueryWithCorrection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)SPSearchQueryContext) initWithSearchString:v4];

  id v6 = [(SDSearchQuery *)self queryContext];
  [v5 setWhyQuery:18];
  [v5 setQueryKind:10];
  objc_msgSend(v5, "setQueryIdent:", -[SDSearchQuery queryIdent](self, "queryIdent"));
  id v7 = [v6 keyboardLanguage];
  [v5 setKeyboardLanguage:v7];

  uint64_t v8 = [v6 keyboardPrimaryLanguage];
  [v5 setKeyboardPrimaryLanguage:v8];

  [v6 scaleFactor];
  objc_msgSend(v5, "setScaleFactor:");
  long long v9 = [v6 searchDomains];
  [v5 setSearchDomains:v9];

  uint64_t v10 = [v6 disabledDomains];
  [v5 setDisabledDomains:v10];

  uint64_t v11 = [(SDSearchQuery *)self disabledApps];
  [v5 setDisabledApps:v11];

  uint64_t v12 = [(SDSearchQuery *)self disabledBundles];
  [v5 setDisabledBundles:v12];

  uint64_t v13 = [v6 markedTextArray];
  [v5 setMarkedTextArray:v13];

  objc_msgSend(v5, "setPromoteLocalResults:", -[SDSearchQuery promoteLocalResults](self, "promoteLocalResults"));
  objc_msgSend(v5, "setPromoteParsecResults:", -[SDSearchQuery promoteParsecResults](self, "promoteParsecResults"));
  objc_msgSend(v5, "setNoTokenize:", -[SDSearchQuery noTokenize](self, "noTokenize"));
  objc_msgSend(v5, "setDeviceAuthenticationState:", objc_msgSend(v6, "deviceAuthenticationState"));
  os_log_type_t v14 = [v6 queryUnderstandingOutput];
  [v5 setQueryUnderstandingOutput:v14];

  id v15 = [SDSearchQuery alloc];
  uint64_t v16 = [(SDSearchQuery *)self externalID];
  id v17 = [(SDSearchQuery *)self connection];
  id v18 = [(SDSearchQuery *)v15 initWithQueryContext:v5 externalID:v16 connection:v17];

  uint64_t v19 = [(SDSearchQuery *)self queryContext];
  -[SDSearchQuery setPreviousQueryKind:](v18, "setPreviousQueryKind:", [v19 queryKind]);

  [(SDSearchQuery *)v18 setInfinitePatience:[(SDSearchQuery *)self infinitePatience]];
  [(SDSearchQuery *)v18 setNoTokenize:[(SDSearchQuery *)self noTokenize]];
  [(SDSearchQuery *)v18 setPromoteParsecResults:[(SDSearchQuery *)self promoteParsecResults]];
  [(SDSearchQuery *)v18 setPromoteLocalResults:[(SDSearchQuery *)self promoteLocalResults]];
  [(SDSearchQuery *)v18 setContentFilters:[(SDSearchQuery *)self contentFilters]];
  [(SDSearchQuery *)v18 setMaxCount:[(SDSearchQuery *)self maxCount]];
  BOOL v20 = [(SDSearchQuery *)self message];
  [(SDSearchQuery *)v18 setMessage:v20];

  [(SDSearchQuery *)v18 setIsWideScreen:[(SDSearchQuery *)self isWideScreen]];
  [(SDSearchQuery *)v18 setInternalDebug:[(SDSearchQuery *)self internalDebug]];
  [(SDSearchQuery *)v18 setIsRewrite:1];

  return v18;
}

- (void)dealloc
{
  id v3 = [(SDSearchQuery *)self message];
  unsigned int v4 = [v3 needsReply];

  if (v4)
  {
    id v5 = [(SDSearchQuery *)self message];
    [v5 sendReply:&__NSDictionary0__struct];
  }
  if ([(SDSearchQuery *)self cancelled]) {
    sub_100017670(self, "cancel", self->_startTime);
  }
  v6.receiver = self;
  v6.super_class = (Class)SDSearchQuery;
  [(SDSearchQuery *)&v6 dealloc];
}

- (id)waitForQueryCorrections
{
  correctionsSem = self->_correctionsSem;
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
  id v2 = +[SDController datastoreForDomain:2];
  unsigned __int8 v3 = [v2 available];

  return v3;
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
  return (SPXPCMessage *)objc_getProperty(self, a2, 240, 1);
}

- (void)setMessage:(id)a3
{
}

- (NSString)fbq
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (NSString)web_fbq
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (NSMutableDictionary)categoryEngagements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 264, 1);
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
  self->_blendingTime = a3;
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
  self->_BOOL allowAnonymousDataCollection = a3;
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
  self->_prefersLocalUserTypedSuggestion = a3;
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

- (NSMutableArray)delayedStartStores
{
  return self->_delayedStartStores;
}

- (void)setDelayedStartStores:(id)a3
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
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 424, 1);
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

- (void).cxx_destruct
{
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
  objc_storeStrong((id *)&self->_delayedStartStores, 0);
  objc_storeStrong((id *)&self->_delayedStartTokens, 0);
  objc_storeStrong((id *)&self->_slowTokens, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_itemRanker, 0);
  objc_storeStrong((id *)&self->_geoUserSessionEntityString, 0);
  objc_storeStrong((id *)&self->_categoryEngagements, 0);
  objc_storeStrong((id *)&self->_web_fbq, 0);
  objc_storeStrong((id *)&self->_fbq, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_sectionOrderByInsertion, 0);
  objc_storeStrong((id *)&self->_categoryToResultMapping, 0);
  objc_storeStrong((id *)&self->_server_features, 0);
  objc_storeStrong((id *)&self->_searchThroughCEPData, 0);
  objc_storeStrong((id *)&self->_bundlesSupportingAppScoping, 0);
  objc_storeStrong((id *)&self->_topHitsManager, 0);
  objc_storeStrong((id *)&self->_actualSentSections, 0);
  objc_storeStrong((id *)&self->_sentSections, 0);
  objc_storeStrong((id *)&self->_stableSections, 0);
  objc_storeStrong((id *)&self->_bottomPlacedSections, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end