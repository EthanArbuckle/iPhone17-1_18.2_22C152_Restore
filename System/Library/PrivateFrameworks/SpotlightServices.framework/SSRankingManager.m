@interface SSRankingManager
+ (BOOL)searchToolShouldFilterEventBeforeRanking:(id)a3 queryContext:(id)a4 matchQUIntent:(BOOL)a5 searchToolBundles:(id)a6 useLLMQU:(BOOL)a7 hasEventTypeFromQU:(BOOL)a8;
+ (BOOL)searchToolShouldFilterResultBeforeRanking:(id)a3 queryContext:(id)a4 matchQUIntent:(BOOL)a5 intentAndResultWithStartDueDate:(BOOL)a6 isCleanSlate:(BOOL)a7 searchToolBundles:(id)a8 useLLMQU:(BOOL)a9;
+ (__CFString)defaultKey;
+ (float)topicalityAdjustmentForHighlyEngagedFileResult:(id)a3 topicalityBeforeAdjustment:(float)a4 engagement:(float)a5;
+ (float)topicalityAdjustmentForMessageFreshness:(float)a3 topicalityBeforeAdjustment:(float)a4;
+ (id)bundleIDSetsForQUIntent:(id)a3;
+ (id)getCoreDuetValues;
+ (id)getDemoteNonExactMatchBundle;
+ (id)getEventIntentFallbackTokens;
+ (id)getForbiddenSecondSections;
+ (id)getLegacyTophitSection;
+ (id)getPoorSecondSections;
+ (id)getSuggestionsRankingThresholds;
+ (id)getTopHitItems:(id)a3;
+ (id)getTopHitsContinuationThresholds;
+ (id)getTopHitsThresholdsForBundleId:(uint64_t)a1;
+ (id)getTopHitsThresholdsForBundleId:(unint64_t)a3 queryLength:(unint64_t)a4 queryTermCount:(char)a5 getFallback:;
+ (id)jsonStringFromDictionary:(id)a3;
+ (id)jsonStringFromDictionary:(id)a3 prettyPrinted:(BOOL)a4;
+ (id)keyForIntervalType:(int64_t)a3;
+ (id)nominateServerTopHitForSection:(id)a3 queryString:(id)a4 language:(id)a5 currentTime:(double)a6;
+ (id)processSearchToolFinalResults:(id)a3 queryContext:(id)a4;
+ (id)rankLocalBundles:(id)a3 sectionMapping:(id)a4 l3RankingScores:(id)a5;
+ (id)rankLocalBundlesUsingModelL3ScoreAndRules:(id)a3 sectionMapping:(id)a4 l3RankingScores:(id)a5;
+ (id)rankLocalBundlesUsingOriginalL2ScoreAndRules:(id)a3 sectionMapping:(id)a4 l3RankingScores:(id)a5;
+ (uint64_t)getMinMisspellingLengthForLanguage:(uint64_t)a1;
+ (uint64_t)getRecencyIntervalForBundleId:(uint64_t)a3 intervalType:(unint64_t)a4 indexRequired:;
+ (uint64_t)getRecencyIntervalForBundleType:(uint64_t)a3 intervalType:(unint64_t)a4 indexRequired:;
+ (uint64_t)isKeywordsHidingEnabledForLanguage:(uint64_t)a1;
+ (void)deactivate;
+ (void)determineTopHitsForSafariSection:(id)a3 forQuery:(id)a4;
+ (void)extractThresholdABValues:(id)a3 forLanguage:(id)a4;
+ (void)fetchDuetValues;
+ (void)fillRankingPosition:(id)a3;
+ (void)initialize;
+ (void)logItems:(id)a3 prefix:(id)a4 queryId:(unint64_t)a5 query:(id)a6;
+ (void)logL3Results:(id)a3 l3Info:(id)a4;
+ (void)logSections:(id)a3 prefix:(id)a4 queryId:(unint64_t)a5 query:(id)a6;
+ (void)logStats:(id)a3 prefix:(id)a4 queryId:(unint64_t)a5 query:(id)a6;
+ (void)moveSafariTopHitsToTopOfSection:(id)a3;
+ (void)prepareSafariUserTypedURLForTopHitNomination:(id)a3 query:(id)a4;
+ (void)prepareServerSectionRankingItemsForTopHitNomination:(id)a3 currentTime:(double)a4;
+ (void)prepareTopHitsParametersForLanguage:(id)a3;
+ (void)rankLocalBundlesUsingL3Score:(id)a3 sectionMapping:(id)a4 l3RankingScores:(id)a5;
+ (void)reloadCommittedSearchParametersFromTrial;
+ (void)reloadLocaleSpecificMatchingParameters;
+ (void)reloadRankingParametersFromTrial;
+ (void)reloadRecencyThresholds;
+ (void)reloadSuggestionsRankingThresholds;
+ (void)reloadTopHitsParametersFromTrial;
+ (void)searchToolDeduplicateResults:(id)a3;
+ (void)searchToolFilterResultsAfterRanking:(id)a3 queryContext:(id)a4;
+ (void)searchToolRanker:(id)a3 queryContext:(id)a4 searchToolBundles:(id)a5;
- (BOOL)bullseyeRankingEnabled;
- (BOOL)isCancelled;
- (BOOL)sectionContainsOnlyStaleApps:(id)a3;
- (BOOL)sectionContainsOnlyStaleApps:(id)a3 shortcutResult:(id)a4;
- (BOOL)sectionDoesNotContainMoreRecentlyUsedApps:(id)a3 lastUsedDate:(id)a4;
- (BOOL)sectionsContainsOnlyOneAppSection:(id)a3;
- (BOOL)sectionsContainsShortcutResult:(id)a3 shortcutResult:(id)a4;
- (NSMutableString)logValues;
- (NSSet)allowedTopHitSections;
- (NSString)query;
- (PRSRankingConfiguration)rankingConfiguration;
- (SSRankingManager)initWithQuery:(id)a3;
- (double)blendingTime;
- (double)roundedValueForScore:(double)a3;
- (float)appFreshnessAdjustmentForLaunchCounts:(float)a3 topicality:(float)a4 engagement:(float)a5 launchCount:(float)a6 launchCountTotal:(float)a7 nAppResultsWithLaunchCount:(unint64_t)a8 launchPortion:(float *)a9;
- (float)appFreshnessAdjustmentForOutOfSpotlightCounts:(float)a3 topicality:(float)a4 engagement:(float)a5 launchCount:(float)a6 launchCountTotal:(float)a7 nAppResultsWithLaunchCount:(unint64_t)a8 launchPortion:(float *)a9;
- (float)freshnessAdjustmentForAppResult:(id)a3 section:(id)a4 freshnessBeforeAdjustment:(float)a5 topicality:(float)a6 engagement:(float)a7 appsWithLaunchCount:(BOOL)a8 isSearchToolClient:(BOOL)a9;
- (float)likelihoodAdjustmentForMailAndNotesResult:(float)result freshness:(float)a4 topicality:(float)a5 engagement:(float)a6 numQueryTokens:(unint64_t)a7 queryLength:(unint64_t)a8;
- (float)topicalityAdjustmentForContactsResult:(id)a3 topicalityBeforeAdjustment:(float)result freshness:(float)a5;
- (id)CEPValuesForTTR;
- (id)applyTopSectionPolicy:(id)a3 withTopHitSection:(id)a4 isPeopleSearch:(BOOL)a5 queryKind:(unint64_t)a6 correction:(id)a7 queryLength:(unint64_t)a8 ranker:(id)a9;
- (id)groupSectionsByCategory:(id)a3 genreMap:(id)a4 topSections:(id)a5;
- (id)keyForSection:(id)a3;
- (id)makeTopHitSectionUsingSections:(id)a3 withItemRanker:(id)a4 sectionHeader:(id)a5 shortcutResult:(id)a6 isBullseyeNonCommittedSearch:(BOOL)a7 isBullseyeCommittedSearch:(BOOL)a8 parsecEnabled:(BOOL)a9 maxNumAppsInTopHitSection:(unint64_t)a10;
- (id)nominateLocalTopHitsFromSections:(id)a3 withItemRanker:(id)a4 sectionHeader:(id)a5 maxInitiallyVisibleResults:(unint64_t)a6 shortcutResult:(id)a7 isBullseyeNonCommittedSearch:(BOOL)a8 isBullseyeCommittedSearch:(BOOL)a9 parsecEnabled:(BOOL)a10 maxNumAppsInTopHitSection:(unint64_t)a11 queryId:(unint64_t)a12 queryKind:(unint64_t)a13 clientBundleID:(id)a14 qu:(id)a15 currentTime:(double)a16;
- (id)rankAppsAtTopForScopedSearchWithSections:(id)a3;
- (id)rankSectionsUsingBundleIDToSectionMapping:(id)a3 withRanker:(id)a4 preferredBundleIds:(id)a5 isScopedSearch:(BOOL)a6 queryId:(unint64_t)a7 isCJK:(BOOL)a8 isBullseyeNonCommittedSearch:(BOOL)a9 isBullseyeCommittedSearch:(BOOL)a10 isPeopleSearch:(BOOL)a11 queryContext:(id)a12;
- (id)relativeRankWithAbsRank:(id)a3 numberValues:(unint64_t)a4;
- (id)removeBlockListedSectionsForMapping:(id)a3;
- (id)removeBlockListedSectionsForMapping:(id)a3 withRankingConfiguration:(id)a4;
- (int64_t)compareDate:(id)a3 withDate:(id)a4;
- (void)_tagQUIntent:(id)a3 qu:(id)a4;
- (void)addCEPValuesForTTR;
- (void)applyTopHitRankingPolicyToSection:(id)a3 topResultSection:(id)a4 maxTopHitCount:(int64_t)a5 isShortcut:(BOOL)a6;
- (void)calculateLikelihoodAndPriorForSection:(id)a3 currentTime:(double)a4 shortcutResult:(id)a5 queryId:(unint64_t)a6 ranker:(id)a7 nominateLocalTopHit:(BOOL)a8 qu:(id)a9 isSearchToolClient:(BOOL)a10;
- (void)cancel;
- (void)finalizeLog;
- (void)logPommesScoringForRankingItem:(id)a3 queryId:(unint64_t)a4 query:(id)a5 bundleID:(id)a6 name:(id)a7 topicality:(float)a8 freshness:(float)a9 engagement:(float)a10 likelihood:(float)a11 launchPortion:(float)a12 launchCount:(float)a13 launchPortionOutOfSpotlight:(float)a14 launchCountOutOfSpotlight:(float)a15 engagedInSpotlight:(BOOL)a16 exactMatchedLaunchString:(BOOL)a17 lastUsedDate:(id)a18 recentEngagementDateInSpotlight:(id)a19 recentEngagementDateInApp:(id)a20 recentEngagementDateOutSpotlight:(id)a21 nominateLocalTopHit:(BOOL)a22;
- (void)refineSectionShowingVisibleResultsWithBetterTextMatches:(id)a3;
- (void)sendTTRLogsWithSections:(id)a3 searchString:(id)a4 queryKind:(unint64_t)a5 isCommittedSearch:(BOOL)a6 parsecCameLaterThanSRT:(BOOL)a7;
- (void)setAllowedTopHitSections:(id)a3;
- (void)setBlendingTime:(double)a3;
- (void)setBullseyeRankingEnabled:(BOOL)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setLogValues:(id)a3;
- (void)setQuery:(id)a3;
- (void)setRankingConfiguration:(id)a3;
- (void)updateServerScoresUsingBlockOrder:(id)a3 bundleFeatures:(id)a4;
- (void)updateWithNewRankingInfo:(id)a3;
- (void)withinSectionTopHitNomination:(id)a3 withItemRanker:(id)a4;
@end

@implementation SSRankingManager

+ (void)deactivate
{
}

+ (id)bundleIDSetsForQUIntent:(id)a3
{
  id v3 = a3;
  if (bundleIDSetsForQUIntent__onceToken != -1) {
    dispatch_once(&bundleIDSetsForQUIntent__onceToken, &__block_literal_global_1);
  }
  v4 = (__CFString *)v3;
  v5 = @"INTENT_FLIGHT";
  if (([(__CFString *)v4 hasPrefix:@"INTENT_FLIGHT"] & 1) != 0
    || (v5 = @"INTENT_HOTEL",
        v6 = v4,
        [(__CFString *)v4 hasPrefix:@"INTENT_HOTEL"]))
  {

    v6 = v5;
  }
  if ([(__CFString *)v4 hasPrefix:@"INTENT_RESTAURANT"])
  {

    v6 = @"INTENT_RESTAURANT";
  }
  v7 = [(id)bundleIDSetsForQUIntent___quIntentBundleSets objectForKeyedSubscript:v4];

  return v7;
}

void __44__SSRankingManager_bundleIDSetsForQUIntent___block_invoke()
{
  v51[12] = *MEMORY[0x1E4F143B8];
  v50[0] = @"INTENT_PHOTO_SEARCH";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v49 = @"com.apple.mobileslideshow";
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  v36 = [v0 setWithArray:v37];
  v51[0] = v36;
  v50[1] = @"INTENT_PHOTO_SEARCH_OCR";
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  v48 = @"com.apple.mobileslideshow";
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  v34 = [v1 setWithArray:v35];
  v51[1] = v34;
  v50[2] = @"INTENT_NOTES_SEARCH";
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v47 = @"com.apple.mobilenotes";
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v32 = [v2 setWithArray:v33];
  v51[2] = v32;
  v50[3] = @"INTENT_FILE_SEARCH";
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v46 = @"com.apple.DocumentsApp";
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  v30 = [v3 setWithArray:v31];
  v51[3] = v30;
  v50[4] = @"INTENT_MAIL_SEARCH";
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v45 = @"com.apple.mobilemail";
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  v28 = [v4 setWithArray:v29];
  v51[4] = v28;
  v50[5] = @"INTENT_MESSAGE_SEARCH";
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v44[0] = @"com.apple.MobileSMS";
  v44[1] = @"com.apple.mobilemail";
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  v26 = [v5 setWithArray:v27];
  v51[5] = v26;
  v50[6] = @"INTENT_CALENDAR_SEARCH";
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v43 = @"com.apple.mobilecal";
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v24 = [v6 setWithArray:v25];
  v51[6] = v24;
  v50[7] = @"INTENT_REMINDER_SEARCH";
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v42 = @"com.apple.reminders";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  v22 = [v7 setWithArray:v23];
  v51[7] = v22;
  v50[8] = @"INTENT_SAFARI_SEARCH";
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v41 = @"com.apple.mobilesafari";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v9 = [v8 setWithArray:v21];
  v51[8] = v9;
  v50[9] = @"INTENT_FLIGHT";
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  v40[0] = @"com.apple.spotlight.events";
  v40[1] = @"com.apple.mobilemail";
  v40[2] = @"com.apple.mobilecal";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
  v12 = [v10 setWithArray:v11];
  v51[9] = v12;
  v50[10] = @"INTENT_HOTEL";
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  v39[0] = @"com.apple.spotlight.events";
  v39[1] = @"com.apple.mobilemail";
  v39[2] = @"com.apple.mobilecal";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
  v15 = [v13 setWithArray:v14];
  v51[10] = v15;
  v50[11] = @"INTENT_RESTAURANT";
  v16 = (void *)MEMORY[0x1E4F1CAD0];
  v38[0] = @"com.apple.spotlight.events";
  v38[1] = @"com.apple.mobilemail";
  v38[2] = @"com.apple.mobilecal";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
  v18 = [v16 setWithArray:v17];
  v51[11] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:12];
  v20 = (void *)bundleIDSetsForQUIntent___quIntentBundleSets;
  bundleIDSetsForQUIntent___quIntentBundleSets = v19;
}

+ (id)getEventIntentFallbackTokens
{
  if (getEventIntentFallbackTokens_onceToken != -1) {
    dispatch_once(&getEventIntentFallbackTokens_onceToken, &__block_literal_global_373);
  }
  v2 = (void *)getEventIntentFallbackTokens_eventIntentFallbackTokens;
  return v2;
}

void __48__SSRankingManager_getEventIntentFallbackTokens__block_invoke()
{
  v0 = (void *)getEventIntentFallbackTokens_eventIntentFallbackTokens;
  getEventIntentFallbackTokens_eventIntentFallbackTokens = (uint64_t)&unk_1F1864280;
}

+ (void)logStats:(id)a3 prefix:(id)a4 queryId:(unint64_t)a5 query:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [v9 count];
  v13 = SSGeneralLog();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      v15 = SSRedactString(v11, 0);
      v16 = +[SSRankingManager jsonStringFromDictionary:v9 prettyPrinted:0];
      int v17 = 134218754;
      unint64_t v18 = a5;
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      v22 = v15;
      __int16 v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1BDB2A000, v13, OS_LOG_TYPE_DEFAULT, "[qid=%llu][SpotlightRanking] %@ query=%@ stats=%@", (uint8_t *)&v17, 0x2Au);

LABEL_6:
    }
  }
  else if (v14)
  {
    v15 = SSRedactString(v11, 0);
    int v17 = 134218498;
    unint64_t v18 = a5;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    v22 = v15;
    _os_log_impl(&dword_1BDB2A000, v13, OS_LOG_TYPE_DEFAULT, "[qid=%llu][SpotlightRanking] %@ query=%@ stats=skipped", (uint8_t *)&v17, 0x20u);
    goto LABEL_6;
  }
}

+ (void)logSections:(id)a3 prefix:(id)a4 queryId:(unint64_t)a5 query:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([v9 count])
  {
    unint64_t v27 = a5;
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v28 = v9;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          unint64_t v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          __int16 v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v18, "resultsCount", v27));
          id v20 = [v18 bundleIdentifier];
          if (v20)
          {
            [v12 setObject:v19 forKeyedSubscript:v20];
          }
          else
          {
            uint64_t v21 = [v18 identifier];
            v22 = (void *)v21;
            if (v21) {
              __int16 v23 = (__CFString *)v21;
            }
            else {
              __int16 v23 = @"nil";
            }
            [v12 setObject:v19 forKeyedSubscript:v23];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v15);
    }

    v24 = SSGeneralLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = SSRedactString(v11, 0);
      v26 = +[SSRankingManager jsonStringFromDictionary:v12];
      *(_DWORD *)buf = 134218754;
      unint64_t v34 = v27;
      __int16 v35 = 2112;
      id v36 = v10;
      __int16 v37 = 2112;
      v38 = v25;
      __int16 v39 = 2112;
      v40 = v26;
      _os_log_impl(&dword_1BDB2A000, v24, OS_LOG_TYPE_DEFAULT, "[qid=%llu][SpotlightRanking] %@ query=%@ sections=%@", buf, 0x2Au);
    }
    id v9 = v28;
  }
}

+ (void)logItems:(id)a3 prefix:(id)a4 queryId:(unint64_t)a5 query:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([v9 count])
  {
    unint64_t v29 = a5;
    id v30 = v10;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "sectionBundleIdentifier", v29);
          __int16 v19 = (void *)v18;
          if (v18) {
            id v20 = (__CFString *)v18;
          }
          else {
            id v20 = @"nil";
          }
          uint64_t v21 = v20;

          v22 = [v12 objectForKey:v21];

          if (!v22) {
            [v12 setObject:&unk_1F1860F08 forKeyedSubscript:v21];
          }
          __int16 v23 = (void *)MEMORY[0x1E4F28ED0];
          v24 = [v12 objectForKeyedSubscript:v21];
          uint64_t v25 = objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v24, "integerValue") + 1);
          [v12 setObject:v25 forKeyedSubscript:v21];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v15);
    }

    v26 = SSGeneralLog();
    id v10 = v30;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v27 = SSRedactString(v11, 0);
      id v28 = +[SSRankingManager jsonStringFromDictionary:v12];
      *(_DWORD *)buf = 134218754;
      unint64_t v36 = v29;
      __int16 v37 = 2112;
      id v38 = v30;
      __int16 v39 = 2112;
      v40 = v27;
      __int16 v41 = 2112;
      uint64_t v42 = v28;
      _os_log_impl(&dword_1BDB2A000, v26, OS_LOG_TYPE_DEFAULT, "[qid=%llu][SpotlightRanking] %@ query=%@ items=%@", buf, 0x2Au);
    }
  }
}

+ (void)fetchDuetValues
{
  id v4 = +[PRSMLManager getSPMLSharedInstance];
  uint64_t v2 = [v4 getRankedCategoriesAsDictionaryForDays:14];
  os_unfair_lock_lock((os_unfair_lock_t)&sDuetValuesLock);
  id v3 = (void *)initRankedCategoriesFromDuet;
  initRankedCategoriesFromDuet = v2;

  os_unfair_lock_unlock((os_unfair_lock_t)&sDuetValuesLock);
}

+ (id)getCoreDuetValues
{
  os_unfair_lock_lock((os_unfair_lock_t)&sDuetValuesLock);
  id v2 = (id)initRankedCategoriesFromDuet;
  os_unfair_lock_unlock((os_unfair_lock_t)&sDuetValuesLock);
  return v2;
}

- (void)cancel
{
  self->_isCancelled = 1;
}

- (double)roundedValueForScore:(double)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  bzero(__str, 0x400uLL);
  snprintf(__str, 0x400uLL, "%.3g", a3);
  return atof(__str);
}

- (id)removeBlockListedSectionsForMapping:(id)a3 withRankingConfiguration:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v6 lock];
  uint64_t v7 = [v6 cepBlocklistSet];
  v8 = (void *)v7;
  if (v5 && v7)
  {
    id v9 = (void *)[v5 mutableCopy];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = objc_msgSend(v5, "allKeys", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if ([v8 containsObject:v15]) {
            [v9 removeObjectForKey:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    uint64_t v16 = [v9 copy];
    id v5 = (id)v16;
  }
  [v6 unlock];

  return v5;
}

- (id)relativeRankWithAbsRank:(id)a3 numberValues:(unint64_t)a4
{
  id v5 = (void *)MEMORY[0x1E4F28ED0];
  [a3 doubleValue];
  double v7 = (v6 + -1.0) / (double)a4;
  return (id)[v5 numberWithDouble:v7];
}

- (void)applyTopHitRankingPolicyToSection:(id)a3 topResultSection:(id)a4 maxTopHitCount:(int64_t)a5 isShortcut:(BOOL)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ([v9 resultsCount] > (unint64_t)a5) {
    objc_msgSend(v9, "removeResultsInRange:", a5, objc_msgSend(v9, "resultsCount") - a5);
  }
  if ([v10 resultsCount])
  {
    uint64_t v11 = [v10 results];
    uint64_t v12 = [v11 objectAtIndexedSubscript:0];

    uint64_t v13 = [v12 rankingItem];
    if (![v13 eligibleForDemotion] || a6 || objc_msgSend(v12, "topHit"))
    {
    }
    else
    {
      uint64_t v14 = [v12 rankingItem];
      int v15 = [v14 topHitReason];

      if (!v15)
      {
        uint64_t v16 = [v9 results];
        int v17 = (void *)[v16 copy];

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          int v21 = 0;
          uint64_t v22 = *(void *)v27;
          do
          {
            uint64_t v23 = 0;
            uint64_t v24 = v21;
            do
            {
              if (*(void *)v27 != v22) {
                objc_enumerationMutation(v18);
              }
              uint64_t v25 = *(void *)(*((void *)&v26 + 1) + 8 * v23);
              objc_msgSend(v10, "addResults:atIndex:", v25, v24 + v23, (void)v26);
              [v9 removeResults:v25];
              ++v23;
            }
            while (v20 != v23);
            uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
            int v21 = v24 + v23;
          }
          while (v20);
        }

        if (![v9 resultsCount]) {
          [v10 setPinToTop:1];
        }
      }
    }
  }
}

- (BOOL)sectionContainsOnlyStaleApps:(id)a3
{
  return [(SSRankingManager *)self sectionContainsOnlyStaleApps:a3 shortcutResult:0];
}

- (BOOL)sectionContainsOnlyStaleApps:(id)a3 shortcutResult:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [a3 resultSet];
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v26 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v26) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v8 = [v7 sectionBundleIdentifier];
        if (![v8 isEqualToString:@"com.apple.application"]) {
          goto LABEL_19;
        }
        id v9 = [v7 rankingItem];
        if ([v9 didMatchRankingDescriptor:@"kMDItemLastUsedDateThisMonth"])
        {

LABEL_19:
LABEL_20:
          BOOL v23 = 0;
          goto LABEL_21;
        }
        id v10 = [v7 rankingItem];
        uint64_t v11 = [v10 L2FeatureVector];
        char v12 = [v11 isAppInDock];

        if (v12) {
          goto LABEL_20;
        }
        uint64_t v13 = [v7 rankingItem];
        int v14 = [v13 didMatchRankingDescriptor:@"kMDItemContentCreationDateToday"];

        if (v14)
        {
          int v15 = [v7 rankingItem];
          uint64_t v16 = SSCompactRankingAttrsGetValue((int8x8_t *)[v15 attributes], 0x177uLL);

          int v17 = [v7 rankingItem];
          id v18 = SSCompactRankingAttrsGetValue((int8x8_t *)[v17 attributes], 0x20uLL);

          [v16 timeIntervalSinceReferenceDate];
          double v20 = v19;
          [v18 timeIntervalSinceReferenceDate];
          double v22 = v20 <= v21 ? v21 - v20 : v20 - v21;

          if (v22 < 600.0) {
            goto LABEL_20;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      BOOL v23 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v23 = 1;
  }
LABEL_21:

  return v23;
}

- (BOOL)sectionDoesNotContainMoreRecentlyUsedApps:(id)a3 lastUsedDate:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [a3 resultSet];
  uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v37 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v37) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v10 = [v9 rankingItem];
        if ([v10 didMatchRankingDescriptor:@"kMDItemLastUsedDateThisMonth"])
        {
          uint64_t v11 = SSCompactRankingAttrsGetValue((int8x8_t *)[v10 attributes], 9uLL);
          [v11 timeIntervalSinceReferenceDate];
          double v13 = v12;
          [v5 timeIntervalSinceReferenceDate];
          double v15 = v14;

          if (v13 > v15) {
            goto LABEL_21;
          }
        }
        uint64_t v16 = [v10 contentType];
        int v17 = [v16 isEqualToString:@"public.contact"];

        if (v17)
        {
          id v18 = [v10 lastAccessDate];
          [v18 timeIntervalSinceReferenceDate];
          double v20 = v19;
          [v5 timeIntervalSinceReferenceDate];
          double v22 = v21;

          if (v20 > v22) {
            goto LABEL_21;
          }
        }
        BOOL v23 = [v9 rankingItem];
        int v24 = [v23 didMatchRankingDescriptor:@"kMDItemContentCreationDateToday"];

        if (v24)
        {
          uint64_t v25 = [v9 rankingItem];
          uint64_t v26 = SSCompactRankingAttrsGetValue((int8x8_t *)[v25 attributes], 0x177uLL);

          long long v27 = [v9 rankingItem];
          long long v28 = SSCompactRankingAttrsGetValue((int8x8_t *)[v27 attributes], 0x20uLL);

          [v26 timeIntervalSinceReferenceDate];
          double v30 = v29;
          [v28 timeIntervalSinceReferenceDate];
          if (v30 <= v31) {
            double v32 = v31 - v30;
          }
          else {
            double v32 = v30 - v31;
          }
          if (v32 < 600.0)
          {
            [v5 timeIntervalSinceReferenceDate];
            if (v30 > v33)
            {

LABEL_21:
              BOOL v34 = 0;
              goto LABEL_22;
            }
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v34 = 1;
LABEL_22:

  return v34;
}

- (BOOL)sectionsContainsOnlyOneAppSection:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    uint64_t v4 = [v3 firstObject];
    id v5 = [v4 resultSet];
    uint64_t v6 = [v5 firstObject];

    uint64_t v7 = [v6 rankingItem];
    unint64_t v8 = [v7 bundleIDType];

    BOOL v9 = (v8 >> 8) & 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)sectionsContainsShortcutResult:(id)a3 shortcutResult:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 identifier];

  if (v7)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      id v25 = v5;
      id v26 = v8;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ([v13 domain] != 2)
          {
            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            double v14 = [v13 resultSet];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v28;
              while (2)
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v28 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  double v19 = [*(id *)(*((void *)&v27 + 1) + 8 * j) identifier];
                  double v20 = [v6 identifier];
                  char v21 = [v19 isEqualToString:v20];

                  if (v21)
                  {

                    BOOL v22 = 1;
                    id v5 = v25;
                    id v8 = v26;
                    goto LABEL_23;
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
                if (v16) {
                  continue;
                }
                break;
              }
            }

            id v8 = v26;
            uint64_t v11 = v24;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
        BOOL v22 = 0;
        id v5 = v25;
      }
      while (v10);
    }
    else
    {
      BOOL v22 = 0;
    }
LABEL_23:
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

+ (void)moveSafariTopHitsToTopOfSection:(id)a3
{
  id v11 = a3;
  id v3 = objc_opt_new();
  uint64_t v4 = [v11 resultSet];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v11 resultSet];
      id v8 = [v7 objectAtIndexedSubscript:v6];

      if ([v8 isSafariTopHit]) {
        [v3 addIndex:v6];
      }

      ++v6;
      uint64_t v9 = [v11 resultSet];
      unint64_t v10 = [v9 count];
    }
    while (v10 > v6);
  }
  [v11 moveResultsAtIndexes:v3 toIndex:0];
  objc_msgSend(v11, "sortRange:options:usingComparator:", 0, objc_msgSend(v3, "count"), 0, &__block_literal_global_411);
}

uint64_t __52__SSRankingManager_moveSafariTopHitsToTopOfSection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 contentType];
  int v7 = [v6 isEqualToString:@"com.apple.safari.bookmark"];

  id v8 = [v5 contentType];
  int v9 = [v8 isEqualToString:@"com.apple.safari.bookmark"];

  if (!v7 || v9)
  {
    if ((v7 | v9 ^ 1) == 1)
    {
      id v11 = [v4 contentURL];
      double v12 = [v5 contentURL];
      unint64_t v13 = [v11 length];
      unint64_t v14 = [v12 length];
      if (v13 >= v14) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = -1;
      }
      if (v13 > v14) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v15;
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

- (void)logPommesScoringForRankingItem:(id)a3 queryId:(unint64_t)a4 query:(id)a5 bundleID:(id)a6 name:(id)a7 topicality:(float)a8 freshness:(float)a9 engagement:(float)a10 likelihood:(float)a11 launchPortion:(float)a12 launchCount:(float)a13 launchPortionOutOfSpotlight:(float)a14 launchCountOutOfSpotlight:(float)a15 engagedInSpotlight:(BOOL)a16 exactMatchedLaunchString:(BOOL)a17 lastUsedDate:(id)a18 recentEngagementDateInSpotlight:(id)a19 recentEngagementDateInApp:(id)a20 recentEngagementDateOutSpotlight:(id)a21 nominateLocalTopHit:(BOOL)a22
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v34 = a5;
  id v35 = a6;
  id v36 = a7;
  id v37 = a18;
  id v38 = a19;
  id v39 = a20;
  id v40 = a21;
  int v41 = _os_feature_enabled_impl();
  uint64_t v42 = SSGeneralLog();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    id v65 = v36;
    id v66 = v34;
    id v73 = v35;
    id v71 = v39;
    id v72 = v38;
    id v70 = v40;
    if (v41)
    {
      int v64 = [v33 isLocalTopHitCandidate];
      v67 = v36;
      v68 = v34;
    }
    else
    {
      v68 = SSRedactString(v34, 0);
      int v64 = [v33 isLocalTopHitCandidate];
      v67 = SSRedactString(v36, 1);
    }
    double v63 = a8;
    [v33 pommesL1Score];
    double v62 = v43;
    [v33 embeddingSimilarity];
    double v60 = v44;
    [v33 keywordMatchScore];
    double v46 = v45;
    double v61 = a11;
    [v33 score];
    double v48 = v47;
    int v58 = [v33 wasEngagedInSpotlight];
    int v57 = [v33 exactMatchedLaunchString];
    uint64_t v59 = [v33 attributes];
    uint64_t Count = SSCompactRankingAttrsGetCount([v33 attributes]);
    int v49 = [v33 isMailCategoryHighImpact];
    int v50 = [v33 isMailCategoryPromotions];
    int v51 = [v33 isMailCategoryTransactions];
    int v52 = [v33 isMailCategoryUpdates];
    int v53 = [v33 matchedQUIntent];
    int v54 = [v33 quIntentAvailable];
    [v33 quIntentScore];
    *(_DWORD *)buf = 67117826;
    BOOL v75 = a22;
    __int16 v76 = 2048;
    unint64_t v77 = a4;
    __int16 v78 = 2112;
    v79 = v68;
    __int16 v80 = 1024;
    int v81 = v64;
    __int16 v82 = 2112;
    id v83 = v73;
    __int16 v84 = 2112;
    v85 = v67;
    __int16 v86 = 2048;
    double v87 = v63;
    __int16 v88 = 2048;
    double v89 = v62;
    __int16 v90 = 2048;
    double v91 = v60;
    __int16 v92 = 2048;
    double v93 = v46;
    __int16 v94 = 2048;
    double v95 = a9;
    __int16 v96 = 2048;
    double v97 = a12;
    __int16 v98 = 2048;
    double v99 = a13;
    __int16 v100 = 2048;
    double v101 = a14;
    __int16 v102 = 2048;
    double v103 = a15;
    __int16 v104 = 2048;
    double v105 = a10;
    __int16 v106 = 2048;
    double v107 = v61;
    __int16 v108 = 2048;
    double v109 = v48;
    __int16 v110 = 1024;
    int v111 = v58;
    __int16 v112 = 1024;
    int v113 = v57;
    __int16 v114 = 2112;
    id v115 = v37;
    __int16 v116 = 2112;
    id v117 = v72;
    __int16 v118 = 2112;
    id v119 = v71;
    __int16 v120 = 2112;
    id v121 = v70;
    __int16 v122 = 2048;
    id v123 = v33;
    __int16 v124 = 2048;
    uint64_t v125 = v59;
    __int16 v126 = 2048;
    uint64_t v127 = Count;
    __int16 v128 = 1024;
    int v129 = v49;
    __int16 v130 = 1024;
    int v131 = v50;
    __int16 v132 = 1024;
    int v133 = v51;
    __int16 v134 = 1024;
    int v135 = v52;
    __int16 v136 = 1024;
    int v137 = v53;
    __int16 v138 = 1024;
    int v139 = v54;
    __int16 v140 = 2048;
    double v141 = v55;
    __int16 v142 = 1024;
    int v143 = [v33 spellCorrectedApp];
    _os_log_impl(&dword_1BDB2A000, v42, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Engagement_Debug> [TH=%d] qid: %llu, query: %@, isLocalCand: %d, bundleID: %@, name: %@, topicality: %f (pommesL1Score = %f, embeddingSimilarity = %f, keywordMatchScore = %f), freshness: %f, launchPortion: %f, launchCount: %f, launchPortionOutSpotlight: %f, launchCountOutSpotlight: %f, engagement: %f, likelihood: %f, L2 model: %f, engagedInSpotlight: %d, exactMatchedLaunchString: %d, lastUsedDate: %@, recentEngInSpotlight: %@, recentEngInApp: %@, recentEngOutSpotlight: %@, ri: %p/%p/%lu, isMailCategory: (HighImpact = %d, Promotions = %d, Transactions = %d, Updates = %d), matchedQUIntent: %d, quIntentAvailable: %d, quIntentScore: %f, spellCorrectedApp: %d", buf, 0x134u);
    if ((v41 & 1) == 0)
    {
    }
    id v36 = v65;
    id v34 = v66;
    id v35 = v73;
    id v39 = v71;
    id v38 = v72;
    id v40 = v70;
  }
}

- (float)freshnessAdjustmentForAppResult:(id)a3 section:(id)a4 freshnessBeforeAdjustment:(float)a5 topicality:(float)a6 engagement:(float)a7 appsWithLaunchCount:(BOOL)a8 isSearchToolClient:(BOOL)a9
{
  id v14 = a4;
  double v15 = a6;
  if (a6 >= 1.0 && a5 <= 0.9) {
    float v17 = 0.9;
  }
  else {
    float v17 = a5;
  }
  id v18 = [a3 rankingItem];
  double v19 = SSCompactRankingAttrsGetValue((int8x8_t *)[v18 attributes], 0x76uLL);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v19 BOOLValue])
  {
    BOOL v20 = (unint64_t)[v14 resultsCount] > 1 && a8;
    if (v17 >= 0.98) {
      BOOL v20 = 0;
    }
    if (a7 >= 0.5) {
      BOOL v20 = 0;
    }
    if (v15 < 1.0 && v20) {
      float v17 = 0.2;
    }
  }

  return v17;
}

- (float)appFreshnessAdjustmentForLaunchCounts:(float)a3 topicality:(float)a4 engagement:(float)a5 launchCount:(float)a6 launchCountTotal:(float)a7 nAppResultsWithLaunchCount:(unint64_t)a8 launchPortion:(float *)a9
{
  if (a6 <= 0.0 || a4 <= 0.0 && a5 <= 0.0) {
    return a3;
  }
  if (a8 >= 2 && (float)a8 < a7)
  {
    float v11 = a6 / a7;
    if ((float)(a6 / a7) > 0.0)
    {
      float v9 = 1.0;
      float v12 = (float)(v11 + 1.0) * a3;
      if (v12 <= 1.0) {
        float v9 = v12;
      }
      *a9 = v11;
      return v9;
    }
    return a3;
  }
  if (a8 != 1 || a4 <= 0.8 && a5 <= 0.8 || a7 <= 0.0) {
    return a3;
  }
  float v9 = 1.0;
  if (a6 > 1000.0) {
    return v9;
  }
  if (a6 <= 100.0)
  {
    if (a6 <= 50.0)
    {
      if (a6 <= 25.0)
      {
        if (a6 <= 10.0) {
          return a3;
        }
        BOOL v13 = a3 <= 0.7;
        float v9 = 0.7;
      }
      else
      {
        BOOL v13 = a3 <= 0.8;
        float v9 = 0.8;
      }
    }
    else
    {
      BOOL v13 = a3 <= 0.85;
      float v9 = 0.85;
    }
  }
  else
  {
    BOOL v13 = a3 <= 0.95;
    float v9 = 0.95;
  }
  if (!v13) {
    return a3;
  }
  return v9;
}

- (float)appFreshnessAdjustmentForOutOfSpotlightCounts:(float)a3 topicality:(float)a4 engagement:(float)a5 launchCount:(float)a6 launchCountTotal:(float)a7 nAppResultsWithLaunchCount:(unint64_t)a8 launchPortion:(float *)a9
{
  if (a6 <= 0.0 || a4 <= 0.0 && a5 <= 0.0) {
    return a3;
  }
  if (a8 >= 2 && (float)a8 < a7)
  {
    float v11 = a6 / a7;
    if ((float)(a6 / a7) > 0.0)
    {
      float v9 = 1.0;
      float v12 = (float)(v11 + 1.0) * a3;
      if (v12 <= 1.0) {
        float v9 = v12;
      }
      *a9 = v11;
      return v9;
    }
    return a3;
  }
  if (a8 != 1 || a4 <= 0.8 && a5 <= 0.8 || a7 <= 0.0) {
    return a3;
  }
  float v9 = 1.0;
  if (a6 > 18.0) {
    return v9;
  }
  if (a6 <= 15.0)
  {
    if (a6 <= 12.0)
    {
      if (a6 <= 9.0)
      {
        if (a6 <= 6.0) {
          return a3;
        }
        BOOL v13 = a3 <= 0.7;
        float v9 = 0.7;
      }
      else
      {
        BOOL v13 = a3 <= 0.8;
        float v9 = 0.8;
      }
    }
    else
    {
      BOOL v13 = a3 <= 0.85;
      float v9 = 0.85;
    }
  }
  else
  {
    BOOL v13 = a3 <= 0.95;
    float v9 = 0.95;
  }
  if (!v13) {
    return a3;
  }
  return v9;
}

- (float)likelihoodAdjustmentForMailAndNotesResult:(float)result freshness:(float)a4 topicality:(float)a5 engagement:(float)a6 numQueryTokens:(unint64_t)a7 queryLength:(unint64_t)a8
{
  BOOL v8 = a4 <= 0.2 || a5 <= 0.5;
  if (!v8 && (a7 > 2 || a8 >= 0x10))
  {
    double v9 = result + 0.15;
    if (v9 > 1.0) {
      return 1.0;
    }
    return v9;
  }
  return result;
}

- (float)topicalityAdjustmentForContactsResult:(id)a3 topicalityBeforeAdjustment:(float)result freshness:(float)a5
{
  double v5 = a5;
  if (v5 <= 0.94)
  {
    if (v5 <= 0.91) {
      return result;
    }
    double v9 = result;
    if (result > 0.5)
    {
      BOOL v7 = v9 < 0.8;
      float v8 = 0.8;
LABEL_7:
      if (v7) {
        return v8;
      }
      return result;
    }
    if (v9 > 0.1) {
      return 0.7;
    }
  }
  else
  {
    double v6 = result;
    if (result > 0.5)
    {
      BOOL v7 = v6 < 0.9;
      float v8 = 0.9;
      goto LABEL_7;
    }
    if (v6 > 0.1) {
      return 0.8;
    }
  }
  return result;
}

+ (float)topicalityAdjustmentForHighlyEngagedFileResult:(id)a3 topicalityBeforeAdjustment:(float)a4 engagement:(float)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  float v8 = v7;
  if (a5 >= 0.75)
  {
    uint64_t v9 = [v7 rankingItem];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      float v11 = [v8 rankingItem];
      if ([v11 exactMatchedLaunchString])
      {
      }
      else
      {
        float v12 = [v8 rankingItem];
        BOOL v13 = [v12 recentSimilarIntentEngagementDates];
        uint64_t v14 = [v13 count];

        if (!v14) {
          goto LABEL_9;
        }
      }
      double v15 = SSGeneralLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 134217984;
        uint64_t v18 = 0x3FF0000000000000;
        _os_log_impl(&dword_1BDB2A000, v15, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][Topicality adjustment][Files] Changing to %.04f due to high engagement", (uint8_t *)&v17, 0xCu);
      }

      a4 = 1.0;
    }
  }
LABEL_9:

  return a4;
}

+ (float)topicalityAdjustmentForMessageFreshness:(float)a3 topicalityBeforeAdjustment:(float)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v5 = a3;
  if (a3 >= 0.65) {
    return a4;
  }
  float v6 = a3 * a4;
  if ((float)(a3 * a4) < 0.05) {
    float v6 = 0.05;
  }
  if (a3 <= 2.2204e-16) {
    float v7 = 0.049;
  }
  else {
    float v7 = v6;
  }
  float v8 = SSGeneralLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218496;
    double v11 = a4;
    __int16 v12 = 2048;
    double v13 = v7;
    __int16 v14 = 2048;
    double v15 = v5;
    _os_log_impl(&dword_1BDB2A000, v8, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][Topicality adjustment][Messages] Changing %.04f -> %.04f due to freshness %.04f", (uint8_t *)&v10, 0x20u);
  }

  return v7;
}

- (void)_tagQUIntent:(id)a3 qu:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  float v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 intentBundleIds];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      [v7 intentScore];
      double v11 = v10;

      if (v11 >= 0.9)
      {
        __int16 v12 = [v7 intentBundleIds];
        double v13 = [v5 bundleIdentifier];
        uint64_t v14 = [v12 containsObject:v13];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        double v15 = objc_msgSend(v5, "results", 0);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v29 != v18) {
                objc_enumerationMutation(v15);
              }
              BOOL v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              char v21 = [v20 rankingItem];

              if (v21)
              {
                BOOL v22 = [v20 rankingItem];
                [v22 setMatchedQUIntent:v14];

                float v23 = -1.0;
                if (v14)
                {
                  [v7 intentScore];
                  float v23 = v24;
                }
                id v25 = [v20 rankingItem];
                *(float *)&double v26 = v23;
                [v25 setQuIntentScore:v26];

                long long v27 = [v20 rankingItem];
                [v27 setQuIntentAvailable:1];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v17);
        }
      }
    }
  }
}

- (void)calculateLikelihoodAndPriorForSection:(id)a3 currentTime:(double)a4 shortcutResult:(id)a5 queryId:(unint64_t)a6 ranker:(id)a7 nominateLocalTopHit:(BOOL)a8 qu:(id)a9 isSearchToolClient:(BOOL)a10
{
  BOOL v274 = a8;
  uint64_t v293 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v238 = a5;
  id v242 = a7;
  id v15 = a9;
  if (![v14 resultsCount]) {
    goto LABEL_122;
  }
  uint64_t v16 = [v14 bundleIdentifier];
  if ([v16 isEqualToString:@"com.apple.mobilesafari"]) {
    +[SSRankingManager prepareSafariUserTypedURLForTopHitNomination:v14 query:self->_query];
  }
  int v17 = [v16 isEqualToString:@"com.apple.application"];
  [(SSRankingManager *)self _tagQUIntent:v14 qu:v15];
  v241 = v14;
  v273 = v16;
  int v243 = v17;
  v237 = v15;
  if (v17)
  {
    v248 = self;
    long long v290 = 0u;
    long long v288 = 0u;
    long long v289 = 0u;
    long long v287 = 0u;
    uint64_t v18 = [v14 results];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v287 objects:v292 count:16];
    if (!v19)
    {
      uint64_t v245 = 0;
      uint64_t v21 = 0;
      float v23 = 0.0;
      float v24 = 0.0;
      goto LABEL_47;
    }
    uint64_t v20 = v19;
    uint64_t v245 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = *(void *)v288;
    float v23 = 0.0;
    float v24 = 0.0;
    while (1)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v288 != v22) {
          objc_enumerationMutation(v18);
        }
        double v26 = *(void **)(*((void *)&v287 + 1) + 8 * i);
        float v286 = 0.0;
        long long v27 = [v26 rankingItem];
        SSCompactRankingAttrsGetFloat([v27 attributes], 0x154uLL, &v286);

        float v28 = v286;
        if (v286 <= 0.0)
        {
          id v14 = [v26 rankingItem];
          if (![v14 wasEngagedInSpotlight])
          {
            BOOL v31 = 0;
LABEL_18:

            goto LABEL_19;
          }
        }
        long long v29 = [v26 rankingItem];
        [v29 topicalityScore];
        if (v30 <= 0.0)
        {
          long long v32 = [v26 rankingItem];
          [v32 engagementScore];
          BOOL v31 = v33 > 0.0;
        }
        else
        {
          BOOL v31 = 1;
        }

        if (v28 <= 0.0) {
          goto LABEL_18;
        }
LABEL_19:
        if (v31) {
          float v34 = v286;
        }
        else {
          float v34 = -0.0;
        }
        if (SSEnableSpotlightPersonalizedRanking2024())
        {
          id v35 = [v26 rankingItem];
          id v36 = SSCompactRankingAttrsGetValue((int8x8_t *)[v35 attributes], 0x74uLL);

          if ([v36 count])
          {
            id v37 = [v26 rankingItem];
            [v37 topicalityScore];
            if (v38 > 0.0)
            {

              goto LABEL_27;
            }
            id v39 = [v26 rankingItem];
            [v39 engagementScore];
            double v41 = v40;

            if (v41 > 0.0)
            {
LABEL_27:
              float v23 = v23 + (float)(unint64_t)[v36 count];
              ++v245;
            }
          }
        }
        v21 += v31;
        float v24 = v24 + v34;
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v287 objects:v292 count:16];
      if (!v20)
      {
LABEL_47:
        float v239 = v23;
        uint64_t v240 = v21;

        goto LABEL_48;
      }
    }
  }
  if (([v16 isEqualToString:@"com.apple.conversion"] & 1) == 0
    && ([v16 isEqualToString:@"com.apple.calculation"] & 1) == 0
    && ([v16 isEqualToString:@"com.apple.worldclock"] & 1) == 0
    && ![v16 isEqualToString:@"com.apple.datadetector.quick_actions"])
  {
    v248 = self;
    uint64_t v245 = 0;
    uint64_t v240 = 0;
    float v239 = 0.0;
    float v24 = 0.0;
LABEL_48:
    v251 = objc_opt_new();
    long long v282 = 0u;
    long long v283 = 0u;
    long long v284 = 0u;
    long long v285 = 0u;
    id obj = [v241 results];
    uint64_t v254 = [obj countByEnumeratingWithState:&v282 objects:v291 count:16];
    if (!v254) {
      goto LABEL_120;
    }
    uint64_t v247 = *(void *)v283;
LABEL_50:
    uint64_t v89 = 0;
    while (1)
    {
      if (*(void *)v283 != v247) {
        objc_enumerationMutation(obj);
      }
      uint64_t v272 = v89;
      __int16 v90 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResult:*(void *)(*((void *)&v282 + 1) + 8 * v89)];
      [v251 addObject:v90];
      double v91 = [v90 rankingItem];
      [v91 topicalityScore];
      float v93 = v92;

      __int16 v94 = [v90 rankingItem];
      [v94 engagementScore];
      float v96 = v95;

      float v286 = 0.0;
      uint64_t v281 = 0;
      if (v93 > 0.0) {
        break;
      }
      float v270 = 0.0;
      if (v96 <= 0.0) {
        float v113 = 0.05;
      }
      else {
        float v113 = v96 * 0.4;
      }
      float v100 = 0.0;
LABEL_92:
      v168 = [v90 rankingItem];
      [v168 setFreshnessScore:v100];

      float v280 = v113;
      __int16 v279 = 3227;
      v169 = [v90 rankingItem];
      v170 = [v169 L2FeatureVector];
      [v170 setScores:&v280 forFeatures:&v279 count:1];

      v171 = [v90 rankingItem];
      [v171 setTopicalityScore:v93];

      v172 = [v90 rankingItem];
      [v172 setLikelihood:v113];

      v173 = [v90 rankingItem];
      [v173 setFinalTopicality:v93];

      if (v274) {
        +[SSTopHitNominationManager nominateTopHitCandidate:v90];
      }
      v174 = [v90 rankingItem];
      v268 = SSCompactRankingAttrsGetValue((int8x8_t *)[v174 attributes], 9uLL);

      v175 = [v90 rankingItem];
      v176 = SSCompactRankingAttrsGetValue((int8x8_t *)[v175 attributes], 0x6CuLL);

      v177 = [v90 rankingItem];
      v178 = SSCompactRankingAttrsGetValue((int8x8_t *)[v177 attributes], 0x72uLL);

      v179 = [v90 rankingItem];
      uint64_t v180 = SSCompactRankingAttrsGetValue((int8x8_t *)[v179 attributes], 7uLL);

      v181 = [v90 rankingItem];
      uint64_t v182 = SSCompactRankingAttrsGetValue((int8x8_t *)[v181 attributes], 0xCuLL);

      v183 = [v90 rankingItem];
      uint64_t v184 = SSCompactRankingAttrsGetValue((int8x8_t *)[v183 attributes], 4uLL);

      v276 = (void *)v184;
      v278 = (void *)v182;
      if (SSEnableSpotlightPersonalizedRankingFeedbackLogging())
      {
        v185 = [v90 rankingItem];
        v186 = SSCompactRankingAttrsGetValue((int8x8_t *)[v185 attributes], 9uLL);
        v187 = v186;
        if (v186)
        {
          [v186 timeIntervalSinceReferenceDate];
          double v189 = trunc(fmax(a4 - v188, 0.0)) / 86400.0;
          if (v189 <= 540.0)
          {
            if (v189 <= 365.0)
            {
              if (v189 <= 90.0)
              {
                if (v189 <= 30.0)
                {
                  if (v189 <= 7.0)
                  {
                    v190 = v178;
                    if (v189 <= 3.0)
                    {
                      if (v189 <= 1.0) {
                        uint64_t v191 = 1;
                      }
                      else {
                        uint64_t v191 = 2;
                      }
                    }
                    else
                    {
                      uint64_t v191 = 3;
                    }
                  }
                  else
                  {
                    v190 = v178;
                    uint64_t v191 = 4;
                  }
                }
                else
                {
                  v190 = v178;
                  uint64_t v191 = 5;
                }
              }
              else
              {
                v190 = v178;
                uint64_t v191 = 6;
              }
            }
            else
            {
              v190 = v178;
              uint64_t v191 = 7;
            }
          }
          else
          {
            v190 = v178;
            uint64_t v191 = 8;
          }
        }
        else
        {
          v190 = v178;
          uint64_t v191 = 0;
        }
        v192 = objc_opt_new();
        [v192 setResultQueryRecency:v191];
        v193 = (void *)MEMORY[0x1E4F28ED0];
        [v185 l2Score];
        v194 = objc_msgSend(v193, "numberWithFloat:");
        [v192 setPommesL2Score:v194];

        v195 = (void *)MEMORY[0x1E4F28ED0];
        [v185 topicalityScore];
        v197 = [v195 numberWithDouble:round(v196 * 100000000.0) / 100000000.0];
        [v192 setTopicalityScore:v197];

        v198 = (void *)MEMORY[0x1E4F28ED0];
        [v185 freshnessScore];
        v200 = [v198 numberWithDouble:round(v199 * 100000000.0) / 100000000.0];
        [v192 setFreshness:v200];

        v201 = (void *)MEMORY[0x1E4F28ED0];
        [v185 engagementScore];
        v203 = [v201 numberWithDouble:round(v202 * 100000000.0) / 100000000.0];
        [v192 setEngagementScore:v203];

        v204 = (void *)MEMORY[0x1E4F28ED0];
        [v185 likelihood];
        v206 = [v204 numberWithDouble:round(v205 * 100000000.0) / 100000000.0];
        [v192 setPredictedLikelihoodOfEngagement:v206];

        objc_msgSend(v192, "setWasNominatedAsTopHit:", objc_msgSend(v185, "isLocalTopHitCandidate"));
        objc_msgSend(v192, "setIsExactMatchOfLaunchString:", objc_msgSend(v185, "exactMatchedLaunchString"));
        objc_msgSend(v192, "setWasEngagedInSpotlight:", objc_msgSend(v185, "wasEngagedInSpotlight"));
        v207 = [v185 retrievalType];
        objc_msgSend(v192, "setIsSemanticMatch:", ((unint64_t)objc_msgSend(v207, "integerValue") >> 1) & 1);

        v208 = [v185 retrievalType];
        objc_msgSend(v192, "setIsSyntacticMatch:", objc_msgSend(v208, "integerValue") != 2);

        v209 = (void *)MEMORY[0x1E4F28ED0];
        [v185 embeddingSimilarity];
        v210 = objc_msgSend(v209, "numberWithFloat:");
        [v192 setSemanticScore:v210];

        v211 = (void *)MEMORY[0x1E4F28ED0];
        [v185 pommesL1Score];
        v212 = objc_msgSend(v211, "numberWithFloat:");
        [v192 setSyntacticScore:v212];

        [v90 setCoreSpotlightRankingSignals:v192];
        v178 = v190;
        uint64_t v184 = (uint64_t)v276;
        uint64_t v182 = (uint64_t)v278;
      }
      v262 = v178;
      v213 = [v90 rankingItem];
      v214 = SSCompactRankingAttrsGetValue((int8x8_t *)[v213 attributes], 0x74uLL);

      uint64_t v215 = [v90 rankingItem];
      query = v248->_query;
      v260 = (void *)v215;
      if (v182) {
        uint64_t v216 = v182;
      }
      else {
        uint64_t v216 = v184;
      }
      if (v180) {
        uint64_t v216 = v180;
      }
      uint64_t v256 = v216;
      int v217 = HIDWORD(v281);
      float v218 = v286;
      int v219 = v281;
      v220 = [v90 rankingItem];
      v266 = (void *)v180;
      uint64_t v221 = [v220 wasEngagedInSpotlight];
      v222 = [v90 rankingItem];
      char v223 = [v222 exactMatchedLaunchString];
      [v176 valueForKeyPath:@"@max.self"];
      v224 = v264 = v176;
      v225 = [v178 valueForKeyPath:@"@max.self"];
      v226 = [v214 valueForKeyPath:@"@max.self"];
      LOBYTE(v236) = v274;
      LOBYTE(v235) = v223;
      *(float *)&double v227 = v93;
      *(float *)&double v228 = v100;
      *(float *)&double v229 = v96;
      *(float *)&double v230 = v113;
      LODWORD(v231) = v217;
      *(float *)&double v232 = v218;
      LODWORD(v233) = v219;
      *(float *)&double v234 = v270;
      -[SSRankingManager logPommesScoringForRankingItem:queryId:query:bundleID:name:topicality:freshness:engagement:likelihood:launchPortion:launchCount:launchPortionOutOfSpotlight:launchCountOutOfSpotlight:engagedInSpotlight:exactMatchedLaunchString:lastUsedDate:recentEngagementDateInSpotlight:recentEngagementDateInApp:recentEngagementDateOutSpotlight:nominateLocalTopHit:](v248, "logPommesScoringForRankingItem:queryId:query:bundleID:name:topicality:freshness:engagement:likelihood:launchPortion:launchCount:launchPortionOutOfSpotlight:launchCountOutOfSpotlight:engagedInSpotlight:exactMatchedLaunchString:lastUsedDate:recentEngagementDateInSpotlight:recentEngagementDateInApp:recentEngagementDateOutSpotlight:nominateLocalTopHit:", v260, a6, query, v273, v256, v221, v227, v228, v229, v230, v231, v232, v233, v234, v235,
        v268,
        v224,
        v225,
        v226,
        v236);

      uint64_t v89 = v272 + 1;
      if (v254 == v272 + 1)
      {
        uint64_t v254 = [obj countByEnumeratingWithState:&v282 objects:v291 count:16];
        if (!v254)
        {
LABEL_120:

          [v241 setResults:v251];
          __int16 v88 = v273;
          goto LABEL_121;
        }
        goto LABEL_50;
      }
    }
    double v97 = [v90 rankingItem];
    *(float *)&double v98 = v93;
    [v97 staleDemotionWithCurrentTime:a4 topicality:v98];
    float v100 = v99;

    if (v243)
    {
      double v101 = [v90 rankingItem];
      SSCompactRankingAttrsGetFloat([v101 attributes], 0x154uLL, &v286);

      float v102 = 0.0;
      __int16 v108 = v273;
      if (!SSEnableSpotlightPersonalizedRanking2024())
      {
LABEL_78:
        *(float *)&double v106 = v286;
        *(float *)&double v103 = v100;
        *(float *)&double v104 = v93;
        *(float *)&double v105 = v96;
        *(float *)&double v107 = v24;
        [(SSRankingManager *)v248 appFreshnessAdjustmentForLaunchCounts:v240 topicality:(char *)&v281 + 4 engagement:v103 launchCount:v104 launchCountTotal:v105 nAppResultsWithLaunchCount:v106 launchPortion:v107];
        int v146 = v145;
        if (SSEnableSpotlightPersonalizedRanking2024())
        {
          LODWORD(v147) = v146;
          *(float *)&double v148 = v93;
          *(float *)&double v149 = v96;
          *(float *)&double v150 = v102;
          uint64_t v152 = v245;
          *(float *)&double v151 = v239;
          [(SSRankingManager *)v248 appFreshnessAdjustmentForOutOfSpotlightCounts:v245 topicality:&v281 engagement:v147 launchCount:v148 launchCountTotal:v149 nAppResultsWithLaunchCount:v150 launchPortion:v151];
          int v146 = LODWORD(v147);
          v153 = v241;
        }
        else
        {
          v153 = v241;
          uint64_t v152 = v245;
        }
        BOOL v154 = (v240 | v152) != 0;
        LODWORD(v147) = v146;
        *(float *)&double v148 = v93;
        *(float *)&double v149 = v96;
        BOOL v114 = a10;
        [(SSRankingManager *)v248 freshnessAdjustmentForAppResult:v90 section:v153 freshnessBeforeAdjustment:v154 topicality:a10 engagement:v147 appsWithLaunchCount:v148 isSearchToolClient:v149];
        float v100 = v155;
        goto LABEL_82;
      }
      double v109 = [v90 rankingItem];
      __int16 v110 = SSCompactRankingAttrsGetValue((int8x8_t *)[v109 attributes], 0x74uLL);

      if ([v110 count])
      {
        int v111 = [v90 rankingItem];
        [v111 topicalityScore];
        if (v112 > 0.0)
        {

LABEL_76:
          float v102 = (float)(unint64_t)[v110 count];
          float v239 = v239 + v102;
          ++v245;
          goto LABEL_77;
        }
        __int16 v142 = [v90 rankingItem];
        [v142 engagementScore];
        double v144 = v143;

        if (v144 > 0.0) {
          goto LABEL_76;
        }
      }
LABEL_77:
      __int16 v108 = v273;

      goto LABEL_78;
    }
    BOOL v114 = a10;
    __int16 v108 = v273;
    if (a10)
    {
LABEL_62:
      float v102 = 0.0;
      if ([v273 isEqualToString:@"com.apple.mobilemail"])
      {
        id v115 = [v90 rankingItem];
        __int16 v116 = SSCompactRankingAttrsGetValue((int8x8_t *)[v115 attributes], 0x10CuLL);

        if (v116)
        {
          unint64_t v117 = [v116 unsignedIntegerValue];
          BOOL v118 = (v117 & 0xFFFFFFFFFFFFFFDFLL) == 0;
          BOOL v119 = (v117 & 0xFFFFFFFFFFFFFFDFLL) == 4;
          BOOL v120 = (v117 & 0xFFFFFFFFFFFFFFDFLL) == 16;
          BOOL v121 = (v117 & 0xFFFFFFFFFFFFFFDFLL) == 2;
          uint64_t v122 = (v117 >> 5) & 1;
          id v123 = [v90 rankingItem];
          [v123 setIsMailCategoryDefault:v118];

          __int16 v124 = [v90 rankingItem];
          [v124 setIsMailCategoryTransactions:v119];

          uint64_t v125 = [v90 rankingItem];
          [v125 setIsMailCategoryUpdates:v120];

          __int16 v126 = [v90 rankingItem];
          [v126 setIsMailCategoryPromotions:v121];

          uint64_t v127 = [v90 rankingItem];
          [v127 setIsMailCategoryHighImpact:v122];
        }
        __int16 v108 = v273;
        BOOL v114 = a10;
      }
LABEL_82:
      if (v114)
      {
LABEL_87:
        float v113 = v100 * 0.8 * v93 + v96 * 0.2;
        if (([v108 isEqualToString:@"com.apple.mobilemail"] & 1) != 0
          || [v108 isEqualToString:@"com.apple.mobilenotes"])
        {
          uint64_t v161 = [v242 queryTermCount];
          uint64_t v162 = [v242 queryTermLength];
          *(float *)&double v163 = v100 * 0.8 * v93 + v96 * 0.2;
          *(float *)&double v164 = v100;
          *(float *)&double v165 = v93;
          *(float *)&double v166 = v96;
          [(SSRankingManager *)v248 likelihoodAdjustmentForMailAndNotesResult:v161 freshness:v162 topicality:v163 engagement:v164 numQueryTokens:v165 queryLength:v166];
          float v113 = v167;
        }
        float v270 = v102;
        if (v113 < 0.05) {
          float v113 = 0.05;
        }
        goto LABEL_92;
      }
LABEL_83:
      v156 = [v90 rankingItem];
      __int16 v157 = [v156 bundleIDType];

      if ((v157 & 0x800) != 0 && v96 > 0.0)
      {
        *(float *)&double v158 = v93;
        *(float *)&double v159 = v96;
        +[SSRankingManager topicalityAdjustmentForHighlyEngagedFileResult:v90 topicalityBeforeAdjustment:v158 engagement:v159];
        float v93 = v160;
      }
      __int16 v108 = v273;
      goto LABEL_87;
    }
    if ([v273 isEqualToString:@"com.apple.MobileAddressBook"])
    {
      *(float *)&double v128 = v93;
      *(float *)&double v129 = v100;
      [(SSRankingManager *)v248 topicalityAdjustmentForContactsResult:v90 topicalityBeforeAdjustment:v128 freshness:v129];
      float v93 = v130;
      int v131 = [v90 rankingItem];
      __int16 v132 = v131;
      *(float *)&double v133 = v93;
    }
    else
    {
      if (![v273 isEqualToString:@"com.apple.MobileSMS"] || v93 <= 0.0) {
        goto LABEL_62;
      }
      *(float *)&double v134 = v100;
      *(float *)&double v135 = v93;
      +[SSRankingManager topicalityAdjustmentForMessageFreshness:v134 topicalityBeforeAdjustment:v135];
      float v93 = v136;
      int v137 = [v90 rankingItem];
      *(float *)&double v138 = v93;
      [v137 setKeywordMatchScore:v138];

      int v139 = [v90 rankingItem];
      [v139 freshnessScore];
      double v141 = v140;

      float v102 = 0.0;
      if (v141 > 2.22044605e-16) {
        goto LABEL_83;
      }
      int v131 = [v90 rankingItem];
      __int16 v132 = v131;
      LODWORD(v133) = 1028174906;
    }
    [v131 setKeywordMatchScore:v133];

    float v102 = 0.0;
    goto LABEL_83;
  }
  uint64_t v42 = [v14 resultSet];
  float v43 = [v42 objectAtIndexedSubscript:0];
  float v44 = [v43 rankingItem];

  if (!v44)
  {
    float v45 = [[PRSRankingItem alloc] initWithAttrs:SSCompactRankingAttrsAlloc(0)];
    double v46 = [v14 resultSet];
    float v47 = [v46 objectAtIndexedSubscript:0];
    [v47 setRankingItem:v45];

    double v48 = [v14 resultSet];
    int v49 = [v48 objectAtIndexedSubscript:0];
    int v50 = [v49 rankingItem];
    [v50 setSectionBundleIdentifier:v273];
  }
  int v51 = [v237 intentLabel];
  if ([v51 isEqualToString:@"INTENT_MAIL_SEARCH"])
  {
    int v52 = v14;
    int v53 = [v14 resultSet];
    int v54 = [v53 objectAtIndexedSubscript:0];
    float v55 = [v54 resultBundleId];
    int v56 = [v55 isEqualToString:@"com.apple.datadetector.quick_actions.calendar"];

    if (v56)
    {
      +[SSTopHitNominationManager getTopHitThreshold:@"LOCAL_TOPHIT_CANDIDATE_LIKELIHOOD_THRESHOLD"];
      double v58 = v57 + -0.01;
      uint64_t v59 = [v241 resultSet];
      double v60 = [v59 objectAtIndexedSubscript:0];
      double v61 = [v60 rankingItem];
      double v62 = v61;
      double v63 = v58;
      goto LABEL_43;
    }
  }
  else
  {

    int v52 = v14;
  }
  uint64_t v59 = [v52 resultSet];
  double v60 = [v59 objectAtIndexedSubscript:0];
  double v61 = [v60 rankingItem];
  double v62 = v61;
  double v63 = 1.0;
LABEL_43:
  [v61 setLikelihood:v63];

  if (v274)
  {
    int v64 = [v241 resultSet];
    id v65 = [v64 objectAtIndexedSubscript:0];
    +[SSTopHitNominationManager nominateTopHitCandidate:v65];
  }
  v277 = [v241 resultSet];
  v275 = [v277 objectAtIndexedSubscript:0];
  id v66 = [v275 rankingItem];
  v259 = self->_query;
  v271 = [v241 resultSet];
  v269 = [v271 objectAtIndexedSubscript:0];
  v267 = [v269 rankingItem];
  [v267 topicalityScore];
  *(float *)&unsigned int v68 = v67;
  v265 = [v241 resultSet];
  v263 = [v265 objectAtIndexedSubscript:0];
  v261 = [v263 rankingItem];
  [v261 freshnessScore];
  float v70 = v69;
  v257 = [v241 resultSet];
  v255 = [v257 objectAtIndexedSubscript:0];
  v253 = [v255 rankingItem];
  [v253 engagementScore];
  float v72 = v71;
  v250 = [v241 resultSet];
  v249 = [v250 objectAtIndexedSubscript:0];
  id v73 = [v249 rankingItem];
  [v73 likelihood];
  float v75 = v74;
  __int16 v76 = [v241 resultSet];
  unint64_t v77 = [v76 objectAtIndexedSubscript:0];
  __int16 v78 = [v77 rankingItem];
  uint64_t v79 = [v78 wasEngagedInSpotlight];
  __int16 v80 = [v241 resultSet];
  [v80 objectAtIndexedSubscript:0];
  v82 = int v81 = self;
  id v83 = [v82 rankingItem];
  LOBYTE(v236) = v274;
  LOBYTE(v235) = [v83 exactMatchedLaunchString];
  *(float *)&double v84 = v70;
  *(float *)&double v85 = v72;
  *(float *)&double v86 = v75;
  double v87 = v81;
  __int16 v88 = v273;
  -[SSRankingManager logPommesScoringForRankingItem:queryId:query:bundleID:name:topicality:freshness:engagement:likelihood:launchPortion:launchCount:launchPortionOutOfSpotlight:launchCountOutOfSpotlight:engagedInSpotlight:exactMatchedLaunchString:lastUsedDate:recentEngagementDateInSpotlight:recentEngagementDateInApp:recentEngagementDateOutSpotlight:nominateLocalTopHit:](v87, "logPommesScoringForRankingItem:queryId:query:bundleID:name:topicality:freshness:engagement:likelihood:launchPortion:launchCount:launchPortionOutOfSpotlight:launchCountOutOfSpotlight:engagedInSpotlight:exactMatchedLaunchString:lastUsedDate:recentEngagementDateInSpotlight:recentEngagementDateInApp:recentEngagementDateOutSpotlight:nominateLocalTopHit:", v66, a6, v259, v273, @"CCCD", v79, COERCE_DOUBLE((unint64_t)v68), v84, v85, v86, 0.0, 0.0, 0.0, 0.0, v235,
    0,
    0,
    0,
    0,
    v236);

LABEL_121:
  id v14 = v241;
  id v15 = v237;
LABEL_122:
}

- (void)withinSectionTopHitNomination:(id)a3 withItemRanker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 bundleIdentifier];
  if ([v6 domain] == 1)
  {
    if (([v8 isEqualToString:@"com.apple.mobilemail"] & 1) != 0
      || (SSSectionIsSyndicatedPhotos(v8) & 1) != 0)
    {
      goto LABEL_9;
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__SSRankingManager_withinSectionTopHitNomination_withItemRanker___block_invoke;
    v9[3] = &unk_1E634C380;
    v9[4] = self;
    id v10 = v8;
    id v11 = v7;
    [v6 sortWithOptions:16 usingComparator:v9];
  }
  else if ([v6 domain] == 2)
  {
    [v6 sortWithOptions:16 usingComparator:&__block_literal_global_427];
  }
  if ([v8 isEqualToString:@"com.apple.application"]) {
    +[SSTopHitNominationManager topHitCandidacyThresholdingForAppSection:v6];
  }
LABEL_9:
}

uint64_t __65__SSRankingManager_withinSectionTopHitNomination_withItemRanker___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && v6)
  {
    uint64_t v8 = [v5 rankingItem];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      id v10 = [v7 rankingItem];

      if (v10)
      {
        id v11 = [v5 rankingItem];
        int v12 = [v11 bundleIDType];

        if ((v12 & 0x80) != 0)
        {
          double v13 = [v5 rankingItem];
          id v14 = [v7 rankingItem];
          uint64_t v15 = [v13 compareSafariTopHitCandidate:v14];
        }
        else if ((v12 & 0x100) != 0)
        {
          double v13 = [v5 rankingItem];
          id v14 = [v7 rankingItem];
          uint64_t v15 = [v13 compareAppsTopHitCandidate:v14];
        }
        else if ((v12 & 4) != 0)
        {
          double v13 = [v5 rankingItem];
          id v14 = [v7 rankingItem];
          uint64_t v15 = [v13 compareContactsTopHitCandidate:v14];
        }
        else
        {
          if ((v12 & 0x1800000) == 0)
          {
            if ((v12 & 0x10) != 0)
            {
              double v13 = [v5 rankingItem];
              id v14 = [v7 rankingItem];
            }
            else
            {
              uint64_t v19 = [*(id *)(a1 + 32) allowedTopHitSections];
              int v20 = [v19 containsObject:*(void *)(a1 + 40)];

              double v13 = [v5 rankingItem];
              id v14 = [v7 rankingItem];
              if (v20)
              {
                [*(id *)(a1 + 48) currentTime];
                uint64_t v15 = objc_msgSend(v13, "compare:currentTime:", v14);
                goto LABEL_28;
              }
            }
            uint64_t v15 = [v13 compareLocalTopHitCandidate:v14];
            goto LABEL_28;
          }
          double v13 = [v5 rankingItem];
          id v14 = [v7 rankingItem];
          uint64_t v15 = [v13 comparePeopleItemTopHitCandidate:v14];
        }
LABEL_28:
        uint64_t v21 = v15;

        uint64_t v17 = -v21;
        goto LABEL_29;
      }
    }
  }
  else if (!v5)
  {
    if (!v6)
    {
      uint64_t v17 = 0;
      goto LABEL_29;
    }
    goto LABEL_18;
  }
  uint64_t v16 = [v5 rankingItem];

  if (v16) {
    uint64_t v17 = -1;
  }
  else {
    uint64_t v17 = 0;
  }
  if (v7 && !v16)
  {
LABEL_18:
    uint64_t v18 = [v7 rankingItem];
    uint64_t v17 = v18 != 0;
  }
LABEL_29:

  return v17;
}

uint64_t __65__SSRankingManager_withinSectionTopHitNomination_withItemRanker___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 rankingItem];
  if (v6)
  {
    id v7 = [v5 rankingItem];

    if (v7)
    {
      uint64_t v8 = [v4 rankingItem];
      uint64_t v9 = [v5 rankingItem];
      uint64_t v6 = -[v8 compareParsecTopHitCandidate:v9];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

- (id)nominateLocalTopHitsFromSections:(id)a3 withItemRanker:(id)a4 sectionHeader:(id)a5 maxInitiallyVisibleResults:(unint64_t)a6 shortcutResult:(id)a7 isBullseyeNonCommittedSearch:(BOOL)a8 isBullseyeCommittedSearch:(BOOL)a9 parsecEnabled:(BOOL)a10 maxNumAppsInTopHitSection:(unint64_t)a11 queryId:(unint64_t)a12 queryKind:(unint64_t)a13 clientBundleID:(id)a14 qu:(id)a15 currentTime:(double)a16
{
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v125 = a4;
  id v22 = a5;
  id v128 = a7;
  id v23 = a14;
  id v127 = a15;
  float v24 = objc_opt_new();
  [v24 setBundleIdentifier:@"com.apple.spotlight.tophits"];
  uint64_t v122 = v22;
  [v24 setTitle:v22];
  [v24 setMaxInitiallyVisibleResults:a6];
  if (a11 <= 1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = a11;
  }
  unint64_t v120 = v25;
  if (!v23)
  {
    int v126 = 0;
    goto LABEL_12;
  }
  id v26 = v23;
  if (SPQueryKindIsSearchToolSearch_onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken, &__block_literal_global_1490);
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode) {
    goto LABEL_8;
  }
  if (!SPQueryKindIsSearchToolSearch_isSearchToolRanking)
  {
    int v126 = 0;
    goto LABEL_10;
  }
  if (([v26 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
    || ([v26 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
  {
LABEL_8:
    int v27 = 1;
  }
  else
  {
    int v105 = [v26 hasPrefix:@"com.apple.ondeviceeval"];
    if (a13 == 12) {
      int v27 = 1;
    }
    else {
      int v27 = v105;
    }
  }
  int v126 = v27;
LABEL_10:

LABEL_12:
  id v123 = v24;
  BOOL v121 = v23;
  __int16 v124 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  id obj = v21;
  uint64_t v28 = [obj countByEnumeratingWithState:&v157 objects:v167 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    double v30 = 0;
    uint64_t v31 = *(void *)v158;
    uint64_t v130 = *(void *)v158;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v158 != v31) {
          objc_enumerationMutation(obj);
        }
        double v33 = *(void **)(*((void *)&v157 + 1) + 8 * i);
        if ([v33 resultsCount])
        {
          float v34 = [v33 bundleIdentifier];
          int v35 = [v34 isEqualToString:@"com.apple.Preferences"];

          if (v35)
          {
            LOBYTE(v119) = v126;
            [(SSRankingManager *)self calculateLikelihoodAndPriorForSection:v33 currentTime:v128 shortcutResult:a12 queryId:v125 ranker:1 nominateLocalTopHit:v127 qu:a16 isSearchToolClient:v119];
            id v36 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v33, "resultsCount"));

            long long v155 = 0u;
            long long v156 = 0u;
            long long v153 = 0u;
            long long v154 = 0u;
            id v37 = [v33 resultSet];
            uint64_t v38 = [v37 countByEnumeratingWithState:&v153 objects:v166 count:16];
            if (v38)
            {
              uint64_t v39 = v38;
              uint64_t v40 = *(void *)v154;
              do
              {
                for (uint64_t j = 0; j != v39; ++j)
                {
                  if (*(void *)v154 != v40) {
                    objc_enumerationMutation(v37);
                  }
                  uint64_t v42 = *(void **)(*((void *)&v153 + 1) + 8 * j);
                  uint64_t v43 = [v42 identifier];
                  if (v43)
                  {
                    float v44 = (void *)v43;
                    float v45 = [v42 rankingItem];

                    if (v45)
                    {
                      double v46 = [v42 rankingItem];
                      float v47 = [v42 identifier];
                      [v36 setObject:v46 forKeyedSubscript:v47];
                    }
                  }
                }
                uint64_t v39 = [v37 countByEnumeratingWithState:&v153 objects:v166 count:16];
              }
              while (v39);
            }

            double v30 = v36;
            uint64_t v31 = v130;
          }
        }
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v157 objects:v167 count:16];
    }
    while (v29);
  }
  else
  {
    double v30 = 0;
  }

  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v129 = obj;
  uint64_t v48 = [v129 countByEnumeratingWithState:&v149 objects:v165 count:16];
  if (!v48)
  {
    int v131 = 0;
    int v50 = v125;
    goto LABEL_63;
  }
  uint64_t v49 = v48;
  int v131 = 0;
  id obja = *(id *)v150;
  int v50 = v125;
  do
  {
    for (uint64_t k = 0; k != v49; ++k)
    {
      if (*(id *)v150 != obja) {
        objc_enumerationMutation(v129);
      }
      int v52 = *(void **)(*((void *)&v149 + 1) + 8 * k);
      if ([v52 resultsCount])
      {
        int v53 = [v52 bundleIdentifier];
        if ([v53 isEqualToString:@"com.apple.Preferences"]) {
          goto LABEL_41;
        }
        int v54 = [v52 bundleIdentifier];
        char IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v54);

        if ((IsSyndicatedPhotos & 1) == 0)
        {
          LOBYTE(v119) = v126;
          [(SSRankingManager *)self calculateLikelihoodAndPriorForSection:v52 currentTime:v128 shortcutResult:a12 queryId:v50 ranker:1 nominateLocalTopHit:v127 qu:a16 isSearchToolClient:v119];
          int v56 = [v52 bundleIdentifier];
          int v57 = [v56 isEqualToString:@"com.apple.shortcuts"];

          if (v57)
          {
            long long v147 = 0u;
            long long v148 = 0u;
            long long v145 = 0u;
            long long v146 = 0u;
            int v53 = [v52 resultSet];
            uint64_t v58 = [v53 countByEnumeratingWithState:&v145 objects:v164 count:16];
            if (v58)
            {
              uint64_t v59 = v58;
              uint64_t v60 = *(void *)v146;
              do
              {
                for (uint64_t m = 0; m != v59; ++m)
                {
                  if (*(void *)v146 != v60) {
                    objc_enumerationMutation(v53);
                  }
                  double v62 = *(void **)(*((void *)&v145 + 1) + 8 * m);
                  double v63 = [v62 rankingItem];

                  if (v63)
                  {
                    int v64 = [v62 rankingItem];
                    [v64 resetScoreForShortcutsSetting:v30];
                  }
                }
                uint64_t v59 = [v53 countByEnumeratingWithState:&v145 objects:v164 count:16];
              }
              while (v59);
              int v50 = v125;
            }
LABEL_41:
          }
        }
        [(SSRankingManager *)self withinSectionTopHitNomination:v52 withItemRanker:v50];
        if ([v52 resultsCount])
        {
          id v65 = [v52 resultSet];
          id v66 = [v65 objectAtIndexedSubscript:0];
          double v67 = [v66 rankingItem];
          int v68 = [v67 isLocalTopHitCandidate];

          if (v68)
          {
            double v69 = [v52 resultSet];
            float v70 = [v69 objectAtIndexedSubscript:0];
            uint64_t v71 = SSSetTopHitWithReasonType(1, v70, 28, 0, 1);
            float v72 = [v52 resultSet];
            id v73 = [v72 objectAtIndexedSubscript:0];
            [v73 setTopHit:v71];

            [v124 addObject:v52];
          }
        }
        double v74 = [v52 bundleIdentifier];
        int v75 = [v74 isEqualToString:@"com.apple.datadetector.quick_actions"];

        if (v75)
        {
          id v76 = v52;

          int v131 = v76;
        }
        continue;
      }
    }
    uint64_t v49 = [v129 countByEnumeratingWithState:&v149 objects:v165 count:16];
  }
  while (v49);
LABEL_63:

  unint64_t v77 = v124;
  [v124 sortWithOptions:16 usingComparator:&__block_literal_global_434];
  if (v126)
  {
    __int16 v78 = SSGeneralLog();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BDB2A000, v78, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] by-pass TH nomination", buf, 2u);
    }
    goto LABEL_112;
  }
  if ([v124 count])
  {
    uint64_t v79 = [v124 objectAtIndexedSubscript:0];
    __int16 v80 = [v79 bundleIdentifier];
    int v81 = [v80 isEqualToString:@"com.apple.application"];

    if (v81) {
      unint64_t v82 = v120;
    }
    else {
      unint64_t v82 = 1;
    }
    unint64_t v83 = [v79 resultsCount];
    if (v82 >= v83) {
      unint64_t v84 = v83;
    }
    else {
      unint64_t v84 = v82;
    }
    if (v84)
    {
      for (uint64_t n = 0; n != v84; ++n)
      {
        double v86 = [v79 resultSet];
        double v87 = [v86 objectAtIndexedSubscript:n];
        __int16 v88 = [v87 rankingItem];
        int v89 = [v88 isLocalTopHitCandidate];

        if (v89)
        {
          __int16 v90 = [v124 objectAtIndexedSubscript:0];
          double v91 = [v90 resultSet];
          double v92 = [v91 objectAtIndexedSubscript:n];
          [v123 addResults:v92];

          float v93 = [v79 bundleIdentifier];
          [v123 setRelatedSectionBundleIdentifier:v93];
        }
      }
    }

    unint64_t v77 = v124;
    int v50 = v125;
  }
  if (v131)
  {
    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    __int16 v94 = [v123 resultSet];
    uint64_t v95 = [v94 countByEnumeratingWithState:&v140 objects:v163 count:16];
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v141;
      while (2)
      {
        for (iuint64_t i = 0; ii != v96; ++ii)
        {
          if (*(void *)v141 != v97) {
            objc_enumerationMutation(v94);
          }
          float v99 = [*(id *)(*((void *)&v140 + 1) + 8 * ii) sectionBundleIdentifier];
          char v100 = [v99 isEqualToString:@"com.apple.datadetector.quick_actions"];

          if (v100)
          {

            unint64_t v77 = v124;
            int v50 = v125;
            goto LABEL_97;
          }
        }
        uint64_t v96 = [v94 countByEnumeratingWithState:&v140 objects:v163 count:16];
        int v50 = v125;
        if (v96) {
          continue;
        }
        break;
      }
    }

    double v101 = [v131 resultSet];
    float v102 = [v101 objectAtIndexedSubscript:0];
    double v103 = [v102 resultBundleId];
    char v104 = [v103 isEqualToString:@"com.apple.datadetector.quick_actions.tracking_number"];

    unint64_t v77 = v124;
    if ((v104 & 1) == 0) {
      [v131 clearResults];
    }
  }
LABEL_97:
  if (_os_feature_enabled_impl())
  {
    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    double v106 = v129;
    uint64_t v107 = [v106 countByEnumeratingWithState:&v136 objects:v162 count:16];
    if (v107)
    {
      uint64_t v108 = v107;
      uint64_t v109 = *(void *)v137;
LABEL_100:
      uint64_t v110 = 0;
      while (1)
      {
        if (*(void *)v137 != v109) {
          objc_enumerationMutation(v106);
        }
        int v111 = *(void **)(*((void *)&v136 + 1) + 8 * v110);
        double v112 = [v111 bundleIdentifier];
        char v113 = [v112 isEqualToString:@"com.apple.spotlight.events"];

        if (v113) {
          break;
        }
        if (v108 == ++v110)
        {
          uint64_t v108 = [v106 countByEnumeratingWithState:&v136 objects:v162 count:16];
          if (v108) {
            goto LABEL_100;
          }
          __int16 v78 = v106;
          unint64_t v77 = v124;
          int v50 = v125;
          goto LABEL_112;
        }
      }
      __int16 v78 = v111;

      unint64_t v77 = v124;
      int v50 = v125;
      if (!v78) {
        goto LABEL_113;
      }
      [v123 clearResults];
      memset(v135, 0, sizeof(v135));
      BOOL v114 = [v78 resultSet];
      if ([v114 countByEnumeratingWithState:v135 objects:v161 count:16])
      {
        uint64_t v115 = **((void **)&v135[0] + 1);
        __int16 v116 = [**((id **)&v135[0] + 1) rankingItem];
        [v116 setLikelihood:1.0];

        +[SSTopHitNominationManager setTopHitCandidate:v115];
        [v123 addResults:v115];
      }
    }
    else
    {
      __int16 v78 = v106;
    }
LABEL_112:
  }
LABEL_113:
  id v117 = v123;

  return v117;
}

uint64_t __267__SSRankingManager_nominateLocalTopHitsFromSections_withItemRanker_sectionHeader_maxInitiallyVisibleResults_shortcutResult_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_parsecEnabled_maxNumAppsInTopHitSection_queryId_queryKind_clientBundleID_qu_currentTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 bundleIdentifier];
  if ([v6 isEqualToString:@"com.apple.datadetector.quick_actions"])
  {
    id v7 = [v5 bundleIdentifier];
    uint64_t v8 = @"com.apple.calculation";
    if ([v7 isEqualToString:@"com.apple.calculation"])
    {

LABEL_11:
      uint64_t v15 = [v4 resultSet];
      uint64_t v16 = [v15 objectAtIndexedSubscript:0];
      uint64_t v17 = [v16 resultBundleId];
      int v18 = [v17 isEqualToString:@"com.apple.datadetector.quick_actions.phone_number"];

      BOOL v19 = v18 == 0;
      uint64_t v20 = -1;
      goto LABEL_14;
    }
    double v13 = [v5 bundleIdentifier];
    int v14 = [v13 isEqualToString:@"com.apple.conversion"];

    if (v14) {
      goto LABEL_11;
    }
  }
  else
  {

    uint64_t v8 = @"com.apple.calculation";
  }
  uint64_t v9 = [v4 bundleIdentifier];
  char v10 = [v9 isEqualToString:@"com.apple.calculation"];
  if ((v10 & 1) == 0)
  {
    uint64_t v8 = [v4 bundleIdentifier];
    if (([(__CFString *)v8 isEqualToString:@"com.apple.conversion"] & 1) == 0)
    {

      goto LABEL_18;
    }
  }
  id v11 = [v5 bundleIdentifier];
  int v12 = [v11 isEqualToString:@"com.apple.datadetector.quick_actions"];

  if ((v10 & 1) == 0)
  {

    if (v12) {
      goto LABEL_13;
    }
LABEL_18:
    id v26 = [v4 resultSet];
    int v27 = [v26 objectAtIndexedSubscript:0];
    uint64_t v28 = [v27 rankingItem];

    uint64_t v29 = [v5 resultSet];
    double v30 = [v29 objectAtIndexedSubscript:0];
    uint64_t v31 = [v30 rankingItem];

    uint64_t v25 = 0;
    if (!v28 || !v31) {
      goto LABEL_24;
    }
    uint64_t v32 = [v28 compareShortcutTopHitCandidate:v31];
    if (v32)
    {
      uint64_t v25 = -v32;
    }
    else
    {
      if (![v28 compareWithCCCDTopHitCandidate:v31])
      {
        [v28 likelihood];
        double v35 = v34;
        [v31 likelihood];
        if (v35 > v36)
        {
          uint64_t v25 = -1;
          goto LABEL_24;
        }
        [v28 likelihood];
        double v38 = v37;
        [v31 likelihood];
        if (v38 < v39)
        {
          uint64_t v25 = 1;
          goto LABEL_24;
        }
      }
      uint64_t v25 = 0;
    }
LABEL_24:

    goto LABEL_25;
  }

  if (!v12) {
    goto LABEL_18;
  }
LABEL_13:
  id v21 = [v5 resultSet];
  id v22 = [v21 objectAtIndexedSubscript:0];
  id v23 = [v22 resultBundleId];
  int v24 = [v23 isEqualToString:@"com.apple.datadetector.quick_actions.phone_number"];

  BOOL v19 = v24 == 0;
  uint64_t v20 = 1;
LABEL_14:
  if (v19) {
    uint64_t v25 = -v20;
  }
  else {
    uint64_t v25 = v20;
  }
LABEL_25:

  return v25;
}

+ (void)prepareServerSectionRankingItemsForTopHitNomination:(id)a3 currentTime:(double)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = SSGeneralLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    double v38 = v7;
    _os_log_impl(&dword_1BDB2A000, v6, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] prepareServerSectionRankingItemsForTopHitNomination bundle_id = %@", buf, 0xCu);
  }
  uint64_t v8 = [v5 results];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    char v10 = objc_msgSend(v5, "results", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (v15)
          {
            uint64_t v16 = [PRSRankingItem alloc];
            uint64_t v17 = [v5 bundleIdentifier];
            id v18 = [(PRSRankingItem *)v16 initForParsecResultWithBundleID:v17];

            [v18 setEngagementScore:0.0];
            [v18 setTopicalityScore:-1.0];
            if ([v15 topHit] == 1)
            {
              uint64_t v19 = [v18 bundleIDType];
              double v20 = 0.85;
              if ((v19 & 0x180060000000001) == 0)
              {
                uint64_t v21 = objc_msgSend(v18, "bundleIDType", 0.85);
                double v20 = 0.6;
                if ((v21 & 0x200500000000000) == 0)
                {
                  uint64_t v22 = objc_msgSend(v18, "bundleIDType", 0.6);
                  double v20 = 0.3;
                  if ((v22 & 0x200000000000) == 0)
                  {
                    uint64_t v23 = objc_msgSend(v18, "bundleIDType", 0.3);
                    double v20 = 0.53;
                    if ((v23 & 0x80000000000) == 0)
                    {
                      uint64_t v24 = objc_msgSend(v18, "bundleIDType", 0.53);
                      double v20 = 0.6;
                      if ((v24 & 0x1000000000000) == 0) {
                        double v20 = dbl_1BDC5D310[(objc_msgSend(v18, "bundleIDType", 0.6) & 0x10000000000) == 0];
                      }
                    }
                  }
                }
              }
              [v18 setTopicalityScore:v20];
            }
            if (([v18 bundleIDType] & 0x10000000000) != 0)
            {
              uint64_t v25 = [v15 mapsPersonalizationResult];
              id v26 = v25;
              if (v25)
              {
                if ([v25 resultType])
                {
                  int v27 = [v26 startEventDate];

                  if (v27)
                  {
                    uint64_t v28 = [v26 startEventDate];
                    [v28 timeIntervalSinceReferenceDate];
                    double v30 = v29 - a4;

                    if (v30 > -3600.0 && v30 < 21600.0) {
                      [v18 setEngagementScore:0.5];
                    }
                  }
                }
              }
            }
            [v18 topicalityScore];
            *(float *)&double v31 = v31;
            [v18 setKeywordMatchScore:v31];
            [v15 setRankingItem:v18];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v12);
    }
  }
}

+ (void)prepareSafariUserTypedURLForTopHitNomination:(id)a3 query:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = SSGeneralLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BDB2A000, v7, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] prepareSafariUserTypedURLForTopHitNomination", buf, 2u);
  }

  uint64_t v8 = [v5 results];
  if ([v8 count])
  {
    uint64_t v9 = [v5 bundleIdentifier];
    int v10 = [v9 isEqualToString:@"com.apple.mobilesafari"];

    if (v10)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v8 = [v5 results];
      uint64_t v11 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (!v11) {
        goto LABEL_25;
      }
      uint64_t v12 = v11;
      id v30 = v5;
      uint64_t v13 = *(void *)v33;
      double v31 = v6;
      while (1)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (v15)
          {
            uint64_t v16 = [*(id *)(*((void *)&v32 + 1) + 8 * i) resultBundleId];
            if ([v16 isEqualToString:@"com.apple.safari.userTypedURL"])
            {
              uint64_t v17 = [v15 rankingItem];

              if (v17) {
                continue;
              }
              if ([v6 containsString:@"://"])
              {
                id v18 = v6;
              }
              else
              {
                id v18 = [NSString stringWithFormat:@"https://%@", v6];
              }
              uint64_t v16 = v18;
              uint64_t v19 = [MEMORY[0x1E4F1CB10] URLWithString:v18];
              double v20 = v19;
              if (v19)
              {
                uint64_t v21 = [v19 scheme];
                if (v21)
                {
                  uint64_t v22 = (void *)v21;
                  uint64_t v23 = [v20 host];

                  if (v23)
                  {
                    [v15 setContentURL:v16];
                    uint64_t v24 = (int8x8_t *)SSCompactRankingAttrsAlloc(3);
                    SSCompactRankingAttrsUpdateValue(v24, 0xCuLL, v31);
                    SSCompactRankingAttrsUpdateValue(v24, 0xDuLL, v31);
                    SSCompactRankingAttrsUpdateValue(v24, 0x1FuLL, v31);
                    uint64_t v25 = [[PRSRankingItem alloc] initWithAttrs:v24];
                    [v15 setRankingItem:v25];

                    id v26 = [v15 rankingItem];
                    objc_msgSend(v26, "setBundleIDType:", objc_msgSend(v26, "bundleIDType") | 0x80);

                    int v27 = [v15 rankingItem];
                    [v27 setTopicalityScore:1.0];

                    uint64_t v28 = [v15 rankingItem];
                    LODWORD(v29) = 1.0;
                    [v28 setKeywordMatchScore:v29];
                  }
                }
              }

              id v6 = v31;
            }
          }
        }
        uint64_t v12 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (!v12)
        {
          id v5 = v30;
          goto LABEL_25;
        }
      }
    }
  }
  else
  {
LABEL_25:
  }
}

+ (id)nominateServerTopHitForSection:(id)a3 queryString:(id)a4 language:(id)a5 currentTime:(double)a6
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v47 = a4;
  id v48 = a5;
  if (nominateServerTopHitForSection_queryString_language_currentTime__onceToken != -1) {
    dispatch_once(&nominateServerTopHitForSection_queryString_language_currentTime__onceToken, &__block_literal_global_444);
  }
  uint64_t v86 = 0;
  double v87 = &v86;
  uint64_t v88 = 0x3032000000;
  int v89 = __Block_byref_object_copy__0;
  __int16 v90 = __Block_byref_object_dispose__0;
  id v91 = 0;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
  int v10 = [v54 results];
  id v91 = [v9 arrayWithArray:v10];

  uint64_t v11 = [v54 results];
  LODWORD(v9) = [v11 count] == 0;

  if (v9)
  {
    id v43 = (id)v87[5];
  }
  else
  {
    uint64_t v49 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v12 = (id)v87[5];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v82 objects:v93 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v83;
      uint64_t v15 = 3;
LABEL_6:
      uint64_t v16 = 0;
      uint64_t v52 = v15 - v13;
      while (1)
      {
        if (*(void *)v83 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v82 + 1) + 8 * v16);
        if (!v17) {
          break;
        }
        if (v15 == v16) {
          goto LABEL_17;
        }
        id v18 = [*(id *)(*((void *)&v82 + 1) + 8 * v16) rankingItem];
        uint64_t v19 = [v18 bundleIDType];

        if ((v19 & 0x20000000000) != 0)
        {
          uint64_t v21 = [v17 identifier];
          double v20 = [v21 componentsSeparatedByString:@"-"];

          if ([v20 count] != 3)
          {
            id v43 = (id)v87[5];

            goto LABEL_37;
          }
          uint64_t v22 = NSString;
          uint64_t v23 = [v20 objectAtIndexedSubscript:1];
          uint64_t v24 = [v22 stringWithFormat:@"st:%@", v23];
          [v49 addObject:v24];
        }
        else
        {
          double v20 = [v17 identifier];
          [v49 addObject:v20];
        }

        if (v13 == ++v16)
        {
          uint64_t v13 = [v12 countByEnumeratingWithState:&v82 objects:v93 count:16];
          uint64_t v15 = v52;
          if (v13) {
            goto LABEL_6;
          }
          goto LABEL_17;
        }
      }
      id v43 = (id)v87[5];
LABEL_37:

      goto LABEL_38;
    }
LABEL_17:

    if ([v49 count])
    {
      uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F237B8]) initWithQuery:v47 language:v48 fuzzyThreshold:0 options:0];
      [v25 setMatchOncePerTerm:0];
      int v53 = _os_feature_enabled_impl();
      v80[0] = 0;
      v80[1] = v80;
      v80[2] = 0x2020000000;
      uint64_t v81 = 0;
      uint64_t v81 = [v49 count];
      v78[0] = 0;
      v78[1] = v78;
      v78[2] = 0x3032000000;
      v78[3] = __Block_byref_object_copy__0;
      v78[4] = __Block_byref_object_dispose__0;
      id v79 = 0;
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __84__SSRankingManager_nominateServerTopHitForSection_queryString_language_currentTime___block_invoke_456;
      v73[3] = &unk_1E634C3C8;
      id v26 = v49;
      id v74 = v26;
      id v76 = &v86;
      id v45 = v25;
      id v75 = v45;
      double v77 = a6;
      int v27 = (void *)MEMORY[0x1C1885400](v73);
      uint64_t v67 = 0;
      int v68 = &v67;
      uint64_t v69 = 0x3032000000;
      float v70 = __Block_byref_object_copy__0;
      uint64_t v71 = __Block_byref_object_dispose__0;
      id v72 = 0;
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __84__SSRankingManager_nominateServerTopHitForSection_queryString_language_currentTime___block_invoke_2;
      v61[3] = &unk_1E634C3F0;
      int v64 = v80;
      id v65 = v78;
      id v28 = v26;
      id v62 = v28;
      id v29 = v27;
      id v63 = v29;
      id v66 = &v67;
      int v51 = (void *)MEMORY[0x1C1885400](v61);
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __84__SSRankingManager_nominateServerTopHitForSection_queryString_language_currentTime___block_invoke_3;
      v59[3] = &unk_1E634C418;
      id v46 = v29;
      id v60 = v46;
      int v50 = (void *)MEMORY[0x1C1885400](v59);
      if (v53)
      {
        dispatch_group_t v30 = dispatch_group_create();
        double v31 = (void *)v68[5];
        v68[5] = (uint64_t)v30;
      }
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v32 = (id)nominateServerTopHitForSection_queryString_language_currentTime__protectionClasses;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v55 objects:v92 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v56 != v34) {
              objc_enumerationMutation(v32);
            }
            uint64_t v36 = *(void *)(*((void *)&v55 + 1) + 8 * i);
            if (v53)
            {
              dispatch_group_enter((dispatch_group_t)v68[5]);
              double v37 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
              uint64_t v38 = nominateServerTopHitForSection_queryString_language_currentTime__sServerEngagementAttributes;
              uint64_t v39 = [v54 bundleIdentifier];
              [v37 slowFetchAttributes:v38 protectionClass:v36 bundleID:v39 identifiers:v28 completionHandler:v51];
            }
            else
            {
              double v37 = [MEMORY[0x1E4FA5D60] sharedInstance];
              uint64_t v40 = nominateServerTopHitForSection_queryString_language_currentTime__sServerEngagementAttributes;
              uint64_t v39 = [v54 bundleIdentifier];
              [v37 fetchAttributesForProtectionClass:v36 attributes:v40 bundleID:v39 identifiers:v28 completion:v50];
            }
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v55 objects:v92 count:16];
        }
        while (v33);
      }

      if (v53)
      {
        double v41 = v68[5];
        dispatch_time_t v42 = dispatch_time(0, 300000000);
        dispatch_group_wait(v41, v42);
      }
      id v43 = (id)v87[5];

      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(v78, 8);

      _Block_object_dispose(v80, 8);
    }
    else
    {
      id v43 = (id)v87[5];
    }
LABEL_38:
  }
  _Block_object_dispose(&v86, 8);

  return v43;
}

void __84__SSRankingManager_nominateServerTopHitForSection_queryString_language_currentTime___block_invoke()
{
  v8[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F23468];
  v8[0] = *MEMORY[0x1E4F23478];
  v8[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F23470];
  v8[2] = *MEMORY[0x1E4F23480];
  v8[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F230F0];
  v8[4] = *MEMORY[0x1E4F23100];
  v8[5] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:6];
  id v4 = (void *)nominateServerTopHitForSection_queryString_language_currentTime__sServerEngagementAttributes;
  nominateServerTopHitForSection_queryString_language_currentTime__sServerEngagementAttributes = v3;

  v7[0] = *MEMORY[0x1E4F28358];
  v7[1] = @"Priority";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v6 = (void *)nominateServerTopHitForSection_queryString_language_currentTime__protectionClasses;
  nominateServerTopHitForSection_queryString_language_currentTime__protectionClasses = v5;
}

void __84__SSRankingManager_nominateServerTopHitForSection_queryString_language_currentTime___block_invoke_456(uint64_t a1, void *a2)
{
  id v49 = a2;
  if ([v49 count] && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    uint64_t v3 = 0;
    id v4 = (id *)&_SpotlightDefineRankingTypes_[364];
    while (1)
    {
      uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v3];
      id v6 = [v49 objectForKeyedSubscript:v5];

      uint64_t v7 = [v6 count];
      if (v7 == [v4[245] count])
      {
        uint64_t v8 = [v6 objectAtIndexedSubscript:0];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_28;
        }
        uint64_t v9 = [v6 objectAtIndexedSubscript:1];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_27;
        }
        int v10 = [v6 objectAtIndexedSubscript:2];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_26;
        }
        uint64_t v11 = [v6 objectAtIndexedSubscript:3];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          break;
        }
      }
LABEL_29:

      if (++v3 >= (unint64_t)[*(id *)(a1 + 32) count]) {
        goto LABEL_30;
      }
    }
    uint64_t v8 = [v6 objectAtIndexedSubscript:0];
    uint64_t v9 = [v6 objectAtIndexedSubscript:1];
    int v10 = [v6 objectAtIndexedSubscript:2];
    uint64_t v13 = [v6 objectAtIndexedSubscript:3];
    uint64_t v14 = [v6 objectAtIndexedSubscript:4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v46 = v13;
      uint64_t v15 = [v6 objectAtIndexedSubscript:5];
      objc_opt_class();
      char v16 = objc_opt_isKindOfClass();

      if (v16)
      {
        id v48 = [v6 objectAtIndexedSubscript:4];
        uint64_t v17 = [v6 objectAtIndexedSubscript:5];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:v3];
          uint64_t v19 = [v14 rankingItem];
          double v20 = (void *)v18;
          [v19 setLastUsedDate:v18];

          uint64_t v13 = v46;
LABEL_14:

          goto LABEL_17;
        }
        double v20 = 0;
      }
      else
      {
        double v20 = 0;
        id v48 = &stru_1F1824018;
      }
LABEL_17:
      uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:v3];
      uint64_t v22 = [v21 rankingItem];
      id v47 = v20;
      LODWORD(v23) = -1.0;
      [v22 inSpotlightEngagementScoreWithEvaluator:*(void *)(a1 + 40) currentTime:v8 queriesInSpotlight:v9 datesInSpotlight:v10 queriesInSpotlightNonUnique:v13 datesInSpotlightNonUnique:v48 launchString:*(double *)(a1 + 56) lastUsedDate:v23 topicalityScore:v20];
      float v25 = v24;

      if (v25 <= 0.0) {
        goto LABEL_25;
      }
      id v26 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:v3];
      int v27 = [v26 rankingItem];
      [v27 setWasEngaged:1];

      id v28 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:v3];
      id v29 = [v28 rankingItem];
      [v29 setWasEngagedInSpotlight:1];

      dispatch_group_t v30 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:v3];
      double v31 = [v30 rankingItem];
      [v31 engagementScore];
      double v33 = v32;

      if (v33 < v25) {
        double v33 = v25;
      }
      uint64_t v34 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:v3];
      long long v35 = [v34 rankingItem];
      [v35 setEngagementScore:v33];

      uint64_t v36 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:v3];
      double v37 = [v36 rankingItem];
      if (([v37 bundleIDType] & 0x10000000000) != 0 && v25 >= 0.5)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:v3];
        uint64_t v38 = v45 = v36;
        uint64_t v39 = [v38 rankingItem];
        [v39 topicalityScore];
        double v41 = v40;

        if (v41 > 0.0) {
          goto LABEL_25;
        }
        dispatch_time_t v42 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:v3];
        id v43 = [v42 rankingItem];
        [v43 setTopicalityScore:0.5];

        uint64_t v36 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:v3];
        double v37 = [v36 rankingItem];
        LODWORD(v44) = 0.5;
        [v37 setKeywordMatchScore:v44];
      }

LABEL_25:
      id v4 = (id *)(_SpotlightDefineRankingTypes_ + 1456);
LABEL_26:

LABEL_27:
LABEL_28:

      goto LABEL_29;
    }
    double v20 = 0;
    id v48 = &stru_1F1824018;
    goto LABEL_14;
  }
LABEL_30:
}

void __84__SSRankingManager_nominateServerTopHitForSection_queryString_language_currentTime___block_invoke_2(void *a1, void *a2)
{
  id v16 = a2;
  if (![v16 count])
  {
LABEL_10:
    (*(void (**)(void))(a1[5] + 16))();
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1[8] + 8) + 40));
    id v4 = v16;
    goto LABEL_11;
  }
  BOOL v3 = [v16 count] == *(void *)(*(void *)(a1[6] + 8) + 24);
  id v4 = v16;
  if (v3)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(a1[7] + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = [v16 count];
    if (v8)
    {
      uint64_t v9 = v8;
      for (uint64_t i = 0; i != v9; ++i)
      {
        uint64_t v11 = [v16 objectAtIndexedSubscript:i];
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = *(void **)(*(void *)(a1[7] + 8) + 40);
            uint64_t v13 = (void *)a1[4];
            id v14 = v11;
            uint64_t v15 = [v13 objectAtIndexedSubscript:i];
            [v12 setObject:v14 forKey:v15];
          }
        }
      }
    }
    goto LABEL_10;
  }
LABEL_11:
}

uint64_t __84__SSRankingManager_nominateServerTopHitForSection_queryString_language_currentTime___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)makeTopHitSectionUsingSections:(id)a3 withItemRanker:(id)a4 sectionHeader:(id)a5 shortcutResult:(id)a6 isBullseyeNonCommittedSearch:(BOOL)a7 isBullseyeCommittedSearch:(BOOL)a8 parsecEnabled:(BOOL)a9 maxNumAppsInTopHitSection:(unint64_t)a10
{
  BOOL v266 = a8;
  BOOL v251 = a7;
  uint64_t v353 = *MEMORY[0x1E4F143B8];
  id v239 = a3;
  id v276 = a4;
  id v236 = a5;
  id v303 = a6;
  v241 = +[SSRankingManager getLegacyTophitSection]();
  char v13 = [v241 containsObject:@"none"];
  int v244 = [v241 containsObject:@"nocontact"];
  int v230 = [v241 containsObject:@"noshortcut"];
  int v255 = [v241 containsObject:@"noappnonexactmatch"];
  int v254 = [v241 containsObject:@"nophotos"];
  if (v266 && (v13 & 1) != 0)
  {
    id v14 = 0;
    goto LABEL_386;
  }
  uint64_t v336 = 0;
  v337 = &v336;
  uint64_t v338 = 0x3032000000;
  v339 = __Block_byref_object_copy__0;
  v340 = __Block_byref_object_dispose__0;
  id v341 = 0;
  id v341 = (id)objc_opt_new();
  uint64_t v330 = 0;
  v331 = (id *)&v330;
  uint64_t v332 = 0x3032000000;
  v333 = __Block_byref_object_copy__0;
  v334 = __Block_byref_object_dispose__0;
  id v335 = 0;
  [(id)v337[5] setBundleIdentifier:@"com.apple.spotlight.tophits"];
  [(id)v337[5] setTitle:v236];
  [(id)v337[5] setMaxInitiallyVisibleResults:1];
  v329[0] = MEMORY[0x1E4F143A8];
  v329[1] = 3221225472;
  v329[2] = __190__SSRankingManager_makeTopHitSectionUsingSections_withItemRanker_sectionHeader_shortcutResult_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_parsecEnabled_maxNumAppsInTopHitSection___block_invoke;
  v329[3] = &unk_1E634C440;
  v329[4] = &v330;
  v329[5] = &v336;
  uint64_t v240 = (void (**)(void, void, void))MEMORY[0x1C1885400](v329);
  uint64_t v15 = [v303 identifier];
  if (!v15) {
    goto LABEL_29;
  }
  BOOL v16 = [v303 type] == 3;

  if (!v16) {
    goto LABEL_29;
  }
  long long v327 = 0u;
  long long v328 = 0u;
  long long v325 = 0u;
  long long v326 = 0u;
  id obj = v239;
  uint64_t v17 = [obj countByEnumeratingWithState:&v325 objects:v352 count:16];
  if (!v17)
  {

LABEL_28:
    id v303 = 0;
    goto LABEL_29;
  }
  char v301 = 0;
  uint64_t obj_8 = *(void *)v326;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v326 != obj_8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void **)(*((void *)&v325 + 1) + 8 * i);
      if ([v19 domain] == 1)
      {
        long long v323 = 0u;
        long long v324 = 0u;
        long long v321 = 0u;
        long long v322 = 0u;
        double v20 = [v19 resultSet];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v321 objects:v351 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v322;
          while (2)
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v322 != v22) {
                objc_enumerationMutation(v20);
              }
              float v24 = *(void **)(*((void *)&v321 + 1) + 8 * j);
              float v25 = [v24 identifier];
              id v26 = [v303 identifier];
              int v27 = [v25 isEqualToString:v26];

              if (v27)
              {
                id v28 = v24;

                char v301 = 1;
                id v303 = v28;
                goto LABEL_22;
              }
            }
            uint64_t v21 = [v20 countByEnumeratingWithState:&v321 objects:v351 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }
LABEL_22:
      }
    }
    uint64_t v17 = [obj countByEnumeratingWithState:&v325 objects:v352 count:16];
  }
  while (v17);

  if ((v301 & 1) == 0) {
    goto LABEL_28;
  }
LABEL_29:
  long long v319 = 0u;
  long long v320 = 0u;
  long long v317 = 0u;
  long long v318 = 0u;
  id v294 = v239;
  uint64_t v29 = [v294 countByEnumeratingWithState:&v317 objects:v350 count:16];
  BOOL v249 = v29 != 0;
  dispatch_group_t v30 = 0;
  if (v29)
  {
    uint64_t v31 = *(void *)v318;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v318 != v31) {
          objc_enumerationMutation(v294);
        }
        double v33 = *(void **)(*((void *)&v317 + 1) + 8 * k);
        uint64_t v34 = [v33 bundleIdentifier];
        char v35 = [v34 isEqualToString:@"com.apple.MobileAddressBook"];

        if (v35)
        {
          id v36 = v33;

          dispatch_group_t v30 = v36;
        }
      }
      uint64_t v29 = [v294 countByEnumeratingWithState:&v317 objects:v350 count:16];
    }
    while (v29);

    if (!v30)
    {
      BOOL v249 = 0;
      float v39 = -3.4028e38;
      goto LABEL_48;
    }
    double v37 = [v30 results];
    unint64_t v38 = 0;
    float v39 = -3.4028e38;
    while (v38 < [v37 count])
    {
      double v40 = [v37 objectAtIndex:v38];
      double v41 = [v40 rankingItem];
      dispatch_time_t v42 = [v41 L2FeatureVector];
      [v42 scoreForFeature:165];
      float v44 = v43;

      if (v44 == 0.0)
      {
        id v45 = [v41 L2FeatureVector];
        [v45 originalL2Score];
        float v47 = v46;

        if (v47 > v39) {
          float v39 = v47;
        }
      }

      ++v38;
    }
  }
  else
  {
    float v39 = -3.4028e38;
    double v37 = v294;
  }

LABEL_48:
  double v229 = v30;
  if (v303)
  {
    id v300 = 0;
    long long obja = 0uLL;
    v302 = 0;
    goto LABEL_70;
  }
  long long v315 = 0u;
  long long v316 = 0u;
  long long v313 = 0u;
  long long v314 = 0u;
  id v287 = v294;
  uint64_t v48 = [v287 countByEnumeratingWithState:&v313 objects:v349 count:16];
  if (!v48)
  {
    id v300 = 0;
    long long obja = 0uLL;
    v302 = 0;
    id v49 = 0;
    id v303 = 0;
    goto LABEL_69;
  }
  uint64_t v291 = v48;
  id v300 = 0;
  long long obja = 0uLL;
  v302 = 0;
  id v49 = 0;
  id v303 = 0;
  uint64_t v289 = *(void *)v314;
  do
  {
    for (uint64_t m = 0; m != v291; ++m)
    {
      if (*(void *)v314 != v289) {
        objc_enumerationMutation(v287);
      }
      int v50 = *(void **)(*((void *)&v313 + 1) + 8 * m);
      int v51 = [v50 results];
      for (unint64_t n = 0; n < [v51 count]; ++n)
      {
        int v53 = [v51 objectAtIndex:n];
        id v54 = [v53 rankingItem];
        if (![v54 hasShortCut]) {
          goto LABEL_64;
        }
        long long v55 = SSCompactRankingAttrsGetValue((int8x8_t *)[v54 attributes], 0x52uLL);

        if (*((void *)&obja + 1) && v55)
        {
          if ([*((id *)&obja + 1) compare:v55] != -1) {
            goto LABEL_61;
          }
        }
        else if (obja != 0)
        {
LABEL_61:
          id v49 = v55;
          goto LABEL_64;
        }
        id v56 = v50;

        id v57 = v53;
        uint64_t v58 = [v57 rankingItem];

        id v49 = v55;
        *(void *)&long long obja = v57;

        id v300 = v56;
        v302 = (void *)v58;
        *((void *)&obja + 1) = v49;
        id v303 = (id)obja;
LABEL_64:
      }
    }
    uint64_t v291 = [v287 countByEnumeratingWithState:&v313 objects:v349 count:16];
  }
  while (v291);
LABEL_69:

LABEL_70:
  unint64_t v248 = [v276 queryTermLength];
  long long v311 = 0u;
  long long v312 = 0u;
  long long v309 = 0u;
  long long v310 = 0u;
  id v253 = v294;
  uint64_t v59 = [v253 countByEnumeratingWithState:&v309 objects:v348 count:16];
  if (v59)
  {
    uint64_t v259 = v59;
    unsigned __int8 v258 = 0;
    uint64_t v234 = 0;
    uint64_t v235 = 0;
    char v252 = 0;
    int v238 = 0;
    int v243 = 0;
    v275 = 0;
    id v60 = 0;
    char v231 = 0;
    char v61 = 0;
    uint64_t v260 = *(void *)v310;
    double v227 = @"com.apple.searchd.syndicatedPhotos";
    uint64_t v278 = *MEMORY[0x1E4F229F0];
    while (1)
    {
      uint64_t v273 = 0;
      do
      {
        if (*(void *)v310 != v260) {
          objc_enumerationMutation(v253);
        }
        if (v61) {
          goto LABEL_328;
        }
        id v62 = *(void **)(*((void *)&v309 + 1) + 8 * v273);
        v292 = [v62 results];
        __int16 v279 = [v62 bundleIdentifier];
        allowedTopHitSections = self->_allowedTopHitSections;
        id v282 = v62;
        int v64 = [v62 bundleIdentifier];
        BOOL v281 = [(NSSet *)allowedTopHitSections containsObject:v64];

        if (v281)
        {
          id v65 = [v282 resultSet];
          v307[0] = MEMORY[0x1E4F143A8];
          v307[1] = 3221225472;
          v307[2] = __190__SSRankingManager_makeTopHitSectionUsingSections_withItemRanker_sectionHeader_shortcutResult_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_parsecEnabled_maxNumAppsInTopHitSection___block_invoke_2;
          v307[3] = &unk_1E634C468;
          id v308 = v276;
          uint64_t v66 = [v65 sortedArrayWithOptions:16 usingComparator:v307];

          uint64_t v67 = [v282 bundleIdentifier];
          int v68 = [v67 isEqualToString:@"com.apple.mobilesafari"];

          if (v68) {
            +[SSRankingManager moveSafariTopHitsToTopOfSection:v282];
          }

          v292 = (void *)v66;
        }
        if ((SSSectionIsSyndicatedPhotos(v279) & 1) == 0)
        {
          uint64_t v69 = [v282 bundleIdentifier];
          int v288 = [v69 isEqualToString:@"com.apple.application"];

          if (v288)
          {
            [v292 count];
            char v70 = 0;
            int v272 = 0;
            int v71 = 0;
          }
          else
          {
            id v72 = [v282 bundleIdentifier];
            char v73 = [v72 isEqualToString:@"com.apple.app-clips"];

            if (v73)
            {
              int v272 = 0;
              int v71 = 0;
              char v70 = 1;
            }
            else
            {
              id v74 = [v282 bundleIdentifier];
              char v75 = [v74 isEqualToString:@"com.apple.Preferences"];

              if (v75)
              {
                char v70 = 0;
                int v71 = 0;
                int v272 = 1;
              }
              else
              {
                id v76 = [v282 bundleIdentifier];
                if ([v76 isEqualToString:@"com.apple.mobileslideshow"])
                {
                  int v71 = 1;
                }
                else
                {
                  double v77 = [v282 bundleIdentifier];
                  int v71 = [v77 isEqualToString:v227];
                }
                char v70 = 0;
                int v272 = 0;
              }
            }
          }
          v295 = 0;
          char v257 = v288 | v70;
          int v250 = v71 ^ 1;
          int v269 = v71;
          int v245 = v71 & v254 ^ 1;
          int v246 = v71 & v254 & v255 ^ 1;
          while (2)
          {
            if ((unint64_t)v295 >= objc_msgSend(v292, "count", v227)) {
              goto LABEL_81;
            }
            objc_msgSend(v292, "objectAtIndex:");
            id v78 = (id)objc_claimAutoreleasedReturnValue();
            id v79 = [v78 rankingItem];
            int v283 = [v79 topHitReason];
            v298 = [v78 userActivityType];
            if (v298)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (([v298 isEqualToString:v278] & 1) == 0)
                {
                  uint64_t v290 = (uint64_t)v60;
LABEL_288:

                  ++v295;
                  id v60 = (void *)v290;
                  continue;
                }
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  __int16 v80 = MEMORY[0x1E4F14500];
                  id v81 = MEMORY[0x1E4F14500];
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
                  {
                    long long v150 = [v78 resultBundleId];
                    *(_DWORD *)buf = 138412546;
                    v343 = v298;
                    __int16 v344 = 2112;
                    v345 = v150;
                    _os_log_fault_impl(&dword_1BDB2A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "result.userActivityType(%@) isKindOfClass NSArray class, result.resultBundleId(%@)", buf, 0x16u);

                    __int16 v80 = MEMORY[0x1E4F14500];
                  }
                }
              }
            }
            break;
          }
          if (v288)
          {
            if ([v79 didMatchRankingDescriptor:@"kMDItemAlternateNameExactMatch"])
            {
              BOOL v284 = 1;
            }
            else
            {
              long long v82 = [v79 displayNameInitials];
              BOOL v284 = v82 != 0;
            }
          }
          else
          {
            BOOL v284 = 0;
          }
          if (v303) {
            BOOL v83 = v78 == v303;
          }
          else {
            BOOL v83 = 0;
          }
          int v84 = v83;
          int v285 = v84;
          if (v83)
          {
            objc_msgSend(v303, "setTopHit:", SSSetTopHitWithReasonString(2, v303, @"shortcutResult match", 1));
            uint64_t v290 = SSCompactRankingAttrsGetValue((int8x8_t *)[v79 attributes], 0x178uLL);

            if ([v303 forceNoTopHit])
            {
              [v303 setForceNoTopHit:0];
              objc_msgSend(v303, "setTopHit:", SSSetTopHitWithReasonString(1, v303, @"hasShortCut Safar edge case", 1));
            }
          }
          else
          {
            uint64_t v290 = (uint64_t)v60;
          }
          if ([v78 type] == 26) {
            int v85 = v288;
          }
          else {
            int v85 = 0;
          }
          if (v85 == 1)
          {
            uint64_t v86 = [v78 rankingItem];
            double v87 = [v86 L2FeatureVector];
            [v87 originalL2Score];
            BOOL v89 = v88 == 0.0;

            if (v89) {
              goto LABEL_288;
            }
          }
          __int16 v90 = [v282 bundleIdentifier];
          if ([v90 isEqualToString:@"com.apple.dictionary"])
          {
            BOOL v91 = [v78 topHit] == 2;

            if ((v91 & (v281 | v285) & 1) == 0) {
              goto LABEL_288;
            }
          }
          else
          {

            if ((v281 | v285) != 1) {
              goto LABEL_288;
            }
          }
          if ([v78 topHit]) {
            char v92 = 1;
          }
          else {
            char v92 = v284;
          }
          if ((v92 & 1) == 0 && ([v79 shouldHideUnderShowMore] & 1) != 0
            || (v285 | [v78 forceNoTopHit] ^ 1) != 1)
          {
            goto LABEL_288;
          }
          float v93 = [(SSRankingManager *)self rankingConfiguration];
          [v93 lock];

          uint64_t v94 = PRSLogCategoryDefault();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            long long v151 = [(SSRankingManager *)self query];
            long long v152 = [(SSRankingManager *)self rankingConfiguration];
            long long v153 = [v152 cepBlocklistSet];
            double v154 = [v78 applicationBundleIdentifier];
            *(_DWORD *)buf = 138412802;
            v343 = v151;
            __int16 v344 = 2112;
            v345 = v153;
            __int16 v346 = 2112;
            double v347 = v154;
            _os_log_debug_impl(&dword_1BDB2A000, v94, OS_LOG_TYPE_DEBUG, "query %@: blocklist %@, result app bundleid %@", buf, 0x20u);
          }
          uint64_t v95 = [v78 applicationBundleIdentifier];
          if (v95)
          {
            uint64_t v96 = [(SSRankingManager *)self rankingConfiguration];
            uint64_t v97 = [v96 cepBlocklistSet];
            if (v97)
            {
              double v98 = [(SSRankingManager *)self rankingConfiguration];
              float v99 = [v98 cepBlocklistSet];
              char v100 = [v78 applicationBundleIdentifier];
              double v101 = [v100 lowercaseString];
              char v102 = [v99 containsObject:v101];

              if (v102) {
                goto LABEL_288;
              }
            }
            else
            {
            }
          }
          double v103 = [(SSRankingManager *)self rankingConfiguration];
          [v103 unlock];

          char v104 = [v79 lastAccessDate];

          if ((v285 & (*((void *)&obja + 1) != 0)) == 1 && v104)
          {
            v275 = [*((id *)&obja + 1) laterDate:v104];
          }
          else
          {
            v275 = v104;
          }
          unint64_t v277 = [v79 bundleIDType];
          unsigned int v265 = [v79 bundleIDType];
          if (([v79 bundleIDType] & 0x40000) != 0)
          {
            int v105 = [v78 contentType];
            int v267 = [v105 isEqualToString:@"com.apple.quicktime-movie"];
          }
          else
          {
            int v267 = 0;
          }
          [v276 currentTime];
          double v107 = v106;
          [v275 timeIntervalSinceReferenceDate];
          if ((v277 & 4) != 0)
          {
            if ((v108 <= 0.0 || v108 < v107 + -47304000.0)
              && ([v276 wasItemCreatedWithinAWeek:v79] & 1) == 0)
            {
              goto LABEL_288;
            }
            if ([v276 queryTermCount] == 1)
            {
              uint64_t v109 = [v79 firstMatchedAltName];
              BOOL v110 = v109 == 0;

              if (v110
                && (*(unsigned char *)-[PRSRankingItem attrCountsPrefix]((uint64_t)v79) & 0x82) != 0
                && (*(void *)-[PRSRankingItem attrCountsPrefix]((uint64_t)v79) & 0xFFFFFFFFFFFFFF7DLL) == 0)
              {
                goto LABEL_288;
              }
            }
          }
          int v111 = [v79 didMatchRankingDescriptor:@"kMDItemDisplayNameOrSubjectOrTitleNonTokenizedPrefixMatch"];
          if (v111)
          {
            int v112 = 0;
          }
          else
          {
            char v113 = [v282 bundleIdentifier];
            if ([v113 isEqualToString:@"com.apple.mobilesafari"]
              && (int)[v78 topHit] >= 1)
            {
              int v112 = [v78 forceNoTopHit] ^ 1;
            }
            else
            {
              int v112 = 0;
            }
          }
          if ([v79 didMatchRankingDescriptor:@"kMDItemDisplayNameOrSubjectOrTitleNonTokenizedWordMatch"])
          {
            int v114 = 1;
          }
          else
          {
            uint64_t v115 = [v79 L2FeatureVector];
            int v114 = [v115 displayNameFuzzySpecialInsertion];
          }
          int v274 = [v79 didMatchRankingDescriptor:@"kMDItemDisplayNameOrSubjectOrTitleExactMatch"];
          int v271 = [v79 didMatchRankingDescriptor:@"kMDItemDisplayNameOrSubjectOrTitleTokenizedPrefixMatch"];
          int v116 = [v79 didMatchRankingDescriptor:@"kMDItemAlternateNameExactMatch"];
          if (v288)
          {
            id v117 = [v79 L2FeatureVector];
            [v117 scoreForFeature:2327];
            BOOL v119 = v118 != 0.0;

            unint64_t v120 = [v79 L2FeatureVector];
            [v120 scoreForFeature:1614];
            float v122 = v121;

            id v123 = [v79 L2FeatureVector];
            [v123 scoreForFeature:189];
            float v125 = v124;

            BOOL v126 = v125 != 2147500000.0 || v248 > 4;
            BOOL v127 = v122 == 0.0 && v126;
            if (v249 && v127)
            {
              id v128 = [v79 L2FeatureVector];
              [v128 originalL2Score];
              BOOL v130 = v129 < v39;

              BOOL v127 = !v130;
            }
            int v131 = [v79 L2FeatureVector];
            [v131 scoreForFeature:1621];
            float v133 = v132;

            BOOL v134 = v133 == 0.0 && v126;
            BOOL v268 = v134;
            double v135 = [v79 L2FeatureVector];
            [v135 scoreForFeature:34];
            float v137 = v136;

            BOOL v264 = v137 == 1.0;
          }
          else
          {
            BOOL v119 = 0;
            BOOL v127 = 0;
            BOOL v268 = 0;
            BOOL v264 = 0;
          }
          int v138 = [v276 isAltNamePrefixMatchOnlyTopHitExcludedQuery];
          int v263 = v112 | v111;
          if ((v112 | v111 | v114 | v274 | v271)) {
            int v139 = 1;
          }
          else {
            int v139 = (v116 | v119 | (v127 || v284)) & (v138 & v251 ^ 1);
          }
          if (v272)
          {
            if ([v79 topHitReason] == 15)
            {
              int v139 = 1;
            }
            else if (v295)
            {
              int v139 = 0;
            }
          }
          if (v283 == 16) {
            int v140 = v269;
          }
          else {
            int v140 = 0;
          }
          if ((([v279 isEqualToString:@"com.apple.calculation"] & 1) != 0
             || ([v279 isEqualToString:@"com.apple.conversion"] & 1) != 0
             || ([v279 isEqualToString:@"com.apple.worldclock"] & 1) != 0
             || [v279 isEqualToString:@"com.apple.datadetector.quick_actions"])
            && [v78 topHit] == 2)
          {
            v190 = [(id)v337[5] results];
            BOOL v191 = v190 == 0;

            if (v191)
            {
              v192 = objc_opt_new();
              [(id)v337[5] setResults:v192];
            }
            if ([(id)v337[5] resultsCount]) {
              objc_msgSend((id)v337[5], "removeResultsInRange:", 0, objc_msgSend((id)v337[5], "resultsCount"));
            }
            [(id)v337[5] setRelatedSectionBundleIdentifier:v279];
            [(id)v337[5] addResults:v78 atIndex:0];
            char v231 = 1;
            char v61 = 1;
            goto LABEL_324;
          }
          unint64_t v141 = [(id)v337[5] resultsCount];
          unint64_t v142 = [(id)v337[5] maxInitiallyVisibleResults];
          char v143 = v272 ^ 1;
          if (v141 < v142) {
            char v143 = 1;
          }
          if ((v143 & 1) == 0 && [v79 topHitReason] == 15)
          {
            v193 = [(id)v337[5] results];
            BOOL v194 = v193 == 0;

            if (v194)
            {
              v195 = objc_opt_new();
              [(id)v337[5] setResults:v195];
            }
            if ([(id)v337[5] resultsCount]) {
              objc_msgSend((id)v337[5], "removeResultsInRange:", 0, objc_msgSend((id)v337[5], "resultsCount"));
            }
            [(id)v337[5] setRelatedSectionBundleIdentifier:v279];
            [(id)v337[5] addResults:v78 atIndex:0];
            char v61 = 0;
LABEL_324:

            id v60 = (void *)v290;
            goto LABEL_82;
          }
          int v262 = [v79 displayNameInitialsPrefixMatchOnly];
          int v261 = [v79 displayNameInitialsFirstWordAndMoreMatchOnly];
          unint64_t v144 = [(id)v337[5] resultsCount];
          int v145 = v140 | v139;
          if (v144 >= [(id)v337[5] maxInitiallyVisibleResults]) {
            goto LABEL_243;
          }
          if ((v277 & 4) == 0
            || ([v78 contactIdentifier],
                uint64_t v256 = objc_claimAutoreleasedReturnValue(),
                ([v256 isEqualToString:sMeContactIdentifier] ^ 1 | v274) == 1))
          {
            if ((v145 & 1) != 0
              || ([v282 bundleIdentifier],
                  uint64_t v247 = objc_claimAutoreleasedReturnValue(),
                  ([v247 isEqualToString:@"com.apple.calculation"] & 1) != 0))
            {
              int v146 = 0;
              int v147 = 0;
              goto LABEL_204;
            }
            id v242 = [v282 bundleIdentifier];
            if ([v242 isEqualToString:@"com.apple.conversion"])
            {
              int v147 = 0;
              int v146 = 1;
              goto LABEL_204;
            }
            v237 = [v282 bundleIdentifier];
            if ([v237 isEqualToString:@"com.apple.worldclock"])
            {
              int v146 = 1;
              int v147 = 1;
LABEL_204:
              int v148 = 0;
              if (v266 & (v277 >> 2) & v244)
              {
                int v149 = 0;
                goto LABEL_237;
              }
LABEL_219:
              if ((v266 & v288 ^ 1 | v274 | v268))
              {
                int v155 = 0;
                goto LABEL_226;
              }
              int v156 = !v264 | v262 | v261;
              if ((v156 & 1) != 0
                || ([v79 displayNameInitials], (double v233 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                int v155 = v156 ^ 1;
                if (v255)
                {
LABEL_235:
                  int v149 = 0;
                  if (v155) {
                    goto LABEL_236;
                  }
LABEL_231:
                  if (v148) {
                    goto LABEL_232;
                  }
LABEL_237:
                  if (v147) {
                    goto LABEL_238;
                  }
LABEL_233:
                  if (!v146) {
                    goto LABEL_240;
                  }
LABEL_239:

                  goto LABEL_240;
                }
              }
              else
              {
                double v233 = 0;
                int v155 = 1;
              }
LABEL_226:
              if ((!v266 | v288 | v230 ^ 1 | v285 ^ 1) != 1) {
                goto LABEL_235;
              }
              if (v283 == 16) {
                int v149 = v266 & (v265 >> 18) & v254 ^ 1;
              }
              else {
                int v149 = 1;
              }
              if ((v155 & 1) == 0) {
                goto LABEL_231;
              }
LABEL_236:

              if ((v148 & 1) == 0) {
                goto LABEL_237;
              }
LABEL_232:

              if ((v147 & 1) == 0) {
                goto LABEL_233;
              }
LABEL_238:

              if (v146) {
                goto LABEL_239;
              }
LABEL_240:
              if (v145)
              {
                if ((v277 & 4) != 0) {
                  goto LABEL_242;
                }
LABEL_256:
                if (v149) {
                  goto LABEL_257;
                }
              }
              else
              {

                if (((v277 >> 2) & 1) == 0) {
                  goto LABEL_256;
                }
LABEL_242:

                if (v149)
                {
LABEL_257:
                  objc_storeStrong(v331 + 5, v282);
                  v171 = [v282 bundleIdentifier];
                  [(id)v337[5] setRelatedSectionBundleIdentifier:v171];

                  [(id)v337[5] addResults:v78];
                  if ((v277 & 4) == 0)
                  {
                    v252 |= v263;
                    v238 |= v263 & v288;
                    LODWORD(v235) = v114 & v288 | v235;
                    v243 |= v274 & v288;
                    HIDWORD(v234) |= v284 & v288;
                    LODWORD(v234) = v271 & v288 | v234;
                  }
                  goto LABEL_288;
                }
              }
LABEL_243:
              long long v157 = [(id)v337[5] resultSet];
              long long v158 = [v157 firstObject];
              long long v159 = [v158 sectionBundleIdentifier];

              if (([v159 isEqualToString:@"com.apple.calculation"] & 1) != 0
                || ([v159 isEqualToString:@"com.apple.conversion"] & 1) != 0
                || ([v159 isEqualToString:@"com.apple.worldclock"] & 1) != 0)
              {
                char v160 = 1;
              }
              else
              {
                char v160 = [v159 isEqualToString:@"com.apple.datadetector.quick_actions"];
              }
              uint64_t v161 = [v79 L2FeatureVector];
              [v161 originalL2Score];
              float v163 = v162;

              double v164 = PRSLogCategoryDefault();
              if (os_log_type_enabled(v164, OS_LOG_TYPE_DEBUG))
              {
                v173 = [(SSRankingManager *)self query];
                v174 = [v78 applicationBundleIdentifier];
                v175 = v174;
                if (!v174)
                {
                  double v228 = [v78 sectionBundleIdentifier];
                  v175 = v228;
                }
                *(_DWORD *)buf = 138412802;
                v343 = v173;
                __int16 v344 = 2112;
                v345 = v175;
                __int16 v346 = 2048;
                double v347 = v163;
                _os_log_debug_impl(&dword_1BDB2A000, v164, OS_LOG_TYPE_DEBUG, "query %@: Top Hit score for result %@ %f", buf, 0x20u);
                if (!v174) {
              }
                }
              double v165 = [(id)v337[5] results];
              uint64_t v166 = [v165 count];

              if (v166)
              {
                float v167 = [(id)v337[5] resultsAtIndex:0];
                float v286 = [v167 rankingItem];
                if ((v160 & 1) == 0)
                {
                  if (v257)
                  {
                    uint64_t v168 = v270;
                    goto LABEL_252;
                  }
                  if (((v250 | v267) & 1) == 0)
                  {
                    v172 = [v78 sectionBundleIdentifier];
                    float v270 = v172;
                    uint64_t v168 = v159;
                    if (v159 != v172)
                    {

                      goto LABEL_281;
                    }
LABEL_252:
                    int v169 = v145 & v266 & v288 ^ 1 | v274;
                    if ((v169 | v268))
                    {
                      int v170 = v169 ^ 1 | v145;
                    }
                    else if ((!v264 | v262 | v261))
                    {
                      int v170 = v246;
                    }
                    else
                    {
                      v176 = [v79 displayNameInitials];
                      if (v176) {
                        int v177 = v255 ^ 1;
                      }
                      else {
                        int v177 = 1;
                      }

                      int v170 = v177 | v245;
                    }
                    if (v257)
                    {
                      if (v170)
                      {
LABEL_276:
                        if (!v167 || ([v286 bundleIDType] & 0x100) != 0)
                        {
                          BOOL v180 = 1;
                        }
                        else
                        {
                          v178 = [v286 L2FeatureVector];
                          [v178 originalL2Score];
                          BOOL v180 = v163 >= v179;
                        }
                        int v184 = !v180;
                        if (!(v243 & 1 | ((v274 & 1) == 0)) && (v184 & 1) == 0)
                        {
                          ((void (**)(void, id, id))v240)[2](v240, v78, v282);
                          int v243 = 1;
                          goto LABEL_311;
                        }
                        int v185 = v243 | v238 | v184;
                        if (((v263 ^ 1 | v185) & 1) == 0)
                        {
                          ((void (**)(void, id, id))v240)[2](v240, v78, v282);
                          int v243 = 0;
                          int v238 = 1;
                          goto LABEL_311;
                        }
                        if (((v263 ^ 1 | v235 | v185) & 1) == 0)
                        {
                          ((void (**)(void, id, id))v240)[2](v240, v78, v282);
                          int v238 = 0;
                          int v243 = 0;
                          LODWORD(v235) = 1;
                          goto LABEL_311;
                        }
                        if (((!v284 | HIDWORD(v234) | v235 | v238 | v243 | v184) & 1) == 0)
                        {
                          ((void (**)(void, id, id))v240)[2](v240, v78, v282);
                          int v238 = 0;
                          int v243 = 0;
                          HIDWORD(v234) = 1;
                          LODWORD(v235) = 0;
                          goto LABEL_311;
                        }
                        if (((v271 ^ 1 | v234 | v238 | v235 | HIDWORD(v234) | v243 | v184) & 1) == 0)
                        {
                          ((void (**)(void, id, id))v240)[2](v240, v78, v282);
                          int v238 = 0;
                          LODWORD(v235) = 0;
                          int v243 = 0;
                          uint64_t v234 = 1;
                          goto LABEL_311;
                        }
                        v186 = [v78 sectionBundleIdentifier];
                        if (v159 == v186)
                        {
                        }
                        else
                        {
                          if (![v159 isEqualToString:@"com.apple.application"])
                          {

                            goto LABEL_308;
                          }
                          v187 = [v78 sectionBundleIdentifier];
                          int v188 = [v187 isEqualToString:@"com.apple.app-clips"];

                          if (!v188)
                          {
LABEL_308:
                            if (v251 && (unint64_t)[v292 count] >= 2) {
                              ((void (**)(void, id, id))v240)[2](v240, v78, v282);
                            }
LABEL_311:
                            int v189 = HIDWORD(v235);
                            v258 |= v288;
                            if (!v288) {
                              int v189 = v269 | HIDWORD(v235);
                            }
                            HIDWORD(v235) = v189;
LABEL_286:

LABEL_287:
                            float v270 = v168;
                            goto LABEL_288;
                          }
                        }
                        [(id)v337[5] addResults:v78];
                        goto LABEL_311;
                      }
                    }
                    else
                    {

                      if (v170) {
                        goto LABEL_276;
                      }
                    }
                    float v270 = v168;
                  }
                }
LABEL_281:
                v181 = [v286 L2FeatureVector];
                [v181 originalL2Score];
                BOOL v183 = v163 <= v182;

                if (!(v183 | v258 & 1 | ((v277 & 4) == 0) | v252 & 1))
                {
                  if (v274) {
                    ((void (**)(void, id, id))v240)[2](v240, v78, v282);
                  }
                  unsigned __int8 v258 = 0;
                }
                uint64_t v168 = v270;
                goto LABEL_286;
              }
              uint64_t v168 = v270;
              goto LABEL_287;
            }
            double v232 = [v282 bundleIdentifier];
            if ([v232 isEqualToString:@"com.apple.datadetector.quick_actions"])
            {
              if ((v266 & (v277 >> 2) & v244) != 1)
              {
                int v148 = 1;
                int v147 = 1;
                int v146 = 1;
                goto LABEL_219;
              }
            }
            else
            {

              if (((v277 >> 2) & 1) == 0) {
                goto LABEL_243;
              }
            }
          }

          goto LABEL_243;
        }
LABEL_81:
        char v61 = 0;
LABEL_82:

        ++v273;
      }
      while (v273 != v259);
      uint64_t v196 = [v253 countByEnumeratingWithState:&v309 objects:v348 count:16];
      uint64_t v259 = v196;
      if (!v196) {
        goto LABEL_328;
      }
    }
  }
  unsigned __int8 v258 = 0;
  BYTE4(v235) = 0;
  v275 = 0;
  id v60 = 0;
  char v231 = 0;
LABEL_328:

  if ((v258 | BYTE4(v235))) {
    int v197 = 8;
  }
  else {
    int v197 = 1;
  }
  if (a10) {
    int v197 = a10;
  }
  int v296 = v197;
  v198 = objc_msgSend((id)v337[5], "results", v227);
  uint64_t v293 = [v198 count];
  if ((void)obja)
  {
    double v199 = (void *)MEMORY[0x1E4F1C9C8];
    [v276 currentTime];
    v299 = objc_msgSend(v199, "dateWithTimeIntervalSinceReferenceDate:");
    id v200 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v201 = (void *)[v200 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    unint64_t v202 = 0;
    uint64_t v203 = -1;
    uint64_t v204 = -1;
    while (v202 < [v198 count])
    {
      double v205 = [v198 objectAtIndex:v202];
      v206 = v205;
      if (v205 == (void *)obja)
      {
        uint64_t v204 = v202;
      }
      else if (v203 < 0)
      {
        v207 = [v205 rankingItem];
        v208 = SSCompactRankingAttrsGetValue((int8x8_t *)[v207 attributes], 0x20uLL);
        if (!v208
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || ((int v209 = [v201 isDate:v208 inSameDayAsDate:v299], *((void *)&obja + 1))
            ? (int v210 = v209)
            : (int v210 = 0),
              v210 != 1
           || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
           || [*((id *)&obja + 1) compare:v208] != -1))
        {
          uint64_t v203 = v202;
        }
      }
      ++v202;
    }
  }
  else
  {
    uint64_t v203 = -1;
    uint64_t v204 = -1;
  }
  v211 = [(id)v337[5] resultSet];
  v212 = [v211 firstObject];
  v213 = [v212 sectionBundleIdentifier];

  if ((void)obja)
  {
    if (v293)
    {
      if ((v203 & 0x8000000000000000) == 0
        && v203 < v296
        && ([v213 isEqualToString:@"com.apple.calculation"] & 1) == 0
        && ([v213 isEqualToString:@"com.apple.conversion"] & 1) == 0
        && ([v213 isEqualToString:@"com.apple.worldclock"] & 1) == 0
        && ([v213 isEqualToString:@"com.apple.datadetector.quick_actions"] & 1) == 0
        && (([v213 isEqualToString:@"com.apple.application"] & 1) != 0
         || [v213 isEqualToString:@"com.apple.app-clips"]))
      {
        v214 = [(id)obja sectionBundleIdentifier];
        if ([v214 isEqualToString:@"com.apple.application"])
        {
          int v215 = 0;
          int v216 = 1;
        }
        else
        {
          int v226 = [v214 isEqualToString:@"com.apple.application"];
          if (v203) {
            int v216 = v226;
          }
          else {
            int v216 = 1;
          }
          int v215 = (v203 == 0) & ~v226;
        }

        goto LABEL_365;
      }
    }
    else
    {
      uint64_t v203 = 0;
      int v215 = 0;
      int v216 = 1;
LABEL_365:
      if (!v216 || v204 < 0 || v204 > v203)
      {
        if (v216 && (v266 & v230 & 1) == 0)
        {
          [(NSMutableString *)self->_logValues insertString:@"Top Hit is a shortcut result\n" atIndex:0];
          if ((v204 & 0x8000000000000000) == 0)
          {
            int v217 = [(id)v337[5] resultSet];
            [v217 removeObject:(void)obja];
          }
          [(id)v337[5] addResults:(void)obja atIndex:v203];
          [v302 setTopHitReason:17];
          if (v296 >= 1 && [(id)v337[5] resultsCount] > (unint64_t)v296) {
            objc_msgSend((id)v337[5], "removeResultsAtIndex:", objc_msgSend((id)v337[5], "resultsCount") - 1);
          }
          if (v215) {
            objc_msgSend((id)v337[5], "removeResultsInRange:", 1, objc_msgSend((id)v337[5], "resultsCount") - 1);
          }
          if (v300 && !v203)
          {
            objc_storeStrong(v331 + 5, v300);
            float v218 = [v300 bundleIdentifier];
            [(id)v337[5] setRelatedSectionBundleIdentifier:v218];
          }
          int v219 = [(id)obja sectionBundleIdentifier];
          v220 = [(SSRankingManager *)self rankingConfiguration];
          [v220 setShortcutSectionBundleID:v219];

          char v231 = 1;
        }
      }
      else
      {
        [v302 setTopHitReason:17];
        v231 |= v204 == 0;
      }
    }
  }
  [(SSRankingManager *)self applyTopHitRankingPolicyToSection:v337[5] topResultSection:v331[5] maxTopHitCount:v296 isShortcut:v231 & 1];
  uint64_t v221 = [(id)v337[5] results];

  for (iuint64_t i = 0; ii < [v221 count]; ++ii)
  {
    char v223 = [v221 objectAtIndex:ii];
    v224 = [v223 rankingItem];
    objc_msgSend(v224, "setBundleIDType:", objc_msgSend(v224, "bundleIDType") | 0x8000);
  }
  id v14 = (id)v337[5];

  _Block_object_dispose(&v330, 8);
  _Block_object_dispose(&v336, 8);

LABEL_386:
  return v14;
}

+ (id)getLegacyTophitSection
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  id v0 = (id)sLegacyTophitSection;
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  return v0;
}

void __190__SSRankingManager_makeTopHitSectionUsingSections_withItemRanker_sectionHeader_shortcutResult_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_parsecEnabled_maxNumAppsInTopHitSection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v6 = [v5 bundleIdentifier];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setRelatedSectionBundleIdentifier:v6];

  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) resultSet];
  uint64_t v8 = [v7 firstObject];

  if (v8)
  {
    uint64_t v9 = [v8 sectionBundleIdentifier];
    int v10 = [v15 sectionBundleIdentifier];

    if (v9 != v10)
    {
      uint64_t v11 = [v8 sectionBundleIdentifier];
      if ([v11 isEqualToString:@"com.apple.mobileslideshow"])
      {
      }
      else
      {
        id v12 = [v8 sectionBundleIdentifier];
        char v13 = [v12 isEqualToString:@"com.apple.searchd.syndicatedPhotos"];

        if ((v13 & 1) == 0)
        {
          id v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) resultSet];
          [v14 removeObjectAtIndex:0];
          goto LABEL_8;
        }
      }
      id v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) resultSet];
      [v14 removeAllObjects];
LABEL_8:
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addResults:v15 atIndex:0];
}

uint64_t __190__SSRankingManager_makeTopHitSectionUsingSections_withItemRanker_sectionHeader_shortcutResult_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_parsecEnabled_maxNumAppsInTopHitSection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 rankingItem];
  if (v7
    && (uint64_t v8 = (void *)v7,
        [v5 rankingItem],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    int v10 = [v5 rankingItem];
    uint64_t v11 = [v6 rankingItem];
    [*(id *)(a1 + 32) currentTime];
    uint64_t v12 = -objc_msgSend(v10, "compare:currentTime:", v11);
  }
  else
  {
    char v13 = [v5 rankingItem];

    if (v13)
    {
      uint64_t v12 = -1;
    }
    else
    {
      id v14 = [v6 rankingItem];

      uint64_t v12 = v14 != 0;
    }
  }

  return v12;
}

- (id)removeBlockListedSectionsForMapping:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SSRankingManager *)self rankingConfiguration];
  [v5 lock];

  id v6 = [(SSRankingManager *)self rankingConfiguration];
  uint64_t v7 = [v6 cepBlocklistSet];

  if (v4 && v7)
  {
    uint64_t v8 = (void *)[v4 mutableCopy];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = objc_msgSend(v4, "allKeys", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if ([v7 containsObject:v14]) {
            [v8 removeObjectForKey:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    uint64_t v15 = [v8 copy];
    id v4 = (id)v15;
  }
  BOOL v16 = [(SSRankingManager *)self rankingConfiguration];
  [v16 unlock];

  return v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.searchd"];
    uint64_t v2 = [v7 objectForKey:@"meContactIdentifier"];
    BOOL v3 = (void *)sMeContactIdentifier;
    sMeContactIdentifier = v2;

    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.parsec.web_suggest", @"com.apple.parsec.web_index", @"com.apple.parsec.bing", 0);
    id v5 = (void *)sSetOfSuggestedWebsitesBundleIDs;
    sSetOfSuggestedWebsitesBundleIDs = v4;

    id v6 = (void *)sDefaultProbability;
    sDefaultProbability = (uint64_t)&unk_1F1864270;

    if (initialize_once_token != -1) {
      dispatch_once(&initialize_once_token, &__block_literal_global_510);
    }
    isInternalDevice = os_variant_has_internal_diagnostics();
  }
}

uint64_t __30__SSRankingManager_initialize__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"marriott", @"hilton", @"intercontinental hotels", @"igh", @"accor hotels", @"ritz-carlton", @"ritz carlton", @"four seasons", @"shangri-la", @"shangri la", @"hyatt", @"jw marriott", @"hotel", @"resort", @"lodging", @"accommodation", @"reservation",
    @"suite",
    @"room",
    @"guest",
    @"booking",
    @"confirmation",
    @"check-in",
    @"check-out",
    @"check in",
    @"check out",
  uint64_t v0 = 0);
  uint64_t v1 = (void *)sSetOfHotelReservationKeywords;
  sSetOfHotelReservationKeywords = v0;

  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"delta", @"alaska", @"southwest", @"hawaiian", @"jetblue", @"united", @"american", @"spirit", @"frontier", @"emirates", @"qatar airways", @"singapore airlines", @"air canada", @"aeroflot", @"airport", @"airline", @"airlines",
    @"departure",
    @"arrival",
    @"boarding",
    @"boarding gate",
    @"terminal",
    @"check in",
    @"check-in",
  uint64_t v2 = 0);
  BOOL v3 = (void *)sSetOfFlightReservationKeywords;
  sSetOfFlightReservationKeywords = v2;

  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"restaurant", @"reservation", @"reservations", @"dinning", @"dinner", @"lunch", @"brunch", @"breakfast", @"bistro", @"cafe", @"eatery", @"party of", @"table for", 0);
  id v5 = (void *)sSetOfRestaurantReservationKeywords;
  sSetOfRestaurantReservationKeywords = v4;

  sSetOfOtherReservationKeywords = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ticket", @"tickets", @"reservation", @"confirmation", @"RSVP", @"booking", @"appointment", @"party of", @"event", @"venue", 0);
  return MEMORY[0x1F41817F8]();
}

- (SSRankingManager)initWithQuery:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SSRankingManager;
  id v6 = [(SSRankingManager *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_query, a3);
    uint64_t v8 = objc_opt_new();
    rankingConfiguratiounint64_t n = v7->_rankingConfiguration;
    v7->_rankingConfiguratiounint64_t n = (PRSRankingConfiguration *)v8;

    if (isInternalDevice)
    {
      uint64_t v10 = objc_opt_new();
      logValues = v7->_logValues;
      v7->_logValues = (NSMutableString *)v10;
    }
    else
    {
      logValues = v7->_logValues;
      v7->_logValues = 0;
    }

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.application", @"com.apple.MobileAddressBook", @"com.apple.conversion", @"com.apple.calculation", @"com.apple.worldclock", @"com.apple.datadetector.quick_actions", @"com.apple.dictionary", @"com.apple.mobilesafari", @"com.apple.app-clips", 0);
    allowedTopHitSections = v7->_allowedTopHitSections;
    v7->_allowedTopHitSections = (NSSet *)v12;

    v7->_bullseyeRankingEnabled = 0;
  }

  return v7;
}

- (int64_t)compareDate:(id)a3 withDate:(id)a4
{
  if (a3 && a4)
  {
    id v5 = a4;
    [a3 timeIntervalSinceNow];
    double v7 = v6;
    [v5 timeIntervalSinceNow];
    double v9 = v8;

    if ((v7 <= 0.0 || v9 <= 0.0) && (v7 > 0.0 || v9 > 0.0)) {
      goto LABEL_14;
    }
    double v7 = fabs(v7);
    double v9 = fabs(v9);
    if (v7 < v9) {
      return -1;
    }
    if (v7 <= v9)
    {
LABEL_14:
      if (v9 >= 0.0 || v7 <= 0.0) {
        return 1;
      }
      else {
        return -1;
      }
    }
    else
    {
      return 1;
    }
  }
  else if (a3)
  {
    return -1;
  }
  else
  {
    return a4 != 0;
  }
}

+ (id)jsonStringFromDictionary:(id)a3 prettyPrinted:(BOOL)a4
{
  uint64_t v7 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:a4 | 2 error:&v7];
  if (v4) {
    id v5 = (__CFString *)[[NSString alloc] initWithData:v4 encoding:4];
  }
  else {
    id v5 = &stru_1F1824018;
  }

  return v5;
}

+ (id)jsonStringFromDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3)
  {
    BOOL v16 = 0;
    goto LABEL_21;
  }
  id v5 = [v3 objectForKeyedSubscript:@"ResultBundle"];
  int v6 = [v5 isEqualToString:@"com.apple.spotlight.websuggestionlist.usertypedstring"];

  if (v6)
  {
    uint64_t v7 = (void *)[v4 mutableCopy];
    id v8 = [v4 objectForKeyedSubscript:@"identifier"];
    double v9 = [NSString stringWithFormat:@"%@: ", @"com.apple.spotlight.websuggestionlist.usertypedstring"];
    uint64_t v10 = [v9 length];
    if ([v8 hasPrefix:v9])
    {
      uint64_t v11 = [v8 substringFromIndex:v10];
      uint64_t v12 = v11;
      char v13 = NSString;
      if (v11)
      {
        uint64_t v14 = SSRedactString(v11, 1);
        id v15 = [v13 stringWithFormat:@"%@%@", v9, v14];
      }
      else
      {
        id v15 = [NSString stringWithFormat:@"%@%@", v9, &stru_1F1824018];
      }

      goto LABEL_19;
    }
    id v18 = v8;
    goto LABEL_18;
  }
  uint64_t v17 = [v4 objectForKeyedSubscript:@"ResultBundle"];
  if ([v17 isEqualToString:@"com.apple.spotlight.related_search"])
  {
  }
  else
  {
    long long v19 = [v4 objectForKeyedSubscript:@"ResultBundle"];
    int v20 = [v19 isEqualToString:@"com.apple.spotlight.related_search_as_typed.web"];

    BOOL v16 = v4;
    if (!v20) {
      goto LABEL_21;
    }
  }
  uint64_t v7 = (void *)[v4 mutableCopy];
  id v8 = [v4 objectForKeyedSubscript:@"identifier"];
  uint64_t v21 = [@"rs:" length];
  if ([v8 hasPrefix:@"rs:"])
  {
    uint64_t v22 = [v8 substringFromIndex:v21];
    double v9 = v22;
    uint64_t v23 = NSString;
    if (v22)
    {
      float v24 = SSRedactString(v22, 1);
      id v15 = [v23 stringWithFormat:@"%@%@", @"rs:", v24];

LABEL_19:
      goto LABEL_20;
    }
    id v18 = [NSString stringWithFormat:@"%@%@", @"rs:", &stru_1F1824018];
LABEL_18:
    id v15 = v18;
    goto LABEL_19;
  }
  id v15 = v8;
LABEL_20:

  [v7 setObject:v15 forKey:@"identifier"];
  BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];

LABEL_21:
  float v25 = +[SSRankingManager jsonStringFromDictionary:v4 prettyPrinted:1];

  return v25;
}

+ (void)rankLocalBundlesUsingL3Score:(id)a3 sectionMapping:(id)a4 l3RankingScores:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    if ([v7 count])
    {
      unint64_t v12 = 0;
      do
      {
        char v13 = [v7 objectAtIndexedSubscript:v12];
        uint64_t v14 = [v13 rankingItem];
        [v14 keywordMatchScore];
        float v16 = v15;

        if (v16 >= 0.0)
        {
          [v10 addObject:v13];
          uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v12];
          [v11 addObject:v17];
        }
        ++v12;
      }
      while (v12 < [v7 count]);
    }
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    float v24 = __80__SSRankingManager_rankLocalBundlesUsingL3Score_sectionMapping_l3RankingScores___block_invoke;
    float v25 = &unk_1E634C490;
    id v26 = v9;
    id v27 = v8;
    [v10 sortWithOptions:16 usingComparator:&v22];
    if (objc_msgSend(v10, "count", v22, v23, v24, v25))
    {
      unint64_t v18 = 0;
      do
      {
        long long v19 = [v11 objectAtIndexedSubscript:v18];
        uint64_t v20 = [v19 unsignedIntegerValue];
        uint64_t v21 = [v10 objectAtIndexedSubscript:v18];
        [v7 replaceObjectAtIndex:v20 withObject:v21];

        ++v18;
      }
      while (v18 < [v10 count]);
    }
  }
}

uint64_t __80__SSRankingManager_rankLocalBundlesUsingL3Score_sectionMapping_l3RankingScores___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = compareBestLocalResultsWithRules(v5, v6, 0);
  if (!v7)
  {
    id v8 = [v5 rankingItem];
    [v8 likelihood];
    float v10 = v9;

    float v29 = v10;
    uint64_t v11 = [v6 rankingItem];
    [v11 likelihood];
    float v13 = v12;

    float v28 = v13;
    uint64_t v14 = [v5 rankingItem];
    [v14 keywordMatchScore];
    float v16 = v15;

    uint64_t v17 = [v6 rankingItem];
    [v17 keywordMatchScore];
    float v19 = v18;

    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v22 = [v5 rankingItem];
    uint64_t v23 = [v22 sectionBundleIdentifier];
    float v24 = [v6 rankingItem];
    float v25 = [v24 sectionBundleIdentifier];
    uint64_t v7 = 1;
    LOWORD(v27) = 1;
    +[SectionL3Scores getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:](SectionL3Scores, "getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:", v21, v20, v23, v25, &v29, &v28, v27);

    if (v29 <= v28)
    {
      if (v28 <= v29)
      {
        if (v16 > v19)
        {
          uint64_t v7 = 1;
          goto LABEL_8;
        }
        if (v19 <= v16)
        {
          uint64_t v7 = 0;
          goto LABEL_8;
        }
      }
      uint64_t v7 = -1;
    }
  }
LABEL_8:

  return -v7;
}

+ (id)rankLocalBundlesUsingOriginalL2ScoreAndRules:(id)a3 sectionMapping:(id)a4 l3RankingScores:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (isInternalDevice) {
    float v10 = objc_opt_new();
  }
  else {
    float v10 = 0;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96__SSRankingManager_rankLocalBundlesUsingOriginalL2ScoreAndRules_sectionMapping_l3RankingScores___block_invoke;
  v17[3] = &unk_1E634C380;
  id v11 = v10;
  id v18 = v11;
  id v19 = v9;
  id v20 = v8;
  id v12 = v8;
  id v13 = v9;
  [v7 sortWithOptions:1 usingComparator:v17];
  uint64_t v14 = v20;
  id v15 = v11;

  return v15;
}

uint64_t __96__SSRankingManager_rankLocalBundlesUsingOriginalL2ScoreAndRules_sectionMapping_l3RankingScores___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = compareBestLocalResultsWithRules(v5, v6, *(void **)(a1 + 32));
  if (!v7)
  {
    id v8 = [v5 rankingItem];
    id v9 = [v8 L2FeatureVector];
    [v9 originalL2Score];
    float v11 = v10;

    float v26 = v11;
    id v12 = [v6 rankingItem];
    id v13 = [v12 L2FeatureVector];
    [v13 originalL2Score];
    float v15 = v14;

    float v25 = v15;
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    id v18 = [v5 rankingItem];
    id v19 = [v18 sectionBundleIdentifier];
    id v20 = [v6 rankingItem];
    uint64_t v21 = [v20 sectionBundleIdentifier];
    LOWORD(v24) = 256;
    +[SectionL3Scores getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:](SectionL3Scores, "getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:", v17, v16, v19, v21, &v26, &v25, v24);

    if (v26 <= v25)
    {
      if (v25 <= v26) {
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
  }
  uint64_t v22 = -v7;

  return v22;
}

+ (id)rankLocalBundlesUsingModelL3ScoreAndRules:(id)a3 sectionMapping:(id)a4 l3RankingScores:(id)a5
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (isInternalDevice) {
    float v10 = objc_opt_new();
  }
  else {
    float v10 = 0;
  }
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __93__SSRankingManager_rankLocalBundlesUsingModelL3ScoreAndRules_sectionMapping_l3RankingScores___block_invoke;
  v87[3] = &unk_1E634C380;
  id v76 = v10;
  id v88 = v76;
  id v80 = v9;
  id v89 = v80;
  id v77 = v8;
  id v90 = v77;
  [v7 sortWithOptions:1 usingComparator:v87];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v7;
  uint64_t v81 = [obj countByEnumeratingWithState:&v83 objects:v93 count:16];
  if (v81)
  {
    uint64_t v79 = *(void *)v84;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v84 != v79) {
          objc_enumerationMutation(obj);
        }
        uint64_t v82 = v11;
        id v12 = *(void **)(*((void *)&v83 + 1) + 8 * v11);
        id v13 = objc_opt_new();
        float v14 = [v12 sectionBundleIdentifier];

        if (v14)
        {
          float v15 = [v12 sectionBundleIdentifier];
          [v13 setObject:v15 forKey:@"bundle_id"];
        }
        uint64_t v16 = [v12 identifier];

        if (v16)
        {
          uint64_t v17 = [v12 identifier];
          [v13 setObject:v17 forKey:@"identifier"];
        }
        id v18 = [v12 title];
        id v19 = [v18 text];

        if (v19)
        {
          id v20 = [v12 title];
          uint64_t v21 = [v20 text];
          uint64_t v22 = SSRedactString(v21, 1);
          [v13 setObject:v22 forKey:@"title"];
        }
        uint64_t v23 = NSString;
        uint64_t v24 = [v12 rankingItem];
        float v25 = objc_msgSend(v23, "stringWithFormat:", @"%i", objc_msgSend(v24, "shouldHideUnderShowMore"));
        [v13 setObject:v25 forKey:@"should_hide_under_show_more"];

        float v26 = [v12 rankingItem];
        uint64_t v27 = [v26 L2FeatureVector];

        if (v27)
        {
          float v28 = NSString;
          float v29 = [v12 rankingItem];
          dispatch_group_t v30 = [v29 L2FeatureVector];
          [v30 originalL2Score];
          double v32 = objc_msgSend(v28, "stringWithFormat:", @"%f", v31);
          [v13 setObject:v32 forKey:@"original_l2_score"];
        }
        double v33 = NSString;
        uint64_t v34 = [v12 rankingItem];
        [v34 likelihood];
        id v36 = objc_msgSend(v33, "stringWithFormat:", @"%f", v35);
        [v13 setObject:v36 forKey:@"likelihood"];

        double v37 = NSString;
        unint64_t v38 = [v12 rankingItem];
        [v38 keywordMatchScore];
        double v40 = objc_msgSend(v37, "stringWithFormat:", @"%f", v39);
        [v13 setObject:v40 forKey:@"topicality_score"];

        double v41 = NSString;
        dispatch_time_t v42 = [v12 rankingItem];
        [v42 engagementScore];
        float v44 = objc_msgSend(v41, "stringWithFormat:", @"%f", v43);
        [v13 setObject:v44 forKey:@"engagement_score"];

        id v45 = NSString;
        float v46 = [v12 rankingItem];
        [v46 freshnessScore];
        uint64_t v48 = objc_msgSend(v45, "stringWithFormat:", @"%f", v47);
        [v13 setObject:v48 forKey:@"freshness_score"];

        id v49 = [v12 rankingItem];
        int v50 = [v49 sectionBundleIdentifier];

        if (!v50)
        {
          int v50 = [v12 sectionBundleIdentifier];
        }
        int v51 = [v80 objectForKey:v50];
        uint64_t v52 = v51;
        if (v51)
        {
          int v53 = NSString;
          [v51 iFunScore];
          long long v55 = objc_msgSend(v53, "stringWithFormat:", @"%f", v54);
          [v13 setObject:v55 forKey:@"iFunScore"];

          uint64_t v56 = 0;
          do
          {
            id v57 = NSString;
            [v52 getL3Score:v56 isLegacy:0];
            uint64_t v59 = objc_msgSend(v57, "stringWithFormat:", @"%f", v58);
            id v60 = objc_msgSend(NSString, "stringWithFormat:", @"l3Score[%i]", v56);
            [v13 setObject:v59 forKey:v60];

            char v61 = NSString;
            [v52 getL3Score:v56 isLegacy:1];
            id v63 = objc_msgSend(v61, "stringWithFormat:", @"%f", v62);
            int v64 = objc_msgSend(NSString, "stringWithFormat:", @"l3ScoreLegacy[%i]", v56);
            [v13 setObject:v63 forKey:v64];

            uint64_t v56 = (v56 + 1);
          }
          while (v56 != 3);
          id v65 = NSString;
          [v52 serverRelevanceScore];
          uint64_t v67 = objc_msgSend(v65, "stringWithFormat:", @"%f", v66);
          [v13 setObject:v67 forKey:@"serverRelevanceScore"];

          int v68 = NSString;
          [v52 modelScore];
          char v70 = objc_msgSend(v68, "stringWithFormat:", @"%f", v69);
          [v13 setObject:v70 forKey:@"modelScore"];
        }
        int v71 = SSGeneralLog();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          id v72 = +[SSRankingManager jsonStringFromDictionary:v13];
          *(_DWORD *)buf = 138412290;
          char v92 = v72;
          _os_log_impl(&dword_1BDB2A000, v71, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] L3: local_bundles_model_results = %@", buf, 0xCu);
        }
        uint64_t v11 = v82 + 1;
      }
      while (v82 + 1 != v81);
      uint64_t v81 = [obj countByEnumeratingWithState:&v83 objects:v93 count:16];
    }
    while (v81);
  }

  char v73 = v90;
  id v74 = v76;

  return v74;
}

uint64_t __93__SSRankingManager_rankLocalBundlesUsingModelL3ScoreAndRules_sectionMapping_l3RankingScores___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = compareBestLocalResultsWithRules(v5, v6, *(void **)(a1 + 32));
  if (!v7)
  {
    id v8 = [v5 rankingItem];
    id v9 = [v8 L2FeatureVector];
    [v9 originalL2Score];
    float v11 = v10;

    float v31 = v11;
    id v12 = [v6 rankingItem];
    id v13 = [v12 L2FeatureVector];
    [v13 originalL2Score];
    float v15 = v14;

    float v30 = v15;
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 48);
    id v18 = [v5 rankingItem];
    id v19 = [v18 sectionBundleIdentifier];
    id v20 = [v6 rankingItem];
    uint64_t v21 = [v20 sectionBundleIdentifier];
    LOWORD(v29) = 256;
    +[SectionL3Scores getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:](SectionL3Scores, "getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:", v16, v17, v19, v21, &v31, &v30, v29);

    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v23 = [v5 rankingItem];
    uint64_t v24 = [v23 sectionBundleIdentifier];
    float v25 = [v6 rankingItem];
    float v26 = [v25 sectionBundleIdentifier];
    +[SectionL3Scores getComparableModelL3Score:v22 bundleId1:v24 bundleId2:v26 score1:&v31 score2:&v30];

    if (v31 <= v30)
    {
      if (v30 <= v31) {
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
  }
  uint64_t v27 = -v7;

  return v27;
}

+ (id)rankLocalBundles:(id)a3 sectionMapping:(id)a4 l3RankingScores:(id)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  float v10 = +[SSRankingManager rankLocalBundlesUsingOriginalL2ScoreAndRules:v7 sectionMapping:v8 l3RankingScores:v9];
  if (SSEnableSpotlightTopHitPersonalizedRanking()) {
    +[SSRankingManager rankLocalBundlesUsingL3Score:v7 sectionMapping:v8 l3RankingScores:v9];
  }
  if (isInternalDevice)
  {
    uint64_t v59 = v10;
    id v60 = v9;
    id v61 = v8;
    int v64 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v62 = v7;
    id obj = v7;
    uint64_t v11 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v66 != v13) {
            objc_enumerationMutation(obj);
          }
          float v15 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          uint64_t v16 = objc_opt_new();
          uint64_t v17 = [v15 sectionBundleIdentifier];

          if (v17)
          {
            id v18 = [v15 sectionBundleIdentifier];
            [v16 setObject:v18 forKey:@"bundle_id"];
          }
          id v19 = [v15 identifier];

          if (v19)
          {
            id v20 = [v15 identifier];
            [v16 setObject:v20 forKey:@"identifier"];
          }
          uint64_t v21 = [v15 title];
          uint64_t v22 = [v21 text];

          if (v22)
          {
            uint64_t v23 = [v15 title];
            uint64_t v24 = [v23 text];
            float v25 = SSRedactString(v24, 1);
            [v16 setObject:v25 forKey:@"title"];
          }
          float v26 = NSString;
          uint64_t v27 = [v15 rankingItem];
          float v28 = objc_msgSend(v26, "stringWithFormat:", @"%i", objc_msgSend(v27, "shouldHideUnderShowMore"));
          [v16 setObject:v28 forKey:@"should_hide_under_show_more"];

          uint64_t v29 = [v15 rankingItem];
          float v30 = [v29 L2FeatureVector];

          if (v30)
          {
            float v31 = NSString;
            double v32 = [v15 rankingItem];
            double v33 = [v32 L2FeatureVector];
            [v33 originalL2Score];
            uint64_t v35 = objc_msgSend(v31, "stringWithFormat:", @"%f", v34);
            [v16 setObject:v35 forKey:@"original_l2_score"];
          }
          id v36 = NSString;
          double v37 = [v15 rankingItem];
          [v37 likelihood];
          float v39 = objc_msgSend(v36, "stringWithFormat:", @"%f", v38);
          [v16 setObject:v39 forKey:@"likelihood"];

          double v40 = NSString;
          double v41 = [v15 rankingItem];
          [v41 keywordMatchScore];
          uint64_t v43 = objc_msgSend(v40, "stringWithFormat:", @"%f", v42);
          [v16 setObject:v43 forKey:@"topicality_score"];

          float v44 = NSString;
          id v45 = [v15 rankingItem];
          [v45 engagementScore];
          uint64_t v47 = objc_msgSend(v44, "stringWithFormat:", @"%f", v46);
          [v16 setObject:v47 forKey:@"engagement_score"];

          uint64_t v48 = NSString;
          id v49 = [v15 rankingItem];
          [v49 freshnessScore];
          int v51 = objc_msgSend(v48, "stringWithFormat:", @"%f", v50);
          [v16 setObject:v51 forKey:@"freshness_score"];

          [v64 addObject:v16];
          uint64_t v52 = SSGeneralLog();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            int v53 = +[SSRankingManager jsonStringFromDictionary:v16];
            *(_DWORD *)buf = 138412290;
            char v70 = v53;
            _os_log_impl(&dword_1BDB2A000, v52, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] L3: local_bundles_rule_results = %@", buf, 0xCu);
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
      }
      while (v12);
    }

    float v54 = SSGeneralLog();
    float v10 = v59;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      long long v55 = +[SSRankingManager jsonStringFromDictionary:v59];
      *(_DWORD *)buf = 138412290;
      char v70 = v55;
      _os_log_impl(&dword_1BDB2A000, v54, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] L3: local_bundles_rules = %@", buf, 0xCu);
    }
    uint64_t v56 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    [v56 setObject:v64 forKey:@"l3_local_bundles_results"];
    [v56 setObject:v59 forKey:@"l3_local_bundles_rules"];
    id v57 = +[SSRankingManager jsonStringFromDictionary:v56];

    id v8 = v61;
    id v7 = v62;
    id v9 = v60;
  }
  else
  {
    id v57 = &stru_1F1824018;
  }

  return v57;
}

+ (void)logL3Results:(id)a3 l3Info:(id)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v77 = a4;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v5;
  uint64_t v80 = [v5 countByEnumeratingWithState:&v81 objects:v89 count:16];
  if (v80)
  {
    int v76 = 0;
    uint64_t v78 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v80; ++i)
      {
        if (*(void *)v82 != v78) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        if ([v7 resultsCount])
        {
          uint64_t v79 = v7;
          id v8 = [v7 resultsAtIndex:0];
          id v9 = objc_opt_new();
          float v10 = [v8 sectionBundleIdentifier];

          if (v10)
          {
            uint64_t v11 = [v8 sectionBundleIdentifier];
            [v9 setObject:v11 forKey:@"bundle_id"];
          }
          uint64_t v12 = [v8 identifier];

          if (v12)
          {
            uint64_t v13 = [v8 identifier];
            [v9 setObject:v13 forKey:@"identifier"];
          }
          float v14 = [v8 title];
          float v15 = [v14 text];

          if (v15)
          {
            uint64_t v16 = [v8 title];
            uint64_t v17 = [v16 text];
            id v18 = SSRedactString(v17, 1);
            [v9 setObject:v18 forKey:@"title"];
          }
          id v19 = NSString;
          id v20 = [v8 rankingItem];
          uint64_t v21 = objc_msgSend(v19, "stringWithFormat:", @"%i", objc_msgSend(v20, "shouldHideUnderShowMore"));
          [v9 setObject:v21 forKey:@"should_hide_under_show_more"];

          uint64_t v22 = [v8 rankingItem];
          uint64_t v23 = [v22 L2FeatureVector];

          if (v23)
          {
            uint64_t v24 = NSString;
            float v25 = [v8 rankingItem];
            float v26 = [v25 L2FeatureVector];
            [v26 originalL2Score];
            float v28 = objc_msgSend(v24, "stringWithFormat:", @"%f", v27);
            [v9 setObject:v28 forKey:@"original_l2_score"];
          }
          uint64_t v29 = NSString;
          [v8 l2score];
          float v31 = objc_msgSend(v29, "stringWithFormat:", @"%f", v30);
          [v9 setObject:v31 forKey:@"result_l2_score"];

          double v32 = NSString;
          double v33 = [v8 rankingItem];
          [v33 likelihood];
          uint64_t v35 = objc_msgSend(v32, "stringWithFormat:", @"%f", v34);
          [v9 setObject:v35 forKey:@"likelihood"];

          id v36 = NSString;
          double v37 = [v8 rankingItem];
          [v37 keywordMatchScore];
          float v39 = objc_msgSend(v36, "stringWithFormat:", @"%f", v38);
          [v9 setObject:v39 forKey:@"topicality_score"];

          double v40 = NSString;
          double v41 = [v8 rankingItem];
          [v41 engagementScore];
          uint64_t v43 = objc_msgSend(v40, "stringWithFormat:", @"%f", v42);
          [v9 setObject:v43 forKey:@"engagement_score"];

          float v44 = NSString;
          id v45 = [v8 rankingItem];
          [v45 freshnessScore];
          uint64_t v47 = objc_msgSend(v44, "stringWithFormat:", @"%f", v46);
          [v9 setObject:v47 forKey:@"freshness_score"];

          uint64_t v48 = [v8 rankingItem];
          id v49 = [v48 sectionBundleIdentifier];

          if (!v49)
          {
            id v49 = [v8 sectionBundleIdentifier];
          }
          uint64_t v50 = [v77 objectForKey:v49];
          int v51 = v50;
          if (v50)
          {
            uint64_t v52 = NSString;
            [v50 iFunScore];
            float v54 = objc_msgSend(v52, "stringWithFormat:", @"%f", v53);
            [v9 setObject:v54 forKey:@"iFunScore"];

            uint64_t v55 = 0;
            do
            {
              uint64_t v56 = NSString;
              [v51 getL3Score:v55 isLegacy:0];
              float v58 = objc_msgSend(v56, "stringWithFormat:", @"%f", v57);
              uint64_t v59 = objc_msgSend(NSString, "stringWithFormat:", @"l3Score[%i]", v55);
              [v9 setObject:v58 forKey:v59];

              id v60 = NSString;
              [v51 getL3Score:v55 isLegacy:1];
              id v62 = objc_msgSend(v60, "stringWithFormat:", @"%f", v61);
              id v63 = objc_msgSend(NSString, "stringWithFormat:", @"l3ScoreLegacy[%i]", v55);
              [v9 setObject:v62 forKey:v63];

              uint64_t v55 = (v55 + 1);
            }
            while (v55 != 3);
            int v64 = NSString;
            [v51 serverRelevanceScore];
            long long v66 = objc_msgSend(v64, "stringWithFormat:", @"%f", v65);
            [v9 setObject:v66 forKey:@"serverRelevanceScore"];

            long long v67 = NSString;
            [v51 modelScore];
            float v69 = objc_msgSend(v67, "stringWithFormat:", @"%f", v68);
            [v9 setObject:v69 forKey:@"modelScore"];

            char v70 = NSString;
            int v71 = [v79 resultSet];
            uint64_t v72 = objc_msgSend(v70, "stringWithFormat:", @"%lu", objc_msgSend(v71, "count"));
            [v9 setObject:v72 forKey:@"resultCount"];
          }
          char v73 = SSGeneralLog();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            id v74 = +[SSRankingManager jsonStringFromDictionary:v9];
            *(_DWORD *)buf = 67109378;
            int v86 = ++v76;
            __int16 v87 = 2112;
            id v88 = v74;
            _os_log_impl(&dword_1BDB2A000, v73, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] L3: all_bundles_results %uint64_t i = %@", buf, 0x12u);
          }
        }
      }
      uint64_t v80 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
    }
    while (v80);
  }
}

+ (id)getTopHitItems:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v21 = v3;
  id obj = [v3 allValues];
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v9 = [v8 results];
        uint64_t v10 = [v9 count];

        if (v10)
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v11 = [v8 results];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v25 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * j);
                uint64_t v17 = [v16 rankingItem];
                __int16 v18 = [v17 bundleIDType];

                if (v18 < 0)
                {
                  id v19 = [v16 rankingItem];
                  [v4 addObject:v19];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v13);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)rankSectionsUsingBundleIDToSectionMapping:(id)a3 withRanker:(id)a4 preferredBundleIds:(id)a5 isScopedSearch:(BOOL)a6 queryId:(unint64_t)a7 isCJK:(BOOL)a8 isBullseyeNonCommittedSearch:(BOOL)a9 isBullseyeCommittedSearch:(BOOL)a10 isPeopleSearch:(BOOL)a11 queryContext:(id)a12
{
  uint64_t v12 = MEMORY[0x1F4188790](self, a2, a3, a4, a5, a6, a7, a8);
  int v718 = v13;
  char v716 = v14;
  uint64_t v16 = v15;
  __int16 v18 = v17;
  uint64_t v670 = v12;
  v956[16] = *MEMORY[0x1E4F143B8];
  id v20 = v19;
  id v21 = v18;
  id v690 = v16;
  id v22 = a12;
  if (rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__onceToken != -1) {
    dispatch_once(&rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__onceToken, &__block_literal_global_625);
  }
  if (rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__onceTokenL3 != -1) {
    dispatch_once(&rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__onceTokenL3, &__block_literal_global_627);
  }
  if (([(id)l3modelManager loaded] & 1) == 0) {
    [(id)l3modelManager loadModel];
  }
  unsigned int v732 = PRSRankingSDEnabledFlagState();
  id v735 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (SPSpamDemotionDisabled_onceToken != -1) {
    dispatch_once(&SPSpamDemotionDisabled_onceToken, &__block_literal_global_516);
  }
  char v23 = SPSpamDemotionDisabled__spamDemotionDisabled;
  uint64_t v924 = 0;
  v925 = &v924;
  uint64_t v926 = 0x3032000000;
  v927 = __Block_byref_object_copy__0;
  v928 = __Block_byref_object_dispose__0;
  v929 = &stru_1F1824018;
  BOOL v701 = SSEnableSpotlightTopHitPersonalizedRanking();
  long long v24 = [v22 clientBundleID];
  v629 = v22;
  v687 = v21;
  char v683 = v23;
  if (!v24)
  {
    char v679 = 0;
    goto LABEL_17;
  }
  uint64_t v25 = [v22 queryKind];
  id v26 = [v22 clientBundleID];
  if (SPQueryKindIsSearchToolSearch_onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken, &__block_literal_global_1490);
  }
  if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode) {
    goto LABEL_13;
  }
  if (!SPQueryKindIsSearchToolSearch_isSearchToolRanking)
  {
    char v679 = 0;
    goto LABEL_15;
  }
  if (([v26 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
    || ([v26 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
  {
LABEL_13:
    char v27 = 1;
  }
  else
  {
    char v121 = [v26 hasPrefix:@"com.apple.ondeviceeval"];
    if (v25 == 12) {
      char v27 = 1;
    }
    else {
      char v27 = v121;
    }
  }
  char v679 = v27;
LABEL_15:

LABEL_17:
  long long v28 = SSGeneralLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v952) = 67109120;
    HIDWORD(v952) = v701;
    _os_log_impl(&dword_1BDB2A000, v28, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] PersonalizedRankingEnabled=%i", (uint8_t *)&v952, 8u);
  }

  context = (void *)MEMORY[0x1C1885190]();
  long long v29 = [(id)v670 rankingConfiguration];
  long long v30 = objc_opt_new();
  long long v31 = [v29 parsecCategoryOrder];
  v736 = (void *)[v31 mutableCopy];

  v740 = objc_opt_new();
  double v32 = [(id)v670 removeBlockListedSectionsForMapping:v20 withRankingConfiguration:v29];

  long long v923 = 0u;
  long long v922 = 0u;
  long long v921 = 0u;
  long long v920 = 0u;
  double v33 = (void *)[v736 copy];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v920 objects:v956 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v921;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v921 != v35) {
          objc_enumerationMutation(v33);
        }
        uint64_t v37 = *(void *)(*((void *)&v920 + 1) + 8 * i);
        float v38 = [v32 objectForKey:v37];
        float v39 = v38;
        if (v38)
        {
          double v40 = [v38 results];
          [v30 addObjectsFromArray:v40];

          [v29 engagementProbabilityForCategory:v37];
          if (v41 != -1.0)
          {
            uint64_t v42 = [MEMORY[0x1E4F28ED0] numberWithDouble:v41];
            [v740 addObject:v42];
          }
        }
        else
        {
          [v736 removeObject:v37];
        }
      }
      uint64_t v34 = [v33 countByEnumeratingWithState:&v920 objects:v956 count:16];
    }
    while (v34);
  }

  uint64_t v43 = objc_opt_new();
  v918[0] = MEMORY[0x1E4F143A8];
  v918[1] = 3221225472;
  v918[2] = __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_630;
  v918[3] = &unk_1E634C4B8;
  v918[4] = v670;
  id v44 = v43;
  id v919 = v44;
  [v30 enumerateObjectsUsingBlock:v918];
  [v44 sortUsingComparator:&__block_literal_global_635];
  [v740 sortUsingComparator:&__block_literal_global_637];
  id v45 = (void *)[v740 mutableCopy];
  uint64_t v46 = (void *)[v740 mutableCopy];
  [v29 engagementProbabilityForCategory:@"com.apple.other.search_appstore"];
  float v48 = v47;
  [v29 engagementProbabilityForCategory:@"com.apple.other.search_app_store"];
  float v50 = v49;
  [v29 engagementProbabilityForCategory:@"com.apple.other.search_web"];
  float v52 = v51;
  [v29 engagementProbabilityForCategory:@"com.apple.other.search_maps"];
  float v54 = v53;
  float v55 = -1.0;
  if (v48 == -1.0)
  {
    v633 = 0;
  }
  else
  {
    v633 = [MEMORY[0x1E4F28ED0] numberWithDouble:v48];
    [v45 addObject:v633];
  }
  if (v50 == -1.0)
  {
    v630 = 0;
  }
  else
  {
    v630 = [MEMORY[0x1E4F28ED0] numberWithDouble:v50];
    [v46 addObject:v630];
  }
  float v56 = -1.0;
  if (v54 == -1.0)
  {
    v635 = 0;
  }
  else
  {
    v635 = [MEMORY[0x1E4F28ED0] numberWithDouble:v54];
    [v45 addObject:v635];
    [v46 addObject:v635];
  }
  if (v52 == -1.0)
  {
    v634 = 0;
  }
  else
  {
    v634 = [MEMORY[0x1E4F28ED0] numberWithDouble:v52];
    [v45 addObject:v634];
    [v46 addObject:v634];
  }
  [v45 sortUsingComparator:&__block_literal_global_639];
  [v46 sortUsingComparator:&__block_literal_global_641];
  uint64_t v57 = [v44 count];
  uint64_t v676 = [v740 count];
  unint64_t v706 = [v45 count];
  [v46 count];
  BOOL v544 = v54 == -1.0;
  float v58 = -1.0;
  if (!v544)
  {
    float v58 = (float)(unint64_t)([v45 indexOfObject:v635] + 1);
    float v55 = (v58 + -1.0) / (double)v706;
  }
  BOOL v544 = v48 == -1.0;
  float v59 = -1.0;
  if (!v544)
  {
    float v56 = (float)(unint64_t)([v45 indexOfObject:v633] + 1);
    float v59 = (v56 + -1.0) / (double)v706;
  }
  float v60 = -1.0;
  float v61 = -1.0;
  if (v52 != -1.0)
  {
    float v60 = (float)(unint64_t)([v45 indexOfObject:v634] + 1);
    float v61 = (v60 + -1.0) / (double)v706;
  }
  if ([v740 count])
  {
    id v674 = [v740 objectAtIndexedSubscript:0];
  }
  else
  {
    id v674 = &unk_1F1860F38;
  }
  if ([v740 count])
  {
    id v671 = [v45 objectAtIndexedSubscript:0];
  }
  else
  {
    id v671 = &unk_1F1860F38;
  }
  id obj = (id)[v30 count];
  [v32 allKeys];
  uint64_t v664 = v57;
  v666 = v46;
  v658 = v668 = v44;
  unint64_t v62 = [v658 count];
  unint64_t v63 = v62;
  int v64 = (v732 >> 1) & 1;
  if (v62 % 7) {
    size_t v65 = v62 / 7 + 1;
  }
  else {
    size_t v65 = v62 / 7;
  }
  unint64_t v66 = 6;
  while (v65
        % rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__core_count)
  {
    if (v62 % v66) {
      size_t v65 = v62 / v66 + 1;
    }
    else {
      size_t v65 = v62 / v66;
    }
    BOOL v543 = v66-- > 4;
    if (!v543)
    {
      uint64_t v67 = 4;
      goto LABEL_65;
    }
  }
  uint64_t v67 = v66 + 1;
LABEL_65:
  uint64_t v656 = v67;
  v711 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v62];
  id v722 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v63];
  v730 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v63];
  float v68 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v63];
  unint64_t v733 = v63;
  float v69 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v63];
  if (SSEnableSpotlightFullPageRanking()) {
    v628 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v63];
  }
  else {
    v628 = 0;
  }
  if (v63)
  {
    uint64_t v70 = *MEMORY[0x1E4F1D260];
    do
    {
      [v68 addObject:v70];
      [v69 addObject:v70];
      [v730 addObject:v70];
      [v722 addObject:v70];
      [v711 addObject:v70];
      --v63;
    }
    while (v63);
  }
  char v652 = v64;
  uint64_t v952 = 0;
  v953 = &v952;
  uint64_t v954 = 0x2020000000;
  char v955 = 0;
  uint64_t v914 = 0;
  v915 = &v914;
  uint64_t v916 = 0x2020000000;
  char v917 = 0;
  uint64_t v910 = 0;
  v911 = &v910;
  uint64_t v912 = 0x2020000000;
  char v913 = 0;
  uint64_t v906 = 0;
  v907 = &v906;
  uint64_t v908 = 0x2020000000;
  char v909 = 0;
  uint64_t v902 = 0;
  v903 = (float *)&v902;
  uint64_t v904 = 0x2020000000;
  int v905 = -1082130432;
  uint64_t v898 = 0;
  v899 = &v898;
  uint64_t v900 = 0x2020000000;
  char v901 = 0;
  uint64_t v894 = 0;
  v895 = (float *)&v894;
  uint64_t v896 = 0x2020000000;
  int v897 = 1325400064;
  uint64_t v890 = 0;
  v891 = &v890;
  uint64_t v892 = 0x2020000000;
  char v893 = 0;
  v654 = +[SSRankingManager getTopHitItems:v32];
  v886[0] = MEMORY[0x1E4F143A8];
  v886[1] = 3221225472;
  v886[2] = __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_644;
  v886[3] = &unk_1E634C500;
  BOOL v888 = a10;
  id v613 = v690;
  id v887 = v613;
  char v889 = v679;
  v695 = (void *)MEMORY[0x1C1885400](v886);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_647;
  block[3] = &unk_1E634C528;
  block[4] = v670;
  uint64_t v872 = v656;
  unint64_t v873 = v733;
  id v621 = v658;
  id v845 = v621;
  id v625 = v32;
  id v846 = v625;
  id v627 = v29;
  id v847 = v627;
  id v626 = v687;
  id v848 = v626;
  id v657 = v68;
  id v849 = v657;
  v864 = &v914;
  v865 = &v890;
  id v622 = v695;
  id v863 = v622;
  id v624 = v654;
  id v850 = v624;
  char v884 = v683;
  BOOL v885 = v701;
  id v659 = v69;
  id v851 = v659;
  v866 = &v952;
  v867 = &v910;
  v868 = &v906;
  id v615 = v740;
  id v852 = v615;
  id v617 = v45;
  id v853 = v617;
  id v618 = v666;
  id v854 = v618;
  id v702 = v736;
  id v855 = v702;
  uint64_t v874 = v676;
  id v619 = v674;
  id v856 = v619;
  id v620 = v671;
  id v857 = v620;
  id v614 = v30;
  id v858 = v614;
  id v875 = obj;
  unint64_t v876 = v706;
  float v878 = v58;
  float v879 = v55;
  float v880 = v56;
  float v881 = v59;
  float v882 = v60;
  float v883 = v61;
  id v616 = v668;
  id v859 = v616;
  uint64_t v877 = v664;
  id v669 = v722;
  id v860 = v669;
  id v667 = v730;
  id v861 = v667;
  id v665 = v711;
  id v862 = v665;
  v869 = &v902;
  v870 = &v898;
  v871 = &v894;
  dispatch_apply(v65, 0, block);
  int v71 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v649 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:obj];
  v648 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:obj];
  v645 = objc_opt_new();
  v644 = objc_opt_new();
  if (v733)
  {
    uint64_t v72 = 0;
    char v73 = (void *)*MEMORY[0x1E4F1D260];
    do
    {
      id v74 = [v669 objectAtIndexedSubscript:v72];
      BOOL v75 = v74 == v73;

      if (!v75)
      {
        int v76 = [v669 objectAtIndexedSubscript:v72];
        [v649 addObjectsFromArray:v76];
      }
      id v77 = [v667 objectAtIndexedSubscript:v72];
      BOOL v78 = v77 == v73;

      if (!v78)
      {
        uint64_t v79 = [v667 objectAtIndexedSubscript:v72];
        [v648 addObjectsFromArray:v79];
      }
      uint64_t v80 = [v665 objectAtIndexedSubscript:v72];
      BOOL v81 = v80 == v73;

      if (!v81)
      {
        long long v82 = [v665 objectAtIndexedSubscript:v72];
        long long v843 = 0u;
        long long v842 = 0u;
        long long v841 = 0u;
        long long v840 = 0u;
        long long v83 = [v82 keyEnumerator];
        uint64_t v84 = [v83 countByEnumeratingWithState:&v840 objects:v951 count:16];
        if (v84)
        {
          uint64_t v85 = *(void *)v841;
          do
          {
            for (uint64_t j = 0; j != v84; ++j)
            {
              if (*(void *)v841 != v85) {
                objc_enumerationMutation(v83);
              }
              uint64_t v87 = *(void *)(*((void *)&v840 + 1) + 8 * j);
              id v88 = [v82 objectForKey:v87];
              [v71 setObject:v88 forKey:v87];
            }
            uint64_t v84 = [v83 countByEnumeratingWithState:&v840 objects:v951 count:16];
          }
          while (v84);
        }
      }
      id v89 = [v657 objectAtIndexedSubscript:v72];
      BOOL v90 = v89 == v73;

      if (v90) {
        [v645 addIndex:v72];
      }
      BOOL v91 = [v659 objectAtIndexedSubscript:v72];
      BOOL v92 = v91 == v73;

      if (v92) {
        [v644 addIndex:v72];
      }
      ++v72;
    }
    while (v72 != v733);
  }
  [v665 removeAllObjects];
  [v669 removeAllObjects];
  [v667 removeAllObjects];
  [v657 removeObjectsAtIndexes:v645];
  [v659 removeObjectsAtIndexes:v644];
  int v612 = *(unsigned __int8 *)(v670 + 8);
  if (*(unsigned char *)(v670 + 8)) {
    goto LABEL_600;
  }
  v741 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v71, "count"));
  long long v839 = 0u;
  long long v838 = 0u;
  long long v837 = 0u;
  long long v836 = 0u;
  float v93 = [v71 keyEnumerator];
  uint64_t v94 = [v93 countByEnumeratingWithState:&v836 objects:v950 count:16];
  if (v94)
  {
    uint64_t v95 = *(void *)v837;
    do
    {
      for (uint64_t k = 0; k != v94; ++k)
      {
        if (*(void *)v837 != v95) {
          objc_enumerationMutation(v93);
        }
        uint64_t v97 = [v71 objectForKey:*(void *)(*((void *)&v836 + 1) + 8 * k)];
        double v98 = [v97 maxScore];
        [v741 addObject:v98];
      }
      uint64_t v94 = [v93 countByEnumeratingWithState:&v836 objects:v950 count:16];
    }
    while (v94);
  }

  [v741 sortWithOptions:1 usingComparator:&__block_literal_global_668];
  long long v835 = 0u;
  long long v834 = 0u;
  long long v833 = 0u;
  long long v832 = 0u;
  float v99 = [v71 keyEnumerator];
  uint64_t v100 = [v99 countByEnumeratingWithState:&v832 objects:v949 count:16];
  if (v100)
  {
    uint64_t v101 = *(void *)v833;
    do
    {
      for (uint64_t m = 0; m != v100; ++m)
      {
        if (*(void *)v833 != v101) {
          objc_enumerationMutation(v99);
        }
        double v103 = [v71 objectForKey:*(void *)(*((void *)&v832 + 1) + 8 * m)];
        char v104 = [v103 maxScore];
        unint64_t v105 = [v741 indexOfObject:v104];

        unint64_t v106 = [v741 count];
        double v107 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v105 + 1];
        [v103 setMaxScoreAbsRank:v107];

        double v108 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)v105 / (double)v106];
        [v103 setMaxScoreRelRank:v108];
      }
      uint64_t v100 = [v99 countByEnumeratingWithState:&v832 objects:v949 count:16];
    }
    while (v100);
  }

  uint64_t v828 = 0;
  v829 = &v828;
  uint64_t v830 = 0x2020000000;
  char v831 = 0;
  long long v824 = 0u;
  long long v825 = 0u;
  long long v826 = 0u;
  long long v827 = 0u;
  id v109 = v659;
  uint64_t v110 = [v109 countByEnumeratingWithState:&v824 objects:v948 count:16];
  if (v110)
  {
    uint64_t v111 = *(void *)v825;
    do
    {
      for (uint64_t n = 0; n != v110; ++n)
      {
        if (*(void *)v825 != v111) {
          objc_enumerationMutation(v109);
        }
        char v113 = *(void **)(*((void *)&v824 + 1) + 8 * n);
        int v114 = [v113 rankingItem];
        if (v114)
        {
          uint64_t v115 = [v113 rankingItem];
          [v115 likelihood];
          BOOL v117 = v116 > 0.1;

          if (v117) {
            *((unsigned char *)v829 + 24) = 1;
          }
        }
      }
      uint64_t v110 = [v109 countByEnumeratingWithState:&v824 objects:v948 count:16];
    }
    while (v110);
  }

  v808[0] = MEMORY[0x1E4F143A8];
  v808[1] = 3221225472;
  v808[2] = __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_3_669;
  v808[3] = &unk_1E634C550;
  id v809 = v649;
  id v810 = v71;
  id v640 = v626;
  id v811 = v640;
  char v823 = v652;
  id v712 = v648;
  id v812 = v712;
  id v118 = v702;
  id v813 = v118;
  uint64_t v814 = v670;
  id v815 = v657;
  id v637 = v109;
  id v816 = v637;
  id v731 = v628;
  id v817 = v731;
  id v737 = v625;
  id v818 = v737;
  id v119 = v627;
  id v819 = v119;
  v821 = &v828;
  id v723 = v629;
  id v820 = v723;
  v822 = &v924;
  dispatch_apply(3uLL, 0, v808);
  v636 = objc_opt_new();
  v734 = objc_opt_new();
  if (SPExperimentalScoringEnabled_onceToken != -1) {
    dispatch_once(&SPExperimentalScoringEnabled_onceToken, &__block_literal_global_529);
  }
  int v120 = SPExperimentalScoringEnabled__experimentalScoringEnabled;
  if (SPExperimentalScoringEnabled__experimentalScoringEnabled) {
    v651 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v118, "count"));
  }
  else {
    v651 = 0;
  }
  unint64_t v122 = 0;
  v653 = v119;
  while (v122 < [v712 count])
  {
    id v123 = [v712 objectAtIndexedSubscript:v122];
    float v124 = [v123 sectionBundleIdentifier];

    if (v124)
    {
      if ([v734 containsObject:v124])
      {
        [v636 addIndex:v122];
      }
      else
      {
        [v734 addObject:v124];
        if (v120) {
          [v651 addObject:v124];
        }
      }
    }

    ++v122;
  }
  [v712 removeObjectsAtIndexes:v636];
  v643 = objc_opt_new();
  v650 = objc_opt_new();
  for (iuint64_t i = 0; ii < [v118 count]; ++ii)
  {
    BOOL v126 = [v118 objectAtIndex:ii];
    if (v126)
    {
      if ([v650 containsObject:v126]) {
        [v643 addIndex:ii];
      }
      else {
        [v650 addObject:v126];
      }
      if ([v126 isEqualToString:@"com.apple.parsec.related_search"]) {
        [v643 addIndex:ii];
      }
      else {
        [v650 addObject:v126];
      }
    }
  }
  [v118 removeObjectsAtIndexes:v643];
  long long v807 = 0u;
  long long v806 = 0u;
  long long v805 = 0u;
  long long v804 = 0u;
  BOOL v127 = (void *)[v118 copy];
  uint64_t v128 = [v127 countByEnumeratingWithState:&v804 objects:v947 count:16];
  if (v128)
  {
    uint64_t v129 = *(void *)v805;
    do
    {
      for (juint64_t j = 0; jj != v128; ++jj)
      {
        if (*(void *)v805 != v129) {
          objc_enumerationMutation(v127);
        }
        uint64_t v131 = *(void *)(*((void *)&v804 + 1) + 8 * jj);
        uint64_t v132 = [v734 count];
        if (v132 != [v118 count] && (objc_msgSend(v734, "containsObject:", v131) & 1) == 0) {
          [v118 removeObject:v131];
        }
      }
      uint64_t v128 = [v127 countByEnumeratingWithState:&v804 objects:v947 count:16];
    }
    while (v128);
  }

  float v133 = objc_opt_new();
  for (kuint64_t k = 0; kk < [v712 count]; ++kk)
  {
    double v135 = [v712 objectAtIndexedSubscript:kk];
    float v136 = [v135 sectionBundleIdentifier];

    if (v136 && ([v118 containsObject:v136] & 1) == 0) {
      [v133 addIndex:kk];
    }
  }
  [v712 removeObjectsAtIndexes:v133];
  if (v120)
  {
    v631 = objc_opt_new();

    for (muint64_t m = 0; mm < [v651 count]; ++mm)
    {
      int v138 = [v651 objectAtIndexedSubscript:mm];
      if (v138 && ([v118 containsObject:v138] & 1) == 0) {
        [v631 addIndex:mm];
      }
    }
    [v651 removeObjectsAtIndexes:v631];
    if (!*((unsigned char *)v953 + 24) || v903[6] > 10000.0 && (!*((unsigned char *)v899 + 24) || v895[6] == 0.0))
    {
      id v139 = v651;

      int v140 = v139;
      goto LABEL_175;
    }
  }
  else
  {
    v631 = v133;
  }
  int v140 = v118;
LABEL_175:
  v641 = v140;
  unint64_t v646 = [v140 count];
  uint64_t v141 = [v637 count];
  v655 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v141 + v646];
  unint64_t v638 = v141;
  unint64_t v610 = v141 + v646;
  if ([v637 count])
  {
    unint64_t v142 = [v637 objectAtIndexedSubscript:0];
    char v143 = [v142 rankingItem];
    if (([v143 bundleIDType] & 0x8000) != 0)
    {
    }
    else
    {
      unint64_t v144 = [v142 rankingItem];
      int v145 = [v144 L2FeatureVector];
      [v145 originalL2Score];
      BOOL v147 = v146 != 0.0;

      if (!v147)
      {
        id v632 = 0;
LABEL_182:

        goto LABEL_183;
      }
    }
    id v632 = v142;
    goto LABEL_182;
  }
  id v632 = 0;
LABEL_183:
  if (SSEnableSpotlightFullPageRanking())
  {
    long long v803 = 0u;
    long long v802 = 0u;
    long long v801 = 0u;
    long long v800 = 0u;
    id v148 = v712;
    uint64_t v149 = [v148 countByEnumeratingWithState:&v800 objects:v946 count:16];
    if (v149)
    {
      uint64_t v150 = 0;
      uint64_t v151 = *(void *)v801;
      do
      {
        for (nuint64_t n = 0; nn != v149; ++nn)
        {
          if (*(void *)v801 != v151) {
            objc_enumerationMutation(v148);
          }
          long long v153 = *(void **)(*((void *)&v800 + 1) + 8 * nn);
          double v154 = [v153 sectionBundleIdentifier];
          BOOL v155 = v154 == 0;

          if (!v155)
          {
            int v156 = [v153 sectionBundleIdentifier];
            long long v157 = [v731 objectForKey:v156];

            if (!v157)
            {
              long long v158 = [v153 sectionBundleIdentifier];
              long long v159 = [v737 objectForKey:v158];

              if (v159)
              {
                char v160 = objc_alloc_init(SectionL3Scores);
                [(SectionL3Scores *)v160 computeScore:v159 rankingConfig:v653 hasGoodLocalResult:*((unsigned __int8 *)v829 + 24) pos:v150 + nn + 1 queryContext:v723];
                uint64_t v161 = [v153 sectionBundleIdentifier];
                [v731 setObject:v160 forKeyedSubscript:v161];
              }
            }
          }
        }
        uint64_t v149 = [v148 countByEnumeratingWithState:&v800 objects:v946 count:16];
        uint64_t v150 = (v150 + nn);
      }
      while (v149);
    }

    if ([(id)l3modelManager loaded])
    {
      v707 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:67];
      float v162 = [(id)v670 query];
      [v707 setObject:v162 forKeyedSubscript:@"query"];
      [v707 setObject:v162 forKeyedSubscript:@"prefix"];

      float v163 = [MEMORY[0x1E4F1CA20] currentLocale];
      double v164 = [v163 localeIdentifier];
      [v707 setObject:v164 forKeyedSubscript:@"locale"];

      *(float *)&double v165 = (float)v610;
      uint64_t v166 = [MEMORY[0x1E4F28ED0] numberWithFloat:v165];
      [v707 setObject:v166 forKeyedSubscript:@"section_count"];

      *(float *)&double v167 = (float)v638;
      uint64_t v168 = [MEMORY[0x1E4F28ED0] numberWithFloat:v167];
      [v707 setObject:v168 forKeyedSubscript:@"local_section_count"];

      *(float *)&double v169 = (float)v646;
      int v170 = [MEMORY[0x1E4F28ED0] numberWithFloat:v169];
      [v707 setObject:v170 forKeyedSubscript:@"server_section_count"];

      double v171 = 0.0;
      if (v632) {
        *(float *)&double v171 = 1.0;
      }
      v172 = [MEMORY[0x1E4F28ED0] numberWithFloat:v171];
      [v707 setObject:v172 forKeyedSubscript:@"local_section_is_tophit"];

      v174 = (void *)MEMORY[0x1E4F28ED0];
      if (v632) {
        BOOL v175 = 0;
      }
      else {
        BOOL v175 = [v624 count] != 0;
      }
      *(float *)&double v173 = (float)v175;
      v176 = [v174 numberWithFloat:v173];
      [v707 setObject:v176 forKeyedSubscript:@"server_section_is_tophit"];

      int v177 = [v653 iFunScores];
      v178 = [v177 localScore];

      if (v178)
      {
        float v179 = (void *)MEMORY[0x1E4F28ED0];
        BOOL v180 = [v653 iFunScores];
        v181 = [v180 localScore];
        [v181 floatValue];
        float v182 = objc_msgSend(v179, "numberWithFloat:");
        [v707 setObject:v182 forKeyedSubscript:@"local_ifun_score"];
      }
      BOOL v183 = [v653 iFunScores];
      int v184 = [v183 serverScore];

      if (v184)
      {
        int v185 = (void *)MEMORY[0x1E4F28ED0];
        v186 = [v653 iFunScores];
        v187 = [v186 serverScore];
        [v187 floatValue];
        int v188 = objc_msgSend(v185, "numberWithFloat:");
        [v707 setObject:v188 forKeyedSubscript:@"server_ifun_score"];
      }
      long long v799 = 0u;
      long long v798 = 0u;
      long long v797 = 0u;
      long long v796 = 0u;
      id v189 = v637;
      uint64_t v190 = [v189 countByEnumeratingWithState:&v796 objects:v945 count:16];
      if (v190)
      {
        uint64_t v191 = *(void *)v797;
        float v688 = 0.0;
        float v691 = 0.0;
        float v696 = 0.0;
        float v192 = 0.0;
        float v724 = 0.0;
        float v703 = -1000.0;
        float v684 = -1000.0;
        do
        {
          for (uint64_t i1 = 0; i1 != v190; ++i1)
          {
            if (*(void *)v797 != v191) {
              objc_enumerationMutation(v189);
            }
            BOOL v194 = *(void **)(*((void *)&v796 + 1) + 8 * i1);
            v195 = [v194 sectionBundleIdentifier];
            BOOL v196 = v195 == 0;

            if (!v196)
            {
              int v197 = [v194 sectionBundleIdentifier];
              v198 = [v731 objectForKey:v197];

              if (v198)
              {
                double v199 = [v198 features];
                id v200 = [v199 objectForKeyedSubscript:@"section_tophit_should_be_count"];
                [v200 floatValue];
                float v202 = v201;

                uint64_t v203 = [v198 features];
                uint64_t v204 = [v203 objectForKeyedSubscript:@"section_tophit_must_be_count"];
                [v204 floatValue];
                float v206 = v205;

                v207 = [v198 features];
                v208 = [v207 objectForKeyedSubscript:@"score_over_th_threshold_count"];
                [v208 floatValue];
                float v210 = v209;

                v211 = [v198 features];
                v212 = [v211 objectForKeyedSubscript:@"max_likelihood"];
                [v212 floatValue];
                float v214 = v213;

                if (v192 < v214) {
                  float v192 = v214;
                }
                int v215 = [v198 features];
                int v216 = [v215 objectForKeyedSubscript:@"max_topicality"];
                [v216 floatValue];
                float v218 = v217;

                float v219 = v724;
                if (v724 < v218) {
                  float v219 = v218;
                }
                float v724 = v219;
                v220 = [v198 features];
                uint64_t v221 = [v220 objectForKeyedSubscript:@"max_original_l2_score"];
                [v221 floatValue];
                float v223 = v222;

                float v224 = v703;
                if (v703 < v223) {
                  float v224 = v223;
                }
                float v703 = v224;
                v225 = [v198 features];
                int v226 = [v225 objectForKeyedSubscript:@"max_l2_score"];
                [v226 floatValue];
                float v228 = v227;

                float v688 = v688 + v202;
                float v691 = v691 + v206;
                float v696 = v696 + v210;
                float v229 = v684;
                if (v684 < v228) {
                  float v229 = v228;
                }
                float v684 = v229;
              }
            }
          }
          uint64_t v190 = [v189 countByEnumeratingWithState:&v796 objects:v945 count:16];
        }
        while (v190);
      }
      else
      {
        float v688 = 0.0;
        float v691 = 0.0;
        float v696 = 0.0;
        float v192 = 0.0;
        float v724 = 0.0;
        float v703 = -1000.0;
        float v684 = -1000.0;
      }

      long long v795 = 0u;
      long long v794 = 0u;
      long long v793 = 0u;
      long long v792 = 0u;
      id obja = v148;
      uint64_t v230 = [obja countByEnumeratingWithState:&v792 objects:v944 count:16];
      if (v230)
      {
        uint64_t v231 = *(void *)v793;
        float v232 = -1000.0;
        float v675 = 0.0;
        float v677 = 0.0;
        float v680 = 0.0;
        float v233 = 0.0;
        float v234 = 0.0;
        float v672 = -1000.0;
        do
        {
          for (uint64_t i2 = 0; i2 != v230; ++i2)
          {
            if (*(void *)v793 != v231) {
              objc_enumerationMutation(obja);
            }
            id v236 = *(void **)(*((void *)&v792 + 1) + 8 * i2);
            v237 = [v236 sectionBundleIdentifier];
            BOOL v238 = v237 == 0;

            if (!v238)
            {
              id v239 = [v236 sectionBundleIdentifier];
              uint64_t v240 = [v731 objectForKey:v239];

              if (v240)
              {
                v241 = [v240 features];
                id v242 = [v241 objectForKeyedSubscript:@"section_tophit_should_be_count"];
                [v242 floatValue];
                float v244 = v243;

                int v245 = [v240 features];
                int v246 = [v245 objectForKeyedSubscript:@"section_tophit_must_be_count"];
                [v246 floatValue];
                float v248 = v247;

                BOOL v249 = [v240 features];
                int v250 = [v249 objectForKeyedSubscript:@"score_over_th_threshold_count"];
                [v250 floatValue];
                float v252 = v251;

                id v253 = [v240 features];
                int v254 = [v253 objectForKeyedSubscript:@"max_likelihood"];
                [v254 floatValue];
                float v256 = v255;

                if (v233 < v256) {
                  float v233 = v256;
                }
                char v257 = [v240 features];
                unsigned __int8 v258 = [v257 objectForKeyedSubscript:@"max_topicality"];
                [v258 floatValue];
                float v260 = v259;

                if (v234 < v260) {
                  float v234 = v260;
                }
                int v261 = [v240 features];
                int v262 = [v261 objectForKeyedSubscript:@"max_original_l2_score"];
                [v262 floatValue];
                float v264 = v263;

                if (v232 < v264) {
                  float v232 = v264;
                }
                unsigned int v265 = [v240 features];
                BOOL v266 = [v265 objectForKeyedSubscript:@"max_l2_score"];
                [v266 floatValue];
                float v268 = v267;

                float v675 = v675 + v244;
                float v677 = v677 + v248;
                float v680 = v680 + v252;
                float v269 = v672;
                if (v672 < v268) {
                  float v269 = v268;
                }
                float v672 = v269;
              }
            }
          }
          uint64_t v230 = [obja countByEnumeratingWithState:&v792 objects:v944 count:16];
        }
        while (v230);
      }
      else
      {
        float v675 = 0.0;
        float v232 = -1000.0;
        float v677 = 0.0;
        float v680 = 0.0;
        float v233 = 0.0;
        float v234 = 0.0;
        float v672 = -1000.0;
      }

      *(float *)&double v270 = v688;
      int v271 = [MEMORY[0x1E4F28ED0] numberWithFloat:v270];
      [v707 setObject:v271 forKeyedSubscript:@"local_tophit_should_be_count"];

      *(float *)&double v272 = v675;
      uint64_t v273 = [MEMORY[0x1E4F28ED0] numberWithFloat:v272];
      [v707 setObject:v273 forKeyedSubscript:@"server_tophit_should_be_count"];

      *(float *)&double v274 = v691;
      v275 = [MEMORY[0x1E4F28ED0] numberWithFloat:v274];
      [v707 setObject:v275 forKeyedSubscript:@"local_tophit_must_be_count"];

      *(float *)&double v276 = v677;
      unint64_t v277 = [MEMORY[0x1E4F28ED0] numberWithFloat:v276];
      [v707 setObject:v277 forKeyedSubscript:@"server_tophit_must_be_count"];

      *(float *)&double v278 = v696;
      __int16 v279 = [MEMORY[0x1E4F28ED0] numberWithFloat:v278];
      [v707 setObject:v279 forKeyedSubscript:@"local_score_over_th_threshold_count"];

      *(float *)&double v280 = v680;
      BOOL v281 = [MEMORY[0x1E4F28ED0] numberWithFloat:v280];
      [v707 setObject:v281 forKeyedSubscript:@"server_score_over_th_threshold_count"];

      *(float *)&double v282 = v192;
      int v283 = [MEMORY[0x1E4F28ED0] numberWithFloat:v282];
      [v707 setObject:v283 forKeyedSubscript:@"local_max_likelihood"];

      *(float *)&double v284 = v233;
      int v285 = [MEMORY[0x1E4F28ED0] numberWithFloat:v284];
      [v707 setObject:v285 forKeyedSubscript:@"server_max_likelihood"];

      *(float *)&double v286 = v724;
      id v287 = [MEMORY[0x1E4F28ED0] numberWithFloat:v286];
      [v707 setObject:v287 forKeyedSubscript:@"local_max_topicality"];

      *(float *)&double v288 = v234;
      uint64_t v289 = [MEMORY[0x1E4F28ED0] numberWithFloat:v288];
      [v707 setObject:v289 forKeyedSubscript:@"server_max_topicality"];

      *(float *)&double v290 = v703;
      uint64_t v291 = [MEMORY[0x1E4F28ED0] numberWithFloat:v290];
      [v707 setObject:v291 forKeyedSubscript:@"local_max_original_l2_score"];

      *(float *)&double v292 = v232;
      uint64_t v293 = [MEMORY[0x1E4F28ED0] numberWithFloat:v292];
      [v707 setObject:v293 forKeyedSubscript:@"server_max_original_l2_score"];

      *(float *)&double v294 = v684;
      v295 = [MEMORY[0x1E4F28ED0] numberWithFloat:v294];
      [v707 setObject:v295 forKeyedSubscript:@"local_max_l2_score"];

      *(float *)&double v296 = v672;
      v297 = [MEMORY[0x1E4F28ED0] numberWithFloat:v296];
      [v707 setObject:v297 forKeyedSubscript:@"server_max_l2_score"];

      v298 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v610];
      id v725 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v610];
      long long v791 = 0u;
      long long v790 = 0u;
      long long v789 = 0u;
      long long v788 = 0u;
      id v704 = v189;
      uint64_t v299 = [v704 countByEnumeratingWithState:&v788 objects:v943 count:16];
      if (v299)
      {
        uint64_t v300 = *(void *)v789;
        do
        {
          for (uint64_t i3 = 0; i3 != v299; ++i3)
          {
            if (*(void *)v789 != v300) {
              objc_enumerationMutation(v704);
            }
            v302 = *(void **)(*((void *)&v788 + 1) + 8 * i3);
            id v303 = [v302 sectionBundleIdentifier];
            BOOL v304 = v303 == 0;

            if (!v304)
            {
              v305 = [v302 sectionBundleIdentifier];
              v306 = [v731 objectForKey:v305];

              if (v306)
              {
                v307 = [v306 features];
                [v307 addEntriesFromDictionary:v707];

                id v308 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v298, "count"));
                long long v309 = [v302 sectionBundleIdentifier];
                [v725 setObject:v308 forKeyedSubscript:v309];

                long long v310 = [v306 features];
                [v298 addObject:v310];
              }
            }
          }
          uint64_t v299 = [v704 countByEnumeratingWithState:&v788 objects:v943 count:16];
        }
        while (v299);
      }

      long long v787 = 0u;
      long long v786 = 0u;
      long long v785 = 0u;
      long long v784 = 0u;
      id v311 = obja;
      uint64_t v312 = [v311 countByEnumeratingWithState:&v784 objects:v942 count:16];
      if (v312)
      {
        uint64_t v313 = *(void *)v785;
        do
        {
          for (uint64_t i4 = 0; i4 != v312; ++i4)
          {
            if (*(void *)v785 != v313) {
              objc_enumerationMutation(v311);
            }
            long long v315 = *(void **)(*((void *)&v784 + 1) + 8 * i4);
            long long v316 = [v315 sectionBundleIdentifier];
            BOOL v317 = v316 == 0;

            if (!v317)
            {
              long long v318 = [v315 sectionBundleIdentifier];
              long long v319 = [v731 objectForKey:v318];

              if (v319)
              {
                long long v320 = [v319 features];
                [v320 addEntriesFromDictionary:v707];

                long long v321 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v298, "count"));
                long long v322 = [v315 sectionBundleIdentifier];
                [v725 setObject:v321 forKeyedSubscript:v322];

                long long v323 = [v319 features];
                [v298 addObject:v323];
              }
            }
          }
          uint64_t v312 = [v311 countByEnumeratingWithState:&v784 objects:v942 count:16];
        }
        while (v312);
      }

      v697 = [(id)l3modelManager predict:v298];
      if (v697 && (uint64_t v324 = [v697 count], v324 == objc_msgSend(v298, "count")))
      {
        long long v783 = 0u;
        long long v782 = 0u;
        long long v781 = 0u;
        long long v780 = 0u;
        id v692 = v704;
        uint64_t v325 = [v692 countByEnumeratingWithState:&v780 objects:v941 count:16];
        if (v325)
        {
          uint64_t v326 = *(void *)v781;
          do
          {
            for (uint64_t i5 = 0; i5 != v325; ++i5)
            {
              if (*(void *)v781 != v326) {
                objc_enumerationMutation(v692);
              }
              long long v328 = *(void **)(*((void *)&v780 + 1) + 8 * i5);
              v329 = [v328 sectionBundleIdentifier];
              BOOL v330 = v329 == 0;

              if (!v330)
              {
                v331 = [v328 sectionBundleIdentifier];
                uint64_t v332 = [v731 objectForKey:v331];

                if (v332)
                {
                  v333 = [v328 sectionBundleIdentifier];
                  v334 = [v725 objectForKeyedSubscript:v333];
                  id v335 = objc_msgSend(v697, "objectAtIndexedSubscript:", (int)objc_msgSend(v334, "intValue"));
                  [v335 floatValue];
                  objc_msgSend(v332, "setModelScore:");
                }
              }
            }
            uint64_t v325 = [v692 countByEnumeratingWithState:&v780 objects:v941 count:16];
          }
          while (v325);
        }

        long long v779 = 0u;
        long long v778 = 0u;
        long long v777 = 0u;
        long long v776 = 0u;
        uint64_t v336 = v311;
        uint64_t v337 = [v336 countByEnumeratingWithState:&v776 objects:v940 count:16];
        if (v337)
        {
          uint64_t v338 = *(void *)v777;
          do
          {
            for (uint64_t i6 = 0; i6 != v337; ++i6)
            {
              if (*(void *)v777 != v338) {
                objc_enumerationMutation(v336);
              }
              v340 = *(void **)(*((void *)&v776 + 1) + 8 * i6);
              id v341 = [v340 sectionBundleIdentifier];
              BOOL v342 = v341 == 0;

              if (!v342)
              {
                v343 = [v340 sectionBundleIdentifier];
                __int16 v344 = [v731 objectForKey:v343];

                if (v344)
                {
                  v345 = [v340 sectionBundleIdentifier];
                  __int16 v346 = [v725 objectForKeyedSubscript:v345];
                  double v347 = objc_msgSend(v697, "objectAtIndexedSubscript:", (int)objc_msgSend(v346, "intValue"));
                  [v347 floatValue];
                  objc_msgSend(v344, "setModelScore:");
                }
              }
            }
            uint64_t v337 = [v336 countByEnumeratingWithState:&v776 objects:v940 count:16];
          }
          while (v337);
        }
      }
      else
      {
        uint64_t v336 = SSGeneralLog();
        if (os_log_type_enabled(v336, OS_LOG_TYPE_ERROR)) {
          -[SSRankingManager rankSectionsUsingBundleIDToSectionMapping:withRanker:preferredBundleIds:isScopedSearch:queryId:isCJK:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:isPeopleSearch:queryContext:](v336);
        }
      }

      id v348 = +[SSRankingManager rankLocalBundlesUsingModelL3ScoreAndRules:v704 sectionMapping:v737 l3RankingScores:v731];
    }
  }
  id v726 = (id)objc_opt_new();
  long long v775 = 0u;
  long long v774 = 0u;
  long long v773 = 0u;
  long long v772 = 0u;
  id v349 = v637;
  uint64_t v350 = [v349 countByEnumeratingWithState:&v772 objects:v939 count:16];
  if (v350)
  {
    uint64_t v351 = *(void *)v773;
    do
    {
      for (uint64_t i7 = 0; i7 != v350; ++i7)
      {
        if (*(void *)v773 != v351) {
          objc_enumerationMutation(v349);
        }
        uint64_t v353 = *(void **)(*((void *)&v772 + 1) + 8 * i7);
        if (objc_opt_respondsToSelector())
        {
          v354 = [v353 sectionBundleIdentifier];
          [v726 addObject:v354];
        }
        else
        {
          v354 = SSGeneralLog();
          if (os_log_type_enabled(v354, OS_LOG_TYPE_ERROR))
          {
            v355 = objc_opt_class();
            -[SSRankingManager rankSectionsUsingBundleIDToSectionMapping:withRanker:preferredBundleIds:isScopedSearch:queryId:isCJK:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:isPeopleSearch:queryContext:](v355, v937, &v938, v354);
          }
        }
      }
      uint64_t v350 = [v349 countByEnumeratingWithState:&v772 objects:v939 count:16];
    }
    while (v350);
  }

  if (v638)
  {
    LOBYTE(v693) = 0;
    unint64_t v681 = 0;
    v685 = 0;
    unint64_t v356 = 0;
    unint64_t v698 = 0;
    while (1)
    {
      unint64_t v357 = [v712 count];
      unint64_t v358 = v646;
      if (v646 >= v357) {
        unint64_t v358 = v357;
      }
      if ((unint64_t)v685 >= v358) {
        goto LABEL_439;
      }
      v708 = [v349 objectAtIndexedSubscript:v698];
      id v705 = [v712 objectAtIndexedSubscript:v685];
      v359 = [v708 rankingItem];
      v689 = [v359 L2FeatureVector];

      float v771 = 0.0;
      [v689 originalL2Score];
      float v771 = v360;
      float v770 = 0.0;
      [v705 l2score];
      float v770 = v361;
      v362 = [v708 rankingItem];
      v363 = [v362 sectionBundleIdentifier];
      v364 = [v705 sectionBundleIdentifier];
      LOWORD(v603) = 257;
      +[SectionL3Scores getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:](SectionL3Scores, "getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:", v731, v737, v363, v364, &v771, &v770, v603);

      v365 = [v708 rankingItem];
      v366 = [v365 sectionBundleIdentifier];
      v367 = [v705 sectionBundleIdentifier];
      +[SectionL3Scores getComparableModelL3Score:v731 bundleId1:v366 bundleId2:v367 score1:&v771 score2:&v770];

      if (*((unsigned char *)v915 + 24) && *((unsigned char *)v911 + 24))
      {
        v369 = [v708 rankingItem];
        v370 = [v369 L2FeatureVector];
        [v370 scoreForFeature:31];
        float v372 = v371;

        BOOL v373 = v372 == 1.0;
        v374 = [v705 rankingItem];
        v375 = [v374 sectionBundleIdentifier];
        int v376 = [v375 isEqualToString:@"com.apple.parsec.weather"];
      }
      else
      {
        BOOL v373 = 0;
        int v376 = 0;
      }
      if (v693)
      {
        int v693 = 1;
      }
      else
      {
        if (!*((unsigned char *)v891 + 24) || !*((unsigned char *)v907 + 24)) {
          goto LABEL_329;
        }
        v377 = [v708 rankingItem];
        if ([v377 photosMatch])
        {
          char v378 = 1;
        }
        else
        {
          v379 = [v708 rankingItem];
          char v378 = [v379 photosExactMatch];
        }
        v380 = [v705 rankingItem];
        v381 = [v380 sectionBundleIdentifier];
        int v693 = [v381 isEqualToString:@"com.apple.parsec.web_images"];

        if ((v378 & 1) == 0)
        {
          v382 = [v708 sectionBundleIdentifier];
          int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v382);

          if (!IsSyndicatedPhotos) {
            goto LABEL_329;
          }
          v384 = [v708 rankingItem];
          v385 = [v384 L2FeatureVector];
          [v385 scoreForFeature:1928];
          BOOL v387 = v386 == 1.0;

          if (!v387) {
LABEL_329:
          }
            int v693 = 0;
        }
      }
      *(float *)&double v368 = v770;
      if (v770 > v771) {
        int v388 = 1;
      }
      else {
        int v388 = v376 & v373;
      }
      v389 = objc_msgSend(v708, "rankingItem", v368);
      int v390 = v388 & (v693 ^ 1);
      if (([v389 bundleIDType] & 4) != 0)
      {
        v391 = [v708 rankingItem];
        int v392 = [v391 isPerfectMatch];

        v390 &= ~v392;
      }
      else
      {
      }
      v393 = [v708 rankingItem];
      v394 = [v393 L2FeatureVector];
      if (v394)
      {
        v395 = [v708 rankingItem];
        v396 = [v395 L2FeatureVector];
        [v396 scoreForFeature:3234];
        BOOL v398 = v397 == 0.0;

        v390 &= v398;
      }
      else
      {
      }
      v399 = [v708 rankingItem];
      if ([v399 shouldHideUnderShowMore])
      {
        v400 = [v705 rankingItem];
        int v401 = [v400 shouldHideUnderShowMore];

        if (!v401)
        {
          int v390 = 1;
          goto LABEL_346;
        }
      }
      else
      {
      }
      v402 = [v708 rankingItem];
      if ([v402 shouldHideUnderShowMore])
      {
      }
      else
      {
        v403 = [v705 rankingItem];
        char v404 = [v403 shouldHideUnderShowMore];

        if (v404) {
          goto LABEL_383;
        }
      }
LABEL_346:
      if (v390 && v632)
      {
        v405 = [v632 rankingItem];
        char v406 = [v405 bundleIDType];

        if ((v406 & 4) != 0)
        {
          v678 = [v708 rankingItem];
          char v407 = [v678 bundleIDType];
          if ((v407 & 8) != 0
            || ([v708 rankingItem],
                id v637 = (id)objc_claimAutoreleasedReturnValue(),
                ([v637 bundleIDType] & 0x20) != 0))
          {
            int objb = 0;
            int v673 = 0;
            int v409 = 0;
            int v410 = 0;
            int v411 = 0;
            int v412 = 0;
          }
          else
          {
            v609 = [v708 rankingItem];
            if (([v609 bundleIDType] & 0x100000) != 0)
            {
              int v673 = 0;
              int v409 = 0;
              int v410 = 0;
              int v411 = 0;
              int v412 = 0;
              int objb = 1;
            }
            else
            {
              v608 = [v708 rankingItem];
              if (([v608 bundleIDType] & 2) != 0)
              {
                int v409 = 0;
                int v410 = 0;
                int v411 = 0;
                int v412 = 0;
                int objb = 1;
                int v673 = 1;
              }
              else
              {
                v607 = [v708 rankingItem];
                if (([v607 bundleIDType] & 0x40) != 0)
                {
                  int v410 = 0;
                  int v411 = 0;
                  int v412 = 0;
                  int objb = 1;
                  int v673 = 1;
                  int v409 = 1;
                }
                else
                {
                  v606 = [v708 rankingItem];
                  if (([v606 bundleIDType] & 0x40000) != 0)
                  {
                    int v411 = 0;
                    int v412 = 0;
                    int objb = 1;
                    int v673 = 1;
                    int v409 = 1;
                    int v410 = 1;
                  }
                  else
                  {
                    v605 = [v708 rankingItem];
                    if (([v605 bundleIDType] & 0x2000000) != 0)
                    {
                      int v412 = 0;
                      int objb = 1;
                      int v673 = 1;
                      int v409 = 1;
                      int v410 = 1;
                      int v411 = 1;
                    }
                    else
                    {
                      v604 = [v708 rankingItem];
                      if (([v604 bundleIDType] & 0x4000000) == 0)
                      {

                        int v390 = 1;
                        v408 = v637;
                        goto LABEL_416;
                      }
                      int objb = 1;
                      int v673 = 1;
                      int v409 = 1;
                      int v410 = 1;
                      int v411 = 1;
                      int v412 = 1;
                    }
                  }
                }
              }
            }
          }
          v413 = [v708 rankingItem];
          char v414 = [v413 shouldHideUnderShowMore];

          if (v412)
          {

            if ((v411 & 1) == 0) {
              goto LABEL_361;
            }
LABEL_368:

            if ((v410 & 1) == 0) {
              goto LABEL_369;
            }
LABEL_362:

            if ((v409 & 1) == 0) {
              goto LABEL_363;
            }
LABEL_370:

            if ((v673 & 1) == 0) {
              goto LABEL_371;
            }
LABEL_364:

            if ((objb & 1) == 0) {
              goto LABEL_365;
            }
LABEL_372:

            if ((v407 & 8) != 0) {
              goto LABEL_373;
            }
LABEL_366:
          }
          else
          {
            if (v411) {
              goto LABEL_368;
            }
LABEL_361:
            if (v410) {
              goto LABEL_362;
            }
LABEL_369:
            if (v409) {
              goto LABEL_370;
            }
LABEL_363:
            if (v673) {
              goto LABEL_364;
            }
LABEL_371:
            if (objb) {
              goto LABEL_372;
            }
LABEL_365:
            if ((v407 & 8) == 0) {
              goto LABEL_366;
            }
LABEL_373:
          }
          if ((v414 & 1) == 0)
          {
            v415 = [v705 sectionBundleIdentifier];

            if (v415)
            {
              v416 = [v708 sectionBundleIdentifier];
              v417 = [v708 rankingItem];
              if (([v417 bundleIDType] & 0x2000000) != 0)
              {
              }
              else
              {
                v418 = [v708 rankingItem];
                BOOL v419 = ([v418 bundleIDType] & 0x40000) == 0;

                if (v419)
                {
                  v420 = v416;
LABEL_390:
                  v678 = v420;
                  objc_msgSend(v653, "engagementProbabilityForCategory:");
                  float v425 = v424;
                  v426 = [v705 sectionBundleIdentifier];
                  [v653 engagementProbabilityForCategory:v426];
                  float v428 = v427;

                  int v390 = 0;
                  if (v428 <= 0.00001 || v425 >= v428) {
                    goto LABEL_417;
                  }
                  v429 = objc_msgSend(v632, "rankingItem", v428);
                  v408 = SSCompactRankingAttrsGetValue((int8x8_t *)[v429 attributes], 7uLL);

                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    goto LABEL_415;
                  }
                  v430 = [v708 rankingItem];
                  if (([v430 bundleIDType] & 8) == 0)
                  {
                    v431 = [v708 rankingItem];
                    if (([v431 bundleIDType] & 0x100000) == 0)
                    {
                      v432 = [v708 rankingItem];
                      BOOL v433 = ([v432 bundleIDType] & 0x4000000) == 0;

                      if (v433)
                      {
                        v434 = [v708 rankingItem];
                        if (([v434 bundleIDType] & 0x40000) != 0)
                        {
                        }
                        else
                        {
                          v435 = [v708 rankingItem];
                          BOOL v436 = ([v435 bundleIDType] & 0x2000000) == 0;

                          if (v436)
                          {
                            v437 = [v708 rankingItem];
                            if (([v437 bundleIDType] & 0x20) != 0)
                            {
                            }
                            else
                            {
                              v438 = [v708 rankingItem];
                              BOOL v439 = ([v438 bundleIDType] & 0x40) == 0;

                              if (v439)
                              {
                                v440 = [v708 rankingItem];
                                char v441 = [v440 bundleIDType];

                                if ((v441 & 2) == 0) {
                                  goto LABEL_415;
                                }
                                v442 = [v708 rankingItem];
                                v443 = SSCompactRankingAttrsGetValue((int8x8_t *)[v442 attributes], 7uLL);

                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
LABEL_434:
                                  char v451 = [v443 containsString:v408];

                                  if (v451)
                                  {
LABEL_428:
                                    int v390 = 0;
LABEL_416:

LABEL_417:
                                    goto LABEL_380;
                                  }
LABEL_415:
                                  int v390 = 1;
                                  goto LABEL_416;
                                }
LABEL_436:

                                goto LABEL_415;
                              }
                            }
                            v450 = [v708 rankingItem];
                            v443 = SSCompactRankingAttrsGetValue((int8x8_t *)[v450 attributes], 0xCuLL);

                            objc_opt_class();
                            if (objc_opt_isKindOfClass()) {
                              goto LABEL_434;
                            }
                            goto LABEL_436;
                          }
                        }
                        v448 = [v708 rankingItem];
                        v445 = SSCompactRankingAttrsGetValue((int8x8_t *)[v448 attributes], 0x80uLL);

                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          for (unint64_t i8 = 0; i8 < [v445 count]; ++i8)
                          {
                            v447 = [v445 objectAtIndex:i8];
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0
                              && ([v408 isEqualToString:v447] & 1) != 0)
                            {
                              goto LABEL_427;
                            }
                          }
                        }
LABEL_414:

                        goto LABEL_415;
                      }
LABEL_408:
                      v444 = [v708 rankingItem];
                      v445 = SSCompactRankingAttrsGetValue((int8x8_t *)[v444 attributes], 5uLL);

                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        for (unint64_t i9 = 0; i9 < [v445 count]; ++i9)
                        {
                          v447 = [v445 objectAtIndex:i9];
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0
                            && ([v408 isEqualToString:v447] & 1) != 0)
                          {
LABEL_427:

                            goto LABEL_428;
                          }
                        }
                      }
                      goto LABEL_414;
                    }
                  }
                  goto LABEL_408;
                }
              }
              v423 = @"com.apple.mobileslideshow";

              v420 = v423;
              goto LABEL_390;
            }
          }
        }
        int v390 = 1;
      }
LABEL_380:
      if (!v390 || v356 >= v646)
      {
LABEL_383:
        if (v681 < [v726 count])
        {
          v422 = objc_msgSend(v726, "objectAtIndexedSubscript:");
          [v655 addObject:v422];

          ++v681;
        }
        ++v698;
        goto LABEL_386;
      }
      v421 = [v641 objectAtIndexedSubscript:v356];
      [v655 addObject:v421];

      ++v356;
      ++v685;
LABEL_386:

      if (v698 >= v638) {
        goto LABEL_439;
      }
    }
  }
  unint64_t v356 = 0;
  unint64_t v681 = 0;
LABEL_439:
  if (v356 < v646)
  {
    do
    {
      v452 = [v641 objectAtIndexedSubscript:v356];
      [v655 addObject:v452];

      ++v356;
    }
    while (v646 != v356);
  }
  for (unint64_t i10 = v681; i10 < [v726 count]; ++i10)
  {
    v454 = [v726 objectAtIndexedSubscript:i10];
    [v655 addObject:v454];
  }
  long long v769 = 0u;
  long long v767 = 0u;
  long long v768 = 0u;
  long long v766 = 0u;
  v455 = [v655 objectEnumerator];
  uint64_t v456 = [v455 countByEnumeratingWithState:&v766 objects:v936 count:16];
  if (v456)
  {
    uint64_t v457 = *(void *)v767;
    do
    {
      for (uint64_t i11 = 0; i11 != v456; ++i11)
      {
        if (*(void *)v767 != v457) {
          objc_enumerationMutation(v455);
        }
        v459 = [v737 objectForKeyedSubscript:*(void *)(*((void *)&v766 + 1) + 8 * i11)];
        if (v459) {
          [v735 addObject:v459];
        }
        if ([v459 domain] != 2 && (v716 & 1) == 0)
        {
          v460 = [v459 bundleIdentifier];
          if (([v460 isEqualToString:@"com.apple.application"] & v718) == 1)
          {
          }
          else
          {
            v461 = [v459 bundleIdentifier];
            char v462 = SSSectionIsSyndicatedPhotos(v461);

            if ((v462 & 1) == 0) {
              [(id)v670 refineSectionShowingVisibleResultsWithBetterTextMatches:v459];
            }
          }
        }
      }
      uint64_t v456 = [v455 countByEnumeratingWithState:&v766 objects:v936 count:16];
    }
    while (v456);
  }

  long long v764 = 0u;
  long long v765 = 0u;
  long long v762 = 0u;
  long long v763 = 0u;
  id v702 = v641;
  uint64_t v463 = [v702 countByEnumeratingWithState:&v762 objects:v935 count:16];
  if (v463)
  {
    BOOL v464 = 1;
    uint64_t v465 = *(void *)v763;
    do
    {
      uint64_t v466 = 0;
      do
      {
        if (*(void *)v763 != v465) {
          objc_enumerationMutation(v702);
        }
        v467 = [v737 objectForKey:*(void *)(*((void *)&v762 + 1) + 8 * v466)];
        v468 = v467;
        if (v467)
        {
          v469 = [v467 results];
          v470 = [v469 firstObject];

          if (v464)
          {
            if ([v470 placement] == 3 && objc_msgSend(v470, "topHit") == 2)
            {
              v719 = [v735 firstObject];
              v471 = [v719 results];
              v713 = [v471 firstObject];

              int v472 = [v719 domain];
              BOOL v464 = v472 == 2;
              if (v472 == 2)
              {
                v473 = [v713 sectionBundleIdentifier];
                v474 = [v470 sectionBundleIdentifier];
                [v473 isEqualToString:v474];

                goto LABEL_487;
              }
              if (SPRankingTopHitMustBeOverrideMinScore_onceToken != -1) {
                dispatch_once(&SPRankingTopHitMustBeOverrideMinScore_onceToken, &__block_literal_global_534);
              }
              float v475 = *(float *)&SPRankingTopHitMustBeOverrideMinScore__topHitMustBeOverrideMinScore;
              v476 = [v713 rankingItem];
              if (([v476 bundleIDType] & 0x100) != 0)
              {
                v480 = [v476 L2FeatureVector];
                [v480 scoreForFeature:1];
                float v482 = v481;

                v483 = [v476 L2FeatureVector];
                [v483 scoreForFeature:41];
                float v485 = v484;

                unint64_t v486 = [v640 queryTermLength];
                if (v486 > +[PRSRankingItemRanker spellCorrectedAppMinQueryLen]&& v482 == 1.0&& v485 == 0.0)
                {
                  if (SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore_onceToken != -1) {
                    dispatch_once(&SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore_onceToken, &__block_literal_global_544);
                  }
                  v479 = &SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore__topHitMustBeOverrideMinSpellCorrectedAppScore;
LABEL_485:
                  float v475 = *(float *)v479;
                }
              }
              else
              {
                v477 = [v470 sectionBundleIdentifier];
                int v478 = [v477 isEqualToString:@"com.apple.DocumentsApp"];

                if (v478)
                {
                  if (SPRankingTopHitMustBeOverrideMinFileScore_onceToken != -1) {
                    dispatch_once(&SPRankingTopHitMustBeOverrideMinFileScore_onceToken, &__block_literal_global_539);
                  }
                  v479 = &SPRankingTopHitMustBeOverrideMinFileScore__topHitMustBeOverrideMinFileScore;
                  goto LABEL_485;
                }
              }
              v487 = [v476 L2FeatureVector];
              [v487 originalL2Score];
              float v489 = v488;

              [v735 removeObject:v468];
              [v735 insertObject:v468 atIndex:v489 > v475];
LABEL_487:
            }
            else
            {
              BOOL v464 = 1;
            }
          }
          else
          {
            BOOL v464 = 0;
          }
          if ([v470 placement] == 2)
          {
            [v735 removeObject:v468];
            [v735 addObject:v468];
          }
        }
        ++v466;
      }
      while (v463 != v466);
      uint64_t v463 = [v702 countByEnumeratingWithState:&v762 objects:v935 count:16];
    }
    while (v463);
  }

  long long v760 = 0u;
  long long v761 = 0u;
  long long v758 = 0u;
  long long v759 = 0u;
  id v686 = v726;
  uint64_t v490 = [v686 countByEnumeratingWithState:&v758 objects:v934 count:16];
  if (!v490)
  {

    id v682 = 0;
    id v642 = 0;
    id v647 = 0;
    id v611 = 0;
    v491 = 0;
    goto LABEL_588;
  }
  id v682 = 0;
  id v642 = 0;
  id v647 = 0;
  id v611 = 0;
  v491 = 0;
  uint64_t v639 = 0;
  id v694 = *(id *)v759;
  id objc = (id)*MEMORY[0x1E4F22AA8];
  do
  {
    uint64_t v720 = 0;
    uint64_t v699 = v490;
    uint64_t v714 = v639;
    v639 += v490;
    do
    {
      if (*(id *)v759 != v694) {
        objc_enumerationMutation(v686);
      }
      v492 = *(void **)(*((void *)&v758 + 1) + 8 * v720);
      v493 = [v737 objectForKey:v492];
      v494 = v493;
      if (v493)
      {
        v495 = [v493 results];
        id v727 = [v495 firstObject];

        v709 = [v727 rankingItem];
        if ([v727 placement] == 1
          || v709 && [v709 topHitReason] == 16)
        {
          [v735 removeObject:v494];
          [v735 insertObject:v494 atIndex:0];
        }
        else if ([v727 placement] == 2)
        {
          [v727 setPlacement:0];
          [v735 removeObject:v494];
          [v735 addObject:v494];
        }
        if (a11)
        {
          if ([v492 isEqualToString:@"com.apple.people.findMy"])
          {
            v496 = v682;
            id v682 = v494;
            goto LABEL_537;
          }
          if ([v492 isEqualToString:@"com.apple.people.screenTimeRequest"])
          {
LABEL_524:
            v514 = [v727 valueForAttribute:objc withType:objc_opt_class()];
            int v515 = [v514 unsignedIntValue];

            if (v515 == 1)
            {
              v496 = v647;
              id v647 = v494;
              goto LABEL_537;
            }
LABEL_538:
            if ((v716 & 1) == 0 && [v492 isEqualToString:@"com.apple.shortcuts"])
            {
              v525 = [v494 resultSet];
              long long v756 = 0u;
              long long v757 = 0u;
              long long v754 = 0u;
              long long v755 = 0u;
              id v526 = v525;
              uint64_t v527 = [v526 countByEnumeratingWithState:&v754 objects:v933 count:16];
              if (v527)
              {
                uint64_t v528 = *(void *)v755;
                do
                {
                  uint64_t v529 = 0;
                  do
                  {
                    if (*(void *)v755 != v528) {
                      objc_enumerationMutation(v526);
                    }
                    v530 = [*(id *)(*((void *)&v754 + 1) + 8 * v529) rankingItem];
                    v531 = [v530 L2FeatureVector];
                    [v531 scoreForFeature:130];
                    float v533 = v532;

                    v534 = [v530 L2FeatureVector];
                    [v534 scoreForFeature:77];
                    float v536 = v535;

                    v537 = [v530 L2FeatureVector];
                    [v537 scoreForFeature:165];
                    float v539 = v538;

                    v540 = [v530 L2FeatureVector];
                    [v540 scoreForFeature:165];
                    float v542 = v541;

                    if ((v539 != 0.0 || v536 <= 0.75)
                      && (v533 > 0.33 ? (BOOL v543 = v536 <= 1.0) : (BOOL v543 = 1),
                          !v543 ? (BOOL v544 = v542 == 1.0) : (BOOL v544 = 0),
                          !v544 ? (BOOL v545 = v533 < 0.5) : (BOOL v545 = 0),
                          v545))
                    {
                      v549 = objc_msgSend(v530, "L2FeatureVector", v533);
                      [v549 scoreForFeature:154];
                      float v551 = v550;

                      v552 = [v530 L2FeatureVector];
                      [v552 scoreForFeature:89];
                      float v554 = v553;

                      v555 = [v530 L2FeatureVector];
                      [v555 scoreForFeature:189];
                      float v557 = v556;

                      v558 = [v530 L2FeatureVector];
                      [v558 scoreForFeature:189];
                      float v560 = v559;

                      if (v557 == 0.0 && v554 > 0.75
                        || (v551 > 0.33 ? (BOOL v562 = v554 <= 1.0) : (BOOL v562 = 1),
                            !v562 ? (BOOL v563 = v560 == 1.0) : (BOOL v563 = 0),
                            v563 || v551 >= 0.5))
                      {
                        id v561 = v494;

                        [v530 setShouldHideUnderShowMore:0];
                        [v530 setShouldHideUnderShowMoreIfNotTophit:0];
                        v491 = v561;
                      }
                    }
                    else
                    {
                      id v546 = v494;

                      v547 = SSCompactRankingAttrsGetValue((int8x8_t *)[v530 attributes], 0xA5uLL);
                      v548 = v547;
                      if (!v547 || [v547 integerValue] != 1) {
                        [v530 setTopHitReason:19];
                      }

                      v491 = v546;
                    }

                    ++v529;
                  }
                  while (v527 != v529);
                  uint64_t v564 = [v526 countByEnumeratingWithState:&v754 objects:v933 count:16];
                  uint64_t v527 = v564;
                }
                while (v564);
              }
            }
            goto LABEL_578;
          }
          if (![v492 isEqualToString:@"com.apple.people.askToBuyRequest"]) {
            goto LABEL_538;
          }
LABEL_527:
          v516 = [v727 valueForAttribute:objc withType:objc_opt_class()];
          int v517 = [v516 unsignedIntValue];

          if (v517 != 1) {
            goto LABEL_538;
          }
          v496 = v642;
          id v642 = v494;
LABEL_537:

          goto LABEL_538;
        }
        if ([v492 isEqualToString:@"com.apple.people.findMy"]
          && [v494 resultsCount] == 1)
        {
          v496 = [v494 resultSet];
          v497 = [v496 firstObject];
          v498 = [v497 rankingItem];
          v499 = [v498 L2FeatureVector];
          if (!v499) {
            goto LABEL_513;
          }
          v500 = [v497 rankingItem];
          v501 = [v500 L2FeatureVector];
          [v501 scoreForFeature:137];
          float v503 = v502;

          if (v503 != 2147500000.0)
          {
            v498 = v682;
            id v682 = v494;
LABEL_513:
          }
          goto LABEL_537;
        }
        if ([v492 isEqualToString:@"com.apple.people.askToBuyRequest"])
        {
          v496 = [v727 rankingItem];
          v504 = [v496 L2FeatureVector];
          if (!v504) {
            goto LABEL_537;
          }
          v505 = [v727 rankingItem];
          v506 = [v505 L2FeatureVector];
          [v506 scoreForFeature:137];
          float v508 = v507;

          if (v508 == 2147500000.0) {
            goto LABEL_538;
          }
          goto LABEL_527;
        }
        if ([v492 isEqualToString:@"com.apple.people.screenTimeRequest"])
        {
          v496 = [v727 rankingItem];
          v509 = [v496 L2FeatureVector];
          if (!v509) {
            goto LABEL_537;
          }
          v510 = [v727 rankingItem];
          v511 = [v510 L2FeatureVector];
          [v511 scoreForFeature:137];
          float v513 = v512;

          if (v513 != 2147500000.0) {
            goto LABEL_524;
          }
          goto LABEL_538;
        }
        if (![v492 isEqualToString:@"com.apple.MobileAddressBook"]
          || [v494 resultsCount] != 1
          || v714)
        {
          goto LABEL_538;
        }
        v496 = [v494 resultSet];
        v518 = [v496 firstObject];
        v519 = [v518 rankingItem];
        v520 = [v519 L2FeatureVector];
        if (v520)
        {
          v521 = [v518 rankingItem];
          v522 = [v521 L2FeatureVector];
          [v522 scoreForFeature:131];
          float v524 = v523;

          if (v524 != 2147500000.0)
          {
            v519 = v611;
            id v611 = v494;
            goto LABEL_535;
          }
        }
        else
        {
LABEL_535:
        }
        goto LABEL_537;
      }
LABEL_578:

      ++v714;
      ++v720;
    }
    while (v720 != v699);
    uint64_t v490 = [v686 countByEnumeratingWithState:&v758 objects:v934 count:16];
  }
  while (v490);

  if (a11)
  {
    v565 = v653;
    if (v642)
    {
      [v735 removeObject:v642];
      [v735 insertObject:v642 atIndex:0];
    }
    if (v647)
    {
      [v735 removeObject:v647];
      [v735 insertObject:v647 atIndex:0];
    }
    if (v682)
    {
      objc_msgSend(v735, "removeObject:");
      uint64_t v566 = 0;
      goto LABEL_615;
    }
LABEL_616:
    id v682 = 0;
  }
  else
  {
    v565 = v653;
    if (v611)
    {
      if (v642)
      {
        [v735 removeObject:v642];
        [v735 insertObject:v642 atIndex:1];
      }
      if (v647)
      {
        [v735 removeObject:v647];
        [v735 insertObject:v647 atIndex:1];
      }
      if (!v682) {
        goto LABEL_616;
      }
      objc_msgSend(v735, "removeObject:");
      uint64_t v566 = 1;
LABEL_615:
      [v735 insertObject:v682 atIndex:v566];
    }
    else
    {
      id v611 = 0;
    }
  }
  if ((v716 & 1) == 0 && v491)
  {
    [v565 maxEngagementProbability];
    float v581 = v580;
    [v565 engagementProbabilityForCategory:@"com.apple.other:search_preferences"];
    float v583 = v582;
    long long v752 = 0u;
    long long v753 = 0u;
    long long v750 = 0u;
    long long v751 = 0u;
    id v729 = v735;
    uint64_t v584 = [v729 countByEnumeratingWithState:&v750 objects:v932 count:16];
    if (v584)
    {
      unint64_t v739 = 0;
      uint64_t v717 = *(void *)v751;
      while (2)
      {
        uint64_t v585 = 0;
        uint64_t v715 = v584;
        do
        {
          if (*(void *)v751 != v717) {
            objc_enumerationMutation(v729);
          }
          uint64_t v721 = v585;
          v586 = *(void **)(*((void *)&v750 + 1) + 8 * v585);
          v587 = [v586 bundleIdentifier];
          if ([v587 isEqualToString:@"com.apple.shortcuts"]) {
            goto LABEL_658;
          }
          [v565 engagementProbabilityForCategory:v587];
          if (v581 != -1.0
            && (v588 == v581
             || v581 == v583 && [v587 isEqualToString:@"com.apple.Preferences"]))
          {
LABEL_651:
            uint64_t v602 = v739 + 1;
          }
          else
          {
            if (v739
              || ([v587 isEqualToString:@"com.apple.application"] & 1) == 0
              && ([v587 isEqualToString:@"com.apple.app-clips"] & 1) == 0
              && ([v587 isEqualToString:@"com.apple.MobileAddressBook"] & 1) == 0
              && ([v587 isEqualToString:@"com.apple.mobilesafari"] & 1) == 0)
            {
              if (([v587 hasPrefix:@"com.apple.parsec."] & 1) == 0)
              {
                v710 = [v586 resultSet];
                v589 = [v710 firstObject];
                id v590 = [v589 rankingItem];
                v700 = v589;
                if ([v590 shouldHideUnderShowMore]) {
                  goto LABEL_656;
                }
                v591 = [v589 rankingItem];
                char v592 = [v591 shouldHideUnderShowMoreIfNotTophit];

                if ((v592 & 1) == 0)
                {
                  long long v748 = 0u;
                  long long v749 = 0u;
                  long long v746 = 0u;
                  long long v747 = 0u;
                  id v590 = v710;
                  uint64_t v593 = [v590 countByEnumeratingWithState:&v746 objects:v931 count:16];
                  if (v593)
                  {
                    uint64_t v594 = *(void *)v747;
                    while (2)
                    {
                      for (uint64_t i12 = 0; i12 != v593; ++i12)
                      {
                        if (*(void *)v747 != v594) {
                          objc_enumerationMutation(v590);
                        }
                        v596 = [*(id *)(*((void *)&v746 + 1) + 8 * i12) rankingItem];
                        if (([v596 shouldHideUnderShowMore] & 1) != 0
                          || ([v596 shouldHideUnderShowMoreIfNotTophit] & 1) != 0)
                        {

                          goto LABEL_656;
                        }
                        v597 = [v596 interestingDate];
                        [v640 currentTime];
                        double v599 = v598;
                        [v597 timeIntervalSinceReferenceDate];
                        BOOL v601 = v600 - v599 > -2592000.0;

                        if (v601)
                        {

                          goto LABEL_651;
                        }
                      }
                      uint64_t v593 = [v590 countByEnumeratingWithState:&v746 objects:v931 count:16];
                      if (v593) {
                        continue;
                      }
                      break;
                    }
                  }
LABEL_656:
                }
              }
LABEL_658:

              goto LABEL_660;
            }
            uint64_t v602 = 1;
          }
          unint64_t v739 = v602;

          uint64_t v585 = v721 + 1;
          v565 = v653;
        }
        while (v721 + 1 != v715);
        uint64_t v584 = [v729 countByEnumeratingWithState:&v750 objects:v932 count:16];
        if (v584) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v739 = 0;
    }
LABEL_660:

    if (v739 < [v729 count])
    {
      [v729 removeObject:v491];
      [v729 insertObject:v491 atIndex:v739];
    }
  }
LABEL_588:
  if ([v640 isNLSearch])
  {
    v738 = (void *)[v735 mutableCopy];
    v567 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v735, "count"));
    long long v744 = 0u;
    long long v745 = 0u;
    long long v742 = 0u;
    long long v743 = 0u;
    id v728 = v735;
    uint64_t v568 = [v728 countByEnumeratingWithState:&v742 objects:v930 count:16];
    if (v568)
    {
      uint64_t v569 = *(void *)v743;
      do
      {
        for (uint64_t i13 = 0; i13 != v568; ++i13)
        {
          if (*(void *)v743 != v569) {
            objc_enumerationMutation(v728);
          }
          v571 = *(void **)(*((void *)&v742 + 1) + 8 * i13);
          v572 = [v571 results];
          v573 = [v572 firstObject];

          v574 = [v573 rankingItem];
          v575 = [v574 L2FeatureVector];
          [v575 scoreForFeature:2390];
          float v577 = v576;

          if (v577 == 1.0)
          {
            [v567 addObject:v571];
            [v738 removeObject:v571];
          }
        }
        uint64_t v568 = [v728 countByEnumeratingWithState:&v742 objects:v930 count:16];
      }
      while (v568);
    }

    [v567 addObjectsFromArray:v738];
    id v735 = (id)[v567 copy];
  }
  +[SSRankingManager logL3Results:v735 l3Info:v731];

  _Block_object_dispose(&v828, 8);
LABEL_600:

  _Block_object_dispose(&v890, 8);
  _Block_object_dispose(&v894, 8);
  _Block_object_dispose(&v898, 8);
  _Block_object_dispose(&v902, 8);
  _Block_object_dispose(&v906, 8);
  _Block_object_dispose(&v910, 8);
  _Block_object_dispose(&v914, 8);
  _Block_object_dispose(&v952, 8);

  if (v612)
  {
    id v578 = 0;
  }
  else
  {
    if (isInternalDevice) {
      [*(id *)(v670 + 24) appendFormat:@"\n----------------L3 Ranking Info----------------\n%@\n----------------L3 Ranking Info End----------------\n\n\n", v925[5]];
    }
    id v578 = v735;
  }
  _Block_object_dispose(&v924, 8);

  return v578;
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke()
{
  uint64_t result = get_thread_count();
  rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__core_count = result;
  return result;
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_2()
{
  l3modelManager = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

void __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_630(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  [a2 rankingScore];
  objc_msgSend(v3, "roundedValueForScore:");
  id v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v5];
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_2_632(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

void __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_644(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = [v10 rankingItem];
  char v14 = [v13 L2FeatureVector];

  if (v14)
  {
    float v15 = [v10 rankingItem];
    *(float *)buf = (float)[v15 isAssociatedWithTophitContactsFromItems:v12];

    __int16 v50 = 3234;
    uint64_t v16 = [v10 rankingItem];
    uint64_t v17 = [v16 L2FeatureVector];
    [v17 setScores:buf forFeatures:&v50 count:1];
  }
  if (([v9 bundleIDType] & 0x104) != 0)
  {
    [v9 keywordMatchScore];
    if (v18 > 0.05)
    {
      [v9 likelihood];
      if (v19 > 0.0500000007) {
        [v9 setShouldHideUnderShowMore:0];
      }
    }
  }
  uint64_t v20 = [v9 L2FeatureVector];
  if (v20)
  {
    id v21 = (void *)v20;
    id v22 = [v9 L2FeatureVector];
    [v22 scoreForFeature:3234];
    float v24 = v23;

    if (v24 != 0.0) {
      [v9 setShouldHideUnderShowMore:0];
    }
  }
  if (([v9 bundleIDType] & 8) != 0)
  {
    [v9 freshnessScore];
    if (v25 < 2.22044605e-16) {
      [v9 setShouldHideUnderShowMore:1];
    }
  }
  if (*(unsigned char *)(a1 + 40))
  {
    id v26 = *(void **)(a1 + 32);
    if (v26)
    {
      char v27 = [v9 sectionBundleIdentifier];
      char v28 = [v26 containsObject:v27];

      if (v28)
      {
        uint64_t v29 = 0;
LABEL_20:
        [v9 setShouldHideUnderShowMore:v29];
        goto LABEL_21;
      }
    }
    if (([v9 bundleIDType] & 0x8000) == 0
      && [v9 shouldHideUnderShowMoreIfNotTophit])
    {
      uint64_t v29 = 1;
      goto LABEL_20;
    }
  }
LABEL_21:
  if (SSEnableSpotlightFullPageRanking())
  {
    if (!*(unsigned char *)(a1 + 41)
      && ([v9 bundleIDType] & 0x200000) != 0
      && ([v9 isLocalTopHitCandidate] & 1) == 0
      && ([v11 isEqualToString:@"com.apple.spotlight.tophits"] & 1) == 0)
    {
      [v9 topicalityScore];
      if (v30 < 0.7)
      {
        [v9 engagementScore];
        if (v31 <= 0.0)
        {
          double v32 = [v9 recentSimilarIntentEngagementDates];
          if ([v32 count])
          {
          }
          else
          {
            char v33 = [v9 exactMatchedLaunchString];

            if ((v33 & 1) == 0)
            {
              float v38 = SSCompactRankingAttrsGetValue((int8x8_t *)[v9 attributes], 7uLL);
              float v39 = SSCompactRankingAttrsGetValue((int8x8_t *)[v9 attributes], 0xCuLL);
              float v47 = SSGeneralLog();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                if (v38) {
                  float v48 = v38;
                }
                else {
                  float v48 = v39;
                }
                float v49 = SSRedactString(v48, 1);
                *(float *)buf = 5.7779e-34;
                float v52 = v49;
                _os_log_impl(&dword_1BDB2A000, v47, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][shouldHideUnderShowMore] shortcut: %@ due to lack of topicality/engagement", buf, 0xCu);
              }
              [v9 setShouldHideUnderShowMore:1];
              goto LABEL_53;
            }
          }
        }
      }
    }
    [v9 keywordMatchScore];
    if (v34 > 0.05
      || SSSectionIsSyndicatedPhotos(v11) && ([v9 topicalityScore], v35 > 0.0500000007)
      || [v9 matchedQUIntent])
    {
      [v9 setShouldHideUnderShowMore:0];
      goto LABEL_36;
    }
    if ((SSResultTypeIsServer([v10 type]) & 1) == 0 && (objc_msgSend(v9, "isCCCD") & 1) == 0)
    {
      [v9 topicalityScore];
      if (v36 > -2.22044605e-16)
      {
        [v9 topicalityScore];
        if (v37 < 2.22044605e-16)
        {
          float v38 = SSCompactRankingAttrsGetValue((int8x8_t *)[v9 attributes], 7uLL);
          float v39 = SSCompactRankingAttrsGetValue((int8x8_t *)[v9 attributes], 0xCuLL);
          double v40 = SSCompactRankingAttrsGetValue((int8x8_t *)[v9 attributes], 4uLL);
          float v41 = SSGeneralLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            if (v39) {
              uint64_t v42 = v39;
            }
            else {
              uint64_t v42 = v40;
            }
            if (v38) {
              uint64_t v43 = v38;
            }
            else {
              uint64_t v43 = v42;
            }
            id v44 = SSRedactString(v43, 1);
            id v45 = [v9 sectionBundleIdentifier];
            [v9 topicalityScore];
            *(float *)buf = 5.7781e-34;
            float v52 = v44;
            __int16 v53 = 2112;
            float v54 = v45;
            __int16 v55 = 2048;
            uint64_t v56 = v46;
            _os_log_impl(&dword_1BDB2A000, v41, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][shouldHideUnderShowMore] result: %@ / bundle: %@ / topicality: %.06f", buf, 0x20u);
          }
          [v9 setShouldHideUnderShowMore:1];

LABEL_53:
        }
      }
    }
  }
LABEL_36:
  if ([v9 shouldHideUnderShowMore] && (int)objc_msgSend(v10, "topHit") >= 1) {
    objc_msgSend(v10, "setTopHit:", SSSetTopHitWithReasonString(0, v10, @"Demote due to shouldHideUnderShowMore", 1));
  }
}

void __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_647(uint64_t a1, uint64_t a2)
{
  uint64_t v294 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1C1885190]();
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v4 = *(void *)(a1 + 256);
    unint64_t v5 = v4 * a2;
    unint64_t v6 = v4 * a2 + v4;
    if (v6 >= *(void *)(a1 + 264)) {
      unint64_t v6 = *(void *)(a1 + 264);
    }
    unint64_t v236 = v6;
    if (v5 < v6)
    {
      double v234 = 0.1;
      float v7 = -1.0;
      double v8 = -1.0;
      __asm { FMOV            V0.2S, #-1.0 }
      uint64_t v242 = _D0;
      __asm { FMOV            V0.4S, #-1.0 }
      long long v241 = _Q0;
      while (1)
      {
        float v15 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v5, *(void *)&v234);
        uint64_t v16 = [*(id *)(a1 + 48) objectForKey:v15];
        uint64_t v238 = v5;
        float v252 = v15;
        if ([v16 domain] == 2)
        {
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 208) + 8) + 24)
            || ![v15 isEqualToString:@"com.apple.parsec.itunes.iosSoftware"])
          {
            int v247 = 0;
          }
          else
          {
            int v247 = 1;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 208) + 8) + 24) = 1;
          }
          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 216) + 8) + 24)
            && [v15 isEqualToString:@"com.apple.parsec.weather"])
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 216) + 8) + 24) = 1;
          }
          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 224) + 8) + 24)
            && [v15 isEqualToString:@"com.apple.parsec.web_images"])
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 224) + 8) + 24) = 1;
          }
          [v16 results];
          v30 = uint64_t v29 = v15;
          double v31 = v16;
          uint64_t v32 = [v30 count];

          uint64_t v33 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v32];
          uint64_t v240 = v31;
          float v34 = [v31 results];
          BOOL v249 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v32];
          id v253 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
          [*(id *)(a1 + 56) engagementProbabilityForCategory:v29];
          float v36 = *(float *)&v35;
          if (*(float *)&v35 != v7)
          {
            double v37 = *(void **)(a1 + 96);
            float v38 = [MEMORY[0x1E4F28ED0] numberWithFloat:v35];
            uint64_t v259 = [v37 indexOfObject:v38] + 1;

            float v39 = *(void **)(a1 + 104);
            *(float *)&double v40 = v36;
            float v41 = [MEMORY[0x1E4F28ED0] numberWithFloat:v40];
            *(void *)&double v243 = [v39 indexOfObject:v41] + 1;

            uint64_t v42 = *(void **)(a1 + 112);
            *(float *)&double v43 = v36;
            id v44 = [MEMORY[0x1E4F28ED0] numberWithFloat:v43];
            uint64_t v244 = [v42 indexOfObject:v44] + 1;
          }
          int v261 = objc_opt_new();
          id v45 = objc_opt_new();
          uint64_t v46 = [*(id *)(a1 + 120) indexOfObject:v252] + 1;
          uint64_t v47 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", ((double)(unint64_t)v46 + v8) / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 120), "count"));
          float v48 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v34, "count"));
          [v45 setNumResults:v48];

          unint64_t v257 = v46;
          float v49 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v46];
          [v45 setOriginalOrderAbsRank:v49];

          float v248 = (void *)v47;
          [v45 setOriginalOrderRelRank:v47];
          *(float *)&double v50 = v36;
          float v51 = [MEMORY[0x1E4F28ED0] numberWithFloat:v50];
          [v45 setCep:v51];

          unint64_t v52 = 0x1E4F28000uLL;
          if (v36 == -1.0)
          {
            [v45 setMaxCEPAbsRank:&unk_1F1863FF0];
            [v45 setMaxCEPRelRank:&unk_1F1863FF0];
            [v45 setCepMaxRatio:&unk_1F1863FF0];
            [v45 setCepAllMaxRatio:&unk_1F1863FF0];
          }
          else
          {
            __int16 v53 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v259];
            [v45 setMaxCEPAbsRank:v53];

            float v54 = [MEMORY[0x1E4F28ED0] numberWithDouble:((double)(unint64_t)v259 + v8) / (double)*(unint64_t *)(a1 + 272)];
            [v45 setMaxCEPRelRank:v54];

            __int16 v55 = (void *)MEMORY[0x1E4F28ED0];
            [*(id *)(a1 + 128) doubleValue];
            uint64_t v57 = [v55 numberWithDouble:v36 / v56];
            [v45 setCepMaxRatio:v57];

            float v58 = (void *)MEMORY[0x1E4F28ED0];
            [*(id *)(a1 + 136) doubleValue];
            float v60 = [v58 numberWithDouble:v36 / v59];
            [v45 setCepAllMaxRatio:v60];
          }
          float v251 = (void *)v33;
          float v61 = v253;
          v237 = v45;
          [v253 setObject:v45 forKey:v252];
          long long v269 = 0u;
          long long v270 = 0u;
          long long v267 = 0u;
          long long v268 = 0u;
          id v62 = v34;
          uint64_t v63 = [v62 countByEnumeratingWithState:&v267 objects:v292 count:16];
          if (v63)
          {
            uint64_t v64 = v63;
            uint64_t v260 = *(void *)v268;
            double v65 = -1.0;
            do
            {
              for (uint64_t i = 0; i != v64; ++i)
              {
                if (*(void *)v268 != v260) {
                  objc_enumerationMutation(v62);
                }
                uint64_t v67 = *(void **)(*((void *)&v267 + 1) + 8 * i);
                [v67 rankingScore];
                objc_msgSend(*(id *)(a1 + 32), "roundedValueForScore:");
                double v69 = v68;
                uint64_t v70 = objc_msgSend(*(id *)(v52 + 3792), "numberWithDouble:");
                [v261 addObject:v70];

                if (v69 > v65) {
                  double v65 = v69;
                }
                int v71 = [v67 sectionBundleIdentifier];
                if (v71)
                {
                  uint64_t v72 = [v61 objectForKey:v71];
                  if (v72)
                  {
                    char v73 = (void *)MEMORY[0x1E4F28ED0];
                    unint64_t v74 = [v67 blockId];
                    BOOL v75 = [v72 blockIdValue];
                    unint64_t v76 = [v75 unsignedLongLongValue];

                    if (v74 <= v76) {
                      unint64_t v77 = v76;
                    }
                    else {
                      unint64_t v77 = v74;
                    }
                    float v61 = v253;
                    BOOL v78 = [v73 numberWithUnsignedLongLong:v77];
                    [v72 setBlockIdValue:v78];

                    unint64_t v52 = 0x1E4F28000;
                  }
                }
              }
              uint64_t v64 = [v62 countByEnumeratingWithState:&v267 objects:v292 count:16];
            }
            while (v64);
          }
          else
          {
            double v65 = -1.0;
          }

          [v261 sortUsingComparator:&__block_literal_global_663];
          uint64_t v79 = [*(id *)(v52 + 3792) numberWithDouble:v65];
          [v237 setMaxScore:v79];

          unint64_t v80 = [v261 count];
          long long v263 = 0u;
          long long v264 = 0u;
          long long v265 = 0u;
          long long v266 = 0u;
          id v81 = v62;
          float v7 = -1.0;
          uint64_t v17 = v251;
          long long v82 = v252;
          uint64_t v254 = [v81 countByEnumeratingWithState:&v263 objects:v291 count:16];
          if (v254)
          {
            uint64_t v246 = *(void *)v264;
            float v83 = (float)(unint64_t)v259;
            float v245 = (float)*(unint64_t *)&v243;
            *(float *)&uint64_t v244 = (float)(unint64_t)v244;
            double v84 = (double)(unint64_t)v259 + -1.0;
            double v85 = -1.0;
            double v243 = (double)*(unint64_t *)&v243 + -1.0;
            double v86 = (double)v80;
            float v87 = (float)v257;
            id obja = v81;
            do
            {
              uint64_t v88 = 0;
              do
              {
                if (*(void *)v264 != v246) {
                  objc_enumerationMutation(obja);
                }
                id v89 = *(void **)(*((void *)&v263 + 1) + 8 * v88);
                id v90 = [v89 rankingItem];
                if (!v90)
                {
                  BOOL v91 = [PRSRankingItem alloc];
                  BOOL v92 = [v89 sectionBundleIdentifier];
                  id v90 = [(PRSRankingItem *)v91 initForParsecResultWithBundleID:v92];

                  [v89 setRankingItem:v90];
                }
                float v93 = [v90 L2FeatureVector];
                uint64_t v94 = [v89 sectionBundleIdentifier];
                if (v94)
                {
                  uint64_t v95 = [v253 objectForKey:v94];
                  uint64_t v96 = v95;
                  if (v95)
                  {
                    uint64_t v97 = [v95 blockIdValue];

                    if (v97)
                    {
                      objc_msgSend(v89, "setFeedbackBlockId:", objc_msgSend(v89, "blockId"));
                    }
                    else
                    {
                      objc_msgSend(v89, "setFeedbackBlockId:");
                      [v96 setBlockIdValue:&unk_1F1863FF0];
                    }
                  }
                  else
                  {
                    objc_msgSend(v89, "setFeedbackBlockId:");
                  }
                }
                *(_OWORD *)((char *)&v290[29] + 4) = 0u;
                memset((char *)&v290[30] + 4, 0, 28);
                *(_OWORD *)((char *)&v290[27] + 4) = 0u;
                *(_OWORD *)((char *)&v290[28] + 4) = 0u;
                *(_OWORD *)((char *)&v290[25] + 4) = 0u;
                *(_OWORD *)((char *)&v290[26] + 4) = 0u;
                *(_OWORD *)((char *)&v290[23] + 4) = 0u;
                *(_OWORD *)((char *)&v290[24] + 4) = 0u;
                *(_OWORD *)((char *)&v290[21] + 4) = 0u;
                *(_OWORD *)((char *)&v290[22] + 4) = 0u;
                *(_OWORD *)((char *)&v290[19] + 4) = 0u;
                *(_OWORD *)((char *)&v290[20] + 4) = 0u;
                *(_OWORD *)((char *)&v290[17] + 4) = 0u;
                *(_OWORD *)((char *)&v290[18] + 4) = 0u;
                *(_OWORD *)((char *)&v290[15] + 4) = 0u;
                *(_OWORD *)((char *)&v290[16] + 4) = 0u;
                *(_OWORD *)((char *)&v290[13] + 4) = 0u;
                *(_OWORD *)((char *)&v290[14] + 4) = 0u;
                *(_OWORD *)((char *)&v290[11] + 4) = 0u;
                *(_OWORD *)((char *)&v290[12] + 4) = 0u;
                *(_OWORD *)((char *)&v290[9] + 4) = 0u;
                *(_OWORD *)((char *)&v290[10] + 4) = 0u;
                *(_OWORD *)((char *)&v290[7] + 4) = 0u;
                *(_OWORD *)((char *)&v290[8] + 4) = 0u;
                *(_OWORD *)((char *)&v290[5] + 4) = 0u;
                *(_OWORD *)((char *)&v290[6] + 4) = 0u;
                *(_OWORD *)((char *)&v290[3] + 4) = 0u;
                *(_OWORD *)((char *)&v290[4] + 4) = 0u;
                memset((char *)v290 + 4, 0, 48);
                long long v288 = 0u;
                memset(v289, 0, sizeof(v289));
                long long v286 = 0u;
                long long v287 = 0u;
                long long v284 = 0u;
                long long v285 = 0u;
                long long v282 = 0u;
                long long v283 = 0u;
                long long v280 = 0u;
                long long v281 = 0u;
                long long v278 = 0u;
                long long v279 = 0u;
                long long v276 = 0u;
                long long v277 = 0u;
                *(_OWORD *)&v275[2] = 0u;
                *(_WORD *)v275 = 366;
                *(float *)double v290 = v36;
                [*(id *)(a1 + 56) engagementProbabilityForCategory:@"com.apple.other.search_maps"];
                *(_WORD *)&v275[2] = 402;
                DWORD1(v290[0]) = v98;
                [*(id *)(a1 + 56) engagementProbabilityForCategory:@"com.apple.other.search_app_store"];
                *(_WORD *)&v275[4] = 403;
                DWORD2(v290[0]) = v99;
                [*(id *)(a1 + 56) engagementProbabilityForCategory:@"com.apple.other.search_appstore"];
                *(_WORD *)&v275[6] = 404;
                HIDWORD(v290[0]) = v100;
                [*(id *)(a1 + 56) engagementProbabilityForCategory:@"com.apple.other.search_web"];
                *(_DWORD *)&v275[8] = 24379797;
                *(void *)&v290[1] = v101 | 0x3F80000000000000;
                uint64_t v102 = [*(id *)(a1 + 144) indexOfObject:v89];
                *(_WORD *)&v275[12] = 373;
                float v103 = ((double)(unint64_t)(v102 + 1) + v85) / (double)*(unint64_t *)(a1 + 280);
                *(_DWORD *)&v275[14] = 24576374;
                *((float *)&v290[1] + 2) = (float)(unint64_t)(v102 + 1);
                *((float *)&v290[1] + 3) = v103;
                uint64_t v259 = (uint64_t)v93;
                unsigned __int8 v258 = (void *)v94;
                if (v36 == v7)
                {
                  LODWORD(v276) = 24707448;
                  WORD2(v276) = 379;
                  uint64_t v106 = 12;
                  v290[2] = v241;
                }
                else
                {
                  *(float *)&unsigned int v104 = v84 / (double)*(unint64_t *)(a1 + 272);
                  *(void *)&v290[2] = __PAIR64__(v104, LODWORD(v83));
                  *((void *)&v290[2] + 1) = __PAIR64__(v244, LODWORD(v245));
                  float v105 = v243 / (double)*(unint64_t *)(a1 + 288);
                  *(void *)&long long v276 = 0x17B0179017A0178;
                  *(float *)&v290[3] = v105;
                  uint64_t v106 = 13;
                }
                double v107 = &v275[2 * v106];
                *(void *)double v107 = 0x17F017E017D017CLL;
                *(_OWORD *)((char *)v290 + 4 * v106) = *(_OWORD *)(a1 + 304);
                *(_WORD *)&v275[2 * v106 + 8] = 384;
                *((_WORD *)v107 + 5) = 385;
                uint64_t v108 = v106 + 6;
                *(void *)((char *)&v290[1] + 4 * v106) = *(void *)(a1 + 320);
                id v109 = *(void **)(a1 + 32);
                [v89 rankingScore];
                objc_msgSend(v109, "roundedValueForScore:");
                double v111 = v110;
                *(_WORD *)&v275[2 * v108] = 386;
                *(float *)&double v110 = v110;
                uint64_t v112 = a1;
                uint64_t v113 = v106 + 7;
                *((_DWORD *)v290 + v108) = LODWORD(v110);
                int v114 = *(void **)(v112 + 152);
                uint64_t v115 = [MEMORY[0x1E4F28ED0] numberWithDouble:v111];
                uint64_t v116 = [v114 indexOfObject:v115] + 1;

                *(_WORD *)&v275[2 * v113] = 387;
                *((float *)v290 + v113) = (float)(unint64_t)v116;
                float v117 = ((double)(unint64_t)v116 + -1.0) / (double)*(unint64_t *)(v112 + 296);
                *(_WORD *)&v275[2 * v106 + 16] = 388;
                uint64_t v118 = v106 + 9;
                *((float *)&v290[2] + v106) = v117;
                id v119 = [MEMORY[0x1E4F28ED0] numberWithDouble:v111];
                uint64_t v120 = [v261 indexOfObject:v119] + 1;

                *(_WORD *)&v275[2 * v118] = 389;
                *((float *)v290 + v118) = (float)(unint64_t)v120;
                double v85 = -1.0;
                *(_WORD *)&v275[2 * v106 + 20] = 390;
                float v121 = ((double)(unint64_t)v120 + -1.0) / v86;
                *((float *)&v290[2] + v106 + 2) = v121;
                float v122 = (float)*(unint64_t *)(v112 + 280);
                *(_WORD *)&v275[2 * v106 + 22] = 396;
                uint64_t v123 = v106 + 12;
                *((float *)&v290[2] + v106 + 3) = v122;
                unint64_t v124 = [obja count];
                *(_WORD *)&v275[2 * v123] = 399;
                *((float *)v290 + v123) = (float)v124;
                *(_WORD *)&v275[2 * v106 + 26] = 1776;
                uint64_t v125 = v106 + 14;
                *((float *)&v290[3] + v106 + 1) = v87;
                [v248 floatValue];
                *(_WORD *)&v275[2 * v125] = 1777;
                uint64_t v126 = v106 + 15;
                *((_DWORD *)v290 + v125) = v127;
                [*(id *)(v112 + 128) floatValue];
                *(_WORD *)&v275[2 * v126] = 1778;
                uint64_t v128 = v106 | 0x10;
                *((_DWORD *)v290 + v126) = v129;
                [*(id *)(v112 + 136) floatValue];
                *(_WORD *)&v275[2 * v128] = 1780;
                uint64_t v130 = v106 + 17;
                *((_DWORD *)v290 + v128) = v131;
                float v7 = -1.0;
                if (v36 == -1.0)
                {
                  *(_WORD *)&v275[2 * v130] = 1779;
                  *(_WORD *)&v275[(2 * v106) | 0x24] = 1781;
                  *(void *)((char *)v290 + 4 * v130) = v242;
                  *(_WORD *)&v275[2 * v106 + 38] = 1980;
                  float v135 = -1.0;
                  *((_DWORD *)&v290[4] + v106 + 3) = -1082130432;
                }
                else
                {
                  [*(id *)(v112 + 128) floatValue];
                  *(_WORD *)&v275[2 * v130] = 1779;
                  uint64_t v133 = v106 | 0x12;
                  *((float *)v290 + v130) = v36 / v132;
                  [*(id *)(v112 + 136) floatValue];
                  *(_WORD *)&v275[2 * v133] = 1781;
                  *((float *)v290 + v133) = v36 / v134;
                  *(_WORD *)&v275[2 * v106 + 38] = 1980;
                  *((float *)&v290[4] + v106 + 3) = v83;
                  float v135 = v84 / (double)*(unint64_t *)(v112 + 272);
                }
                a1 = v112;
                long long v82 = v252;
                *(_WORD *)&v275[2 * v106 + 40] = 1981;
                *((float *)&v290[5] + v106) = v135;
                uint64_t v136 = v106 + 21;
                if (v247)
                {
                  [*(id *)(v112 + 56) numAppsDeduped];
                  *(_WORD *)&v275[2 * v136] = 2317;
                  uint64_t v137 = v106 + 22;
                  *((_DWORD *)v290 + v136) = v138;
                  [*(id *)(v112 + 56) engagementProbabilityForCategory:@"com.apple.application"];
                  if (v139 == -1.0)
                  {
                    uint64_t v136 = v106 + 22;
                  }
                  else
                  {
                    *(_WORD *)&v275[2 * v137] = 2318;
                    uint64_t v136 = v106 + 23;
                    *((float *)v290 + v137) = v139;
                    if (v36 != -1.0 && v139 != 0.0)
                    {
                      *(_WORD *)&v275[2 * v136] = 2319;
                      *((float *)v290 + v136) = v36 / v139;
                      uint64_t v136 = v106 + 24;
                    }
                  }
                }
                [v93 setScores:v290 forFeatures:v275 count:v136];
                [v93 setBundleID:v252];
                [v249 addObject:v93];
                uint64_t v17 = v251;
                [v251 addObject:v89];

                ++v88;
              }
              while (v254 != v88);
              id v81 = obja;
              uint64_t v140 = [obja countByEnumeratingWithState:&v263 objects:v291 count:16];
              uint64_t v254 = v140;
            }
            while (v140);
          }
          uint64_t v141 = v82;
          float v18 = v81;

          unint64_t v5 = v238;
          if ([v249 count])
          {
            [*(id *)(a1 + 160) setObject:v249 atIndexedSubscript:v238];
            [*(id *)(a1 + 168) setObject:v17 atIndexedSubscript:v238];
          }
          double v8 = -1.0;
          uint64_t v16 = v240;
          if ([v253 count]) {
            [*(id *)(a1 + 176) setObject:v253 atIndexedSubscript:v238];
          }
          float v15 = v141;
          [*(id *)(a1 + 64) prepareParsecResults:v18 inBundle:v141];
          if ([v141 isEqualToString:@"com.apple.parsec.itunes.iosSoftware"])
          {
            uint64_t v142 = *(void *)(*(void *)(a1 + 208) + 8);
            if (!*(unsigned char *)(v142 + 24)) {
              *(unsigned char *)(v142 + 24) = 1;
            }
            if (![v18 count]) {
              goto LABEL_95;
            }
            char v143 = [v18 firstObject];
            unint64_t v144 = [v143 rankingItem];
            int v145 = v144;
            if (!v144)
            {
LABEL_94:

              uint64_t v16 = v240;
LABEL_95:

LABEL_194:
              goto LABEL_195;
            }
            float v146 = [v144 L2FeatureVector];
            if (!v146)
            {
LABEL_93:
              float v15 = v141;
              goto LABEL_94;
            }
            BOOL v147 = v146;
            [v146 scoreForFeature:2304];
            uint64_t v149 = *(void *)(a1 + 232);
          }
          else
          {
            if (![v141 isEqualToString:@"com.apple.parsec.tv.tvShow"]) {
              goto LABEL_95;
            }
            uint64_t v150 = *(void *)(*(void *)(a1 + 240) + 8);
            if (!*(unsigned char *)(v150 + 24)) {
              *(unsigned char *)(v150 + 24) = 1;
            }
            if (![v18 count]) {
              goto LABEL_95;
            }
            char v143 = [v18 firstObject];
            uint64_t v151 = [v143 rankingItem];
            int v145 = v151;
            if (!v151) {
              goto LABEL_94;
            }
            long long v152 = [v151 L2FeatureVector];
            if (!v152) {
              goto LABEL_93;
            }
            BOOL v147 = v152;
            [v152 scoreForFeature:2312];
            uint64_t v149 = *(void *)(a1 + 248);
          }
          *(_DWORD *)(*(void *)(v149 + 8) + 24) = v148;

          goto LABEL_93;
        }
        uint64_t v17 = [v16 resultSet];
        if ([v17 count]) {
          break;
        }
LABEL_195:

        if (++v5 == v236) {
          goto LABEL_199;
        }
      }
      float v18 = [v17 objectAtIndexedSubscript:0];
      id v239 = v16;
      double v19 = [v16 results];
      uint64_t v20 = [v19 objectAtIndexedSubscript:0];
      id v21 = [v20 sectionBundleIdentifier];
      id v22 = [v21 lowercaseString];

      BOOL v249 = v22;
      [*(id *)(a1 + 56) engagementProbabilityForCategory:v22];
      int v250 = v17;
      if (v23 != v7)
      {
        float v24 = v23;
        double v25 = [@"com.apple.Preferences" lowercaseString];
        char v26 = [v22 isEqualToString:v25];

        id obj = v18;
        if (v26)
        {
          int v27 = 1;
          __int16 v28 = 368;
        }
        else
        {
          long long v153 = [@"com.apple.app-clips" lowercaseString];
          char v154 = [v22 isEqualToString:v153];

          if (v154)
          {
            int v27 = 1;
            __int16 v28 = 369;
          }
          else
          {
            BOOL v155 = [@"com.apple.tips" lowercaseString];
            char v156 = [v22 isEqualToString:v155];

            if (v156)
            {
              int v27 = 1;
              __int16 v28 = 371;
            }
            else
            {
              int v157 = [v22 hasPrefix:@"com.apple."];
              if (v157) {
                __int16 v28 = 3235;
              }
              else {
                __int16 v28 = 370;
              }
              int v27 = v157 ^ 1;
            }
          }
        }
        long long v158 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
        long long v271 = 0u;
        long long v272 = 0u;
        long long v273 = 0u;
        long long v274 = 0u;
        id v159 = v17;
        uint64_t v160 = [v159 countByEnumeratingWithState:&v271 objects:v293 count:16];
        if (v160)
        {
          uint64_t v161 = v160;
          uint64_t v162 = *(void *)v272;
          do
          {
            for (uint64_t j = 0; j != v161; ++j)
            {
              if (*(void *)v272 != v162) {
                objc_enumerationMutation(v159);
              }
              double v164 = [*(id *)(*((void *)&v271 + 1) + 8 * j) rankingItem];
              double v165 = [v164 L2FeatureVector];

              if (v165)
              {
                *(_DWORD *)v275 = 367;
                *(void *)&v290[0] = LODWORD(v24);
                if (v27)
                {
                  *(_WORD *)&v275[2] = v28;
                  *((float *)v290 + 1) = v24;
                  [v165 setScores:v290 forFeatures:v275 count:2];
                  [v158 addObject:v165];
                }
                else
                {
                  [v165 setScores:v290 forFeatures:v275 count:1];
                }
              }
            }
            uint64_t v161 = [v159 countByEnumeratingWithState:&v271 objects:v293 count:16];
          }
          while (v161);
        }

        if (v27)
        {
          uint64_t v166 = (void *)[*(id *)(a1 + 64) computeScoresForVectors:v158];
          if (v166) {
            free(v166);
          }
        }

        unint64_t v5 = v238;
        uint64_t v17 = v250;
        float v18 = obj;
      }
      double v167 = [v18 rankingItem];
      if (v167)
      {
        uint64_t v168 = [v18 rankingItem];
        int v262 = [v168 shouldHideUnderShowMore] ^ 1;
      }
      else
      {
        int v262 = 0;
      }

      double v169 = [v17 objectAtIndexedSubscript:0];
      [*(id *)(a1 + 72) setObject:v169 atIndexedSubscript:v5];

      int v170 = [v18 rankingItem];
      double v171 = [v170 L2FeatureVector];
      if (v171)
      {
        v172 = [v18 rankingItem];
        double v173 = [v172 L2FeatureVector];
        [v173 originalL2Score];
        float v175 = v174;

        unint64_t v5 = v238;
      }
      else
      {
        float v175 = -3.4028e38;
      }

      uint64_t v176 = [v17 count];
      int v177 = [v18 rankingItem];
      unsigned int v178 = [v177 bundleIDType];

      if (!v176)
      {
        [*(id *)(a1 + 88) setObject:v18 atIndexedSubscript:v5];
LABEL_192:
        uint64_t v16 = v239;
        goto LABEL_193;
      }
      unint64_t v179 = v176;
      BOOL v180 = [v17 objectAtIndexedSubscript:0];
      v181 = [v180 rankingItem];
      float v182 = v181;
      BOOL v183 = v252;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 192) + 8) + 24)
        && ([v181 bundleIDType] & 0x400) != 0)
      {
        int v184 = [v182 L2FeatureVector];
        [v184 scoreForFeature:31];
        float v186 = v185;

        BOOL v183 = v252;
        _ZF = v186 == 1.0;
        float v7 = -1.0;
        if (_ZF) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 192) + 8) + 24) = 1;
        }
      }
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 200) + 8) + 24)
        && SSSectionIsSyndicatedPhotos(v183))
      {
        v187 = v18;
        int v188 = [v180 rankingItem];
        if ([v188 photosMatch]) {
          goto LABEL_136;
        }
        id v189 = [v180 rankingItem];
        if ([v189 photosExactMatch])
        {

          BOOL v183 = v252;
LABEL_136:

LABEL_137:
          *(unsigned char *)(*(void *)(*(void *)(a1 + 200) + 8) + 24) = 1;
        }
        else
        {
          uint64_t v230 = [v180 rankingItem];
          uint64_t v231 = [v230 L2FeatureVector];
          [v231 scoreForFeature:1928];
          float v233 = v232;

          uint64_t v17 = v250;
          _ZF = v233 == 1.0;
          float v7 = -1.0;
          BOOL v183 = v252;
          float v18 = v187;
          if (_ZF) {
            goto LABEL_137;
          }
        }
      }
      id v190 = v18;
      (*(void (**)(void))(*(void *)(a1 + 184) + 16))();

      if (v179 >= 2)
      {
        unsigned int v191 = (v178 >> 15) & 1;
        unint64_t v192 = 1;
        while (1)
        {
          v193 = [v17 objectAtIndex:v192];
          BOOL v194 = [v193 rankingItem];
          v195 = [v194 L2FeatureVector];
          if (v195)
          {
            BOOL v196 = [v193 rankingItem];
            int v197 = [v196 L2FeatureVector];
            [v197 originalL2Score];
            float v199 = v198;

            uint64_t v17 = v250;
          }
          else
          {
            float v199 = -3.4028e38;
          }

          id v200 = [v193 rankingItem];
          v191 += ([v200 bundleIDType] >> 15) & 1;
          if (v199 > v175) {
            break;
          }
          float v201 = [v190 rankingItem];
          if (([v201 bundleIDType] & 0x8000) == 0) {
            goto LABEL_153;
          }
          float v202 = [v193 rankingItem];
          __int16 v203 = [v202 bundleIDType];

          uint64_t v17 = v250;
          if ((v203 & 0x8000) == 0) {
            break;
          }
LABEL_154:
          float v7 = -1.0;
          BOOL v183 = v252;
          (*(void (**)(void))(*(void *)(a1 + 184) + 16))();

          if (v179 == ++v192) {
            goto LABEL_155;
          }
        }
        uint64_t v204 = [v239 maxInitiallyVisibleResults];
        if (v262)
        {
          unint64_t v205 = v204 ? v204 : v179;
          if (([v200 shouldHideUnderShowMore] & 1) != 0 || v192 >= v205 + v191) {
            goto LABEL_154;
          }
        }
        float v201 = v190;
        id v190 = v193;
        float v175 = v199;
LABEL_153:

        goto LABEL_154;
      }
LABEL_155:
      float v18 = v190;
      [*(id *)(a1 + 88) setObject:v190 atIndexedSubscript:v238];
      if (*(unsigned char *)(a1 + 328))
      {
        int v206 = 0;
        uint64_t v16 = v239;
      }
      else
      {
        uint64_t v16 = v239;
        if (([v183 hasPrefix:@"com.apple."] & 1) == 0)
        {
          int v208 = [v183 isEqualToString:@"com.apple.Preferences"];
          int v206 = 1;
          goto LABEL_164;
        }
        int v206 = [v183 isEqualToString:@"com.apple.CoreSuggestions"];
      }
      int v207 = [v183 isEqualToString:@"com.apple.Preferences"];
      int v208 = v207;
      if ((v206 & 1) == 0 && !v207)
      {
        unint64_t v5 = v238;
LABEL_193:
        float v15 = v252;
        goto LABEL_194;
      }
LABEL_164:
      float v209 = [v17 objectAtIndexedSubscript:0];
      float v210 = [v209 rankingItem];
      [*(id *)(a1 + 56) engagementProbabilityForCategory:v252];
      float v212 = v211;
      if (v206)
      {
        double v213 = v211;
        float v214 = [v210 L2FeatureVector];
        [v214 scoreForFeature:1961];
        float v216 = v215;

        float v217 = [v210 L2FeatureVector];
        [v217 scoreForFeature:1955];

        float v218 = [v210 L2FeatureVector];
        [v218 scoreForFeature:2084];
        float v220 = v219;

        int v221 = [v252 isEqualToString:@"com.apple.CoreSuggestions"];
        double v222 = 0.01;
        if (v221) {
          double v222 = 0.05;
        }
        int v223 = v222 > v213 && v212 != -1.0;
        if (v220 == -1.0)
        {
          unint64_t v5 = v238;
        }
        else
        {
          unint64_t v5 = v238;
          if (v216 != -1.0)
          {
            BOOL v224 = v220 <= v234;
            if (v216 <= 5.0) {
              BOOL v224 = 1;
            }
            v223 &= v224;
          }
        }
        if (([v210 hasPolicyMultipleTermsPhraseMatch] & 1) != 0
          || ([v210 hasPolicyMultipleTermsNearMatch] & 1) != 0
          || ([v210 hasPolicySingleTermPhraseMatch] & 1) != 0
          || ((v223 ^ 1) & 1) != 0)
        {
          goto LABEL_191;
        }
        [v209 setPlacement:2];
        uint64_t v229 = SSSetTopHitWithReasonString(0, v209, @"Demote due to SFResultPlacementBottom", 1);
      }
      else
      {
        if (*(unsigned char *)(a1 + 329)) {
          int v225 = 0;
        }
        else {
          int v225 = v208;
        }
        unint64_t v5 = v238;
        if (v225 != 1) {
          goto LABEL_191;
        }
        if (v211 == -1.0) {
          goto LABEL_191;
        }
        [*(id *)(a1 + 56) maxEngagementProbability];
        float v227 = v226;
        [*(id *)(a1 + 56) engagementProbabilityForCategory:@"com.apple.other:search_preferences"];
        if (v227 == -1.0 || v212 != v227 && v228 != v227) {
          goto LABEL_191;
        }
        [v210 setTopHitReason:15];
        [v209 setPlacement:1];
        uint64_t v229 = SSSetTopHitWithReasonType(1, v209, 15, 1, 0);
      }
      [v209 setTopHit:v229];
LABEL_191:

      float v7 = -1.0;
      goto LABEL_192;
    }
  }
LABEL_199:
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_661(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_2_666(uint64_t a1, void *a2)
{
  return -objc_msgSend(a2, "compare:");
}

void __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_3_669(uint64_t a1, uint64_t a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (a2 == 2)
  {
    if (SSEnableSpotlightFullPageRanking())
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v15 = *(id *)(a1 + 88);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v57 objects:v61 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v58 != v17) {
              objc_enumerationMutation(v15);
            }
            double v19 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            uint64_t v20 = objc_msgSend(v19, "rankingItem", (void)v57);
            id v21 = [v20 sectionBundleIdentifier];
            BOOL v22 = v21 == 0;

            if (!v22)
            {
              float v23 = *(void **)(a1 + 96);
              float v24 = [v19 rankingItem];
              double v25 = [v24 sectionBundleIdentifier];
              char v26 = [v23 objectForKey:v25];

              if (!v26)
              {
                int v27 = *(void **)(a1 + 104);
                __int16 v28 = [v19 rankingItem];
                uint64_t v29 = [v28 sectionBundleIdentifier];
                double v30 = [v27 objectForKey:v29];

                if (v30)
                {
                  double v31 = objc_alloc_init(SectionL3Scores);
                  if ([(SectionL3Scores *)v31 computeScore:v30 rankingConfig:*(void *)(a1 + 112) hasGoodLocalResult:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) pos:0 queryContext:*(void *)(a1 + 120)])
                  {
                    *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = 1;
                  }
                  uint64_t v32 = *(void **)(a1 + 96);
                  uint64_t v33 = [v19 rankingItem];
                  float v34 = [v33 sectionBundleIdentifier];
                  [v32 setObject:v31 forKeyedSubscript:v34];
                }
              }
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v57 objects:v61 count:16];
        }
        while (v16);
      }
    }
    uint64_t v35 = +[SSRankingManager rankLocalBundles:sectionMapping:l3RankingScores:](SSRankingManager, "rankLocalBundles:sectionMapping:l3RankingScores:", *(void *)(a1 + 88), *(void *)(a1 + 104), *(void *)(a1 + 96), (void)v57);
    uint64_t v36 = *(void *)(*(void *)(a1 + 136) + 8);
    double v37 = *(void **)(v36 + 40);
    *(void *)(v36 + 40) = v35;
  }
  else if (a2 == 1)
  {
    [*(id *)(a1 + 80) sortWithOptions:1 usingComparator:&__block_literal_global_675];
  }
  else if (!a2 && [*(id *)(a1 + 32) count])
  {
    for (unint64_t j = 0; ; ++j)
    {
      unint64_t v4 = [*(id *)(a1 + 32) count];
      unint64_t v5 = *(void **)(a1 + 32);
      if (j >= v4) {
        break;
      }
      unint64_t v6 = [v5 objectAtIndexedSubscript:j];
      float v7 = *(void **)(a1 + 40);
      double v8 = [v6 bundleID];
      id v9 = [v7 objectForKey:v8];

      uint64_t v63 = 0;
      uint64_t v64 = 0;
      uint64_t v62 = 0;
      id v10 = [v9 maxScoreAbsRank];
      [v10 floatValue];
      LODWORD(v63) = v11;

      LOWORD(v62) = 1650;
      id v12 = [v9 maxScoreRelRank];
      [v12 floatValue];
      HIDWORD(v63) = v13;

      WORD1(v62) = 1651;
      if ([*(id *)(a1 + 48) hasParsecPolicyPhraseMatch]) {
        float v14 = 1.0;
      }
      else {
        float v14 = 0.0;
      }
      *(float *)&uint64_t v64 = v14;
      WORD2(v62) = 2089;
      [v6 setScores:&v63 forFeatures:&v62 count:3];
    }
    if ([v5 count])
    {
      if (*(unsigned char *)(a1 + 144))
      {
        unint64_t v52 = PRSModelManagerAssociatedObjectKeyForType(0);
        for (unint64_t k = 0; k < [*(id *)(a1 + 32) count]; ++k)
        {
          float v54 = [*(id *)(a1 + 32) objectAtIndexedSubscript:k];
          __int16 v55 = [*(id *)(a1 + 56) objectAtIndexedSubscript:k];
          double v56 = [v55 rankingItem];

          objc_setAssociatedObject(v54, v52, v56, (void *)1);
        }
      }
      float v38 = (void *)[*(id *)(a1 + 48) computeScoresForVectors:*(void *)(a1 + 32) withBundleFeatures:*(void *)(a1 + 40)];
      if (v38)
      {
        for (unint64_t m = 0; m < [*(id *)(a1 + 32) count]; ++m)
        {
          double v40 = [*(id *)(a1 + 32) objectAtIndexedSubscript:m];
          [v40 originalL2Score];
          int v42 = v41;
          double v43 = [*(id *)(a1 + 56) objectAtIndexedSubscript:m];
          LODWORD(v44) = v42;
          [v43 setL2score:v44];

          id v45 = *(void **)(a1 + 64);
          uint64_t v46 = [*(id *)(a1 + 56) objectAtIndexedSubscript:m];
          uint64_t v47 = [v46 sectionBundleIdentifier];
          uint64_t v48 = [v45 indexOfObject:v47];
          float v49 = [*(id *)(a1 + 56) objectAtIndexedSubscript:m];
          objc_msgSend(v49, "setScore:", v48, 0);
        }
        if (SPBlockGroupingEnabled_onceToken != -1) {
          dispatch_once(&SPBlockGroupingEnabled_onceToken, &__block_literal_global_524);
        }
        if (SPBlockGroupingEnabled__blockGroupingEnabled) {
          [*(id *)(a1 + 72) updateServerScoresUsingBlockOrder:*(void *)(a1 + 56) bundleFeatures:*(void *)(a1 + 40)];
        }
        free(v38);
      }
    }
    [*(id *)(a1 + 56) sortWithOptions:17 usingComparator:&__block_literal_global_672];
    for (unint64_t n = 0; n < [*(id *)(a1 + 32) count]; ++n)
    {
      float v51 = [*(id *)(a1 + 56) objectAtIndexedSubscript:n];
      objc_msgSend(v51, "setScore:", 0, 0);
    }
  }
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_4_670(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 score];
  double v6 = (double)*(unsigned long long *)&v5;
  uint64_t v7 = [v4 score];
  uint64_t v9 = v8;

  uint64_t v10 = v7;
  uint64_t v11 = v9;
  uint64_t v12 = -1;
  if (v6 >= (double)*(unsigned long long *)&v10) {
    uint64_t v12 = 0;
  }
  if (v6 <= (double)*(unsigned long long *)&v10) {
    return v12;
  }
  else {
    return 1;
  }
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_5_673(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 rankingItem];
  double v6 = [v5 L2FeatureVector];
  [v6 originalL2Score];
  float v8 = v7;

  uint64_t v9 = [v4 rankingItem];

  uint64_t v10 = [v9 L2FeatureVector];
  [v10 originalL2Score];
  float v12 = v11;

  if (v8 <= v12) {
    return v12 > v8;
  }
  else {
    return -1;
  }
}

+ (void)determineTopHitsForSafariSection:(id)a3 forQuery:(id)a4
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v25[0] = 0;
  v25[1] = 0;
  v24[0] = 0;
  v24[1] = 0;
  __int16 v23 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  float v7 = [v5 resultSet];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__SSRankingManager_determineTopHitsForSafariSection_forQuery___block_invoke;
  v13[3] = &unk_1E634C578;
  id v8 = v6;
  id v14 = v8;
  id v15 = &v19;
  uint64_t v16 = v24;
  uint64_t v17 = &v23;
  float v18 = v25;
  [v7 enumerateObjectsUsingBlock:v13];

  if (v20[3])
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = (id)v25[v9];
      objc_msgSend(v10, "setTopHit:", SSSetTopHitWithReasonString(1, v10, @"determineTopHitsForSafariSection", 1));
      [v10 setForceNoTopHit:0];
      [v10 setIsSafariTopHit:1];
      float v11 = [v10 rankingItem];
      [v11 setIsSafariTopHit:1];

      float v12 = [v10 rankingItem];
      [v12 setTopHitReason:12];

      ++v9;
    }
    while (v9 < v20[3]);
  }

  _Block_object_dispose(&v19, 8);
}

uint64_t __62__SSRankingManager_determineTopHitsForSafariSection_forQuery___block_invoke(void *a1, void *a2)
{
  id v25 = a2;
  [v25 setTopHit:0];
  [v25 setForceNoTopHit:1];
  [v25 setIsSafariTopHit:0];
  id v3 = [v25 rankingItem];
  [v3 setIsSafariTopHit:0];

  if ([v25 isSafariTopHitForQuery:a1[4]])
  {
    id v4 = [v25 rankingItem];
    id v5 = SSCompactRankingAttrsGetValue((int8x8_t *)[v4 attributes], 9uLL);

    if (v5)
    {
      id v6 = [v25 contentURL];
      unint64_t v7 = [v6 length];

      id v8 = [v25 contentType];
      char v9 = [v8 isEqualToString:@"com.apple.safari.bookmark"];

      uint64_t v10 = a1[5];
      if (*(void *)(*(void *)(v10 + 8) + 24))
      {
        unint64_t v11 = 0;
        char v12 = 0;
        id v13 = v25;
        do
        {
          uint64_t v14 = a1[6];
          uint64_t v15 = a1[7];
          unint64_t v16 = *(void *)(v14 + 8 * v11);
          BOOL v17 = *(unsigned char *)(v15 + v11) != 0;
          BOOL v18 = v7 >= v16 && *(unsigned char *)(v15 + v11) != 0;
          if (!v18 && (v9 & 1) != 0 || (v7 < v16 ? (BOOL v21 = *(unsigned char *)(v15 + v11) == 0) : (BOOL v21 = 0), v21))
          {
            *(void *)(v14 + 8 * v11) = v7;
            *(unsigned char *)(v15 + v11) = v9 & 1;
            uint64_t v19 = a1[8];
            uint64_t v20 = *(void **)(v19 + 8 * v11);
            *(void *)(v19 + 8 * v11) = v13;
            uint64_t v10 = a1[5];
            char v12 = 1;
            id v13 = v20;
            unint64_t v7 = v16;
            char v9 = v17;
          }
          ++v11;
          unint64_t v22 = *(void *)(*(void *)(v10 + 8) + 24);
        }
        while (v11 < v22);
        if (v12) {
          goto LABEL_21;
        }
      }
      else
      {
        unint64_t v22 = 0;
        id v13 = v25;
      }
      if (v22 <= 1)
      {
        uint64_t v23 = a1[7];
        *(void *)(a1[6] + 8 * v22) = v7;
        *(unsigned char *)(v23 + *(void *)(*(void *)(a1[5] + 8) + 24)) = v9 & 1;
        *(void *)(a1[8] + 8 * (*(void *)(*(void *)(a1[5] + 8) + 24))++) = v13;
      }
    }
LABEL_21:
  }
  return MEMORY[0x1F41817F8]();
}

- (void)refineSectionShowingVisibleResultsWithBetterTextMatches:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 resultSet];
  unint64_t v5 = [v4 count];

  if (v5 >= 3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = v5;
  }
  unint64_t v7 = [v3 resultSet];
  id v8 = [v7 array];

  if (!v6) {
    goto LABEL_10;
  }
  unint64_t v9 = 0;
  uint64_t v10 = 0;
  do
  {
    unint64_t v11 = [v8 objectAtIndexedSubscript:v10];
    char v12 = [v11 rankingItem];
    uint64_t v13 = v10 + 1;
    if (![v12 shouldHideUnderShowMore]) {
      unint64_t v9 = v10 + 1;
    }

    ++v10;
  }
  while (v6 != v13);
  if (!v9)
  {
LABEL_10:
    uint64_t v14 = [v3 results];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      [v3 setIsInitiallyHidden:1];
      unint64_t v16 = SSGeneralLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v17 = [v3 bundleIdentifier];
        BOOL v18 = [v3 results];
        int v22 = 138412546;
        uint64_t v23 = v17;
        __int16 v24 = 2048;
        uint64_t v25 = [v18 count];
        _os_log_impl(&dword_1BDB2A000, v16, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] Marking section %@ (%lu result(s)) for isInitiallyHidden - all shouldHideUnderShowMore", (uint8_t *)&v22, 0x16u);
      }
      goto LABEL_20;
    }
    unint64_t v9 = 0;
  }
  uint64_t v19 = [v3 results];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    if (v9 <= 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v9;
    }
    [v3 setMaxInitiallyVisibleResults:v21];
  }
LABEL_20:
}

- (id)applyTopSectionPolicy:(id)a3 withTopHitSection:(id)a4 isPeopleSearch:(BOOL)a5 queryKind:(unint64_t)a6 correction:(id)a7 queryLength:(unint64_t)a8 ranker:(id)a9
{
  BOOL v101 = a5;
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v100 = a7;
  id v103 = a9;
  unint64_t v108 = a6;
  BOOL v14 = (a6 == 4 || a6 == 1) && (unint64_t)[v12 count] > 1;
  id v15 = v13;
  unint64_t v16 = [v12 objectAtIndexedSubscript:v14];
  BOOL v17 = [v16 bundleIdentifier];
  unsigned int v18 = [v17 isEqualToString:@"com.apple.spotlight.tophits"];

  unsigned int v107 = v18;
  if ((unint64_t)[v12 count] < 3)
  {
    char v21 = 0;
  }
  else
  {
    uint64_t v19 = [v12 objectAtIndexedSubscript:v14 + v18];
    uint64_t v20 = [v19 bundleIdentifier];
    char v21 = [v20 isEqualToString:@"com.apple.application"];
  }
  uint64_t v139 = 0;
  uint64_t v140 = &v139;
  uint64_t v141 = 0x3032000000;
  uint64_t v142 = __Block_byref_object_copy__0;
  char v143 = __Block_byref_object_dispose__0;
  id v144 = 0;
  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __115__SSRankingManager_applyTopSectionPolicy_withTopHitSection_isPeopleSearch_queryKind_correction_queryLength_ranker___block_invoke;
  v134[3] = &unk_1E634C5A0;
  uint64_t v136 = &v139;
  BOOL v137 = v14;
  char v138 = v21;
  id v22 = v12;
  id v135 = v22;
  uint64_t v113 = (void (**)(void, void, void, void))MEMORY[0x1C1885400](v134);
  uint64_t v102 = +[SSRankingManager getLegacyTophitSection]();
  int v23 = [v102 containsObject:@"none"];
  unint64_t v24 = v108 - 9;
  if ([v22 count])
  {
    uint64_t v25 = [v15 results];
    if (v25)
    {
      uint64_t v26 = [v15 results];
      BOOL v27 = [v26 count] == 0;

      if (!v27)
      {
        __int16 v28 = [v15 results];
        int v99 = [v28 objectAtIndexedSubscript:0];

        uint64_t v29 = [v99 sectionBundleIdentifier];
        uint64_t v30 = [v22 mutableCopy];
        double v31 = (void *)v140[5];
        v140[5] = v30;

        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        id v32 = v22;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v130 objects:v149 count:16];
        if (!v33) {
          goto LABEL_49;
        }
        uint64_t v110 = *(void *)v131;
        int v34 = v23 ^ 1;
        if (v24 < 0xFFFFFFFFFFFFFFFCLL) {
          int v34 = 1;
        }
        int v109 = v34;
        id v104 = v32;
        float v105 = v29;
        while (1)
        {
          uint64_t v35 = 0;
          uint64_t v111 = v33;
          do
          {
            if (*(void *)v131 != v110) {
              objc_enumerationMutation(v32);
            }
            uint64_t v36 = *(void **)(*((void *)&v130 + 1) + 8 * v35);
            if (objc_msgSend(v36, "pinToTop", v99, v100) && objc_msgSend(v36, "resultsCount"))
            {
              ((void (**)(void, void *, void, void))v113)[2](v113, v36, v107, 0);
              goto LABEL_47;
            }
            double v37 = [v36 bundleIdentifier];
            if (([v37 isEqualToString:@"com.apple.application"] & v109) == 1)
            {
              BOOL v38 = [v36 resultsCount] == 0;

              if (v38) {
                goto LABEL_27;
              }
              float v39 = [v36 results];
              double v40 = [v39 objectAtIndexedSubscript:0];
              double v37 = [v40 rankingItem];

              int v41 = [v37 L2FeatureVector];
              [v41 scoreForFeature:1];
              float v43 = v42;

              double v44 = [v37 L2FeatureVector];
              [v44 scoreForFeature:41];
              float v46 = v45;

              if (+[PRSRankingItemRanker spellCorrectedAppMinQueryLen] < a8&& v43 == 1.0&& v46 == 0.0)
              {
                goto LABEL_45;
              }
            }

LABEL_27:
            uint64_t v47 = [v36 bundleIdentifier];
            char v48 = [v47 isEqualToString:@"com.apple.application"];
            if (v108 == 4) {
              char v49 = 0;
            }
            else {
              char v49 = v48;
            }

            if ((v49 & 1) == 0)
            {
              double v37 = [v36 bundleIdentifier];
              if ([v37 isEqualToString:v29])
              {
                BOOL v50 = [v36 resultsCount] == 0;

                if (v50) {
                  goto LABEL_47;
                }
                float v51 = [v36 results];
                double v37 = [v51 objectAtIndexedSubscript:0];

                unint64_t v52 = [v37 rankingItem];
                int v53 = [v52 shouldHideUnderShowMore];

                if (v53)
                {
                  float v54 = [v15 results];
                  __int16 v55 = (void *)[v54 copy];

                  long long v128 = 0u;
                  long long v129 = 0u;
                  long long v126 = 0u;
                  long long v127 = 0u;
                  id v56 = v55;
                  uint64_t v57 = [v56 countByEnumeratingWithState:&v126 objects:v148 count:16];
                  if (v57)
                  {
                    int v58 = 0;
                    uint64_t v59 = *(void *)v127;
                    do
                    {
                      uint64_t v60 = 0;
                      uint64_t v61 = v58;
                      do
                      {
                        if (*(void *)v127 != v59) {
                          objc_enumerationMutation(v56);
                        }
                        uint64_t v62 = *(void *)(*((void *)&v126 + 1) + 8 * v60);
                        [v36 addResults:v62 atIndex:v61 + v60];
                        [v15 removeResults:v62];
                        ++v60;
                      }
                      while (v57 != v60);
                      uint64_t v57 = [v56 countByEnumeratingWithState:&v126 objects:v148 count:16];
                      int v58 = v61 + v60;
                    }
                    while (v57);
                  }

                  id v32 = v104;
                  uint64_t v29 = v105;
                  if (v107) {
                    [(id)v140[5] removeObject:v15];
                  }
                  ((void (**)(void, void *, void, uint64_t))v113)[2](v113, v36, 0, 1);
                }
                else if (!SSEnableSpotlightFullPageRanking())
                {
LABEL_45:
                  ((void (**)(void, void *, void, void))v113)[2](v113, v36, v107, 0);
                }
              }
            }
LABEL_47:
            ++v35;
          }
          while (v35 != v111);
          uint64_t v33 = [v32 countByEnumeratingWithState:&v130 objects:v149 count:16];
          if (!v33)
          {
LABEL_49:

            id v22 = (id)v140[5];
            goto LABEL_82;
          }
        }
      }
    }
  }
  if ([v22 count])
  {
    uint64_t v63 = [v22 mutableCopy];
    uint64_t v64 = (void *)v140[5];
    v140[5] = v63;

    if (!((v24 < 0xFFFFFFFFFFFFFFFCLL) | (v23 ^ 1) & 1))
    {
      id v80 = (id)v140[5];

      id v22 = v80;
LABEL_70:
      uint64_t v81 = [v22 mutableCopy];
      long long v82 = (void *)v140[5];
      v140[5] = v81;

      long long v120 = 0u;
      long long v121 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      id v83 = v22;
      uint64_t v84 = [v83 countByEnumeratingWithState:&v118 objects:v146 count:16];
      if (v84)
      {
        uint64_t v85 = *(void *)v119;
        while (2)
        {
          for (uint64_t i = 0; i != v84; ++i)
          {
            if (*(void *)v119 != v85) {
              objc_enumerationMutation(v83);
            }
            float v87 = *(void **)(*((void *)&v118 + 1) + 8 * i);
            if ([v87 pinToTop] && objc_msgSend(v87, "resultsCount"))
            {
              ((void (**)(void, void *, void, void))v113)[2](v113, v87, 0, 0);
              goto LABEL_81;
            }
          }
          uint64_t v84 = [v83 countByEnumeratingWithState:&v118 objects:v146 count:16];
          if (v84) {
            continue;
          }
          break;
        }
      }
LABEL_81:
      int v99 = v83;

      id v22 = (id)v140[5];
LABEL_82:

      goto LABEL_83;
    }
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id obj = v22;
    uint64_t v65 = [obj countByEnumeratingWithState:&v122 objects:v147 count:16];
    if (v65)
    {
      uint64_t v66 = *(void *)v123;
LABEL_54:
      uint64_t v67 = 0;
      while (1)
      {
        if (*(void *)v123 != v66) {
          objc_enumerationMutation(obj);
        }
        double v68 = *(void **)(*((void *)&v122 + 1) + 8 * v67);
        double v69 = [v68 bundleIdentifier];
        if (![v69 isEqualToString:@"com.apple.application"]) {
          goto LABEL_63;
        }
        BOOL v70 = [v68 resultsCount] == 0;

        if (!v70) {
          break;
        }
LABEL_64:
        if (v65 == ++v67)
        {
          uint64_t v65 = [obj countByEnumeratingWithState:&v122 objects:v147 count:16];
          if (v65) {
            goto LABEL_54;
          }
          goto LABEL_66;
        }
      }
      int v71 = [v68 results];
      uint64_t v72 = [v71 objectAtIndexedSubscript:0];
      double v69 = [v72 rankingItem];

      char v73 = [v69 L2FeatureVector];
      [v73 scoreForFeature:1];
      float v75 = v74;

      unint64_t v76 = [v69 L2FeatureVector];
      [v76 scoreForFeature:41];
      float v78 = v77;

      if (+[PRSRankingItemRanker spellCorrectedAppMinQueryLen](PRSRankingItemRanker, "spellCorrectedAppMinQueryLen") < a8&& v75 == 1.0&& v78 == 0.0&& ([v103 isSpellCorrectPrefixMatchOnlyTopHitExcludedQuery] & 1) == 0)
      {
        ((void (**)(void, void *, void, void))v113)[2](v113, v68, v107, 0);

        char v79 = 1;
        goto LABEL_69;
      }
LABEL_63:

      goto LABEL_64;
    }
LABEL_66:
    char v79 = 0;
LABEL_69:

    id v22 = (id)v140[5];
    if ((v79 & 1) == 0) {
      goto LABEL_70;
    }
  }
LABEL_83:
  if (v101)
  {
    uint64_t v88 = [v22 mutableCopy];
    id v89 = (void *)v140[5];
    v140[5] = v88;

    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v90 = v22;
    uint64_t v91 = [v90 countByEnumeratingWithState:&v114 objects:v145 count:16];
    if (v91)
    {
      uint64_t v92 = *(void *)v115;
      do
      {
        for (uint64_t j = 0; j != v91; ++j)
        {
          if (*(void *)v115 != v92) {
            objc_enumerationMutation(v90);
          }
          uint64_t v94 = *(void **)(*((void *)&v114 + 1) + 8 * j);
          uint64_t v95 = objc_msgSend(v94, "bundleIdentifier", v99);
          int v96 = [v95 isEqualToString:@"com.apple.MobileAddressBook"];

          if (v96) {
            ((void (**)(void, void *, void, void))v113)[2](v113, v94, 0, 0);
          }
        }
        uint64_t v91 = [v90 countByEnumeratingWithState:&v114 objects:v145 count:16];
      }
      while (v91);
    }

    id v22 = (id)v140[5];
  }
  id v97 = v22;

  _Block_object_dispose(&v139, 8);
  return v97;
}

void __115__SSRankingManager_applyTopSectionPolicy_withTopHitSection_isPeopleSearch_queryKind_correction_queryLength_ranker___block_invoke(uint64_t a1, void *a2, int a3, char a4)
{
  id v14 = a2;
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "removeObject:");
  int v7 = *(_DWORD *)(a1 + 48) + a3;
  if ((a4 & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 52))
    {
      if ((unint64_t)[*(id *)(a1 + 32) count] >= 4)
      {
        id v8 = [v14 bundleIdentifier];
        char v9 = [v8 isEqualToString:@"com.apple.application"];

        if ((v9 & 1) == 0) {
          int v7 = *(_DWORD *)(a1 + 48) + 2;
        }
      }
    }
  }
  if (v7)
  {
    uint64_t v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v7];
    unint64_t v11 = [v10 bundleIdentifier];
    int v12 = [v11 isEqualToString:@"com.apple.searchd.suggestions"];

    uint64_t v13 = v7 + v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) insertObject:v14 atIndex:v13];
}

- (void)updateServerScoresUsingBlockOrder:(id)a3 bundleFeatures:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_isCancelled)
  {
    id v8 = objc_opt_new();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v42 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v57 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          id v15 = [v14 sectionBundleIdentifier];
          unint64_t v16 = [v7 objectForKey:v15];

          if (v16)
          {
            BOOL v17 = [v16 blockIdValue];

            if (v17)
            {
              unsigned int v18 = [v16 blockIdValue];
              uint64_t v19 = [v8 objectForKey:v18];

              if (!v19) {
                uint64_t v19 = objc_opt_new();
              }
              [v19 addObject:v14];
              uint64_t v20 = [v16 blockIdValue];
              [v8 setObject:v19 forKey:v20];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v56 objects:v63 count:16];
      }
      while (v11);
    }

    if ([v8 count])
    {
      id v41 = v7;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id obj = [v8 allKeys];
      uint64_t v21 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v53;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v53 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v25 = [v8 objectForKey:*(void *)(*((void *)&v52 + 1) + 8 * j)];
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v61 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              unsigned __int16 v28 = 0;
              uint64_t v29 = *(void *)v49;
              float v30 = 0.0;
              do
              {
                for (uint64_t k = 0; k != v27; ++k)
                {
                  if (*(void *)v49 != v29) {
                    objc_enumerationMutation(v25);
                  }
                  id v32 = *(void **)(*((void *)&v48 + 1) + 8 * k);
                  [v32 l2score];
                  [v32 l2score];
                  float v30 = v30 + v33;
                  ++v28;
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v48 objects:v61 count:16];
              }
              while (v27);
            }
            else
            {
              unsigned __int16 v28 = 0;
              float v30 = 0.0;
            }
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v34 = v25;
            uint64_t v35 = [v34 countByEnumeratingWithState:&v44 objects:v60 count:16];
            if (v35)
            {
              uint64_t v37 = v35;
              float v38 = v30 / (float)v28;
              uint64_t v39 = *(void *)v45;
              do
              {
                for (uint64_t m = 0; m != v37; ++m)
                {
                  if (*(void *)v45 != v39) {
                    objc_enumerationMutation(v34);
                  }
                  *(float *)&double v36 = v38;
                  [*(id *)(*((void *)&v44 + 1) + 8 * m) setL2score:v36];
                }
                uint64_t v37 = [v34 countByEnumeratingWithState:&v44 objects:v60 count:16];
              }
              while (v37);
            }
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
        }
        while (v22);
      }

      id v7 = v41;
    }

    id v6 = v42;
  }
}

+ (void)extractThresholdABValues:(id)a3 forLanguage:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  id v9 = (void *)sLastLanguage;
  if (!v7)
  {
    sLastLanguage = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
    goto LABEL_5;
  }
  if (![(id)sLastLanguage isEqualToString:v7])
  {
    objc_storeStrong((id *)&sLastLanguage, a4);
    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
    unint64_t v24 = [v8 localeIdentifier];
    if (v24)
    {
      id v4 = [v8 localeIdentifier];
      if ([v7 isEqualToString:v4])
      {

        goto LABEL_37;
      }
    }
    double v31 = [v8 languageCode];
    if (v31)
    {
      id v32 = [v8 languageCode];
      char v33 = [v7 isEqualToString:v32];

      if (v24)
      {
      }
      if (v33)
      {
LABEL_37:
        unint64_t v38 = [v7 length];
        if (v38 >= 2) {
          uint64_t v39 = 2;
        }
        else {
          uint64_t v39 = v38;
        }
        uint64_t v40 = [v7 substringToIndex:v39];

        uint64_t v20 = [v6 objectForKey:v40];
        id v7 = (id)v40;
        if (v20) {
          goto LABEL_46;
        }
LABEL_5:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 localeIdentifier];
          uint64_t v11 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
          uint64_t v12 = [v8 languageCode];
          uint64_t v13 = [v8 scriptCode];
          id v14 = [v8 countryCode];
          *(_DWORD *)long long v49 = 138413314;
          *(void *)&v49[4] = v10;
          *(_WORD *)&v49[12] = 2112;
          *(void *)&v49[14] = v11;
          __int16 v50 = 2112;
          long long v51 = v12;
          __int16 v52 = 2112;
          long long v53 = v13;
          __int16 v54 = 2112;
          long long v55 = v14;
          _os_log_impl(&dword_1BDB2A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Looking for thresholds for %@/%@/%@/%@/%@", v49, 0x34u);
        }
        if (!v7)
        {
          os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
          uint64_t v15 = [v8 languageCode];
          unint64_t v16 = (void *)sLastLanguage;
          sLastLanguage = v15;

          os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
        }
        uint64_t v17 = [v8 localeIdentifier];
        if (v17
          && (unsigned int v18 = (void *)v17,
              [v8 localeIdentifier],
              uint64_t v19 = objc_claimAutoreleasedReturnValue(),
              [v6 objectForKey:v19],
              uint64_t v20 = objc_claimAutoreleasedReturnValue(),
              v19,
              v18,
              v20))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = [v8 localeIdentifier];
            *(_DWORD *)long long v49 = 138412290;
            *(void *)&v49[4] = v21;
            uint64_t v22 = MEMORY[0x1E4F14500];
            uint64_t v23 = "Using thresholds for identifier %@";
LABEL_45:
            _os_log_impl(&dword_1BDB2A000, v22, OS_LOG_TYPE_DEFAULT, v23, v49, 0xCu);
          }
        }
        else
        {
          uint64_t v25 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
          if (v25
            && (uint64_t v26 = (void *)v25,
                [MEMORY[0x1E4F1CA20] _deviceLanguage],
                uint64_t v27 = objc_claimAutoreleasedReturnValue(),
                [v6 objectForKey:v27],
                uint64_t v20 = objc_claimAutoreleasedReturnValue(),
                v27,
                v26,
                v20))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v21 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
              *(_DWORD *)long long v49 = 138412290;
              *(void *)&v49[4] = v21;
              uint64_t v22 = MEMORY[0x1E4F14500];
              uint64_t v23 = "Using thresholds for system locale %@";
              goto LABEL_45;
            }
          }
          else
          {
            uint64_t v28 = [v8 languageCode];
            if (v28
              && (uint64_t v29 = (void *)v28,
                  [v8 languageCode],
                  float v30 = objc_claimAutoreleasedReturnValue(),
                  [v6 objectForKey:v30],
                  uint64_t v20 = objc_claimAutoreleasedReturnValue(),
                  v30,
                  v29,
                  v20))
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v21 = [v8 languageCode];
                *(_DWORD *)long long v49 = 138412290;
                *(void *)&v49[4] = v21;
                uint64_t v22 = MEMORY[0x1E4F14500];
                uint64_t v23 = "Using thresholds for language %@";
                goto LABEL_45;
              }
            }
            else
            {
              uint64_t v34 = [v8 scriptCode];
              if (v34
                && (uint64_t v35 = (void *)v34,
                    [v8 scriptCode],
                    double v36 = objc_claimAutoreleasedReturnValue(),
                    [v6 objectForKey:v36],
                    uint64_t v20 = objc_claimAutoreleasedReturnValue(),
                    v36,
                    v35,
                    v20))
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v21 = [v8 scriptCode];
                  *(_DWORD *)long long v49 = 138412290;
                  *(void *)&v49[4] = v21;
                  uint64_t v22 = MEMORY[0x1E4F14500];
                  uint64_t v23 = "Using thresholds for script %@";
                  goto LABEL_45;
                }
              }
              else
              {
                id v41 = [v8 countryCode];
                uint64_t v20 = [v6 objectForKey:v41];

                BOOL v42 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
                if (!v20)
                {
                  if (!v42) {
                    goto LABEL_48;
                  }
                  uint64_t v20 = [v8 localeIdentifier];
                  id v45 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
                  long long v46 = [v8 languageCode];
                  long long v47 = [v8 scriptCode];
                  long long v48 = [v8 countryCode];
                  *(_DWORD *)long long v49 = 138413314;
                  *(void *)&v49[4] = v20;
                  *(_WORD *)&v49[12] = 2112;
                  *(void *)&v49[14] = v45;
                  __int16 v50 = 2112;
                  long long v51 = v46;
                  __int16 v52 = 2112;
                  long long v53 = v47;
                  __int16 v54 = 2112;
                  long long v55 = v48;
                  _os_log_impl(&dword_1BDB2A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "no locale specific thresholds for %@/%@/%@/%@/%@", v49, 0x34u);

                  goto LABEL_47;
                }
                if (v42)
                {
                  uint64_t v21 = [v8 countryCode];
                  *(_DWORD *)long long v49 = 138412290;
                  *(void *)&v49[4] = v21;
                  uint64_t v22 = MEMORY[0x1E4F14500];
                  uint64_t v23 = "Using thresholds for country %@";
                  goto LABEL_45;
                }
              }
            }
          }
        }
LABEL_46:
        float v43 = +[SSCompactValueArray decodeFromDictionary:nesting:](SSCompactValueArray, "decodeFromDictionary:nesting:", v20, 1, *(_OWORD *)v49);
        os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
        long long v44 = (void *)sTopHitsThreshold;
        sTopHitsThreshold = (uint64_t)v43;
        id v45 = v43;

        os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
LABEL_47:

        goto LABEL_48;
      }
    }
    else
    {

      if (v24)
      {
      }
    }
    uint64_t v37 = [v6 objectForKey:v7];
    if (v37)
    {
      uint64_t v20 = (void *)v37;
      goto LABEL_46;
    }
    goto LABEL_37;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
LABEL_48:
}

+ (void)prepareTopHitsParametersForLanguage:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  id v5 = (id)[(id)sAllTopHitThresholds copy];
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  [a1 extractThresholdABValues:v5 forLanguage:v4];
}

+ (void)reloadTopHitsParametersFromTrial
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = SSDefaultsGetResources();
  id v4 = [v3 filePathForKey:@"TopHitsThreshold"];

  id v5 = SSDefaultsGetResources();
  id v6 = [v5 filePathForKey:@"TopHitsContinuationThresholds"];

  id v7 = SSDefaultsGetResources();
  id v8 = [v7 filePathForKey:@"TopHitsFilterSectionsBundleIds"];

  id v9 = SSValuesFromPlistWithPath(v4);
  uint64_t v10 = SSValuesFromPlistWithPath(v6);
  uint64_t v11 = [v10 objectForKey:@"thresholds"];
  long long v44 = v8;
  uint64_t v12 = SSValuesFromPlistWithPath(v8);
  uint64_t v13 = [v12 objectForKey:@"forbiddenSecondSections"];
  id v14 = [v12 objectForKey:@"poorSecondSections"];
  if ([v9 count])
  {
    id v41 = v10;
    float v43 = v6;
    os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
    uint64_t v15 = [v9 objectForKey:@"iOS"];
    unint64_t v16 = (void *)sAllTopHitThresholds;
    sAllTopHitThresholds = v15;

    uint64_t v17 = (void *)[(id)sAllTopHitThresholds copy];
    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
    [a1 extractThresholdABValues:v17 forLanguage:0];
    unsigned int v18 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v19 = [v17 objectForKey:@"default"];
    BOOL v20 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL v42 = v9;
    if (v19)
    {
      if (v20)
      {
        uint64_t v21 = [v18 localeIdentifier];
        [MEMORY[0x1E4F1CA20] _deviceLanguage];
        v22 = uint64_t v37 = v11;
        [v18 languageCode];
        uint64_t v23 = v36 = v13;
        [v18 scriptCode];
        v24 = uint64_t v39 = v4;
        uint64_t v25 = [v18 countryCode];
        *(_DWORD *)buf = 138413314;
        long long v46 = v21;
        __int16 v47 = 2112;
        long long v48 = v22;
        __int16 v49 = 2112;
        __int16 v50 = v23;
        __int16 v51 = 2112;
        __int16 v52 = v24;
        __int16 v53 = 2112;
        uint64_t v54 = (uint64_t)v25;
        _os_log_impl(&dword_1BDB2A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Getting fallback thresholds for %@/%@/%@/%@/%@", buf, 0x34u);

        id v4 = v39;
        uint64_t v13 = v36;

        uint64_t v11 = v37;
      }
    }
    else
    {
      if (v20)
      {
        uint64_t v26 = [v18 localeIdentifier];
        unint64_t v38 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
        uint64_t v27 = [v18 languageCode];
        [v18 scriptCode];
        uint64_t v28 = v40 = v4;
        [v18 countryCode];
        *(_DWORD *)buf = 138413314;
        long long v46 = v26;
        __int16 v47 = 2112;
        long long v48 = v38;
        __int16 v49 = 2112;
        __int16 v50 = v27;
        __int16 v51 = 2112;
        __int16 v52 = v28;
        v54 = __int16 v53 = 2112;
        uint64_t v29 = (void *)v54;
        _os_log_impl(&dword_1BDB2A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error found no fallback thresholds for %@/%@/%@/%@/%@", buf, 0x34u);

        id v4 = v40;
      }
      uint64_t v19 = &unk_1F18648D0;
    }
    uint64_t v30 = +[SSCompactValueArray decodeFromDictionary:v19 nesting:1];
    os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
    double v31 = (void *)sFallbackTopHitsThreshold;
    sFallbackTopHitsThreshold = v30;

    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
    id v9 = v42;
    id v6 = v43;
    uint64_t v10 = v41;
  }
  if ([v11 count])
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
    objc_storeStrong((id *)&sTopHitsContinuationThreshold, v11);
    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  }
  if ([v13 count])
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
    uint64_t v32 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
    char v33 = (void *)sForbiddenSecondSections;
    sForbiddenSecondSections = v32;

    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  }
  if ([v14 count])
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
    uint64_t v34 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
    uint64_t v35 = (void *)sPoorSecondSections;
    sPoorSecondSections = v34;

    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  }
}

+ (void)reloadCommittedSearchParametersFromTrial
{
  uint64_t v2 = SSDefaultsGetResources();
  id v3 = [v2 filePathForKey:@"CommittedSearchDemotions"];

  id v4 = SSValuesFromPlistWithPath(v3);
  id obj = [v4 objectForKey:@"demoteNonExactMatchBundle"];
  id v5 = [v4 objectForKey:@"legacyTophitSection"];
  if ([obj count])
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
    objc_storeStrong((id *)&sDemoteNonExactMatchBundle, obj);
    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  }
  if ([v5 count])
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    id v7 = (void *)sLegacyTophitSection;
    sLegacyTophitSectiounint64_t n = v6;

    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  }
}

+ (id)getForbiddenSecondSections
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  id v0 = (id)sForbiddenSecondSections;
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  return v0;
}

+ (id)getPoorSecondSections
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  id v0 = (id)sPoorSecondSections;
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  return v0;
}

+ (id)getDemoteNonExactMatchBundle
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  id v0 = (id)sDemoteNonExactMatchBundle;
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  return v0;
}

+ (__CFString)defaultKey
{
  return @"default";
}

+ (id)getTopHitsThresholdsForBundleId:(unint64_t)a3 queryLength:(unint64_t)a4 queryTermCount:(char)a5 getFallback:
{
  id v8 = a2;
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  if (a5)
  {
    id v9 = (id *)sFallbackTopHitsThreshold;
  }
  else
  {
    id v9 = (id *)sTopHitsThreshold;
    if (!sTopHitsThreshold)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
      uint64_t v10 = 0;
      goto LABEL_7;
    }
  }
  uint64_t v10 = getTrialDictionaryForLengthAndTermCount(v9, a3, a4);
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  if (v10)
  {
    uint64_t v11 = [v10 objectForKey:v8];
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v11 = 0;
LABEL_8:

  return v11;
}

+ (id)getTopHitsThresholdsForBundleId:(uint64_t)a1
{
  id v2 = a2;
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  -[SSCompactValueArray defaultValue]((id *)sTopHitsThreshold);
  id v3 = (id *)objc_claimAutoreleasedReturnValue();
  id v4 = -[SSCompactValueArray defaultValue](v3);
  id v5 = [v4 objectForKey:v2];

  if (!v5)
  {
    id v5 = [v4 objectForKey:@"default"];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);

  return v5;
}

+ (id)getTopHitsContinuationThresholds
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  id v0 = (id)sTopHitsContinuationThreshold;
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  return v0;
}

+ (void)reloadSuggestionsRankingThresholds
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = SSDefaultsGetResources();
  id v3 = [v2 filePathForKey:@"SuggestionsRankingThresholds"];

  if ([v3 length])
  {
    id v4 = SSValuesFromPlistWithPath(v3);
    id v5 = [v4 objectForKey:@"rankingparameters"];
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = (void *)MEMORY[0x1E4F28ED0];
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "doubleValue", (void)v16);
          uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
          [v6 addObject:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    if ([v6 count]) {
      id v14 = v6;
    }
    else {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  uint64_t v15 = (void *)sSuggestionsRankingThresholds;
  sSuggestionsRankingThresholds = (uint64_t)v14;

  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
}

+ (id)keyForIntervalType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return off_1E634C610[a3];
  }
}

+ (uint64_t)getRecencyIntervalForBundleId:(uint64_t)a3 intervalType:(unint64_t)a4 indexRequired:
{
  id v6 = a2;
  self;
  id v7 = [(id)objc_opt_class() keyForIntervalType:a3];
  if (v7)
  {
    pthread_rwlock_rdlock(&sIntervalsLock);
    uint64_t v8 = [(id)sRecencyThresholds objectForKey:v7];
    pthread_rwlock_unlock(&sIntervalsLock);
    if (v8)
    {
      uint64_t v9 = [v8 objectForKey:v6];
      if (v9)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (a4 == -1 || (isKindOfClass & 1) == 0 || [v9 count] <= a4)
        {
          id v11 = v9;
        }
        else
        {
          id v11 = [v9 objectAtIndex:a4];
        }
      }
      else
      {
        id v11 = [v8 objectForKey:@"default"];
      }
      uint64_t v13 = v11;
      uint64_t v12 = [v11 integerValue];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (uint64_t)getRecencyIntervalForBundleType:(uint64_t)a3 intervalType:(unint64_t)a4 indexRequired:
{
  id v6 = a2;
  self;
  id v7 = [(id)objc_opt_class() keyForIntervalType:a3];
  if (v7)
  {
    pthread_rwlock_rdlock(&sIntervalsLock);
    uint64_t v8 = [(id)sRecencyThresholds objectForKey:v7];
    pthread_rwlock_unlock(&sIntervalsLock);
    if (v8)
    {
      uint64_t v9 = [v6 stringValue];
      uint64_t v10 = [v8 objectForKey:v9];

      if (v10)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (a4 == -1 || (isKindOfClass & 1) == 0 || [v10 count] <= a4)
        {
          id v12 = v10;
        }
        else
        {
          id v12 = [v10 objectAtIndex:a4];
        }
      }
      else
      {
        id v12 = [v8 objectForKey:@"default"];
      }
      id v14 = v12;
      uint64_t v13 = [v12 integerValue];
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (void)reloadRecencyThresholds
{
  id v2 = SSDefaultsGetResources();
  id v6 = [v2 filePathForKey:@"RecencyIntervals"];

  if ([v6 length])
  {
    id v3 = SSValuesFromPlistWithPath(v6);
    pthread_rwlock_wrlock(&sIntervalsLock);
    uint64_t v4 = [v3 objectForKey:@"iOS"];
    id v5 = (void *)sRecencyThresholds;
    sRecencyThresholds = v4;

    if (!sRecencyThresholds) {
      objc_storeStrong((id *)&sRecencyThresholds, v3);
    }
    pthread_rwlock_unlock(&sIntervalsLock);
  }
  MEMORY[0x1F41817F8]();
}

+ (uint64_t)isKeywordsHidingEnabledForLanguage:(uint64_t)a1
{
  id v2 = a2;
  self;
  pthread_rwlock_rdlock(&sLocaleSpecificMatchingLock);
  id v3 = [(id)sLocaleSpecificMatchingKeywordsHiding objectForKey:v2];

  if (v3)
  {
    pthread_rwlock_unlock(&sLocaleSpecificMatchingLock);
LABEL_4:
    id v4 = v3;
    uint64_t v5 = [v4 BOOLValue];

    return v5;
  }
  id v3 = [(id)sLocaleSpecificMatchingKeywordsHiding objectForKey:@"default"];
  pthread_rwlock_unlock(&sLocaleSpecificMatchingLock);
  if (v3) {
    goto LABEL_4;
  }
  return 1;
}

+ (uint64_t)getMinMisspellingLengthForLanguage:(uint64_t)a1
{
  id v2 = a2;
  self;
  pthread_rwlock_rdlock(&sLocaleSpecificMatchingLock);
  id v3 = [(id)sLocaleSpecificMatchingMinMisspellingLength objectForKey:v2];

  if (v3)
  {
    pthread_rwlock_unlock(&sLocaleSpecificMatchingLock);
LABEL_4:
    id v4 = v3;
    uint64_t v5 = [v4 integerValue];

    return v5;
  }
  id v3 = [(id)sLocaleSpecificMatchingMinMisspellingLength objectForKey:@"default"];
  pthread_rwlock_unlock(&sLocaleSpecificMatchingLock);
  if (v3) {
    goto LABEL_4;
  }
  return 4;
}

+ (void)reloadLocaleSpecificMatchingParameters
{
  id v2 = SSDefaultsGetResources();
  uint64_t v10 = [v2 filePathForKey:@"LocaleSpecificMatching"];

  if ([v10 length])
  {
    id v3 = SSValuesFromPlistWithPath(v10);
    pthread_rwlock_wrlock(&sLocaleSpecificMatchingLock);
    id v4 = [v3 objectForKey:@"keywords_hiding"];
    uint64_t v5 = [v4 objectForKey:@"iOS"];
    id v6 = (void *)sLocaleSpecificMatchingKeywordsHiding;
    sLocaleSpecificMatchingKeywordsHiding = v5;

    if (!sLocaleSpecificMatchingKeywordsHiding) {
      objc_storeStrong((id *)&sLocaleSpecificMatchingKeywordsHiding, v4);
    }
    id v7 = [v3 objectForKey:@"min_misspelling_length"];
    uint64_t v8 = [v7 objectForKey:@"iOS"];
    uint64_t v9 = (void *)sLocaleSpecificMatchingMinMisspellingLength;
    sLocaleSpecificMatchingMinMisspellingLength = v8;

    if (!sLocaleSpecificMatchingMinMisspellingLength) {
      objc_storeStrong((id *)&sLocaleSpecificMatchingMinMisspellingLength, v7);
    }
    pthread_rwlock_unlock(&sLocaleSpecificMatchingLock);
  }
  MEMORY[0x1F41817F8]();
}

+ (id)getSuggestionsRankingThresholds
{
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  id v2 = (id)sSuggestionsRankingThresholds;
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  return v2;
}

+ (void)reloadRankingParametersFromTrial
{
  [(id)objc_opt_class() reloadTopHitsParametersFromTrial];
  [(id)objc_opt_class() reloadCommittedSearchParametersFromTrial];
  [(id)objc_opt_class() reloadSuggestionsRankingThresholds];
  [(id)objc_opt_class() reloadRecencyThresholds];
  id v2 = objc_opt_class();
  [v2 reloadLocaleSpecificMatchingParameters];
}

- (id)CEPValuesForTTR
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = (__CFString *)objc_opt_new();
  id v4 = [(SSRankingManager *)self rankingConfiguration];
  [v4 lock];

  uint64_t v5 = [(SSRankingManager *)self rankingConfiguration];
  id v6 = [v5 queryDependentCategoryProbabilities];

  if ([v6 count])
  {
    long long v19 = self;
    -[__CFString appendFormat:](v3, "appendFormat:", @"Got %lu CEP values from response: \n", [v6 count]);
    id v7 = [v6 keysSortedByValueUsingSelector:sel_compare_];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v13 = [v12 lowercaseString];
          id v14 = [v6 objectForKey:v13];

          if (v14) {
            [(__CFString *)v3 appendFormat:@"%@\t:%@\n", v12, v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }
    [(__CFString *)v3 appendFormat:@"\n"];

    self = v19;
  }
  uint64_t v15 = [(SSRankingManager *)self rankingConfiguration];
  [v15 unlock];

  if ([(__CFString *)v3 length]) {
    long long v16 = v3;
  }
  else {
    long long v16 = &stru_1F1824018;
  }
  long long v17 = v16;

  return v17;
}

- (void)addCEPValuesForTTR
{
  if (self->_logValues)
  {
    id v3 = [(SSRankingManager *)self rankingConfiguration];
    id v4 = [v3 queryDependentCategoryProbabilities];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      logValues = self->_logValues;
      id v7 = [(SSRankingManager *)self CEPValuesForTTR];
      [(NSMutableString *)logValues appendString:v7];
    }
  }
}

- (void)finalizeLog
{
  if (isInternalDevice)
  {
    [(SSRankingManager *)self addCEPValuesForTTR];
    id v3 = SSDefaultsGetResources();
    id v5 = [v3 getTTRLogs];

    id v4 = v5;
    if (v5)
    {
      [(NSMutableString *)self->_logValues appendString:v5];
      id v4 = v5;
    }
  }
}

- (void)sendTTRLogsWithSections:(id)a3 searchString:(id)a4 queryKind:(unint64_t)a5 isCommittedSearch:(BOOL)a6 parsecCameLaterThanSRT:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v116 = a4;
  id v117 = a4;
  logValues = self->_logValues;
  id v14 = [(SSRankingManager *)self query];
  [(NSMutableString *)logValues appendFormat:@"Query: %@\n", v14];

  BOOL v128 = v8;
  [(NSMutableString *)self->_logValues appendFormat:@"Committed search: %d\n", v8];
  unint64_t v131 = a5;
  [(NSMutableString *)self->_logValues appendFormat:@"Query kind: %lu\n", a5];
  BOOL v129 = v7;
  if (v7) {
    [(NSMutableString *)self->_logValues appendString:@"\nParsec came later than timeout\n"];
  }
  uint64_t v15 = objc_opt_new();
  long long v130 = [MEMORY[0x1E4F28E78] string];
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id obj = v12;
  uint64_t v120 = [obj countByEnumeratingWithState:&v144 objects:v153 count:16];
  if (v120)
  {
    LODWORD(v133) = 0;
    uint64_t v139 = 1;
    uint64_t v119 = *(void *)v145;
    uint64_t v136 = self;
    long long v127 = v15;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v145 != v119) {
          objc_enumerationMutation(obj);
        }
        uint64_t v121 = v16;
        long long v17 = *(void **)(*((void *)&v144 + 1) + 8 * v16);
        long long v18 = self->_logValues;
        long long v19 = [v17 bundleIdentifier];
        uint64_t v133 = (v133 + 1);
        [(NSMutableString *)v18 appendFormat:@"Section %d bundleID:%@\n", v133, v19, v116];

        long long v142 = 0u;
        long long v143 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        id v135 = [v17 resultSet];
        uint64_t v20 = [v135 countByEnumeratingWithState:&v140 objects:v152 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v141;
          long long v124 = v17;
          uint64_t v132 = *(void *)v141;
          do
          {
            uint64_t v23 = 0;
            uint64_t v134 = v21;
            do
            {
              if (*(void *)v141 != v22) {
                objc_enumerationMutation(v135);
              }
              id v24 = *(id *)(*((void *)&v140 + 1) + 8 * v23);
              if (([v15 containsObject:v24] & 1) == 0)
              {
                [v15 addObject:v24];
                uint64_t v25 = [v24 rankingItem];
                unsigned int v26 = [v25 hasShortCut];
                char v138 = [v25 L2FeatureVector];
                uint64_t v27 = objc_opt_new();
                uint64_t v28 = [v24 identifier];
                uint64_t v29 = [v17 bundleIdentifier];
                uint64_t v30 = SSRedactSuggestionIdentifier(v28, v29);
                [v27 setObject:v30 forKeyedSubscript:@"identifier"];

                double v31 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v139);
                [v27 setObject:v31 forKeyedSubscript:@"ResultPosition"];

                uint64_t v32 = [v24 title];
                char v33 = [v32 text];

                uint64_t v34 = NSString;
                BOOL v137 = v33;
                uint64_t v35 = SSRedactString(v33, 1);
                double v36 = [v34 stringWithFormat:@"%@", v35];
                [v27 setObject:v36 forKeyedSubscript:@"ResultTitle"];

                uint64_t v37 = NSString;
                unint64_t v38 = [v24 applicationBundleIdentifier];
                uint64_t v39 = v38;
                if (!v38)
                {
                  long long v125 = [v24 resultBundleId];
                  uint64_t v39 = v125;
                }
                uint64_t v40 = [v37 stringWithFormat:@"%@", v39];
                [v27 setObject:v40 forKeyedSubscript:@"ResultBundle"];

                if (!v38) {
                id v41 = NSString;
                }
                [v138 originalL2Score];
                float v43 = objc_msgSend(v41, "stringWithFormat:", @"%.3f", v42);
                [v27 setObject:v43 forKeyedSubscript:@"originalL2"];

                long long v44 = NSString;
                [v138 experimentalScore];
                long long v46 = objc_msgSend(v44, "stringWithFormat:", @"%.3f", v45);
                [v27 setObject:v46 forKeyedSubscript:@"experimentalScore"];

                __int16 v47 = NSString;
                [v25 rawScore];
                __int16 v49 = objc_msgSend(v47, "stringWithFormat:", @"%.3f", v48);
                [v27 setObject:v49 forKeyedSubscript:@"rawScore"];

                __int16 v50 = NSString;
                [v25 score];
                __int16 v52 = objc_msgSend(v50, "stringWithFormat:", @"%.3f", v51);
                [v27 setObject:v52 forKeyedSubscript:@"score"];

                __int16 v53 = NSString;
                [v24 l2score];
                uint64_t v55 = objc_msgSend(v53, "stringWithFormat:", @"%.3f", v54);
                [v27 setObject:v55 forKeyedSubscript:@"L2score"];

                uint64_t v56 = NSString;
                [v138 scoreForFeature:386];
                long long v58 = objc_msgSend(v56, "stringWithFormat:", @"%.3f", v57);
                [v27 setObject:v58 forKeyedSubscript:@"parsecEnumScore"];

                long long v59 = NSString;
                [v138 withinBundleScore];
                uint64_t v61 = objc_msgSend(v59, "stringWithFormat:", @"%.3f", v60);
                [v27 setObject:v61 forKeyedSubscript:@"L2VectorWithinBundleScore"];

                uint64_t v62 = NSString;
                [v25 withinBundleScore];
                uint64_t v64 = objc_msgSend(v62, "stringWithFormat:", @"%.3f", v63);
                [v27 setObject:v64 forKeyedSubscript:@"withinBundleScore"];

                uint64_t v65 = NSString;
                [v138 scoreForFeature:366];
                uint64_t v67 = objc_msgSend(v65, "stringWithFormat:", @"%.6f", v66);
                [v27 setObject:v67 forKeyedSubscript:@"cep"];

                double v68 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v24, "topHit"));
                [v27 setObject:v68 forKeyedSubscript:@"topHit"];

                double v69 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v24, "blockId"));
                [v27 setObject:v69 forKeyedSubscript:@"blockId"];

                BOOL v70 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v24, "isSafariTopHit"));
                [v27 setObject:v70 forKeyedSubscript:@"safariTophit"];

                int v71 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v26);
                [v27 setObject:v71 forKeyedSubscript:@"hasShortcut"];

                uint64_t v72 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v24, "isFuzzyMatch"));
                [v27 setObject:v72 forKeyedSubscript:@"isFuzzyMatch"];

                char v73 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v24, "shouldUseCompactDisplay"));
                [v27 setObject:v73 forKeyedSubscript:@"shouldUseCompactDisplay"];

                float v74 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v24, "usesCompactDisplay"));
                [v27 setObject:v74 forKeyedSubscript:@"usesCompactDisplay"];

                float v75 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v25, "shouldHideUnderShowMore"));
                [v27 setObject:v75 forKeyedSubscript:@"shouldHideUnderShowMore"];

                unint64_t v76 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v25, "photosMatch"));
                [v27 setObject:v76 forKeyedSubscript:@"photosMatch"];

                float v77 = NSString;
                [v25 keywordMatchScore];
                char v79 = objc_msgSend(v77, "stringWithFormat:", @"%.3f", v78);
                [v27 setObject:v79 forKeyedSubscript:@"topicality"];

                id v80 = NSString;
                [v25 engagementScore];
                long long v82 = objc_msgSend(v80, "stringWithFormat:", @"%.3f", v81);
                [v27 setObject:v82 forKeyedSubscript:@"engagement"];

                id v83 = NSString;
                [v25 freshnessScore];
                uint64_t v85 = objc_msgSend(v83, "stringWithFormat:", @"%.3f", v84);
                [v27 setObject:v85 forKeyedSubscript:@"freshness"];

                double v86 = NSString;
                [v25 likelihood];
                uint64_t v88 = objc_msgSend(v86, "stringWithFormat:", @"%.3f", v87);
                [v27 setObject:v88 forKeyedSubscript:@"likelihood"];

                id v89 = NSString;
                [v25 l2Score];
                uint64_t v91 = objc_msgSend(v89, "stringWithFormat:", @"%.3f", v90);
                [v27 setObject:v91 forKeyedSubscript:@"PommesL2score"];

                uint64_t v92 = NSString;
                [v25 pommesL1Score];
                uint64_t v94 = objc_msgSend(v92, "stringWithFormat:", @"%.3f", v93);
                [v27 setObject:v94 forKeyedSubscript:@"PommesL1score"];

                uint64_t v95 = NSString;
                [v25 embeddingSimilarity];
                id v97 = objc_msgSend(v95, "stringWithFormat:", @"%.3f", v96);
                [v27 setObject:v97 forKeyedSubscript:@"embeddingSimilarity"];

                if (SSResultTypeIsLocalSuggestion([v24 type]))
                {
                  int v98 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v24, "type"));
                  [v27 setObject:v98 forKeyedSubscript:@"type"];

                  int v99 = NSString;
                  [v24 rankingScore];
                  BOOL v101 = objc_msgSend(v99, "stringWithFormat:", @"%f", v100);
                  [v27 setObject:v101 forKeyedSubscript:@"compositeScore"];
                }
                uint64_t v102 = +[SSRankingManager jsonStringFromDictionary:v27];
                [v130 appendString:v102];

                [v130 appendString:@"\n\n"];
                self = v136;
                [(NSMutableString *)v136->_logValues appendString:v130];
                [v130 setString:&stru_1F1824018];
                id v103 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v129);
                [v27 setObject:v103 forKeyedSubscript:@"parsecCameLaterThanSRT"];

                id v104 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v128);
                [v27 setObject:v104 forKeyedSubscript:@"isCommittedSearch"];

                float v105 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v131);
                [v27 setObject:v105 forKeyedSubscript:@"queryKind"];

                uint64_t v106 = NSString;
                unsigned int v107 = [v17 bundleIdentifier];
                unint64_t v108 = [v106 stringWithFormat:@"%d %@", v133, v107];
                [v27 setObject:v108 forKeyedSubscript:@"Section"];

                int v109 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v24, "coreSpotlightIndexUsed"));
                [v27 setObject:v109 forKeyedSubscript:@"coreSpotlightIndexUsed"];

                uint64_t v110 = SSGeneralLog();
                if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
                {
                  char v111 = _os_feature_enabled_impl();
                  uint64_t v112 = [(SSRankingManager *)v136 query];
                  uint64_t v113 = v112;
                  if (v111)
                  {
                    long long v114 = v112;
                  }
                  else
                  {
                    SSRedactString(v112, 0);
                    v123 = long long v122 = v113;
                    uint64_t v113 = v123;
                    long long v114 = v126;
                  }
                  long long v115 = +[SSRankingManager jsonStringFromDictionary:v27];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v149 = v113;
                  __int16 v150 = 2112;
                  uint64_t v151 = v115;
                  _os_log_impl(&dword_1BDB2A000, v110, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] FinalResults: query=%@ %@", buf, 0x16u);
                  long long v126 = v114;
                  if ((v111 & 1) == 0)
                  {

                    long long v114 = v122;
                  }

                  self = v136;
                  uint64_t v15 = v127;
                  long long v17 = v124;
                }
                else
                {
                  uint64_t v15 = v127;
                }
                uint64_t v22 = v132;

                uint64_t v139 = (v139 + 1);
                uint64_t v21 = v134;
              }

              ++v23;
            }
            while (v21 != v23);
            uint64_t v21 = [v135 countByEnumeratingWithState:&v140 objects:v152 count:16];
          }
          while (v21);
        }

        uint64_t v16 = v121 + 1;
      }
      while (v121 + 1 != v120);
      uint64_t v120 = [obj countByEnumeratingWithState:&v144 objects:v153 count:16];
    }
    while (v120);
  }

  if (self->_logValues
    && [obj count]
    && (!sLastQueryString || ([(id)sLastQueryString isEqualToString:v117] & 1) == 0))
  {
    objc_storeStrong((id *)&sLastQueryString, v116);
  }
  if (v131 && [obj count]) {
    [(SSRankingManager *)self finalizeLog];
  }
}

+ (void)fillRankingPosition:(id)a3
{
  id v18 = a3;
  if ([v18 count])
  {
    uint64_t v3 = 0;
    LODWORD(v4) = 0;
    do
    {
      id v5 = [v18 objectAtIndexedSubscript:v3];
      id v6 = [v5 resultSet];
      uint64_t v7 = [v6 count];

      uint64_t v4 = (v4 + 1);
      if (v7)
      {
        uint64_t v8 = 0;
        uint64_t v9 = 1;
        do
        {
          uint64_t v10 = [v5 resultSet];
          id v11 = [v10 objectAtIndexedSubscript:v8];

          id v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v4];
          [v11 setIndexOfSectionWhenRanked:v12];

          uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v9];
          [v11 setIndexOfResultInSectionWhenRanked:v13];

          uint64_t v8 = v9;
          id v14 = [v5 resultSet];
          unint64_t v15 = [v14 count];

          BOOL v16 = v15 > v9;
          uint64_t v9 = (v9 + 1);
        }
        while (v16);
      }

      unint64_t v17 = [v18 count];
      uint64_t v3 = v4;
    }
    while (v17 > v4);
  }
}

+ (id)processSearchToolFinalResults:(id)a3 queryContext:(id)a4
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (processSearchToolFinalResults_queryContext__onceToken != -1) {
    dispatch_once(&processSearchToolFinalResults_queryContext__onceToken, &__block_literal_global_1051);
  }
  uint64_t v7 = SSGeneralLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v115) = [v6 isAppEntitySearch];
    _os_log_impl(&dword_1BDB2A000, v7, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] isAppEntitySearch=%d", buf, 8u);
  }
  uint64_t v81 = v6;

  id v80 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v8 = v5;
  uint64_t v85 = [v8 countByEnumeratingWithState:&v110 objects:v124 count:16];
  if (!v85)
  {

    goto LABEL_83;
  }
  id v9 = 0;
  uint64_t v84 = *(void *)v111;
  uint64_t v10 = &_SpotlightDefineRankingTypes_[364];
  id v82 = v8;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v111 != v84) {
        objc_enumerationMutation(v8);
      }
      id v12 = *(void **)(*((void *)&v110 + 1) + 8 * v11);
      if (processSearchToolFinalResults_queryContext__isSearchToolAllBundlesEnabled)
      {
        [*(id *)(*((void *)&v110 + 1) + 8 * v11) setIsInitiallyHidden:0];
        uint64_t v13 = [v12 resultSet];
        objc_msgSend(v12, "setMaxInitiallyVisibleResults:", objc_msgSend(v13, "count"));

        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        id v14 = [v12 resultSet];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v106 objects:v123 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v107;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v107 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v19 = [*(id *)(*((void *)&v106 + 1) + 8 * i) rankingItem];
              [v19 setShouldHideUnderShowMore:0];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v106 objects:v123 count:16];
          }
          while (v16);
        }

        if (v9)
        {
          uint64_t v20 = v11;
          long long v104 = 0u;
          long long v105 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          uint64_t v21 = [v12 resultSet];
          uint64_t v22 = [v21 countByEnumeratingWithState:&v102 objects:v122 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v103;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v103 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void *)(*((void *)&v102 + 1) + 8 * j);
                uint64_t v27 = [v9 resultSet];
                [v27 addObject:v26];

                objc_msgSend(v9, "setMaxInitiallyVisibleResults:", objc_msgSend(v9, "maxInitiallyVisibleResults") + 1);
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v102 objects:v122 count:16];
            }
            while (v23);
          }
          goto LABEL_43;
        }
LABEL_45:
        id v9 = v12;
        goto LABEL_76;
      }
      uint64_t v28 = (void *)*((void *)v10 + 263);
      uint64_t v29 = [v12 bundleIdentifier];
      LODWORD(v28) = [v28 containsObject:v29];

      if (v28)
      {
        [v12 setIsInitiallyHidden:0];
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        uint64_t v30 = [v12 resultSet];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v98 objects:v121 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v99;
          do
          {
            for (uint64_t k = 0; k != v32; ++k)
            {
              if (*(void *)v99 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = [*(id *)(*((void *)&v98 + 1) + 8 * k) rankingItem];
              [v35 setShouldHideUnderShowMore:0];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v98 objects:v121 count:16];
          }
          while (v32);
        }

        double v36 = [v12 resultSet];
        objc_msgSend(v12, "setMaxInitiallyVisibleResults:", objc_msgSend(v36, "count"));

        if (v9)
        {
          uint64_t v20 = v11;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          uint64_t v21 = [v12 resultSet];
          uint64_t v37 = [v21 countByEnumeratingWithState:&v94 objects:v120 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v95;
            do
            {
              for (uint64_t m = 0; m != v38; ++m)
              {
                if (*(void *)v95 != v39) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v41 = *(void *)(*((void *)&v94 + 1) + 8 * m);
                float v42 = [v9 resultSet];
                [v42 addObject:v41];

                objc_msgSend(v9, "setMaxInitiallyVisibleResults:", objc_msgSend(v9, "maxInitiallyVisibleResults") + 1);
              }
              uint64_t v38 = [v21 countByEnumeratingWithState:&v94 objects:v120 count:16];
            }
            while (v38);
          }
LABEL_43:

LABEL_44:
          uint64_t v11 = v20;
          goto LABEL_76;
        }
        goto LABEL_45;
      }
      float v43 = [v12 bundleIdentifier];
      int v44 = [v43 isEqualToString:@"com.apple.spotlight.tophits"];

      if (v44)
      {
        float v45 = [v12 results];
        if ([v45 count])
        {
          uint64_t v20 = v11;
          long long v46 = (void *)*((void *)v10 + 263);
          __int16 v47 = [v12 resultSet];
          float v48 = [v47 objectAtIndexedSubscript:0];
          __int16 v49 = [v48 rankingItem];
          __int16 v50 = [v49 sectionBundleIdentifier];
          LODWORD(v46) = [v46 containsObject:v50];

          uint64_t v10 = _SpotlightDefineRankingTypes_ + 1456;
          if (v46)
          {
            if (v9)
            {
              long long v92 = 0u;
              long long v93 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              float v51 = [v12 resultSet];
              uint64_t v52 = [v51 countByEnumeratingWithState:&v90 objects:v119 count:16];
              if (v52)
              {
                uint64_t v53 = v52;
                uint64_t v54 = *(void *)v91;
                do
                {
                  for (uint64_t n = 0; n != v53; ++n)
                  {
                    if (*(void *)v91 != v54) {
                      objc_enumerationMutation(v51);
                    }
                    uint64_t v56 = *(void *)(*((void *)&v90 + 1) + 8 * n);
                    float v57 = [v9 resultSet];
                    [v57 addObject:v56];

                    objc_msgSend(v9, "setMaxInitiallyVisibleResults:", objc_msgSend(v9, "maxInitiallyVisibleResults") + 1);
                  }
                  uint64_t v53 = [v51 countByEnumeratingWithState:&v90 objects:v119 count:16];
                }
                while (v53);
              }

              id v8 = v82;
            }
            else
            {
              id v9 = v12;
            }
          }
          goto LABEL_44;
        }
      }
      else
      {
        uint64_t v83 = v11;
        id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v59 = [v12 resultSet];
        uint64_t v60 = [v59 countByEnumeratingWithState:&v86 objects:v118 count:16];
        if (v60)
        {
          uint64_t v61 = v60;
          uint64_t v62 = *(void *)v87;
          do
          {
            for (iuint64_t i = 0; ii != v61; ++ii)
            {
              if (*(void *)v87 != v62) {
                objc_enumerationMutation(v59);
              }
              uint64_t v64 = *(void **)(*((void *)&v86 + 1) + 8 * ii);
              uint64_t v65 = [v64 rankingItem];
              int v66 = [v65 isAppEntity];

              if (v66) {
                [v58 addObject:v64];
              }
            }
            uint64_t v61 = [v59 countByEnumeratingWithState:&v86 objects:v118 count:16];
          }
          while (v61);
        }

        if ([v58 count])
        {
          id v8 = v82;
          uint64_t v11 = v83;
          if (v9)
          {
            uint64_t v67 = [v9 resultSet];
            [v67 addObjectsFromArray:v58];

            objc_msgSend(v9, "setMaxInitiallyVisibleResults:", objc_msgSend(v9, "maxInitiallyVisibleResults") + objc_msgSend(v58, "count"));
          }
          else
          {
            id v9 = v12;
            uint64_t v72 = [v9 resultSet];
            [v72 removeAllObjects];

            [v9 addResultsFromArray:v58];
          }
        }
        else
        {
          double v68 = SSGeneralLog();
          id v8 = v82;
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            double v69 = [v81 searchString];
            BOOL v70 = SSRedactString(v69, 1);
            int v71 = [v12 bundleIdentifier];
            *(_DWORD *)buf = 138412546;
            long long v115 = v70;
            __int16 v116 = 2112;
            id v117 = v71;
            _os_log_impl(&dword_1BDB2A000, v68, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ Filtering section %@", buf, 0x16u);
          }
          uint64_t v11 = v83;
        }

        uint64_t v10 = &_SpotlightDefineRankingTypes_[364];
      }
LABEL_76:
      ++v11;
    }
    while (v11 != v85);
    uint64_t v73 = [v8 countByEnumeratingWithState:&v110 objects:v124 count:16];
    uint64_t v85 = v73;
  }
  while (v73);

  if (v9)
  {
    float v74 = v81;
    +[SSRankingManager searchToolRanker:v9 queryContext:v81 searchToolBundles:*((void *)v10 + 263)];
    [v9 setBundleIdentifier:@"com.apple.spotlight.tophits"];
    [v9 setTitle:@"Top Hit"];
    [v9 setGroupId:&unk_1F1860EF0];
    float v75 = [v9 resultSet];
    objc_msgSend(v9, "setMaxInitiallyVisibleResults:", objc_msgSend(v75, "count"));

    [v80 addObject:v9];
    goto LABEL_86;
  }
LABEL_83:
  unint64_t v76 = SSGeneralLog();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    float v77 = [v81 searchString];
    float v78 = SSRedactString(v77, 1);
    *(_DWORD *)buf = 138412290;
    long long v115 = v78;
    _os_log_impl(&dword_1BDB2A000, v76, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ No results to rank", buf, 0xCu);
  }
  id v9 = 0;
  float v74 = v81;
LABEL_86:

  return v80;
}

uint64_t __63__SSRankingManager_processSearchToolFinalResults_queryContext___block_invoke()
{
  v10[14] = *MEMORY[0x1E4F143B8];
  int v0 = _os_feature_enabled_impl();
  uint64_t v1 = (void *)MEMORY[0x1E4F1CAD0];
  if (v0)
  {
    v10[0] = @"com.apple.DocumentsApp";
    v10[1] = @"com.apple.CloudDocs.MobileDocumentsFileProvider";
    v10[2] = @"com.apple.CloudDocs.iCloudDriveFileProvider";
    v10[3] = @"com.apple.CloudDocs.iCloudDriveFileProviderManaged";
    v10[4] = @"com.apple.mobilemail";
    v10[5] = @"com.apple.mobilecal";
    v10[6] = @"com.apple.MobileSMS";
    v10[7] = @"com.apple.reminders";
    v10[8] = @"com.apple.spotlight.events";
    v10[9] = @"com.apple.Passbook";
    v10[10] = @"com.apple.mobilenotes";
    v10[11] = @"com.apple.Music";
    v10[12] = @"com.apple.Keynote";
    v10[13] = @"com.apple.Pages";
    id v2 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v3 = v10;
    uint64_t v4 = 14;
  }
  else
  {
    v9[0] = @"com.apple.DocumentsApp";
    v9[1] = @"com.apple.journal";
    v9[2] = @"com.apple.CloudDocs.MobileDocumentsFileProvider";
    v9[3] = @"com.apple.CloudDocs.iCloudDriveFileProvider";
    v9[4] = @"com.apple.CloudDocs.iCloudDriveFileProviderManaged";
    void v9[5] = @"com.apple.mobilemail";
    v9[6] = @"com.apple.mobilecal";
    v9[7] = @"com.apple.MobileSMS";
    v9[8] = @"com.apple.reminders";
    v9[9] = @"com.apple.spotlight.events";
    v9[10] = @"com.apple.Passbook";
    v9[11] = @"com.apple.mobilenotes";
    v9[12] = @"com.apple.Music";
    v9[13] = @"com.apple.Keynote";
    v9[14] = @"com.apple.Pages";
    v9[15] = @"com.apple.searchd.syndicatedLinks";
    v9[16] = @"com.apple.searchd.syndicatedPhotos";
    v9[17] = @"com.apple.searchd.syndicatedPhotos.MobileSMS";
    v9[18] = @"com.apple.searchd.syndicatedPhotos.mobilenotes";
    v9[19] = @"com.apple.searchd.syndicatedPhotos.mobileslideshow";
    v9[20] = @"com.apple.mobileslideshow";
    v9[21] = @"com.apple.MobileAddressBook";
    v9[22] = @"com.apple.mobilesafari";
    v9[23] = @"com.apple.VoiceMemos";
    v9[24] = @"com.apple.mobilephone";
    v9[25] = @"com.apple.freeform";
    id v2 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v3 = v9;
    uint64_t v4 = 26;
  }
  id v5 = [v2 arrayWithObjects:v3 count:v4];
  uint64_t v6 = [v1 setWithArray:v5];
  uint64_t v7 = (void *)processSearchToolFinalResults_queryContext__SEARCHTOOL_BUNDLES;
  processSearchToolFinalResults_queryContext__SEARCHTOOL_BUNDLES = v6;

  uint64_t result = _os_feature_enabled_impl();
  processSearchToolFinalResults_queryContext__isSearchToolAllBundlesEnabled = result;
  return result;
}

+ (void)searchToolDeduplicateResults:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v38 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if ([v3 count])
  {
    uint64_t v5 = 0;
    *(void *)&long long v4 = 138412290;
    long long v35 = v4;
    while (1)
    {
      uint64_t v6 = objc_msgSend(v3, "objectAtIndexedSubscript:", v5, v35);
      uint64_t v7 = [v6 rankingItem];

      if (v7) {
        break;
      }
LABEL_32:

      if (++v5 >= (unint64_t)[v3 count]) {
        goto LABEL_33;
      }
    }
    id v8 = [v6 rankingItem];
    id v9 = SSCompactRankingAttrsGetValue((int8x8_t *)[v8 attributes], 0xE3uLL);

    uint64_t v10 = [v6 rankingItem];
    uint64_t v11 = SSCompactRankingAttrsGetValue((int8x8_t *)[v10 attributes], 0xE4uLL);

    id v12 = [v6 rankingItem];
    uint64_t v13 = SSCompactRankingAttrsGetValue((int8x8_t *)[v12 attributes], 0x112uLL);

    if (v9)
    {
      if ([v39 containsObject:v9])
      {
        id v14 = SSGeneralLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          [v6 rankingItem];
          uint64_t v15 = v13;
          uint64_t v17 = v16 = v11;
          id v18 = [v17 identifier];
          *(_DWORD *)buf = 138412546;
          int v44 = v18;
          __int16 v45 = 2112;
          long long v46 = v9;
          _os_log_impl(&dword_1BDB2A000, v14, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] dedupe result %@ with com_apple_mail_messageID=%@", buf, 0x16u);

          uint64_t v11 = v16;
          uint64_t v13 = v15;
        }

        int v19 = 1;
        if (!v11) {
          goto LABEL_16;
        }
        goto LABEL_12;
      }
      [v39 addObject:v9];
    }
    int v19 = 0;
    if (!v11) {
      goto LABEL_16;
    }
LABEL_12:
    if (![v40 containsObject:v11])
    {
      [v40 addObject:v11];
      if (!v13)
      {
LABEL_18:
        uint64_t v25 = [v6 rankingItem];
        uint64_t v26 = [v25 identifier];
        if (v26)
        {
          uint64_t v27 = (void *)v26;
          float v42 = v11;
          uint64_t v28 = [v6 rankingItem];
          if (([v28 bundleIDType] & 8) != 0)
          {
            [v6 rankingItem];
            v30 = id v29 = v3;
            [v30 identifier];
            uint64_t v31 = v37 = v9;
            int v36 = [v41 containsObject:v31];

            id v9 = v37;
            id v3 = v29;

            uint64_t v11 = v42;
            if (v36)
            {
              uint64_t v32 = SSGeneralLog();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v33 = [v6 rankingItem];
                uint64_t v34 = [v33 identifier];
                *(_DWORD *)buf = v35;
                int v44 = v34;
                _os_log_impl(&dword_1BDB2A000, v32, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] dedupe result %@ with eventMessageIdentifier", buf, 0xCu);

                uint64_t v11 = v42;
                id v9 = v37;
              }

LABEL_30:
              [v38 addIndex:v5];
LABEL_31:

              goto LABEL_32;
            }
LABEL_22:
            if (!v19) {
              goto LABEL_31;
            }
            goto LABEL_30;
          }

          uint64_t v11 = v42;
        }

        goto LABEL_22;
      }
LABEL_17:
      [v41 addObject:v13];
      goto LABEL_18;
    }
    uint64_t v20 = SSGeneralLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      [v6 rankingItem];
      uint64_t v21 = v13;
      uint64_t v23 = v22 = v11;
      uint64_t v24 = [v23 identifier];
      *(_DWORD *)buf = 138412546;
      int v44 = v24;
      __int16 v45 = 2112;
      long long v46 = v22;
      _os_log_impl(&dword_1BDB2A000, v20, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] dedupe result %@ with com_apple_mail_message_id_header=%@", buf, 0x16u);

      uint64_t v11 = v22;
      uint64_t v13 = v21;
    }

    int v19 = 1;
LABEL_16:
    if (!v13) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_33:
  if ([v38 count]) {
    [v3 removeObjectsAtIndexes:v38];
  }
}

+ (BOOL)searchToolShouldFilterEventBeforeRanking:(id)a3 queryContext:(id)a4 matchQUIntent:(BOOL)a5 searchToolBundles:(id)a6 useLLMQU:(BOOL)a7 hasEventTypeFromQU:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = [v11 rankingItem];
  id v14 = SSCompactRankingAttrsGetValue((int8x8_t *)[v13 attributes], 0xE5uLL);

  uint64_t v15 = [a1 getEventIntentFallbackTokens];
  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = __134__SSRankingManager_searchToolShouldFilterEventBeforeRanking_queryContext_matchQUIntent_searchToolBundles_useLLMQU_hasEventTypeFromQU___block_invoke;
  v114[3] = &unk_1E634C5C8;
  id v113 = v12;
  id v115 = v113;
  uint64_t v16 = [v15 indexOfObjectPassingTest:v114];
  if (!v8 || v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    log = SSGeneralLog();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      float v75 = [v113 searchString];
      LOBYTE(v47) = 1;
      unint64_t v76 = SSRedactString(v75, 1);
      float v77 = [v11 title];
      float v78 = [v77 text];
      char v79 = SSRedactString(v78, 1);
      *(_DWORD *)buf = 138412802;
      id v117 = v76;
      __int16 v118 = 2112;
      uint64_t v119 = v14;
      __int16 v120 = 2112;
      uint64_t v121 = v79;
      _os_log_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] [personal answers] for query=%@, filtered eventType=%@ with title=%@ due to no eventTypeFromQU or fallbackIntent", buf, 0x20u);
    }
    else
    {
      LOBYTE(v47) = 1;
    }
    goto LABEL_67;
  }
  long long v110 = v15;
  uint64_t v17 = [v113 arrivalLocationFromQU];

  long long v111 = v14;
  if (v17)
  {
    id v18 = [v11 rankingItem];
    log = SSCompactRankingAttrsGetValue((int8x8_t *)[v18 attributes], 0xEEuLL);

    int v19 = [v11 rankingItem];
    uint64_t v20 = SSCompactRankingAttrsGetValue((int8x8_t *)[v19 attributes], 0xEFuLL);

    uint64_t v21 = [v11 rankingItem];
    uint64_t v22 = SSCompactRankingAttrsGetValue((int8x8_t *)[v21 attributes], 0xF7uLL);

    uint64_t v23 = [v11 rankingItem];
    uint64_t v24 = SSCompactRankingAttrsGetValue((int8x8_t *)[v23 attributes], 0xF8uLL);

    uint64_t v25 = [v11 rankingItem];
    SSCompactRankingAttrsGetValue((int8x8_t *)[v25 attributes], 0xF9uLL);
    uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v27 = [v11 rankingItem];
    SSCompactRankingAttrsGetValue((int8x8_t *)[v27 attributes], 0xFAuLL);
    uint64_t v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

    id v29 = [v11 rankingItem];
    SSCompactRankingAttrsGetValue((int8x8_t *)[v29 attributes], 0x10AuLL);
    uint64_t v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v31 = [v11 rankingItem];
    uint64_t v32 = SSCompactRankingAttrsGetValue((int8x8_t *)[v31 attributes], 0x10BuLL);

    uint64_t v33 = &stru_1F1824018;
    if (log) {
      uint64_t v34 = (__CFString *)log;
    }
    else {
      uint64_t v34 = &stru_1F1824018;
    }
    long long v108 = (void *)v20;
    if (v20) {
      long long v35 = (__CFString *)v20;
    }
    else {
      long long v35 = &stru_1F1824018;
    }
    int v36 = (void *)v22;
    if (v22) {
      uint64_t v37 = (__CFString *)v22;
    }
    else {
      uint64_t v37 = &stru_1F1824018;
    }
    id v38 = (void *)v32;
    id v39 = (void *)v24;
    if (v24) {
      id v40 = (__CFString *)v24;
    }
    else {
      id v40 = &stru_1F1824018;
    }
    if (v26) {
      id v41 = v26;
    }
    else {
      id v41 = &stru_1F1824018;
    }
    if (v28) {
      float v42 = v28;
    }
    else {
      float v42 = &stru_1F1824018;
    }
    if (v30) {
      float v43 = v30;
    }
    else {
      float v43 = &stru_1F1824018;
    }
    if (v32) {
      uint64_t v33 = (__CFString *)v32;
    }
    int v44 = [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@ %@ %@", v34, v35, v37, v40, v41, v42, v43, v33];
    __int16 v45 = [v113 arrivalLocationFromQU];
    char v46 = [v44 localizedCaseInsensitiveContainsString:v45];

    if ((v46 & 1) == 0)
    {
      long long v104 = v36;
      long long v106 = v28;
      long long v100 = v26;
      long long v102 = v39;
      id v80 = SSGeneralLog();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        long long v98 = [v113 searchString];
        uint64_t v81 = SSRedactString(v98, 1);
        long long v96 = [v11 title];
        long long v94 = [v96 text];
        id v82 = SSRedactString(v94, 1);
        uint64_t v83 = [v113 arrivalLocationFromQU];
        uint64_t v84 = SSRedactString(v83, 1);
        uint64_t v85 = SSRedactString(v44, 1);
        *(_DWORD *)buf = 138413314;
        id v117 = v81;
        __int16 v118 = 2112;
        uint64_t v119 = v111;
        __int16 v120 = 2112;
        uint64_t v121 = v82;
        __int16 v122 = 2112;
        long long v123 = v84;
        __int16 v124 = 2112;
        uint64_t v125 = (uint64_t)v85;
        _os_log_impl(&dword_1BDB2A000, v80, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] [personal answers] for query=%@, filtered eventType=%@ with title=%@ as arrivalLocationFromQU=%@ does not match arrivalLocationsText=%@", buf, 0x34u);
      }
      long long v86 = v108;
      goto LABEL_65;
    }

    id v14 = v111;
  }
  uint64_t v47 = [v113 departureLocationFromQU];

  if (v47)
  {
    float v48 = [v11 rankingItem];
    uint64_t v49 = SSCompactRankingAttrsGetValue((int8x8_t *)[v48 attributes], 0xF0uLL);

    __int16 v50 = [v11 rankingItem];
    uint64_t v51 = SSCompactRankingAttrsGetValue((int8x8_t *)[v50 attributes], 0xF1uLL);

    uint64_t v52 = [v11 rankingItem];
    uint64_t v53 = SSCompactRankingAttrsGetValue((int8x8_t *)[v52 attributes], 0xFBuLL);

    uint64_t v54 = [v11 rankingItem];
    SSCompactRankingAttrsGetValue((int8x8_t *)[v54 attributes], 0xFCuLL);
    uint64_t v55 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v56 = [v11 rankingItem];
    SSCompactRankingAttrsGetValue((int8x8_t *)[v56 attributes], 0xFDuLL);
    float v57 = (__CFString *)objc_claimAutoreleasedReturnValue();

    id v58 = [v11 rankingItem];
    SSCompactRankingAttrsGetValue((int8x8_t *)[v58 attributes], 0xFEuLL);
    long long v59 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v60 = [v11 rankingItem];
    SSCompactRankingAttrsGetValue((int8x8_t *)[v60 attributes], 0x108uLL);
    uint64_t v47 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v61 = [v11 rankingItem];
    SSCompactRankingAttrsGetValue((int8x8_t *)[v61 attributes], 0x109uLL);
    uint64_t v62 = (__CFString *)objc_claimAutoreleasedReturnValue();

    log = v49;
    float v63 = &stru_1F1824018;
    if (v49) {
      uint64_t v64 = (__CFString *)v49;
    }
    else {
      uint64_t v64 = &stru_1F1824018;
    }
    uint64_t v65 = (void *)v51;
    if (v51) {
      int v66 = (__CFString *)v51;
    }
    else {
      int v66 = &stru_1F1824018;
    }
    long long v109 = (void *)v53;
    if (v53) {
      uint64_t v67 = (__CFString *)v53;
    }
    else {
      uint64_t v67 = &stru_1F1824018;
    }
    if (v55) {
      double v68 = v55;
    }
    else {
      double v68 = &stru_1F1824018;
    }
    if (v57) {
      double v69 = v57;
    }
    else {
      double v69 = &stru_1F1824018;
    }
    if (v59) {
      BOOL v70 = v59;
    }
    else {
      BOOL v70 = &stru_1F1824018;
    }
    if (v47) {
      int v71 = v47;
    }
    else {
      int v71 = &stru_1F1824018;
    }
    if (v62) {
      float v63 = v62;
    }
    uint64_t v72 = [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@ %@ %@", v64, v66, v67, v68, v69, v70, v71, v63];
    uint64_t v73 = [v113 departureLocationFromQU];
    char v74 = [v72 localizedCaseInsensitiveContainsString:v73];

    if (v74)
    {

      LOBYTE(v47) = 0;
LABEL_66:
      uint64_t v15 = v110;
      id v14 = v111;
LABEL_67:

      goto LABEL_68;
    }
    long long v103 = v57;
    long long v105 = v55;
    long long v107 = v65;
    long long v87 = SSGeneralLog();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      long long v101 = [v113 searchString];
      long long v95 = SSRedactString(v101, 1);
      long long v99 = [v11 title];
      long long v97 = [v99 text];
      long long v88 = SSRedactString(v97, 1);
      long long v89 = [v113 departureLocationFromQU];
      long long v90 = SSRedactString(v89, 1);
      uint64_t v91 = SSRedactString(v72, 1);
      *(_DWORD *)buf = 138413314;
      id v117 = v95;
      __int16 v118 = 2112;
      uint64_t v119 = v111;
      __int16 v120 = 2112;
      uint64_t v121 = v88;
      __int16 v122 = 2112;
      long long v123 = v90;
      __int16 v124 = 2112;
      uint64_t v125 = v91;
      long long v92 = (void *)v91;
      _os_log_impl(&dword_1BDB2A000, v87, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] [personal answers] for query=%@, filtered eventType=%@ with title=%@ as departureLocationFromQU=%@ does not match departureLocationsText=%@", buf, 0x34u);
    }
    long long v86 = v107;
LABEL_65:

    LOBYTE(v47) = 1;
    goto LABEL_66;
  }
  uint64_t v15 = v110;
LABEL_68:

  return (char)v47;
}

uint64_t __134__SSRankingManager_searchToolShouldFilterEventBeforeRanking_queryContext_matchQUIntent_searchToolBundles_useLLMQU_hasEventTypeFromQU___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  long long v4 = [v2 searchString];
  uint64_t v5 = [v4 localizedCaseInsensitiveContainsString:v3];

  return v5;
}

+ (BOOL)searchToolShouldFilterResultBeforeRanking:(id)a3 queryContext:(id)a4 matchQUIntent:(BOOL)a5 intentAndResultWithStartDueDate:(BOOL)a6 isCleanSlate:(BOOL)a7 searchToolBundles:(id)a8 useLLMQU:(BOOL)a9
{
  BOOL v10 = a5;
  uint64_t v12 = a9;
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  uint64_t v16 = (void *)([v14 llmQUIntentType] & 0x7FC000);
  uint64_t v17 = [v13 rankingItem];
  id v18 = [v17 sectionBundleIdentifier];
  if (![v18 isEqualToString:@"com.apple.spotlight.events"])
  {

LABEL_5:
    int v157 = v14;
    BOOL v155 = v15;
    if (![v14 earliestTokenFromQU]) {
      goto LABEL_31;
    }
    uint64_t v21 = [v13 rankingItem];
    id v18 = [v21 sectionBundleIdentifier];
    if ([v18 isEqualToString:@"com.apple.MobileAddressBook"])
    {

      goto LABEL_31;
    }
    uint64_t v22 = [v13 rankingItem];
    uint64_t v23 = [v22 sectionBundleIdentifier];
    char v24 = [v23 isEqualToString:@"com.apple.spotlight.events"];

    id v14 = v157;
    if (v24) {
      goto LABEL_31;
    }
    uint64_t v25 = [v13 rankingItem];
    uint64_t v26 = [v25 sectionBundleIdentifier];
    if (([v26 isEqualToString:@"com.apple.mobilemail"] & 1) == 0)
    {
      uint64_t v27 = [v13 rankingItem];
      uint64_t v28 = [v27 sectionBundleIdentifier];
      if (([v28 isEqualToString:@"com.apple.email.SearchIndexer"] & 1) == 0)
      {
        uint64_t v54 = [v13 rankingItem];
        uint64_t v55 = [v54 sectionBundleIdentifier];
        char v145 = [v55 isEqualToString:@"com.apple.MobileSMS"];

        if ((v145 & 1) == 0)
        {
          if (v16)
          {
            uint64_t v56 = [v13 rankingItem];
            uint64_t v57 = [v56 contentCreationDateToNowInSeconds];
            int v58 = 86400 * futureEventFromQUGenericRecencyThreshold;

            if (v57 > v58)
            {
              uint64_t v32 = SSGeneralLog();
              if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_54;
              }
              uint64_t v151 = [v157 searchString];
              uint64_t v33 = SSRedactString(v151, 1);
              int v59 = futureEventFromQUGenericRecencyThreshold;
              long long v35 = [v13 title];
              int v36 = [v35 text];
              uint64_t v37 = SSRedactString(v36, 1);
              id v38 = [v13 rankingItem];
              id v39 = [v38 sectionBundleIdentifier];
              id v40 = [v13 rankingItem];
              *(_DWORD *)buf = 138413314;
              id v159 = v33;
              __int16 v160 = 1024;
              *(_DWORD *)uint64_t v161 = v59;
              *(_WORD *)&v161[4] = 2112;
              *(void *)&v161[6] = v37;
              *(_WORD *)&v161[14] = 2112;
              *(void *)&v161[16] = v39;
              *(_WORD *)&v161[24] = 2048;
              *(void *)&v161[26] = [v40 contentCreationDateToNowInSeconds];
              id v41 = "[SpotlightRanking] [SearchTool] query=%@ filter %d-days-old results %@ bundle=%@ for event type and "
                    "future intent contentCreationDateToNowInSeconds=%ld";
              goto LABEL_17;
            }
          }
          uint64_t v60 = [v13 rankingItem];
          id v18 = (void *)[v60 contentCreationDateToNowInSeconds];
          int v61 = 86400 * futureFromQUGenericRecencyThreshold;

          id v14 = v157;
          if ((uint64_t)v18 > v61)
          {
            int v44 = SSGeneralLog();
            if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_22;
            }
            long long v152 = [v157 searchString];
            __int16 v45 = SSRedactString(v152, 1);
            int v62 = futureFromQUGenericRecencyThreshold;
            uint64_t v47 = [v13 title];
            float v48 = [v47 text];
            uint64_t v49 = SSRedactString(v48, 1);
            __int16 v50 = [v13 rankingItem];
            uint64_t v51 = [v50 sectionBundleIdentifier];
            uint64_t v52 = [v13 rankingItem];
            *(_DWORD *)buf = 138413314;
            id v159 = v45;
            __int16 v160 = 1024;
            *(_DWORD *)uint64_t v161 = v62;
            id v14 = v157;
            *(_WORD *)&v161[4] = 2112;
            *(void *)&v161[6] = v49;
            *(_WORD *)&v161[14] = 2112;
            *(void *)&v161[16] = v51;
            *(_WORD *)&v161[24] = 2048;
            *(void *)&v161[26] = [v52 contentCreationDateToNowInSeconds];
            uint64_t v53 = "[SpotlightRanking] [SearchTool] query=%@ filter %d-days-old results %@ bundle=%@ for future intent wit"
                  "hout event type contentCreationDateToNowInSeconds=%ld";
            goto LABEL_21;
          }
LABEL_31:
          float v63 = [v13 rankingItem];
          uint64_t v64 = [v63 sectionBundleIdentifier];
          char v65 = [v64 isEqualToString:@"com.apple.mobilecal"];
          char v156 = v13;
          if (v65)
          {
            int v66 = 0;
          }
          else
          {
            uint64_t v16 = [v13 rankingItem];
            uint64_t v12 = [v16 sectionBundleIdentifier];
            if ([(id)v12 isEqualToString:@"com.apple.reminders"])
            {
              int v66 = 0;
            }
            else
            {
              uint64_t v72 = [v13 rankingItem];
              id v18 = [v72 sectionBundleIdentifier];
              if (([v18 isEqualToString:@"com.apple.spotlight.events"] & 1) == 0)
              {

                goto LABEL_59;
              }
              uint64_t v139 = v18;
              long long v142 = v72;
              int v66 = 1;
            }
          }
          int v67 = [v14 earliestTokenFromQU];
          if (v67)
          {
            id v18 = [v13 rankingItem];
            if ([v18 startDueDateToNowInSeconds] < 0)
            {

              BOOL v68 = 1;
              if ((v66 & 1) == 0) {
                goto LABEL_48;
              }
              goto LABEL_47;
            }
            if (([v14 latestTokenFromQU] & 1) == 0)
            {
              BOOL v68 = 0;
              goto LABEL_41;
            }
          }
          else if (![v14 latestTokenFromQU])
          {
            BOOL v68 = 0;
LABEL_46:
            if (!v66)
            {
LABEL_48:
              if (v65)
              {

                if (!v68) {
                  goto LABEL_59;
                }
                goto LABEL_52;
              }

              if (v68)
              {
LABEL_52:
                uint64_t v32 = SSGeneralLog();
                id v13 = v156;
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v73 = [v157 searchString];
                  char v74 = SSRedactString(v73, 1);
                  float v75 = [v156 title];
                  unint64_t v76 = [v75 text];
                  float v77 = SSRedactString(v76, 1);
                  float v78 = [v156 rankingItem];
                  char v79 = [v78 sectionBundleIdentifier];
                  id v80 = [v156 rankingItem];
                  *(_DWORD *)buf = 138413058;
                  id v159 = v74;
                  __int16 v160 = 2112;
                  *(void *)uint64_t v161 = v77;
                  *(_WORD *)&v161[8] = 2112;
                  *(void *)&v161[10] = v79;
                  *(_WORD *)&v161[18] = 2048;
                  *(void *)&v161[20] = [v80 startDueDateToNowInSeconds];
                  _os_log_impl(&dword_1BDB2A000, v32, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ filter result %@ bundle=%@ for next/last startDueDateToNowInSeconds=%ld", buf, 0x2Au);
                }
                goto LABEL_54;
              }
LABEL_59:
              id v15 = v155;
              id v13 = v156;
              if (a7)
              {
                uint64_t v81 = [v156 rankingItem];
                id v82 = [v81 sectionBundleIdentifier];
                if (v82)
                {
                  uint64_t v83 = [v156 rankingItem];
                  uint64_t v84 = [v83 sectionBundleIdentifier];
                }
                else
                {
                  uint64_t v84 = [v156 resultBundleId];
                }

                [v84 isEqualToString:@"com.apple.spotlight.events"];
                if (a9) {
                  uint64_t v89 = [v157 llmQUIntentType] & 0x3C00;
                }
                else {
                  uint64_t v89 = [v157 intentFromQU] == 5;
                }
                BOOL v90 = v89 == 0;
                uint64_t v91 = [v156 rankingItem];
                long long v92 = [v91 sectionBundleIdentifier];
                if ((SSSectionIsSyndicatedPhotos(v92) & 1) == 0)
                {
                  long long v93 = [v156 rankingItem];
                  long long v94 = [v93 sectionBundleIdentifier];
                  if (([v94 isEqualToString:@"com.apple.MobileAddressBook"] & 1) == 0)
                  {
                    long long v95 = [v156 rankingItem];
                    long long v96 = [v95 retrievalType];
                    if (([v96 intValue] & 2) != 0)
                    {
                      float v97 = flt_1BDC5D2A0[v90];
                      long long v98 = [v156 rankingItem];
                      [v98 embeddingSimilarity];
                      if (v99 < v97)
                      {
                        long long v100 = [v156 rankingItem];
                        [v100 pommesL1Score];
                        float v102 = v101;

                        id v15 = v155;
                        if (v102 < 0.05)
                        {
                          long long v103 = SSGeneralLog();
                          if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
                          {
                            uint64_t v154 = [v156 rankingItem];
                            BOOL v137 = [v154 sectionBundleIdentifier];
                            uint64_t v149 = [v157 searchString];
                            uint64_t v126 = SSRedactString(v149, 1);
                            long long v147 = [v156 rankingItem];
                            long long v144 = [v147 retrievalType];
                            int v136 = [v144 intValue];
                            long long v141 = [v156 rankingItem];
                            uint64_t v127 = [v141 identifier];
                            char v138 = [v156 title];
                            BOOL v128 = [v138 text];
                            BOOL v129 = SSRedactString(v128, 1);
                            long long v130 = [v156 rankingItem];
                            [v130 embeddingSimilarity];
                            double v132 = v131;
                            uint64_t v133 = [v156 rankingItem];
                            [v133 pommesL1Score];
                            *(_DWORD *)buf = 138414338;
                            id v159 = v137;
                            __int16 v160 = 2112;
                            *(void *)uint64_t v161 = v126;
                            *(_WORD *)&v161[8] = 1024;
                            *(_DWORD *)&v161[10] = v136;
                            *(_WORD *)&v161[14] = 2112;
                            *(void *)&v161[16] = v127;
                            uint64_t v134 = (void *)v127;
                            *(_WORD *)&v161[24] = 2112;
                            *(void *)&v161[26] = v129;
                            __int16 v162 = 2048;
                            double v163 = v132;
                            __int16 v164 = 2048;
                            double v165 = v97;
                            __int16 v166 = 2048;
                            double v167 = v135;
                            __int16 v168 = 2048;
                            uint64_t v169 = 0x3FA99999A0000000;
                            _os_log_debug_impl(&dword_1BDB2A000, v103, OS_LOG_TYPE_DEBUG, "[SpotlightRanking] [SearchTool] [bundle=\"%@\"][query=\"%@\"][type=%d][id=\"%@\"] filter result (\"%@\") for low embeddingSimilarity=%0.2f (< %.2f) and low pommesL1Score=%0.2f (< %.2f)", buf, 0x58u);

                            id v13 = v156;
                            id v15 = v155;
                          }
                          BOOL v20 = 1;
                          goto LABEL_88;
                        }
                        goto LABEL_86;
                      }
                    }
                    id v15 = v155;
                  }
                }
LABEL_86:

                goto LABEL_87;
              }
              id v14 = v157;
              if ([v157 isAppEntitySearch])
              {
LABEL_63:
                BOOL v20 = 0;
                goto LABEL_89;
              }
              uint64_t v85 = [v156 rankingItem];
              long long v86 = [v85 sectionBundleIdentifier];
              if ([v86 isEqualToString:@"com.apple.spotlight.events"])
              {
LABEL_67:

LABEL_87:
                BOOL v20 = 0;
LABEL_88:
                id v14 = v157;
                goto LABEL_89;
              }
              long long v87 = [v156 rankingItem];
              long long v88 = [v87 sectionBundleIdentifier];
              if (SSSectionIsSyndicatedPhotos(v88))
              {

                goto LABEL_67;
              }
              long long v104 = [v156 rankingItem];
              long long v105 = [v104 sectionBundleIdentifier];
              if ([v105 isEqualToString:@"com.apple.DocumentsApp"])
              {

                BOOL v20 = 0;
                goto LABEL_55;
              }
              long long v107 = [v156 rankingItem];
              long long v108 = [v107 sectionBundleIdentifier];
              if ([v108 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"])
              {

                BOOL v20 = 0;
                id v13 = v156;
                goto LABEL_55;
              }
              long long v109 = [v156 rankingItem];
              long long v110 = [v109 sectionBundleIdentifier];
              if ([v110 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"])
              {

LABEL_101:
                BOOL v20 = 0;
                id v13 = v156;
                goto LABEL_55;
              }
              int v148 = v110;
              long long v153 = v109;
              long long v146 = [v156 rankingItem];
              long long v111 = [v146 sectionBundleIdentifier];
              if ([v111 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"])
              {
                int v112 = 0;
              }
              else
              {
                long long v143 = [v156 rankingItem];
                id v113 = [v143 sectionBundleIdentifier];
                int v140 = [v155 containsObject:v113];

                int v112 = v140;
              }

              if (!v112) {
                goto LABEL_101;
              }
              id v13 = v156;
              long long v114 = [v156 rankingItem];
              [v114 topicalityScore];
              double v116 = v115;

              id v14 = v157;
              id v15 = v155;
              if (v116 != 0.0) {
                goto LABEL_63;
              }
              int v44 = SSGeneralLog();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                id v117 = [v157 searchString];
                __int16 v118 = SSRedactString(v117, 1);
                uint64_t v119 = [v156 title];
                __int16 v120 = [v119 text];
                uint64_t v121 = SSRedactString(v120, 1);
                __int16 v122 = [v156 rankingItem];
                long long v123 = [v122 sectionBundleIdentifier];
                __int16 v124 = [v156 rankingItem];
                [v124 topicalityScore];
                *(_DWORD *)buf = 138413058;
                id v159 = v118;
                __int16 v160 = 2112;
                *(void *)uint64_t v161 = v121;
                *(_WORD *)&v161[8] = 2112;
                *(void *)&v161[10] = v123;
                *(_WORD *)&v161[18] = 2048;
                *(void *)&v161[20] = v125;
                _os_log_impl(&dword_1BDB2A000, v44, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ filter result %@ bundle=%@ for topicalityScore=%f", buf, 0x2Au);

                id v15 = v155;
                id v14 = v157;
              }
LABEL_22:

              goto LABEL_3;
            }
LABEL_47:

            goto LABEL_48;
          }
          [v13 rankingItem];
          uint64_t v69 = v12;
          v71 = BOOL v70 = v16;
          BOOL v68 = [v71 startDueDateToNowInSeconds] > 0;

          uint64_t v16 = v70;
          uint64_t v12 = v69;
          if (v67)
          {
LABEL_41:

            if ((v66 & 1) == 0) {
              goto LABEL_48;
            }
            goto LABEL_47;
          }
          goto LABEL_46;
        }
LABEL_13:
        if (v16)
        {
          id v29 = [v13 rankingItem];
          uint64_t v30 = [v29 contentCreationDateToNowInSeconds];
          int v31 = 86400 * futureEventFromQUMailAndMessagesRecencyThreshold;

          if (v30 > v31)
          {
            uint64_t v32 = SSGeneralLog();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
LABEL_54:

              BOOL v20 = 1;
LABEL_55:
              id v14 = v157;
              id v15 = v155;
              goto LABEL_89;
            }
            uint64_t v151 = [v157 searchString];
            uint64_t v33 = SSRedactString(v151, 1);
            int v34 = futureEventFromQUMailAndMessagesRecencyThreshold;
            long long v35 = [v13 title];
            int v36 = [v35 text];
            uint64_t v37 = SSRedactString(v36, 1);
            id v38 = [v13 rankingItem];
            id v39 = [v38 sectionBundleIdentifier];
            id v40 = [v13 rankingItem];
            *(_DWORD *)buf = 138413314;
            id v159 = v33;
            __int16 v160 = 1024;
            *(_DWORD *)uint64_t v161 = v34;
            *(_WORD *)&v161[4] = 2112;
            *(void *)&v161[6] = v37;
            *(_WORD *)&v161[14] = 2112;
            *(void *)&v161[16] = v39;
            *(_WORD *)&v161[24] = 2048;
            *(void *)&v161[26] = [v40 contentCreationDateToNowInSeconds];
            id v41 = "[SpotlightRanking] [SearchTool] query=%@ filter %d-dayss-old Mail and Messages results %@ bundle=%@ fo"
                  "r event type and future intent contentCreationDateToNowInSeconds=%ld";
LABEL_17:
            _os_log_impl(&dword_1BDB2A000, v32, OS_LOG_TYPE_DEFAULT, v41, buf, 0x30u);

            goto LABEL_54;
          }
        }
        float v42 = [v13 rankingItem];
        id v18 = (void *)[v42 contentCreationDateToNowInSeconds];
        int v43 = 86400 * futureFromQUMailAndMessagesRecencyThreshold;

        id v14 = v157;
        if ((uint64_t)v18 > v43)
        {
          int v44 = SSGeneralLog();
          if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_22;
          }
          long long v152 = [v157 searchString];
          __int16 v45 = SSRedactString(v152, 1);
          int v46 = futureFromQUMailAndMessagesRecencyThreshold;
          uint64_t v47 = [v13 title];
          float v48 = [v47 text];
          uint64_t v49 = SSRedactString(v48, 1);
          __int16 v50 = [v13 rankingItem];
          uint64_t v51 = [v50 sectionBundleIdentifier];
          uint64_t v52 = [v13 rankingItem];
          *(_DWORD *)buf = 138413314;
          id v159 = v45;
          __int16 v160 = 1024;
          *(_DWORD *)uint64_t v161 = v46;
          id v14 = v157;
          *(_WORD *)&v161[4] = 2112;
          *(void *)&v161[6] = v49;
          *(_WORD *)&v161[14] = 2112;
          *(void *)&v161[16] = v51;
          *(_WORD *)&v161[24] = 2048;
          *(void *)&v161[26] = [v52 contentCreationDateToNowInSeconds];
          uint64_t v53 = "[SpotlightRanking] [SearchTool] query=%@ filter %d-month(s)-old Mail and Messages results %@ bundle=%@ f"
                "or future intent without event type contentCreationDateToNowInSeconds=%ld";
LABEL_21:
          _os_log_impl(&dword_1BDB2A000, v44, OS_LOG_TYPE_DEFAULT, v53, buf, 0x30u);

          id v15 = v155;
          goto LABEL_22;
        }
        goto LABEL_31;
      }
    }
    goto LABEL_13;
  }
  BOOL v19 = +[SSRankingManager searchToolShouldFilterEventBeforeRanking:v13 queryContext:v14 matchQUIntent:v10 searchToolBundles:v15 useLLMQU:a9 hasEventTypeFromQU:v16 != 0];

  if (!v19) {
    goto LABEL_5;
  }
LABEL_3:
  BOOL v20 = 1;
LABEL_89:

  return v20;
}

+ (void)searchToolFilterResultsAfterRanking:(id)a3 queryContext:(id)a4
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (SSEnableSearchToolAbsoluteThresholding() && ([v6 isAppEntitySearch] & 1) == 0)
  {
    BOOL v9 = ([v6 hasSearchTerm] & 1) != 0
      || ([v6 isLLMQUIntentEventSearch] & 1) != 0
      || [v6 llmQUIntentType] != 0;
    BOOL v116 = v9;
  }
  else
  {
    BOOL v116 = 0;
  }
  double v115 = v7;
  if ([v6 isSingle])
  {
    if ((unint64_t)[v5 count] >= 2)
    {
      unsigned int v10 = 2;
      uint64_t v11 = 1;
      do
      {
        [v7 addIndex:v11];
        uint64_t v11 = v10;
        BOOL v12 = [v5 count] > (unint64_t)v10++;
      }
      while (v12);
      [v8 addObject:@"singular"];
    }
    goto LABEL_48;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v14 = -1.0;
  if ([v5 count])
  {
    id v15 = [v5 objectAtIndexedSubscript:0];
    uint64_t v16 = [v15 rankingItem];
    uint64_t v17 = [v16 bundleIDType] & 0x2060804;

    if (!v17)
    {
      id v18 = [v5 objectAtIndexedSubscript:0];
      BOOL v19 = [v18 rankingItem];
      [v19 likelihood];
      float v21 = v20 * *(float *)&acrossBundleRelativeThreshold;

      double v14 = v21;
    }
  }
  if ([v5 count])
  {
    long long v114 = v13;
    long long v110 = v8;
    id v111 = v6;
    uint64_t v22 = 0;
    uint64_t v113 = 0;
    char v112 = 0;
    unsigned int v23 = 1;
    while (1)
    {
      char v24 = objc_msgSend(v5, "objectAtIndexedSubscript:", v22, v110);
      uint64_t v25 = [v24 rankingItem];
      uint64_t v26 = [v25 bundleIDType] & 0x2060804;

      if (!v26)
      {
        uint64_t v27 = [v5 objectAtIndexedSubscript:v22];
        uint64_t v28 = [v27 rankingItem];
        id v29 = [v28 sectionBundleIdentifier];
        uint64_t v30 = [v114 objectForKey:v29];

        if (v30)
        {
          int v31 = [v5 objectAtIndexedSubscript:v22];
          uint64_t v32 = [v31 rankingItem];
          uint64_t v33 = [v32 sectionBundleIdentifier];
          int v34 = [v114 objectForKeyedSubscript:v33];
          [v34 floatValue];
          float v36 = v35;

          uint64_t v37 = [v5 objectAtIndexedSubscript:v22];
          id v38 = [v37 rankingItem];
          [v38 likelihood];
          double v40 = v39;

          id v7 = v115;
          if (v40 < v36)
          {
            [v115 addIndex:v22];
            char v112 = 1;
          }
        }
        else
        {
          id v41 = (void *)MEMORY[0x1E4F28ED0];
          float v42 = [v5 objectAtIndexedSubscript:v22];
          int v43 = [v42 rankingItem];
          [v43 likelihood];
          __int16 v45 = [v41 numberWithDouble:v44 * *(float *)&inBundleRelativeThreshold];
          int v46 = [v5 objectAtIndexedSubscript:v22];
          uint64_t v47 = [v46 rankingItem];
          float v48 = [v47 sectionBundleIdentifier];
          [v114 setObject:v45 forKeyedSubscript:v48];

          id v7 = v115;
        }
        uint64_t v49 = [v5 objectAtIndexedSubscript:v22];
        __int16 v50 = [v49 rankingItem];
        [v50 likelihood];
        double v52 = v51;

        if (v52 < v14)
        {
          [v7 addIndex:v22];
          LOBYTE(v113) = 1;
        }
      }
      if (!v116) {
        goto LABEL_40;
      }
      uint64_t v53 = [v5 objectAtIndexedSubscript:v22];
      uint64_t v54 = [v53 rankingItem];
      uint64_t v55 = [v54 sectionBundleIdentifier];
      int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v55);

      uint64_t v57 = [v5 objectAtIndexedSubscript:v22];
      int v58 = [v57 rankingItem];
      int v59 = v58;
      if (IsSyndicatedPhotos) {
        break;
      }
      float v63 = [v58 sectionBundleIdentifier];
      int v64 = [v63 isEqualToString:@"com.apple.DocumentsApp"];

      char v65 = [v5 objectAtIndexedSubscript:v22];
      int v66 = [v65 rankingItem];
      int v67 = v66;
      if (v64)
      {
        [v66 likelihood];
        double v69 = v68;
        double v70 = *(float *)&inBundleAbsoluteThresholdForFiles;

        BOOL v71 = v69 < v70;
LABEL_37:
        if (!v71) {
          goto LABEL_40;
        }
LABEL_39:
        [v7 addIndex:v22];
        BYTE4(v113) = 1;
        goto LABEL_40;
      }
      uint64_t v72 = [v66 sectionBundleIdentifier];
      if ([v72 isEqualToString:@"com.apple.MobileAddressBook"])
      {
      }
      else
      {
        uint64_t v73 = [v5 objectAtIndexedSubscript:v22];
        char v74 = [v73 rankingItem];
        float v75 = [v74 sectionBundleIdentifier];
        char v76 = [v75 isEqualToString:@"com.apple.spotlight.events"];

        if ((v76 & 1) == 0)
        {
          float v77 = [v5 objectAtIndexedSubscript:v22];
          float v78 = [v77 rankingItem];
          [v78 likelihood];
          double v80 = v79;
          double v81 = *(float *)&acrossBundleAbsoluteThreshold;

          BOOL v71 = v80 < v81;
          id v7 = v115;
          goto LABEL_37;
        }
        id v7 = v115;
      }
LABEL_40:
      uint64_t v22 = v23;
      BOOL v12 = [v5 count] > (unint64_t)v23++;
      if (!v12)
      {
        id v8 = v110;
        if (v112) {
          [v110 addObject:@"thresholding_within_bundle"];
        }
        id v6 = v111;
        id v13 = v114;
        if (v113) {
          [v110 addObject:@"thresholding_all_bundles"];
        }
        if ((v113 & 0x100000000) != 0) {
          [v110 addObject:@"thresholding_by_absolute_value"];
        }
        goto LABEL_47;
      }
    }
    [v58 likelihood];
    double v61 = v60;
    double v62 = *(float *)&inBundleAbsoluteThresholdForPhotos;

    if (v61 >= v62) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_47:

LABEL_48:
  if (![v5 count]) {
    goto LABEL_56;
  }
  uint64_t v82 = 0;
  while (1)
  {
    uint64_t v83 = [v5 objectAtIndexedSubscript:v82];
    uint64_t v84 = [v83 rankingItem];
    uint64_t v85 = [v84 sectionBundleIdentifier];
    int v86 = SSSectionIsSyndicatedPhotos(v85);

    if (v86)
    {
      long long v87 = [v5 objectAtIndexedSubscript:v82];
      long long v88 = [v87 rankingItem];
      [v88 pommesL1Score];
      if (v89 <= 10.0)
      {

        goto LABEL_55;
      }
      BOOL v90 = [v5 objectAtIndexedSubscript:v82];
      uint64_t v91 = [v90 rankingItem];
      [v91 pommesL1Score];
      float v93 = v92;

      if (v93 < 50.0) {
        break;
      }
    }
LABEL_55:
    if (++v82 >= (unint64_t)[v5 count]) {
      goto LABEL_56;
    }
  }
  if ([v5 count])
  {
    unint64_t v100 = 0;
    char v101 = 0;
    do
    {
      while (1)
      {
        float v102 = [v5 objectAtIndexedSubscript:v100];
        long long v103 = [v102 rankingItem];
        long long v104 = [v103 sectionBundleIdentifier];
        int v105 = SSSectionIsSyndicatedPhotos(v104);

        if (!v105) {
          break;
        }
        long long v106 = [v5 objectAtIndexedSubscript:v100];
        long long v107 = [v106 rankingItem];
        [v107 pommesL1Score];
        float v109 = v108;

        if (v109 >= 10.0) {
          break;
        }
        [v115 addIndex:v100++];
        char v101 = 1;
        if (v100 >= [v5 count]) {
          goto LABEL_70;
        }
      }
      ++v100;
    }
    while (v100 < [v5 count]);
    if ((v101 & 1) == 0) {
      goto LABEL_56;
    }
LABEL_70:
    [v8 addObject:@"exactMatchFilter"];
  }
LABEL_56:
  long long v94 = v115;
  if ([v115 count])
  {
    long long v95 = SSGeneralLog();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      long long v96 = [v6 searchString];
      float v97 = SSRedactString(v96, 1);
      uint64_t v98 = [v115 count];
      float v99 = [v8 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412802;
      __int16 v118 = v97;
      __int16 v119 = 2048;
      uint64_t v120 = v98;
      __int16 v121 = 2112;
      __int16 v122 = v99;
      _os_log_impl(&dword_1BDB2A000, v95, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ filter %lu result for [%@]", buf, 0x20u);
    }
    long long v94 = v115;
    [v5 removeObjectsAtIndexes:v115];
  }
}

+ (void)searchToolRanker:(id)a3 queryContext:(id)a4 searchToolBundles:(id)a5
{
  uint64_t v611 = *MEMORY[0x1E4F143B8];
  id v418 = a3;
  id v7 = a4;
  id v8 = a5;
  int v9 = [v7 isFromLLMQUParse];
  int v446 = [v7 intentFromQU];
  unsigned int v10 = SSGeneralLog();
  id v420 = v8;
  v422 = v7;
  int v439 = v9;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v7 searchString];
    SSRedactString(v11, 1);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [v7 intentFromQU];
    uint64_t v13 = intentLabel();
    +[SPSearchQueryContext llmQUIntentString:](SPSearchQueryContext, "llmQUIntentString:", [v7 llmQUIntentType]);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    +[SPSearchQueryContext llmQUIntentString:](SPSearchQueryContext, "llmQUIntentString:", [v7 inferredLlmQUIntentType]);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    int v16 = [v7 earliestTokenFromQU];
    int v17 = [v422 latestTokenFromQU];
    id v18 = [v422 parsedQueryFromQU];
    SSRedactString(v18, 1);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414082;
    id v549 = v12;
    __int16 v550 = 1024;
    *(_DWORD *)float v551 = v439;
    *(_WORD *)&v551[4] = 2080;
    *(void *)&v551[6] = v13;
    int v9 = v439;
    *(_WORD *)&v551[14] = 2112;
    *(void *)&v551[16] = v14;
    *(_WORD *)&v551[24] = 2112;
    *(void *)&v551[26] = v15;
    *(_WORD *)&v551[34] = 1024;
    *(_DWORD *)v552 = v16;
    *(_WORD *)&v552[4] = 1024;
    *(_DWORD *)&v552[6] = v17;
    id v8 = v420;
    id v7 = v422;
    *(_WORD *)float v553 = 2112;
    *(void *)&v553[2] = v19;
    _os_log_impl(&dword_1BDB2A000, v10, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] [QU] query=%@ useLLMQU=%i QU_Intent=%s LLM_QU_Intent=%@ LLM_QU_Inferred_Intent=%@ earliest=%i latest=%i parsedQueryFromQU=%@", buf, 0x46u);
  }
  id v417 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v20 = objc_alloc(MEMORY[0x1E4F1CA60]);
  float v21 = [v418 resultSet];
  BOOL v464 = objc_msgSend(v20, "initWithCapacity:", objc_msgSend(v21, "count"));

  id v22 = objc_alloc(MEMORY[0x1E4F1CA60]);
  unsigned int v23 = [v418 resultSet];
  v461 = objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count"));

  id v24 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v25 = [v418 resultSet];
  v458 = objc_msgSend(v24, "initWithCapacity:", objc_msgSend(v25, "count"));

  [v7 currentTime];
  double v27 = v26;
  LODWORD(v24) = SSEnableSearchToolCleanSlate(1u);
  double v28 = 1.0;
  int v416 = SSEnableTextSemanticSearchCalibration();
  unsigned int v491 = v24;
  if (v24 && [v7 hasQueryTextEmbedding])
  {
    [v7 entityL1Score];
    double v28 = v29 + 9.9889;
  }
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v542 = 0u;
  long long v543 = 0u;
  long long v544 = 0u;
  long long v545 = 0u;
  id obj = [v418 resultSet];
  uint64_t v484 = [obj countByEnumeratingWithState:&v542 objects:v610 count:16];
  if (v484)
  {
    char v486 = 0;
    int v477 = 0;
    LOBYTE(matched) = 0;
    float v31 = v28;
    uint64_t v480 = *(void *)v543;
    double v409 = v31;
    uint64_t v437 = *MEMORY[0x1E4F228C8];
    uint64_t v424 = *MEMORY[0x1E4F228D0];
    uint64_t v415 = *MEMORY[0x1E4F228E0];
    id v473 = v30;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v543 != v480) {
          objc_enumerationMutation(obj);
        }
        v496 = v32;
        uint64_t v33 = *(void **)(*((void *)&v542 + 1) + 8 * (void)v32);
        int v34 = [v33 rankingItem];
        float v35 = [v34 sectionBundleIdentifier];

        if (!v35) {
          goto LABEL_161;
        }
        if (!v9)
        {
          double v44 = [v33 rankingItem];
          __int16 v45 = [v44 sectionBundleIdentifier];
          unsigned int matched = isQUIntentMatchBundle(v446, v45);

          int v46 = [v33 rankingItem];
          id v47 = [v46 sectionBundleIdentifier];
          float v48 = v47;
          if (v446)
          {
            int v49 = v477;
            if (v446 == 3 && ([v47 isEqualToString:@"com.apple.mobilemail"] & 1) != 0) {
              goto LABEL_48;
            }
            __int16 v50 = (const char *)intentLabel();
            if (!v50
              || (double v51 = v50, strncmp(v50, "INTENT_FLIGHT", 0xDuLL))
              && strncmp(v51, "INTENT_HOTEL", 0xCuLL)
              && strncmp(v51, "INTENT_RESTAURANT", 0x11uLL))
            {
              uint64_t v52 = 0;
              goto LABEL_49;
            }
            if (([v48 isEqualToString:@"com.apple.mobilemail"] & 1) != 0
              || ([v48 isEqualToString:@"com.apple.mobilecal"] & 1) != 0
              || ([v48 isEqualToString:@"com.apple.reminders"] & 1) != 0)
            {
LABEL_48:
              uint64_t v52 = 1;
            }
            else
            {
              uint64_t v52 = [v48 isEqualToString:@"com.apple.MobileSMS"];
            }
LABEL_49:
            char v65 = v48;
          }
          else
          {
            uint64_t v52 = 0;
            char v65 = v47;
            int v49 = v477;
          }
LABEL_50:

          goto LABEL_51;
        }
        int v36 = [v7 llmQUIntentType];
        uint64_t v37 = [v33 rankingItem];
        id v38 = [v37 sectionBundleIdentifier];
        unsigned int matched = isLLMQUIntentMatchBundle(v36, v38);

        uint64_t v39 = [v7 llmQUIntentType];
        double v40 = [v33 rankingItem];
        id v41 = [v40 sectionBundleIdentifier];
        float v42 = v41;
        BOOL v43 = (v39 & 0x60) != 0 || (v39 & 0x3C000) != 0;
        if (([v41 isEqualToString:@"com.apple.mobilecal"] & 1) != 0
          || ([v42 isEqualToString:@"com.apple.reminders"] & 1) != 0)
        {
          char v53 = 1;
        }
        else if ([v42 isEqualToString:@"com.apple.spotlight.events"])
        {
          char v53 = _os_feature_enabled_impl();
        }
        else
        {
          char v53 = 0;
        }

        uint64_t v54 = [v7 llmQUIntentType];
        uint64_t v55 = [v33 rankingItem];
        id v56 = [v55 sectionBundleIdentifier];
        uint64_t v57 = v56;
        if (v54 & 8) != 0 && ([v56 isEqualToString:@"com.apple.mobilemail"])
        {
LABEL_34:
          uint64_t v52 = 1;
          goto LABEL_36;
        }
        if ((v54 & 0x3C000) != 0 && _os_feature_enabled_impl())
        {
          if (([v57 isEqualToString:@"com.apple.mobilemail"] & 1) != 0
            || ([v57 isEqualToString:@"com.apple.mobilecal"] & 1) != 0
            || ([v57 isEqualToString:@"com.apple.reminders"] & 1) != 0)
          {
            goto LABEL_34;
          }
          uint64_t v52 = [v57 isEqualToString:@"com.apple.MobileSMS"];
        }
        else
        {
          uint64_t v52 = 0;
        }
LABEL_36:
        char v486 = v43 & v53;

        int v58 = [v7 inferredLlmQUIntentType];
        int v59 = [v33 rankingItem];
        double v60 = [v59 sectionBundleIdentifier];
        int v61 = isLLMQUIntentMatchBundle(v58, v60);

        if (!v61)
        {
          int v49 = 0;
          goto LABEL_52;
        }
        double v62 = [v33 rankingItem];
        float v63 = [v62 sectionBundleIdentifier];
        int v64 = [v63 isEqualToString:@"com.apple.mobilecal"];

        if (!v64)
        {
          int v49 = 1;
          goto LABEL_52;
        }
        int v46 = [v7 searchString];
        char v65 = [v46 lowercaseString];
        if (([v65 containsString:@"meeting"] & 1) == 0)
        {
          float v48 = [v7 searchString];
          BOOL v196 = [v48 lowercaseString];
          int v49 = [v196 containsString:@"appointment"];

          goto LABEL_50;
        }
        int v49 = 1;
LABEL_51:

LABEL_52:
        int v66 = [MEMORY[0x1E4F28ED0] numberWithBool:matched];
        int v67 = [v33 rankingItem];
        double v68 = [v67 sectionBundleIdentifier];
        [v464 setObject:v66 forKeyedSubscript:v68];

        double v69 = [MEMORY[0x1E4F28ED0] numberWithBool:v52];
        double v70 = [v33 rankingItem];
        BOOL v71 = [v70 sectionBundleIdentifier];
        [v461 setObject:v69 forKeyedSubscript:v71];

        uint64_t v72 = [MEMORY[0x1E4F28ED0] numberWithBool:v49 & 1];
        uint64_t v73 = [v33 rankingItem];
        char v74 = [v73 sectionBundleIdentifier];
        [v458 setObject:v72 forKeyedSubscript:v74];

        float v75 = [v33 rankingItem];
        char v76 = [v75 sectionBundleIdentifier];
        int v477 = v49;
        if (([v76 isEqualToString:@"com.apple.spotlight.events"] & 1) == 0)
        {
          float v77 = [v33 rankingItem];
          float v78 = [v77 sectionBundleIdentifier];
          if (([v78 isEqualToString:@"com.apple.mobilemail"] & 1) == 0)
          {
            long long v114 = [v33 rankingItem];
            double v115 = [v114 sectionBundleIdentifier];
            char v116 = [v115 isEqualToString:@"com.apple.MobileSMS"];

            int v9 = v439;
            if ((v116 & 1) == 0) {
              goto LABEL_59;
            }
            goto LABEL_56;
          }
        }
LABEL_56:
        double v79 = [v33 rankingItem];
        double v80 = SSCompactRankingAttrsGetValue((int8x8_t *)[v79 attributes], 0x11uLL);

        if (v80)
        {
          [v80 timeIntervalSinceReferenceDate];
          uint64_t v82 = (uint64_t)(v81 - v27);
          uint64_t v83 = [v33 rankingItem];
          [v83 setStartDueDateToNowInSeconds:v82];
        }
LABEL_59:
        uint64_t v84 = [v33 sectionBundleIdentifier];
        int v85 = [v84 isEqualToString:@"com.apple.spotlight.events"];

        int v86 = [v33 rankingItem];
        long long v87 = v86;
        if (v85)
        {
          [v86 setIsPromotedInstantAnswer:0];

          long long v88 = [v33 rankingItem];
          uint64_t v89 = [v88 attributes];

          id v30 = v473;
          if (v89)
          {
            BOOL v90 = [v33 rankingItem];
            uint64_t v91 = SSCompactRankingAttrsGetValue((int8x8_t *)[v90 attributes], 0xE5uLL);

            if (([v91 isEqualToString:v437] & 1) != 0
              || ([v91 isEqualToString:v424] & 1) != 0
              || [v91 isEqualToString:v415])
            {
              id v92 = [v33 rankingItem];
              [v92 setIsPromotedInstantAnswer:1];
              goto LABEL_102;
            }
            goto LABEL_103;
          }
        }
        else
        {
          float v93 = [v86 sectionBundleIdentifier];
          int v94 = [v93 isEqualToString:@"com.apple.mobilecal"];

          id v30 = v473;
          if (v94)
          {
            id v92 = [v33 rankingItem];
            long long v95 = [v92 sectionBundleIdentifier];
            int v96 = [v95 isEqualToString:@"com.apple.mobilecal"];

            if (v96)
            {
              uint64_t v97 = SSCompactRankingAttrsGetValue((int8x8_t *)[v92 attributes], 0xCuLL);
              uint64_t v98 = SSCompactRankingAttrsGetValue((int8x8_t *)[v92 attributes], 0x14uLL);
              uint64_t v99 = SSCompactRankingAttrsGetValue((int8x8_t *)[v92 attributes], 0xC3uLL);
              unint64_t v100 = &stru_1F1824018;
              v430 = (void *)v98;
              v432 = (void *)v97;
              if (v97) {
                char v101 = (__CFString *)v97;
              }
              else {
                char v101 = &stru_1F1824018;
              }
              if (v98) {
                float v102 = (__CFString *)v98;
              }
              else {
                float v102 = &stru_1F1824018;
              }
              float v428 = (void *)v99;
              if (v99) {
                unint64_t v100 = (__CFString *)v99;
              }
              long long v103 = [NSString stringWithFormat:@"%@ %@ %@", v101, v102, v100];
              long long v104 = [v103 lowercaseString];

              int v105 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
              v426 = v104;
              long long v106 = [v104 componentsSeparatedByCharactersInSet:v105];

              uint64_t v107 = [v106 count];
              if (v107)
              {
                uint64_t v108 = v107;
                unint64_t v109 = 0;
                unint64_t v110 = v107 - 2;
                do
                {
                  id v111 = [v106 objectAtIndex:v109];
                  if ([(id)sSetOfFlightReservationKeywords containsObject:v111])
                  {
                    [v92 setIsCalendarFlightEventType:1];
                  }
                  else if ([(id)sSetOfHotelReservationKeywords containsObject:v111])
                  {
                    [v92 setIsCalendarHotelEventType:1];
                  }
                  else if ([(id)sSetOfRestaurantReservationKeywords containsObject:v111])
                  {
                    [v92 setIsCalendarRestaurantEventType:1];
                  }
                  else if ([(id)sSetOfOtherReservationKeywords containsObject:v111])
                  {
                    [v92 setIsCalendarOtherReservationEventType:1];
                  }
                  if (v109 < v110)
                  {
                    char v112 = [NSString stringWithFormat:@"%@ %@", v101, v102];
                    if ([(id)sSetOfFlightReservationKeywords containsObject:v112]) {
                      [v92 setIsCalendarFlightEventType:1];
                    }
                    if ([(id)sSetOfHotelReservationKeywords containsObject:v112]) {
                      [v92 setIsCalendarHotelEventType:1];
                    }
                    if ([(id)sSetOfRestaurantReservationKeywords containsObject:v112]) {
                      [v92 setIsCalendarRestaurantEventType:1];
                    }
                    if ([(id)sSetOfOtherReservationKeywords containsObject:v112]) {
                      [v92 setIsCalendarOtherReservationEventType:1];
                    }
                  }
                  ++v109;
                }
                while (v108 != v109);
              }
              uint64_t v113 = SSGeneralLog();
              if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
              {
                int v243 = [v92 isCalendarFlightEventType];
                int v244 = [v92 isCalendarHotelEventType];
                int v245 = [v92 isCalendarRestaurantEventType];
                int v246 = [v92 isCalendarOtherReservationEventType];
                *(_DWORD *)buf = 138413826;
                id v549 = v432;
                __int16 v550 = 2112;
                *(void *)float v551 = v430;
                *(_WORD *)&v551[8] = 2112;
                *(void *)&v551[10] = v428;
                *(_WORD *)&v551[18] = 1024;
                *(_DWORD *)&v551[20] = v243;
                *(_WORD *)&v551[24] = 1024;
                *(_DWORD *)&v551[26] = v244;
                *(_WORD *)&v551[30] = 1024;
                *(_DWORD *)&v551[32] = v245;
                *(_WORD *)v552 = 1024;
                *(_DWORD *)&v552[2] = v246;
                _os_log_debug_impl(&dword_1BDB2A000, v113, OS_LOG_TYPE_DEBUG, "[SpotlightRanking] [SearchTool] [Doc Classification] itemTitle:%@, itemNamedLocation:%@, itemComment:%@, flight event type:%d, hotel reservation type:%d, restaurant reservation type:%d, other reservation type:%d", buf, 0x38u);
              }

              uint64_t v91 = v92;
              id v8 = v420;
              id v7 = v422;
              int v9 = v439;
              id v30 = v473;
            }
            else
            {
              uint64_t v91 = v92;
            }
LABEL_102:

LABEL_103:
          }
        }
        id v117 = [v33 rankingItem];
        __int16 v118 = SSCompactRankingAttrsGetValue((int8x8_t *)[v117 attributes], 0x117uLL);
        __int16 v119 = [v33 rankingItem];
        [v119 setPreExtractedCardType:v118];

        uint64_t v120 = [v33 rankingItem];
        __int16 v121 = v120;
        if (v491)
        {
          __int16 v122 = [v120 sectionBundleIdentifier];
          int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v122);

          __int16 v124 = [v33 rankingItem];
          uint64_t v125 = v124;
          if (IsSyndicatedPhotos)
          {
            [v124 l2Score];
            float v127 = v126;

            BOOL v128 = [v33 rankingItem];
            [v128 l2Score];
            double v130 = v129;
            if (v127 >= 70.0)
            {
              double v132 = (v130 + -70.0) * 0.025 + 0.25;

              if (v132 > 1.0) {
                double v132 = 1.0;
              }
            }
            else
            {
              double v131 = v130 / 280.0;

              double v132 = fmax(v131, 0.0);
            }
            uint64_t v170 = [v33 rankingItem];
            [v170 setTopicalityScore:v132];

            int v148 = [v33 rankingItem];
            [v148 topicalityScore];
            double v172 = v171;
            goto LABEL_118;
          }
          char v145 = [v124 sectionBundleIdentifier];
          int v146 = [v145 isEqualToString:@"com.apple.MobileAddressBook"];

          long long v147 = [v33 rankingItem];
          int v148 = v147;
          if (v146)
          {
            [v147 engagementScore];
            double v150 = v149;
            uint64_t v151 = [v33 rankingItem];
            [v151 freshnessScore];
            double v153 = v152 * 0.8;
            uint64_t v154 = [v33 rankingItem];
            [v154 topicalityScore];
            double v156 = v153 * v155 + v150 * 0.2;
            goto LABEL_158;
          }
          uint64_t v176 = [v147 sectionBundleIdentifier];
          if ([v176 isEqualToString:@"com.apple.DocumentsApp"])
          {
            int v177 = [v33 rankingItem];
            id v178 = [v177 sectionBundleIdentifier];
            if (([v7 llmQUIntentType] & 0x3C00) != 0)
            {
              if (([v178 isEqualToString:@"com.apple.DocumentsApp"] & 1) != 0
                || ([v178 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"] & 1) != 0
                || ([v178 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"] & 1) != 0)
              {

                goto LABEL_128;
              }
              char v247 = [v178 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"];

              if (v247)
              {
LABEL_128:
                unint64_t v179 = [v33 rankingItem];
                [v179 embeddingSimilarity];
                float v181 = v180;

                float v182 = [v33 rankingItem];
                BOOL v183 = v182;
                if (v181 >= 0.00000011921)
                {
                  [v182 embeddingSimilarity];
                  double v236 = v235;
                  int v188 = [v33 rankingItem];
                  [v188 pommesL1Score];
                  float v238 = v237;
                  [v7 entityL1Score];
                  double v240 = (float)(v238 / v239) * 0.2 + v236 * 0.6;
                  long long v241 = [v33 rankingItem];
                  [v241 keywordMatchScore];
                  double v190 = v240 + v242 * 0.2;
                }
                else
                {
                  [v182 pommesL1Score];
                  float v185 = v184;
                  [v7 entityL1Score];
                  double v187 = (float)(v185 / v186);
                  int v188 = [v33 rankingItem];
                  [v188 keywordMatchScore];
                  double v190 = v189 * 0.6 + v187 * 0.4;
                }

                if (v190 > 1.0) {
                  double v190 = 1.0;
                }
                int v148 = [v33 rankingItem];
                [v148 setLikelihood:v190];
              }
              else
              {
LABEL_154:
                if (v416)
                {
                  int v148 = [v33 rankingItem];
                  [v148 pommesL1Score];
                  float v210 = v209;
                  uint64_t v151 = [v33 rankingItem];
                  [v151 calibratedEmbeddingSimilarity];
                  float v212 = (float)((float)(v210 + -0.18961) / 0.39976) * 0.294047683
                       + (float)((float)(v211 + -0.65941) / 0.14294) * 0.957514226
                       + -1.40211833;
                  double v213 = (float)((float)(v212 + 6.0) / 9.0);
                  if (v213 < 0.0) {
                    double v213 = 0.0;
                  }
                  float v214 = fmin(v213, 1.0);
                  double v156 = v214;
                  uint64_t v154 = [v33 rankingItem];
                  [v154 setTopicalityScore:v156];
LABEL_158:
                  float v215 = [v33 rankingItem];
                  [v215 setLikelihood:v156];
                }
                else
                {
                  int v230 = [v7 hasQueryTextEmbedding];
                  uint64_t v231 = [v33 rankingItem];
                  [v231 pommesL1Score];
                  double v172 = v232;
                  if (v230)
                  {
                    float v233 = [v33 rankingItem];
                    [v233 embeddingSimilarity];
                    double v172 = (v172 + v234 * 9.9889) / v409;
                  }
                  if (v172 > 1.0) {
                    double v172 = 1.0;
                  }
                  int v148 = [v33 rankingItem];
                  [v148 setTopicalityScore:v172];
LABEL_118:
                  uint64_t v151 = [v33 rankingItem];
                  [v151 setLikelihood:v172];
                }
              }
LABEL_160:

              goto LABEL_161;
            }
          }
          goto LABEL_154;
        }
        [v120 calculateFreshnessForSearchTool:CFAbsoluteTimeGetCurrent()];

        uint64_t v133 = [v33 rankingItem];
        uint64_t v134 = [v133 sectionBundleIdentifier];
        int v135 = SSSectionIsSyndicatedPhotos(v134);

        int v136 = [v33 rankingItem];
        BOOL v137 = v136;
        if (v135)
        {
          [v136 l2Score];
          float v139 = v138;

          int v140 = [v33 rankingItem];
          [v140 l2Score];
          double v142 = v141;
          if (v139 >= 70.0)
          {
            double v144 = (v142 + -70.0) * 0.025 + 0.25;

            if (v144 > 1.0) {
              double v144 = 1.0;
            }
          }
          else
          {
            double v143 = v142 / 280.0;

            double v144 = fmax(v143, 0.0);
          }
          double v173 = [v33 rankingItem];
          [v173 setTopicalityScore:v144];

          __int16 v160 = [v33 rankingItem];
          [v160 topicalityScore];
          double v175 = v174;
          double v163 = [v33 rankingItem];
          [v163 setLikelihood:v175];
        }
        else
        {
          int v157 = [v136 sectionBundleIdentifier];
          int v158 = [v157 isEqualToString:@"com.apple.MobileAddressBook"];

          id v159 = [v33 rankingItem];
          __int16 v160 = v159;
          if (v158)
          {
            [v159 engagementScore];
            double v162 = v161;
            double v163 = [v33 rankingItem];
            [v163 freshnessScore];
            double v165 = v164 * 0.8;
            __int16 v166 = [v33 rankingItem];
            [v166 topicalityScore];
            double v168 = v165 * v167 + v162 * 0.2;
            uint64_t v169 = [v33 rankingItem];
            [v169 setLikelihood:v168];
          }
          else
          {
            [v159 topicalityScore];
            double v192 = v191;

            v193 = [v33 rankingItem];
            __int16 v160 = v193;
            if (v192 >= 0.0)
            {
              [v193 topicalityScore];
              double v198 = v197;
              double v163 = [v33 rankingItem];
              [v163 freshnessScore];
              double v195 = v198 * v199;
            }
            else
            {
              double v163 = [v193 L2FeatureVector];
              [v163 originalL2Score];
              double v195 = 0.05 / (float)(expf(-v194) + 1.0);
            }
            __int16 v166 = [v33 rankingItem];
            [v166 setLikelihood:v195];
          }
        }
        id v200 = [v33 sectionBundleIdentifier];
        int v201 = [v200 isEqualToString:@"com.apple.mobilecal"];

        if (v201)
        {
          int v148 = [v33 rankingItem];
          id v202 = v7;
          __int16 v203 = [v148 sectionBundleIdentifier];
          int v204 = [v203 isEqualToString:@"com.apple.mobilecal"];

          if (v204
            && ([v202 isFlightEventSearch]
             && ([v148 isCalendarFlightEventType] & 1) != 0
             || [v202 isHotelEventSearch]
             && ([v148 isCalendarHotelEventType] & 1) != 0
             || [v202 isRestaurantEventSearch]
             && ([v148 isCalendarRestaurantEventType] & 1) != 0
             || [v202 isEventSearch]
             && ([v148 isCalendarOtherReservationEventType] & 1) != 0))
          {

            unint64_t v205 = [v33 rankingItem];
            [v205 likelihood];
            double v207 = v206 * 10.0;

            if (v207 > 1.0) {
              double v207 = 1.0;
            }
            int v208 = [v33 rankingItem];
            [v208 setLikelihood:v207];

            int v148 = SSGeneralLog();
            if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG)) {
              +[SSRankingManager searchToolRanker:queryContext:searchToolBundles:]((uint64_t)v609, (uint64_t)v33);
            }
          }
          else
          {
          }
          goto LABEL_160;
        }
LABEL_161:
        LOBYTE(v408) = v9;
        if (!+[SSRankingManager searchToolShouldFilterResultBeforeRanking:v33 queryContext:v7 matchQUIntent:matched & 1 intentAndResultWithStartDueDate:v486 & 1 isCleanSlate:v491 searchToolBundles:v8 useLLMQU:v408])
        {
          [v417 addObject:v33];
          float v216 = [v33 rankingItem];
          float v217 = [v216 sectionBundleIdentifier];
          float v218 = [v30 objectForKeyedSubscript:v217];

          float v219 = (void *)MEMORY[0x1E4F28ED0];
          if (v218)
          {
            [v218 floatValue];
            float v221 = v220;
            double v222 = [v33 rankingItem];
            [v222 likelihood];
            double v224 = v223;

            double v225 = v221;
            if (v224 > v221) {
              double v225 = v224;
            }
            float v226 = [v219 numberWithDouble:v225];
            float v227 = [v33 rankingItem];
            float v228 = [v227 sectionBundleIdentifier];
            [v30 setObject:v226 forKeyedSubscript:v228];
          }
          else
          {
            float v226 = [v33 rankingItem];
            [v226 likelihood];
            float v227 = objc_msgSend(v219, "numberWithDouble:");
            float v228 = [v33 rankingItem];
            uint64_t v229 = [v228 sectionBundleIdentifier];
            [v30 setObject:v227 forKeyedSubscript:v229];
          }
        }
        uint64_t v32 = v496 + 1;
      }
      while (v496 + 1 != (char *)v484);
      uint64_t v248 = [obj countByEnumeratingWithState:&v542 objects:v610 count:16];
      uint64_t v484 = v248;
    }
    while (v248);
  }

  if (v9)
  {
    LOBYTE(v249) = ([v7 llmQUIntentType] & 0x3C000) != 0;
    [v7 llmQUIntentType];
    [v7 llmQUIntentType];
  }
  else
  {
    int v250 = (const char *)intentLabel();
    BOOL v249 = v250;
    if (v250) {
      LOBYTE(v249) = !strncmp(v250, "INTENT_FLIGHT", 0xDuLL)
    }
                  || !strncmp(v249, "INTENT_HOTEL", 0xCuLL)
                  || strncmp(v249, "INTENT_RESTAURANT", 0x11uLL) == 0;
  }
  v534[0] = MEMORY[0x1E4F143A8];
  v534[1] = 3221225472;
  v534[2] = __68__SSRankingManager_searchToolRanker_queryContext_searchToolBundles___block_invoke;
  v534[3] = &unk_1E634C5F0;
  id v414 = v464;
  id v535 = v414;
  id v413 = v458;
  id v536 = v413;
  id v412 = v461;
  id v537 = v412;
  id v485 = v7;
  id v538 = v485;
  id v411 = v8;
  id v539 = v411;
  char v541 = (char)v249;
  id v410 = v30;
  id v540 = v410;
  [v417 sortWithOptions:16 usingComparator:v534];
  +[SSRankingManager searchToolDeduplicateResults:v417];
  if (searchToolRanker_queryContext_searchToolBundles__onceToken != -1) {
    dispatch_once(&searchToolRanker_queryContext_searchToolBundles__onceToken, &__block_literal_global_1085);
  }
  if (searchToolRanker_queryContext_searchToolBundles__isDebug)
  {
    long long v533 = 0u;
    long long v531 = 0u;
    long long v532 = 0u;
    long long v530 = 0u;
    id v251 = v417;
    uint64_t v252 = [v251 countByEnumeratingWithState:&v530 objects:v608 count:16];
    if (v252)
    {
      uint64_t v253 = v252;
      uint64_t v254 = *(void *)v531;
      int v492 = 1;
      uint64_t v467 = *(void *)v531;
      id v470 = v251;
      do
      {
        uint64_t v255 = 0;
        uint64_t v474 = v253;
        do
        {
          if (*(void *)v531 != v254) {
            objc_enumerationMutation(v251);
          }
          float v256 = [*(id *)(*((void *)&v530 + 1) + 8 * v255) rankingItem];
          v487 = SSCompactRankingAttrsGetValue((int8x8_t *)[v256 attributes], 1uLL);
          unint64_t v257 = [v256 matchInfo];

          id v502 = v256;
          if (v257)
          {
            long long v528 = 0u;
            long long v529 = 0u;
            long long v526 = 0u;
            long long v527 = 0u;
            v497 = [v256 matchInfo];
            uint64_t v258 = [v497 countByEnumeratingWithState:&v526 objects:v607 count:16];
            if (v258)
            {
              uint64_t v259 = v258;
              uint64_t v478 = v255;
              uint64_t v260 = *(void *)v527;
              int v261 = v502;
              do
              {
                for (uint64_t i = 0; i != v259; ++i)
                {
                  if (*(void *)v527 != v260) {
                    objc_enumerationMutation(v497);
                  }
                  uint64_t v263 = *(void *)(*((void *)&v526 + 1) + 8 * i);
                  if (v263)
                  {
                    id v264 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    long long v522 = 0u;
                    long long v523 = 0u;
                    long long v524 = 0u;
                    long long v525 = 0u;
                    long long v265 = [v261 matchInfo];
                    long long v266 = [v265 objectForKeyedSubscript:v263];

                    uint64_t v267 = [v266 countByEnumeratingWithState:&v522 objects:v606 count:16];
                    if (v267)
                    {
                      uint64_t v268 = v267;
                      uint64_t v269 = *(void *)v523;
                      do
                      {
                        for (uint64_t j = 0; j != v268; ++j)
                        {
                          if (*(void *)v523 != v269) {
                            objc_enumerationMutation(v266);
                          }
                          long long v271 = [*(id *)(*((void *)&v522 + 1) + 8 * j) original];
                          [v264 addObject:v271];
                        }
                        uint64_t v268 = [v266 countByEnumeratingWithState:&v522 objects:v606 count:16];
                      }
                      while (v268);
                    }

                    long long v272 = SSGeneralLog();
                    int v261 = v502;
                    if (os_log_type_enabled(v272, OS_LOG_TYPE_DEBUG))
                    {
                      long long v273 = [v485 searchString];
                      long long v274 = [v502 sectionBundleIdentifier];
                      v275 = [v502 identifier];
                      *(_DWORD *)buf = 138413826;
                      id v549 = v273;
                      __int16 v550 = 1024;
                      *(_DWORD *)float v551 = v492;
                      *(_WORD *)&v551[4] = 2112;
                      *(void *)&v551[6] = v274;
                      *(_WORD *)&v551[14] = 2112;
                      *(void *)&v551[16] = v275;
                      *(_WORD *)&v551[24] = 2112;
                      *(void *)&v551[26] = v487;
                      *(_WORD *)&v551[34] = 2112;
                      *(void *)v552 = v263;
                      *(_WORD *)&v552[8] = 2112;
                      *(void *)float v553 = v264;
                      _os_log_debug_impl(&dword_1BDB2A000, v272, OS_LOG_TYPE_DEBUG, "[SpotlightRanking] [SearchTool] [MatchInfo] query=%@ ranked result %i: bundleId=%@ identifier=%@ MDItemIdentifier=%@, attribute_key=%@, match_value=%@", buf, 0x44u);
                    }
                  }
                }
                uint64_t v259 = [v497 countByEnumeratingWithState:&v526 objects:v607 count:16];
              }
              while (v259);
              uint64_t v254 = v467;
              id v251 = v470;
              uint64_t v253 = v474;
              uint64_t v255 = v478;
            }
          }
          else
          {
            v497 = SSGeneralLog();
            if (os_log_type_enabled(v497, OS_LOG_TYPE_DEBUG))
            {
              long long v276 = [v485 searchString];
              long long v277 = [v256 sectionBundleIdentifier];
              long long v278 = [v502 identifier];
              *(_DWORD *)buf = 138413314;
              id v549 = v276;
              __int16 v550 = 1024;
              *(_DWORD *)float v551 = v492;
              *(_WORD *)&v551[4] = 2112;
              *(void *)&v551[6] = v277;
              *(_WORD *)&v551[14] = 2112;
              *(void *)&v551[16] = v278;
              *(_WORD *)&v551[24] = 2112;
              *(void *)&v551[26] = v487;
              _os_log_debug_impl(&dword_1BDB2A000, v497, OS_LOG_TYPE_DEBUG, "[SpotlightRanking] [SearchTool] [MatchInfo] query=%@ ranked result %i: bundleId=%@ identifier=%@ MDItemIdentifier=%@, NO MATCH_INFO", buf, 0x30u);
            }
          }

          ++v492;
          ++v255;
        }
        while (v255 != v253);
        uint64_t v253 = [v251 countByEnumeratingWithState:&v530 objects:v608 count:16];
      }
      while (v253);
    }

    long long v279 = SSGeneralLog();
    if (os_log_type_enabled(v279, OS_LOG_TYPE_DEFAULT))
    {
      long long v280 = [v485 searchString];
      uint64_t v281 = [v251 count];
      *(_DWORD *)buf = 138412546;
      id v549 = v280;
      __int16 v550 = 2048;
      *(void *)float v551 = v281;
      _os_log_impl(&dword_1BDB2A000, v279, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ rank %lu results", buf, 0x16u);
    }
    long long v520 = 0u;
    long long v521 = 0u;
    long long v518 = 0u;
    long long v519 = 0u;
    id v282 = v251;
    uint64_t v443 = [v282 countByEnumeratingWithState:&v518 objects:v605 count:16];
    if (v443)
    {
      int v441 = 0;
      uint64_t v440 = *(void *)v519;
      id v442 = v282;
      do
      {
        for (uint64_t k = 0; k != v443; uint64_t k = v326 + 1)
        {
          if (*(void *)v519 != v440) {
            objc_enumerationMutation(v282);
          }
          uint64_t v465 = k;
          long long v284 = [*(id *)(*((void *)&v518 + 1) + 8 * k) rankingItem];
          uint64_t v493 = SSCompactRankingAttrsGetValue((int8x8_t *)[v284 attributes], 1uLL);
          uint64_t v459 = SSCompactRankingAttrsGetValue((int8x8_t *)[v284 attributes], 0xE3uLL);
          uint64_t v456 = SSCompactRankingAttrsGetValue((int8x8_t *)[v284 attributes], 0xE4uLL);
          SSCompactRankingAttrsGetValue((int8x8_t *)[v284 attributes], 0xDuLL);
          *(double *)&uint64_t v454 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          SSCompactRankingAttrsGetValue((int8x8_t *)[v284 attributes], 0x10DuLL);
          double obja = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          uint64_t v285 = SSCompactRankingAttrsGetValue((int8x8_t *)[v284 attributes], 7uLL);
          uint64_t v286 = SSCompactRankingAttrsGetValue((int8x8_t *)[v284 attributes], 0xCuLL);
          uint64_t v287 = SSCompactRankingAttrsGetValue((int8x8_t *)[v284 attributes], 4uLL);
          v447 = (void *)v286;
          id v449 = (id)v285;
          v445 = (void *)v287;
          if (v286) {
            long long v288 = (void *)v286;
          }
          else {
            long long v288 = (void *)v287;
          }
          if (v285) {
            long long v288 = (void *)v285;
          }
          double v444 = COERCE_DOUBLE(v288);
          char v462 = v284;
          uint64_t v289 = [v284 L2FeatureVector];
          double v290 = [v289 topicalityAnonFeatDict];

          id v498 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v514 = 0u;
          long long v515 = 0u;
          long long v516 = 0u;
          long long v517 = 0u;
          id v503 = v290;
          uint64_t v291 = [v503 countByEnumeratingWithState:&v514 objects:v604 count:16];
          if (v291)
          {
            uint64_t v292 = v291;
            uint64_t v293 = *(void *)v515;
            do
            {
              for (uint64_t m = 0; m != v292; ++m)
              {
                if (*(void *)v515 != v293) {
                  objc_enumerationMutation(v503);
                }
                v295 = *(void **)(*((void *)&v514 + 1) + 8 * m);
                double v296 = [v503 objectForKeyedSubscript:v295];
                v297 = objc_msgSend(v295, "stringByAppendingFormat:", @":(Unigram:%li Bigram:%li Ngram:%li UnigramPrefix:%li BigramPrefix:%li NgramPrefix:%li)", objc_msgSend(v296, "countAttributeUnigramMatch"), objc_msgSend(v296, "countAttributeBigramMatch"), objc_msgSend(v296, "countAttributeNgramMatch"), objc_msgSend(v296, "countAttributeUnigramPrefixMatch"), objc_msgSend(v296, "countAttributeBigramPrefixMatch"), objc_msgSend(v296, "countAttributeNgramPrefixMatch"));
                [v498 addObject:v297];
              }
              uint64_t v292 = [v503 countByEnumeratingWithState:&v514 objects:v604 count:16];
            }
            while (v292);
          }

          float v488 = [v498 componentsJoinedByString:@" "];
          float v481 = SSCompactRankingAttrsGetValue((int8x8_t *)[v462 attributes], 9uLL);
          v479 = SSCompactRankingAttrsGetValue((int8x8_t *)[v462 attributes], 0x20uLL);
          float v475 = SSCompactRankingAttrsGetValue((int8x8_t *)[v462 attributes], 0x19uLL);
          v471 = SSCompactRankingAttrsGetValue((int8x8_t *)[v462 attributes], 0x15EuLL);
          v468 = SSCompactRankingAttrsGetValue((int8x8_t *)[v462 attributes], 0x17BuLL);
          v298 = SSGeneralLog();
          if (os_log_type_enabled(v298, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v436 = [v485 searchString];
            uint64_t v299 = [v462 sectionBundleIdentifier];
            v431 = [v462 identifier];
            [v462 likelihood];
            double v438 = v300;
            [v462 topicalityScore];
            uint64_t v302 = v301;
            [v462 pommesL1Score];
            double v304 = v303;
            [v462 pommesCalibratedL1Score];
            double v306 = v305;
            [v462 embeddingSimilarity];
            double v308 = v307;
            [v462 keywordMatchScore];
            double v310 = v309;
            [v462 freshnessScore];
            uint64_t v312 = v311;
            [v462 engagementScore];
            uint64_t v314 = v313;
            [v462 l2Score];
            double v316 = v315;
            +[SPSearchQueryContext llmQUIntentString:](SPSearchQueryContext, "llmQUIntentString:", [v462 detectedEventType]);
            id v435 = (id)objc_claimAutoreleasedReturnValue();
            int v434 = [v462 isMailCategoryHighImpact];
            int v433 = [v462 isMailCategoryPromotions];
            uint64_t v429 = [v462 startDueDateToNowInSeconds];
            int v427 = [v462 isCalendarFlightEventType];
            int v425 = [v462 isCalendarHotelEventType];
            int v423 = [v462 isCalendarRestaurantEventType];
            int v421 = [v462 isCalendarOtherReservationEventType];
            uint64_t v419 = [v462 mostRecentTimeToQueryInDaysForFreshness];
            BOOL v317 = [v462 retrievalType];
            int v318 = [v317 intValue];
            *(_DWORD *)buf = 138420994;
            id v549 = v436;
            __int16 v550 = 1024;
            *(_DWORD *)float v551 = ++v441;
            *(_WORD *)&v551[4] = 2112;
            long long v319 = (void *)v299;
            *(void *)&v551[6] = v299;
            *(_WORD *)&v551[14] = 2112;
            *(void *)&v551[16] = v431;
            *(_WORD *)&v551[24] = 2112;
            *(void *)&v551[26] = v493;
            *(_WORD *)&v551[34] = 2112;
            long long v320 = (void *)v456;
            long long v321 = (void *)v459;
            *(void *)v552 = v459;
            *(_WORD *)&v552[8] = 2112;
            *(void *)float v553 = v456;
            *(_WORD *)&v553[8] = 2112;
            double v323 = obja;
            long long v322 = (void *)v454;
            double v554 = *(double *)&v454;
            __int16 v555 = 2112;
            double v556 = obja;
            __int16 v557 = 2112;
            double v324 = v444;
            double v558 = v444;
            __int16 v559 = 2048;
            double v560 = v438;
            __int16 v561 = 2048;
            uint64_t v562 = v302;
            __int16 v563 = 2048;
            double v564 = v304;
            __int16 v565 = 2048;
            double v566 = v306;
            __int16 v567 = 2048;
            double v568 = v308;
            __int16 v569 = 2048;
            *(double *)v570 = v310;
            *(_WORD *)&v570[8] = 2048;
            *(void *)v571 = v312;
            *(_WORD *)&v571[8] = 2048;
            uint64_t v572 = v314;
            *(_WORD *)v573 = 2048;
            *(double *)&v573[2] = v316;
            __int16 v574 = 2112;
            *(void *)v575 = v435;
            *(_WORD *)&v575[8] = 1024;
            *(_DWORD *)&v575[10] = v434;
            __int16 v576 = 1024;
            int v577 = v433;
            __int16 v578 = 2048;
            uint64_t v579 = v429;
            __int16 v580 = 1024;
            int v581 = v427;
            __int16 v582 = 1024;
            int v583 = v425;
            __int16 v584 = 1024;
            int v585 = v423;
            __int16 v586 = 1024;
            int v587 = v421;
            __int16 v588 = 2048;
            uint64_t v589 = v419;
            __int16 v590 = 2112;
            v591 = v488;
            __int16 v592 = 2112;
            uint64_t v593 = v481;
            __int16 v594 = 2112;
            v595 = v479;
            __int16 v596 = 2112;
            v597 = v475;
            __int16 v598 = 2112;
            double v599 = v471;
            __int16 v600 = 2112;
            BOOL v601 = v468;
            __int16 v602 = 1024;
            int v603 = v318;
            _os_log_impl(&dword_1BDB2A000, v298, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ ranked result %i: bundleId=%@ identifier=%@ MDItemIdentifier=%@ messageID=%@ messageHeader=%@ contentURL=%@ appEntityInstanceId=%@ name=%@ score=(likelihood=%f topicality=%f pommesL1Score=%f pommesCalibratedL1Score=%f embeddingSimilarity=%f keywordMatchScore=%f freshness=%f engagement=%f pommesL2Score=%f) documentSignals=(detectedEventTypes=%@ isMailCategoryHighImpact=%i isMailCategoryPromotions=%i startDueDateToNowInSeconds=%ld isCalendarFlightEventType=%i isCalendarHotelEventType=%i isCalendarRestaurantEventTyp=%i isCalendarOtherReservationEventType=%i mostRecentTimeToQueryInDays=%ld) topicalityAnonFeatDict=(%@) dates=(lastUsedDate=[%@] contentCreationDate=[%@] contentModificationDate=[%@] receivedDate=[%@] sentDate=[%@]) retrievalType=%i", buf, 0x140u);

            uint64_t v325 = (void *)v493;
            id v282 = v442;
            uint64_t v326 = v465;
          }
          else
          {
            id v282 = v442;
            uint64_t v326 = v465;
            uint64_t v325 = (void *)v493;
            long long v320 = (void *)v456;
            long long v321 = (void *)v459;
            double v323 = obja;
            long long v322 = (void *)v454;
            double v324 = v444;
          }
        }
        uint64_t v443 = [v282 countByEnumeratingWithState:&v518 objects:v605 count:16];
      }
      while (v443);
    }

    long long v327 = SSGeneralLog();
    if (os_log_type_enabled(v327, OS_LOG_TYPE_DEFAULT))
    {
      long long v328 = [v485 searchString];
      uint64_t v329 = [v282 count];
      *(_DWORD *)buf = 138412546;
      id v549 = v328;
      __int16 v550 = 2048;
      *(void *)float v551 = v329;
      _os_log_impl(&dword_1BDB2A000, v327, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ ranked %lu results", buf, 0x16u);
    }
  }
  else
  {
    BOOL v330 = SSGeneralLog();
    if (os_log_type_enabled(v330, OS_LOG_TYPE_DEFAULT))
    {
      v331 = [v485 searchString];
      SSRedactString(v331, 1);
      id v332 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v333 = [v485 queryIdent];
      uint64_t v334 = [v417 count];
      *(_DWORD *)buf = 138412802;
      id v549 = v332;
      __int16 v550 = 2048;
      *(void *)float v551 = v333;
      *(_WORD *)&v551[8] = 2048;
      *(void *)&v551[10] = v334;
      _os_log_impl(&dword_1BDB2A000, v330, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ qid=%llu rank %lu results", buf, 0x20u);
    }
    long long v512 = 0u;
    long long v513 = 0u;
    long long v510 = 0u;
    long long v511 = 0u;
    id v450 = v417;
    uint64_t v335 = [v450 countByEnumeratingWithState:&v510 objects:v547 count:16];
    if (v335)
    {
      uint64_t v336 = v335;
      int v499 = 0;
      uint64_t v494 = *(void *)v511;
LABEL_253:
      uint64_t v337 = 0;
      uint64_t v448 = v336;
      while (1)
      {
        if (*(void *)v511 != v494) {
          objc_enumerationMutation(v450);
        }
        if (v499 > 99) {
          break;
        }
        uint64_t v338 = [*(id *)(*((void *)&v510 + 1) + 8 * v337) rankingItem];
        v339 = SSCompactRankingAttrsGetValue((int8x8_t *)[v338 attributes], 7uLL);
        v340 = SSCompactRankingAttrsGetValue((int8x8_t *)[v338 attributes], 0xCuLL);
        uint64_t v341 = SSCompactRankingAttrsGetValue((int8x8_t *)[v338 attributes], 4uLL);
        BOOL v342 = (void *)v341;
        if (v340) {
          v343 = v340;
        }
        else {
          v343 = (void *)v341;
        }
        if (v339) {
          v343 = v339;
        }
        id v344 = v343;
        v504 = SSGeneralLog();
        if (os_log_type_enabled(v504, OS_LOG_TYPE_DEFAULT))
        {
          float v482 = [v485 searchString];
          SSRedactString(v482, 1);
          id v345 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v476 = [v485 queryIdent];
          int v472 = [v338 sectionBundleIdentifier];
          SSRedactString(v344, 1);
          id v469 = (id)objc_claimAutoreleasedReturnValue();
          [v338 likelihood];
          uint64_t v466 = v346;
          [v338 topicalityScore];
          uint64_t v348 = v347;
          [v338 pommesL1Score];
          double v350 = v349;
          [v338 pommesCalibratedL1Score];
          double v352 = v351;
          [v338 embeddingSimilarity];
          double v354 = v353;
          [v338 keywordMatchScore];
          double v356 = v355;
          [v338 freshnessScore];
          uint64_t v358 = v357;
          [v338 engagementScore];
          double v360 = v359;
          [v338 l2Score];
          double v362 = v361;
          +[SPSearchQueryContext llmQUIntentString:](SPSearchQueryContext, "llmQUIntentString:", [v338 detectedEventType]);
          double v363 = COERCE_DOUBLE((id)objc_claimAutoreleasedReturnValue());
          int v463 = [v338 isMailCategoryHighImpact];
          int v460 = [v338 isMailCategoryPromotions];
          uint64_t v457 = [v338 startDueDateToNowInSeconds];
          int v455 = [v338 isCalendarFlightEventType];
          int objb = [v338 isCalendarHotelEventType];
          ++v499;
          id v489 = v344;
          v364 = v342;
          v365 = v339;
          int v366 = [v338 isCalendarRestaurantEventType];
          int v367 = [v338 isCalendarOtherReservationEventType];
          uint64_t v368 = [v338 mostRecentTimeToQueryInDaysForFreshness];
          *(_DWORD *)buf = 138417922;
          id v549 = v345;
          __int16 v550 = 2048;
          *(void *)float v551 = v476;
          *(_WORD *)&v551[8] = 1024;
          *(_DWORD *)&v551[10] = v499;
          *(_WORD *)&v551[14] = 2112;
          *(void *)&v551[16] = v472;
          *(_WORD *)&v551[24] = 2112;
          *(void *)&v551[26] = v469;
          *(_WORD *)&v551[34] = 2048;
          *(void *)v552 = v466;
          *(_WORD *)&v552[8] = 2048;
          *(void *)float v553 = v348;
          *(_WORD *)&v553[8] = 2048;
          double v554 = v350;
          __int16 v555 = 2048;
          double v556 = v352;
          __int16 v557 = 2048;
          double v558 = v354;
          __int16 v559 = 2048;
          double v560 = v356;
          __int16 v561 = 2048;
          uint64_t v562 = v358;
          __int16 v563 = 2048;
          double v564 = v360;
          __int16 v565 = 2048;
          double v566 = v362;
          __int16 v567 = 2112;
          double v568 = v363;
          __int16 v569 = 1024;
          *(_DWORD *)v570 = v463;
          *(_WORD *)&v570[4] = 1024;
          *(_DWORD *)&v570[6] = v460;
          *(_WORD *)v571 = 2048;
          *(void *)&v571[2] = v457;
          LOWORD(v572) = 1024;
          *(_DWORD *)((char *)&v572 + 2) = v455;
          HIWORD(v572) = 1024;
          *(_DWORD *)v573 = objb;
          *(_WORD *)&v573[4] = 1024;
          *(_DWORD *)&v573[6] = v366;
          v339 = v365;
          BOOL v342 = v364;
          id v344 = v489;
          __int16 v574 = 1024;
          *(_DWORD *)v575 = v367;
          *(_WORD *)&v575[4] = 2048;
          *(void *)&v575[6] = v368;
          _os_log_impl(&dword_1BDB2A000, v504, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ qid=%llu ranked result %i: bundleId=%@ name=%@ score=(likelihood=%f topicality=%f pommesL1Score=%f pommesCalibratedL1Score=%f embeddingSimilarity=%f keywordMatchScore=%f freshness=%f engagement=%f pommesL2Score=%f) documentSignals=(detectedEventTypes=%@ isMailCategoryHighImpact=%i isMailCategoryPromotions=%i startDueDateToNowInSeconds=%ld isCalendarFlightEventType=%i isCalendarHotelEventType=%i isCalendarRestaurantEventTyp=%i isCalendarOtherReservationEventType=%i mostRecentTimeToQueryInDays=%ld)", buf, 0xCCu);

          uint64_t v336 = v448;
        }

        if (v336 == ++v337)
        {
          uint64_t v336 = [v450 countByEnumeratingWithState:&v510 objects:v547 count:16];
          if (v336) {
            goto LABEL_253;
          }
          break;
        }
      }
    }

    long long v327 = SSGeneralLog();
    if (os_log_type_enabled(v327, OS_LOG_TYPE_DEFAULT))
    {
      v369 = [v485 searchString];
      SSRedactString(v369, 1);
      id v370 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v371 = [v485 queryIdent];
      uint64_t v372 = [v450 count];
      *(_DWORD *)buf = 138412802;
      id v549 = v370;
      __int16 v550 = 2048;
      *(void *)float v551 = v371;
      *(_WORD *)&v551[8] = 2048;
      *(void *)&v551[10] = v372;
      _os_log_impl(&dword_1BDB2A000, v327, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ qid=%llu ranked %lu results", buf, 0x20u);
    }
  }

  if (loadRankingThresholdingParameters_onceToken != -1) {
    dispatch_once(&loadRankingThresholdingParameters_onceToken, &__block_literal_global_1705);
  }
  +[SSRankingManager searchToolFilterResultsAfterRanking:v417 queryContext:v485];
  BOOL v373 = SSGeneralLog();
  if (os_log_type_enabled(v373, OS_LOG_TYPE_DEFAULT))
  {
    v374 = [v485 searchString];
    SSRedactString(v374, 1);
    id v375 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v376 = [v417 count];
    *(_DWORD *)buf = 138412546;
    id v549 = v375;
    __int16 v550 = 2048;
    *(void *)float v551 = v376;
    _os_log_impl(&dword_1BDB2A000, v373, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ output %lu candidates", buf, 0x16u);
  }
  v377 = [v418 resultSet];
  [v377 removeAllObjects];

  id v378 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v506 = 0u;
  long long v507 = 0u;
  long long v508 = 0u;
  long long v509 = 0u;
  id v379 = v417;
  id v505 = (id)[v379 countByEnumeratingWithState:&v506 objects:v546 count:16];
  if (v505)
  {
    uint64_t v380 = 0;
    id v500 = *(id *)v507;
    id v490 = v379;
    id v483 = v378;
    do
    {
      for (uint64_t n = 0; n != v505; uint64_t n = (char *)n + 1)
      {
        if (*(id *)v507 != v500) {
          objc_enumerationMutation(v379);
        }
        v382 = *(void **)(*((void *)&v506 + 1) + 8 * (void)n);
        v383 = [v382 rankingItem];
        v384 = [v383 sectionBundleIdentifier];

        if (v384)
        {
          v385 = [v382 rankingItem];
          float v386 = [v385 sectionBundleIdentifier];
          BOOL v387 = [v378 objectForKeyedSubscript:v386];

          if (v387) {
            uint64_t v388 = [v387 intValue] + 1;
          }
          else {
            uint64_t v388 = 1;
          }
          v389 = [MEMORY[0x1E4F28ED0] numberWithInt:v388];
          int v390 = [v382 rankingItem];
          v391 = [v390 sectionBundleIdentifier];
          [v378 setObject:v389 forKeyedSubscript:v391];
        }
        else
        {
          uint64_t v380 = (v380 + 1);
          LODWORD(v388) = v380;
        }
        if ((int)v388 <= 10)
        {
          int v392 = [v418 resultSet];
          [v392 addObject:v382];

          v393 = SSGeneralLog();
          if (os_log_type_enabled(v393, OS_LOG_TYPE_DEFAULT))
          {
            v495 = [v485 searchString];
            SSRedactString(v495, 1);
            id v394 = (id)objc_claimAutoreleasedReturnValue();
            v395 = [v382 rankingItem];
            v396 = [v395 sectionBundleIdentifier];
            float v397 = [v382 title];
            [v397 text];
            v399 = uint64_t v398 = v380;
            SSRedactString(v399, 1);
            id v400 = (id)objc_claimAutoreleasedReturnValue();
            int v401 = [v382 rankingItem];
            [v401 likelihood];
            *(_DWORD *)buf = 138413058;
            id v549 = v394;
            __int16 v550 = 2112;
            *(void *)float v551 = v396;
            *(_WORD *)&v551[8] = 2112;
            *(void *)&v551[10] = v400;
            *(_WORD *)&v551[18] = 2048;
            *(void *)&v551[20] = v402;
            _os_log_impl(&dword_1BDB2A000, v393, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ output result: bundleID=%@ name=%@ likelihood=%f", buf, 0x2Au);

            uint64_t v380 = v398;
            id v378 = v483;

            id v379 = v490;
          }
        }
      }
      id v505 = (id)[v379 countByEnumeratingWithState:&v506 objects:v546 count:16];
    }
    while (v505);
  }

  v403 = SSGeneralLog();
  if (os_log_type_enabled(v403, OS_LOG_TYPE_DEFAULT))
  {
    char v404 = [v485 searchString];
    SSRedactString(v404, 1);
    id v405 = (id)objc_claimAutoreleasedReturnValue();
    char v406 = [v418 resultSet];
    uint64_t v407 = [v406 count];
    *(_DWORD *)buf = 138412546;
    id v549 = v405;
    __int16 v550 = 2048;
    *(void *)float v551 = v407;
    _os_log_impl(&dword_1BDB2A000, v403, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ output %lu results", buf, 0x16u);
  }
}

uint64_t __68__SSRankingManager_searchToolRanker_queryContext_searchToolBundles___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 rankingItem];
  id v8 = [v7 sectionBundleIdentifier];
  if (v8)
  {
    int v9 = [v5 rankingItem];
    uint64_t v10 = [v9 sectionBundleIdentifier];
  }
  else
  {
    uint64_t v10 = [v5 resultBundleId];
  }

  uint64_t v11 = [v6 rankingItem];
  id v12 = [v11 sectionBundleIdentifier];
  if (v12)
  {
    uint64_t v13 = [v6 rankingItem];
    id v14 = [v13 sectionBundleIdentifier];
  }
  else
  {
    id v14 = [v6 resultBundleId];
  }

  if (v10)
  {
    id v15 = [a1[4] objectForKeyedSubscript:v10];
    int v16 = [v15 BOOLValue];

    if (v14) {
      goto LABEL_9;
    }
  }
  else
  {
    int v16 = 0;
    if (v14)
    {
LABEL_9:
      int v17 = [a1[4] objectForKeyedSubscript:v14];
      int v18 = [v17 BOOLValue];

      if (v10) {
        goto LABEL_10;
      }
      goto LABEL_16;
    }
  }
  int v18 = 0;
  if (v10)
  {
LABEL_10:
    id v19 = [a1[5] objectForKeyedSubscript:v10];
    int v161 = [v19 BOOLValue];

    if (v14) {
      goto LABEL_11;
    }
    goto LABEL_17;
  }
LABEL_16:
  int v161 = 0;
  if (v14)
  {
LABEL_11:
    id v20 = [a1[5] objectForKeyedSubscript:v14];
    int v159 = [v20 BOOLValue];

    if (v10) {
      goto LABEL_12;
    }
LABEL_18:
    float v21 = (void *)v10;
    int v163 = 0;
    if (v14) {
      goto LABEL_13;
    }
    goto LABEL_19;
  }
LABEL_17:
  int v159 = 0;
  if (!v10) {
    goto LABEL_18;
  }
LABEL_12:
  float v21 = (void *)v10;
  id v22 = [a1[6] objectForKeyedSubscript:v10];
  int v163 = [v22 BOOLValue];

  if (v14)
  {
LABEL_13:
    unsigned int v23 = [a1[6] objectForKeyedSubscript:v14];
    int v24 = [v23 BOOLValue];

    goto LABEL_20;
  }
LABEL_19:
  int v24 = 0;
LABEL_20:
  [a1[7] llmQUIntentType];
  uint64_t v25 = [v5 rankingItem];
  [v25 detectedEventType];

  [a1[7] llmQUIntentType];
  double v26 = [v6 rankingItem];
  [v26 detectedEventType];

  double v27 = [v5 rankingItem];
  int v158 = [v27 isMailCategoryPromotions];

  double v28 = [v6 rankingItem];
  int v157 = [v28 isMailCategoryPromotions];

  double v165 = v5;
  float v29 = [v5 rankingItem];
  id v30 = a1;
  if ([v29 isPromotedInstantAnswer])
  {
    float v31 = v6;
    [v6 rankingItem];
    v33 = uint64_t v32 = v14;
    int v34 = [v33 isPromotedInstantAnswer];

    id v14 = v32;
    if (!v34) {
      goto LABEL_56;
    }
  }
  else
  {
    float v31 = v6;
  }
  float v35 = [v165 rankingItem];
  if ([v35 isPromotedInstantAnswer])
  {

    int v36 = v30;
  }
  else
  {
    [v31 rankingItem];
    v38 = uint64_t v37 = v14;
    char v39 = [v38 isPromotedInstantAnswer];

    id v14 = v37;
    int v36 = v30;
    if (v39) {
      goto LABEL_57;
    }
  }
  if ((v16 ^ 1 | v18) == 1)
  {
    if ((v16 | v18 ^ 1) != 1) {
      goto LABEL_57;
    }
    if ((v163 ^ 1 | v24) == 1)
    {
      if ((v163 | v24 ^ 1) == 1)
      {
        double v40 = v21;
        if ((v161 ^ 1 | v159) != 1) {
          goto LABEL_110;
        }
        if ((v161 | v159 ^ 1) != 1) {
          goto LABEL_71;
        }
        if ([v36[8] containsObject:v21]
          && ![v36[8] containsObject:v14])
        {
          goto LABEL_110;
        }
        if (([v36[8] containsObject:v21] & 1) == 0
          && ([v36[8] containsObject:v14] & 1) != 0)
        {
          goto LABEL_71;
        }
        if (([v36[7] earliestTokenFromQU] & 1) == 0
          && ![v36[7] latestTokenFromQU])
        {
LABEL_61:
          if ((v158 ^ 1 | v157))
          {
            BOOL v71 = v14;
            if (((v158 | v157 ^ 1) & 1) == 0)
            {
              uint64_t v83 = SSGeneralLog();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v84 = [v36[7] searchString];
                int v85 = SSRedactString(v84, 1);
                int v86 = [v31 rankingItem];
                long long v87 = [v86 displayName];
                SSRedactString(v87, 1);
                v89 = long long v88 = v40;
                *(_DWORD *)buf = 138412546;
                double v167 = v85;
                __int16 v168 = 2112;
                uint64_t v169 = v89;
                _os_log_impl(&dword_1BDB2A000, v83, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ Result: %@ was demoted due to email Label: Promotional", buf, 0x16u);

                double v40 = v88;
              }

              goto LABEL_75;
            }
            if (![v40 isEqualToString:@"com.apple.spotlight.events"]
              || ![v14 isEqualToString:@"com.apple.spotlight.events"])
            {
              goto LABEL_128;
            }
            uint64_t v72 = [v165 rankingItem];
            if ([v72 startDueDateToNowInSeconds] <= 0)
            {
            }
            else
            {
              uint64_t v73 = [v31 rankingItem];
              uint64_t v74 = [v73 startDueDateToNowInSeconds];

              if (v74 < 0) {
                goto LABEL_75;
              }
            }
            double v115 = [v165 rankingItem];
            if ([v115 startDueDateToNowInSeconds] < 0)
            {
              __int16 v124 = [v31 rankingItem];
              uint64_t v125 = [v124 startDueDateToNowInSeconds];

              if (v125 > 0) {
                goto LABEL_131;
              }
            }
            else
            {
            }
            char v116 = [v165 rankingItem];
            if ([v116 startDueDateToNowInSeconds] <= 0)
            {
            }
            else
            {
              id v117 = [v31 rankingItem];
              uint64_t v118 = [v117 startDueDateToNowInSeconds];

              if (v118 >= 1)
              {
                __int16 v119 = [v165 rankingItem];
                uint64_t v120 = [v119 startDueDateToNowInSeconds];
                __int16 v121 = v31;
                __int16 v122 = [v31 rankingItem];
                uint64_t v123 = [v122 startDueDateToNowInSeconds];

                if (v120 > v123)
                {
                  uint64_t v69 = 1;
LABEL_118:
                  float v31 = v121;
                  goto LABEL_140;
                }
                uint64_t v133 = [v165 rankingItem];
                uint64_t v134 = [v133 startDueDateToNowInSeconds];
                int v135 = [v31 rankingItem];
                uint64_t v136 = [v135 startDueDateToNowInSeconds];

                if (v134 < v136) {
                  goto LABEL_75;
                }
                goto LABEL_128;
              }
            }
            float v126 = [v165 rankingItem];
            if (([v126 startDueDateToNowInSeconds] & 0x8000000000000000) == 0)
            {

LABEL_128:
              if (([v36[7] llmQUIntentType] & 0x7FC000) == 0) {
                goto LABEL_137;
              }
              BOOL v137 = [v165 rankingItem];
              float v138 = [v137 sectionBundleIdentifier];
              if (SSSectionIsSyndicatedPhotos(v138))
              {
                float v139 = [v31 rankingItem];
                uint64_t v140 = [v139 bundleIDType] & 0x20000200100068;

                if (v140) {
                  goto LABEL_131;
                }
              }
              else
              {
              }
              float v141 = [v31 rankingItem];
              double v142 = [v141 sectionBundleIdentifier];
              if ((SSSectionIsSyndicatedPhotos(v142) & 1) == 0)
              {

                goto LABEL_137;
              }
              double v143 = [v165 rankingItem];
              uint64_t v144 = [v143 bundleIDType] & 0x20000200100068;

              if (!v144)
              {
LABEL_137:
                char v145 = [v165 rankingItem];
                [v145 likelihood];
                float v147 = v146;

                int v148 = [v31 rankingItem];
                [v148 likelihood];
                float v150 = v149;

                if (v147 > v150) {
                  uint64_t v69 = -1;
                }
                else {
                  uint64_t v69 = v147 < v150;
                }
                goto LABEL_140;
              }
LABEL_75:
              uint64_t v69 = -1;
LABEL_140:
              id v14 = v71;
              goto LABEL_59;
            }
            float v127 = [v31 rankingItem];
            uint64_t v128 = [v127 startDueDateToNowInSeconds];

            if ((v128 & 0x8000000000000000) == 0) {
              goto LABEL_128;
            }
            float v129 = [v165 rankingItem];
            uint64_t v130 = [v129 startDueDateToNowInSeconds];
            __int16 v121 = v31;
            double v131 = [v31 rankingItem];
            uint64_t v132 = [v131 startDueDateToNowInSeconds];

            if (v130 > v132)
            {
              uint64_t v69 = -1;
              goto LABEL_118;
            }
            uint64_t v151 = [v165 rankingItem];
            uint64_t v152 = [v151 startDueDateToNowInSeconds];
            double v153 = [v31 rankingItem];
            uint64_t v154 = [v153 startDueDateToNowInSeconds];

            if (v152 >= v154) {
              goto LABEL_128;
            }
LABEL_131:
            uint64_t v69 = 1;
            goto LABEL_140;
          }
          float v75 = SSGeneralLog();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            char v76 = [v36[7] searchString];
            float v77 = SSRedactString(v76, 1);
            float v78 = [v165 rankingItem];
            [v78 displayName];
            double v80 = v79 = v14;
            SSRedactString(v80, 1);
            v82 = double v81 = v40;
            *(_DWORD *)buf = 138412546;
            double v167 = v77;
            __int16 v168 = 2112;
            uint64_t v169 = v82;
            _os_log_impl(&dword_1BDB2A000, v75, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ Result: %@ was demoted due to email Label: Promotional", buf, 0x16u);

            id v14 = v79;
            double v40 = v81;
          }
LABEL_71:
          uint64_t v69 = 1;
          goto LABEL_59;
        }
        double v164 = v21;
        id v41 = [v165 rankingItem];
        float v42 = [v41 sectionBundleIdentifier];
        BOOL v43 = [v31 rankingItem];
        double v44 = [v43 sectionBundleIdentifier];
        if (![v42 isEqualToString:v44])
        {

          double v40 = v164;
          goto LABEL_61;
        }
        double v162 = v31;
        __int16 v45 = [v165 rankingItem];
        int v46 = [v45 sectionBundleIdentifier];
        if (([v46 isEqualToString:@"com.apple.mobilecal"] & 1) == 0)
        {
          id v47 = [v165 rankingItem];
          __int16 v160 = [v47 sectionBundleIdentifier];
          if (([v160 isEqualToString:@"com.apple.reminders"] & 1) == 0)
          {
            int v94 = [v165 rankingItem];
            [v94 sectionBundleIdentifier];
            double v155 = v47;
            v96 = long long v95 = v14;
            char v156 = [v96 isEqualToString:@"com.apple.spotlight.events"];

            id v14 = v95;
            float v31 = v162;
            double v40 = v164;
            if ((v156 & 1) == 0) {
              goto LABEL_61;
            }
            goto LABEL_44;
          }
        }
        float v31 = v162;
        double v40 = v164;
LABEL_44:
        float v48 = [v165 rankingItem];
        [v48 likelihood];
        float v50 = v49;

        double v51 = [v31 rankingItem];
        [v51 likelihood];
        float v53 = v52;

        if (*((unsigned char *)v36 + 80)) {
          float v54 = 10000.0;
        }
        else {
          float v54 = v50;
        }
        if (*((unsigned char *)v36 + 80)) {
          float v55 = 9999.0;
        }
        else {
          float v55 = v53;
        }
        id v56 = [v165 rankingItem];
        uint64_t v57 = [v56 sectionBundleIdentifier];
        float v58 = 0.5;
        if (([v57 isEqualToString:@"com.apple.spotlight.events"] & 1) == 0)
        {
          id v59 = v36[9];
          [v165 rankingItem];
          v61 = double v60 = v14;
          double v62 = [v61 sectionBundleIdentifier];
          float v63 = [v59 objectForKeyedSubscript:v62];
          [v63 floatValue];
          float v58 = v64 * 0.75;

          double v40 = v164;
          id v14 = v60;
        }

        if ([v36[7] earliestTokenFromQU])
        {
          char v65 = v14;
          int v66 = [v165 rankingItem];
          if ([v66 startDueDateToNowInSeconds] <= 0)
          {
          }
          else
          {
            int v67 = [v31 rankingItem];
            uint64_t v68 = [v67 startDueDateToNowInSeconds];

            if (v68 < 0)
            {
LABEL_95:
              uint64_t v69 = -1;
LABEL_108:
              id v14 = v65;
              goto LABEL_59;
            }
          }
          uint64_t v91 = [v165 rankingItem];
          if (([v91 startDueDateToNowInSeconds] & 0x8000000000000000) == 0) {
            goto LABEL_86;
          }
          unint64_t v110 = [v31 rankingItem];
          uint64_t v111 = [v110 startDueDateToNowInSeconds];

          if (v111 <= 0)
          {
LABEL_87:
            uint64_t v97 = [v165 rankingItem];
            uint64_t v98 = [v97 startDueDateToNowInSeconds];
            if (v98 >= 0) {
              unint64_t v99 = v98;
            }
            else {
              unint64_t v99 = -v98;
            }
            unint64_t v100 = [v31 rankingItem];
            uint64_t v101 = [v100 startDueDateToNowInSeconds];
            if (v101 >= 0) {
              unint64_t v102 = v101;
            }
            else {
              unint64_t v102 = -v101;
            }

            if (v99 < v102 && v54 > v58) {
              goto LABEL_95;
            }
            long long v103 = [v165 rankingItem];
            uint64_t v104 = [v103 startDueDateToNowInSeconds];
            if (v104 >= 0) {
              unint64_t v105 = v104;
            }
            else {
              unint64_t v105 = -v104;
            }
            long long v106 = [v31 rankingItem];
            uint64_t v107 = [v106 startDueDateToNowInSeconds];
            if (v107 >= 0) {
              unint64_t v108 = v107;
            }
            else {
              unint64_t v108 = -v107;
            }

            BOOL v109 = v105 > v108;
            id v14 = v65;
            if (v109 && v55 > v58) {
              goto LABEL_71;
            }
            goto LABEL_61;
          }
          goto LABEL_107;
        }
        if ([v36[7] latestTokenFromQU])
        {
          BOOL v90 = [v165 rankingItem];
          if (([v90 startDueDateToNowInSeconds] & 0x8000000000000000) == 0)
          {

LABEL_79:
            char v65 = v14;
            uint64_t v91 = [v165 rankingItem];
            if ([v91 startDueDateToNowInSeconds] <= 0)
            {
LABEL_86:

              goto LABEL_87;
            }
            id v92 = [v31 rankingItem];
            uint64_t v93 = [v92 startDueDateToNowInSeconds];

            if ((v93 & 0x8000000000000000) == 0) {
              goto LABEL_87;
            }
LABEL_107:
            uint64_t v69 = 1;
            goto LABEL_108;
          }
          char v112 = [v31 rankingItem];
          uint64_t v113 = v14;
          uint64_t v114 = [v112 startDueDateToNowInSeconds];

          BOOL v109 = v114 <= 0;
          id v14 = v113;
          if (v109) {
            goto LABEL_79;
          }
LABEL_110:
          uint64_t v69 = -1;
          goto LABEL_59;
        }
        goto LABEL_61;
      }
LABEL_57:
      uint64_t v69 = 1;
      goto LABEL_58;
    }
  }
LABEL_56:
  uint64_t v69 = -1;
LABEL_58:
  double v40 = v21;
LABEL_59:

  return v69;
}

uint64_t __68__SSRankingManager_searchToolRanker_queryContext_searchToolBundles___block_invoke_1083()
{
  uint64_t result = _os_feature_enabled_impl();
  searchToolRanker_queryContext_searchToolBundles__isDebug = result;
  return result;
}

- (id)groupSectionsByCategory:(id)a3 genreMap:(id)a4 topSections:(id)a5
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v102 = a4;
  id v85 = a5;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v7, "count"));
  id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = [v7 count];
  uint64_t v11 = v9;
  id v12 = v7;
  id v101 = (id)[v11 initWithCapacity:v10];
  if ([v7 count])
  {
    [v7 objectAtIndexedSubscript:0];
    id v14 = v13 = v7;
    id v15 = [v14 bundleIdentifier];
    int v16 = [v15 isEqualToString:@"com.apple.application"];

    if (v16)
    {
      uint64_t v83 = [v13 objectAtIndexedSubscript:0];
      int v82 = 1;
    }
    else
    {
      int v82 = 0;
      uint64_t v83 = 0;
    }
    id v12 = v13;
  }
  else
  {
    int v82 = 0;
    uint64_t v83 = 0;
  }
  uint64_t v84 = v12;
  if ([v85 count] == 1)
  {
    int v17 = [v85 firstObject];
    int v18 = [v17 results];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      id v20 = [v17 results];
      float v21 = [v20 firstObject];

      id v22 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[SSRankingManager groupSectionsByCategory:genreMap:topSections:](v21, v22);
      }

      unsigned int v23 = [v21 sectionBundleIdentifier];

      if (v23)
      {
        int v24 = [v21 sectionBundleIdentifier];
        uint64_t v25 = [v102 objectForKey:v24];

        double v26 = PRSLogCategoryDefault();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[SSRankingManager groupSectionsByCategory:genreMap:topSections:]((uint64_t)v25, v26);
        }

        if (v25)
        {
          uint64_t v89 = v21;
          uint64_t v91 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v84, "count"));
          int v86 = objc_opt_new();
          int v96 = v17;
          BOOL v99 = __65__SSRankingManager_groupSectionsByCategory_genreMap_topSections___block_invoke((uint64_t)v86, v17);
          long long v115 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          id v27 = v84;
          uint64_t v28 = [v27 countByEnumeratingWithState:&v115 objects:v127 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            int v30 = 0;
            uint64_t v31 = *(void *)v116;
            do
            {
              uint64_t v32 = 0;
              uint64_t v97 = v30;
              do
              {
                if (*(void *)v116 != v31) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v33 = *(void **)(*((void *)&v115 + 1) + 8 * v32);
                int v34 = [v33 bundleIdentifier];

                if (v34)
                {
                  float v35 = [v33 bundleIdentifier];
                  int v36 = [v102 objectForKey:v35];

                  BOOL v38 = __65__SSRankingManager_groupSectionsByCategory_genreMap_topSections___block_invoke(v37, v33);
                  if ([v25 isEqual:v36] && ((v99 ^ v38) & 1) == 0)
                  {
                    char v39 = PRSLogCategoryDefault();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                    {
                      uint64_t v93 = [v33 bundleIdentifier];
                      uint64_t v42 = [v96 bundleIdentifier];
                      *(_DWORD *)buf = 138412546;
                      __int16 v124 = v93;
                      __int16 v125 = 2112;
                      uint64_t v126 = v42;
                      BOOL v43 = (void *)v42;
                      _os_log_debug_impl(&dword_1BDB2A000, v39, OS_LOG_TYPE_DEBUG, "Grouping %@ with %@", buf, 0x16u);
                    }
                    [v91 addObject:v33];
                    [v86 addIndex:v97 + v32];
                  }
                }
                else
                {
                  int v36 = PRSLogCategoryDefault();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                  {
                    double v40 = [v33 bundleIdentifier];
                    id v41 = [v96 bundleIdentifier];
                    *(_DWORD *)buf = 138412546;
                    __int16 v124 = v40;
                    __int16 v125 = 2112;
                    uint64_t v126 = (uint64_t)v41;
                    _os_log_debug_impl(&dword_1BDB2A000, v36, OS_LOG_TYPE_DEBUG, "Not grouping %@ with %@", buf, 0x16u);
                  }
                }

                ++v32;
              }
              while (v29 != v32);
              uint64_t v29 = [v27 countByEnumeratingWithState:&v115 objects:v127 count:16];
              int v30 = v97 + v32;
            }
            while (v29);
          }

          float v21 = v89;
          double v44 = v91;
          int v17 = v96;
        }
        else
        {
          double v44 = 0;
          int v86 = 0;
        }
      }
      else
      {
        double v44 = 0;
        int v86 = 0;
      }
      id v12 = v84;
    }
    else
    {
      double v44 = 0;
      int v86 = 0;
      id v12 = v84;
    }
  }
  else
  {
    double v44 = 0;
    int v86 = 0;
  }
  if ([v44 count] && objc_msgSend(v86, "count"))
  {
    __int16 v45 = (void *)[v12 mutableCopy];
    [v45 removeObjectsAtIndexes:v86];
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v46 = v45;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v111 objects:v122 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v112;
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v112 != v49) {
            objc_enumerationMutation(v46);
          }
          [v44 addObject:*(void *)(*((void *)&v111 + 1) + 8 * i)];
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v111 objects:v122 count:16];
      }
      while (v48);
    }

    id v51 = v44;
  }
  else
  {
    id v51 = v12;
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v52 = v51;
  uint64_t v53 = [v52 countByEnumeratingWithState:&v107 objects:v121 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v108;
    id v92 = v44;
    uint64_t v87 = *(void *)v108;
    id v88 = v52;
    do
    {
      uint64_t v56 = 0;
      uint64_t v90 = v54;
      do
      {
        if (*(void *)v108 != v55) {
          objc_enumerationMutation(v52);
        }
        uint64_t v57 = *(void **)(*((void *)&v107 + 1) + 8 * v56);
        if (([v8 containsObject:v57] & 1) == 0)
        {
          float v58 = PRSLogCategoryDefault();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
            -[SSRankingManager groupSectionsByCategory:genreMap:topSections:]((uint64_t)v120, (uint64_t)v57);
          }

          [v8 addObject:v57];
          [v101 addObject:v57];
          id v59 = [v57 bundleIdentifier];

          if (v59)
          {
            double v60 = [v57 bundleIdentifier];
            int v61 = [v102 objectForKey:v60];

            double v62 = PRSLogCategoryDefault();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              __int16 v124 = v61;
              _os_log_debug_impl(&dword_1BDB2A000, v62, OS_LOG_TYPE_DEBUG, "Genre: %@", buf, 0xCu);
            }

            if (v61)
            {
              uint64_t v94 = v56;
              uint64_t v98 = v57;
              BOOL v64 = __65__SSRankingManager_groupSectionsByCategory_genreMap_topSections___block_invoke(v63, v57);
              long long v103 = 0u;
              long long v104 = 0u;
              long long v105 = 0u;
              long long v106 = 0u;
              id v65 = v52;
              uint64_t v66 = [v65 countByEnumeratingWithState:&v103 objects:v119 count:16];
              if (v66)
              {
                uint64_t v67 = v66;
                uint64_t v68 = *(void *)v104;
                do
                {
                  for (uint64_t j = 0; j != v67; ++j)
                  {
                    if (*(void *)v104 != v68) {
                      objc_enumerationMutation(v65);
                    }
                    double v70 = *(void **)(*((void *)&v103 + 1) + 8 * j);
                    if (([v8 containsObject:v70] & 1) == 0)
                    {
                      BOOL v71 = [v70 bundleIdentifier];

                      if (v71)
                      {
                        uint64_t v72 = [v70 bundleIdentifier];
                        uint64_t v73 = [v102 objectForKey:v72];

                        BOOL v75 = __65__SSRankingManager_groupSectionsByCategory_genreMap_topSections___block_invoke(v74, v70);
                        if ([v61 isEqual:v73] && ((v64 ^ v75) & 1) == 0)
                        {
                          char v76 = PRSLogCategoryDefault();
                          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
                          {
                            unint64_t v100 = [v70 bundleIdentifier];
                            long long v95 = [v98 bundleIdentifier];
                            *(_DWORD *)buf = 138412546;
                            __int16 v124 = v100;
                            __int16 v125 = 2112;
                            uint64_t v126 = (uint64_t)v95;
                            _os_log_debug_impl(&dword_1BDB2A000, v76, OS_LOG_TYPE_DEBUG, "Grouping %@ with %@", buf, 0x16u);
                          }
                          [v8 addObject:v70];
                          [v101 addObject:v70];
                        }
                      }
                      else
                      {
                        uint64_t v73 = PRSLogCategoryDefault();
                        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
                        {
                          float v77 = [v70 bundleIdentifier];
                          float v78 = [v98 bundleIdentifier];
                          *(_DWORD *)buf = 138412546;
                          __int16 v124 = v77;
                          __int16 v125 = 2112;
                          uint64_t v126 = (uint64_t)v78;
                          _os_log_debug_impl(&dword_1BDB2A000, v73, OS_LOG_TYPE_DEBUG, "Not grouping %@ with %@", buf, 0x16u);
                        }
                      }
                    }
                  }
                  uint64_t v67 = [v65 countByEnumeratingWithState:&v103 objects:v119 count:16];
                }
                while (v67);
              }

              uint64_t v54 = v90;
              double v44 = v92;
              uint64_t v55 = v87;
              id v52 = v88;
              uint64_t v56 = v94;
            }
          }
        }
        ++v56;
      }
      while (v56 != v54);
      uint64_t v54 = [v52 countByEnumeratingWithState:&v107 objects:v121 count:16];
    }
    while (v54);
  }

  double v79 = (void *)v83;
  if (v83) {
    int v80 = v82;
  }
  else {
    int v80 = 0;
  }
  if (v80 == 1 && (unint64_t)[v101 count] >= 2)
  {
    [v101 removeObject:v83];
    double v79 = (void *)v83;
    [v101 insertObject:v83 atIndex:0];
  }

  return v101;
}

BOOL __65__SSRankingManager_groupSectionsByCategory_genreMap_topSections___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    if ([v3 domain] == 2)
    {
      BOOL v4 = 0;
    }
    else
    {
      id v5 = [v3 resultSet];
      id v6 = [v5 firstObject];
      id v7 = [v6 rankingItem];
      id v8 = [v7 L2FeatureVector];
      if (v8)
      {
        id v9 = [v6 rankingItem];
        uint64_t v10 = [v9 L2FeatureVector];
        [v10 originalL2Score];
        float v12 = v11;

        BOOL v4 = v12 < -900.0;
      }
      else
      {
        BOOL v4 = 0;
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)rankAppsAtTopForScopedSearchWithSections:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [v4 bundleIdentifier];
  char v6 = [v5 isEqualToString:@"com.apple.application"];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)[v3 mutableCopy];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      int v11 = 0;
      uint64_t v12 = *(void *)v22;
      id v20 = v7;
      while (2)
      {
        uint64_t v13 = 0;
        int v19 = v11 + v10;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v8);
          }
          id v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
          id v15 = [v14 bundleIdentifier];
          int v16 = [v15 isEqualToString:@"com.apple.application"];

          if (v16)
          {
            uint64_t v17 = v13 + v11;
            id v7 = v20;
            [v20 removeObjectAtIndex:v17];
            [v20 insertObject:v14 atIndex:0];
            goto LABEL_12;
          }
          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        int v11 = v19;
        id v7 = v20;
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    id v3 = (id)[v7 copy];
  }

  return v3;
}

- (id)keyForSection:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 bundleIdentifier];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 title];
  }
  id v7 = v6;

  return v7;
}

- (void)updateWithNewRankingInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(SSRankingManager *)self rankingConfiguration];
  [v5 mergeWith:v4];
}

- (PRSRankingConfiguration)rankingConfiguration
{
  return self->_rankingConfiguration;
}

- (void)setRankingConfiguration:(id)a3
{
}

- (NSMutableString)logValues
{
  return self->_logValues;
}

- (void)setLogValues:(id)a3
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

- (NSString)query
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQuery:(id)a3
{
}

- (NSSet)allowedTopHitSections
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAllowedTopHitSections:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)bullseyeRankingEnabled
{
  return self->_bullseyeRankingEnabled;
}

- (void)setBullseyeRankingEnabled:(BOOL)a3
{
  self->_bullseyeRankingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTopHitSections, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_logValues, 0);
  objc_storeStrong((id *)&self->_rankingConfiguration, 0);
}

- (void)rankSectionsUsingBundleIDToSectionMapping:(void *)a3 withRanker:(NSObject *)a4 preferredBundleIds:isScopedSearch:queryId:isCJK:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:isPeopleSearch:queryContext:.cold.1(void *a1, uint8_t *a2, void *a3, NSObject *a4)
{
  id v7 = a1;
  *(_DWORD *)a2 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1BDB2A000, a4, OS_LOG_TYPE_ERROR, "result class >%@< does not respond to selector sectionBundleIdentifier", a2, 0xCu);
}

- (void)rankSectionsUsingBundleIDToSectionMapping:(os_log_t)log withRanker:preferredBundleIds:isScopedSearch:queryId:isCJK:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:isPeopleSearch:queryContext:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_ERROR, "[SpotlightRanking] L3: scoring failed.", v1, 2u);
}

+ (void)searchToolRanker:(uint64_t)a1 queryContext:(uint64_t)a2 searchToolBundles:.cold.1(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_0(a1, a2), "rankingItem");
  [v4 likelihood];
  *id v3 = 134217984;
  void *v2 = v5;
  OUTLINED_FUNCTION_0_0(&dword_1BDB2A000, v6, v7, "[SpotlightRanking] [SearchTool] [Doc Classification] Boosted likelihood for calendar item %0.2f");
}

- (void)groupSectionsByCategory:(uint64_t)a1 genreMap:(uint64_t)a2 topSections:.cold.1(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_0(a1, a2), "bundleIdentifier");
  *id v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_0_0(&dword_1BDB2A000, v5, v6, "Inspecting %@");
}

- (void)groupSectionsByCategory:(uint64_t)a1 genreMap:(NSObject *)a2 topSections:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_DEBUG, "Genre: %@", (uint8_t *)&v2, 0xCu);
}

- (void)groupSectionsByCategory:(void *)a1 genreMap:(NSObject *)a2 topSections:.cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 sectionBundleIdentifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_DEBUG, "Inspecting top result %@", (uint8_t *)&v4, 0xCu);
}

@end