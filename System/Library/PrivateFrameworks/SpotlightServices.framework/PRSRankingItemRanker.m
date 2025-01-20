@interface PRSRankingItemRanker
+ (BOOL)isBlendingScoreDemoted:(float)a3;
+ (BOOL)isCJK;
+ (BOOL)isContentWordQuery:(id)a3 queryTermCount:(int64_t)a4 keyboardLanguage:(id)a5;
+ (BOOL)isKeywordsHidingEnabled;
+ (BOOL)shouldFilterResult:(id)a3 currentTime:(double)a4 isScopedSearch:(BOOL)a5 clientBundleId:(id)a6 queryKind:(unint64_t)a7;
+ (_LanguageModel)languageModel;
+ (id)embeddingForLanguage:(id)a3;
+ (id)englishEmbedding;
+ (id)importantAttributesForBundle:(id)a3;
+ (id)importantAttributesForParsecBundle:(id)a3;
+ (id)itemSpecificImportantAttributesForBundle:(id)a3 withItem:(id)a4;
+ (id)phoneFavoritesCopy;
+ (id)preferredEmbedding;
+ (id)sortedUniqueBundleFeatureValuesFromBundleFeatures:(id)a3;
+ (unint64_t)spellCorrectedAppMinQueryLen;
+ (void)clearState;
+ (void)initialize;
+ (void)preheat;
+ (void)setDockApps:(id)a3;
+ (void)sortResultsInSection:(id)a3 currentTime:(double)a4;
+ (void)thresholdResultsInSection:(id)a3 userQuery:(id)a4 queryID:(int64_t)a5 isEntitiesSearch:(BOOL)a6 currentTime:(double)a7 isScopedSearch:(BOOL)a8 queryKind:(unint64_t)a9 clientBundleID:(id)a10 isSearchToolClient:(BOOL)a11;
- (BOOL)containsDigitInQuery;
- (BOOL)containsEnglishAlphabetInQuery;
- (BOOL)exact;
- (BOOL)hasParsecPolicyPhraseMatch;
- (BOOL)hasPolicyMultipleTermsPhraseMatch;
- (BOOL)hasPolicySingleTermPhraseMatch;
- (BOOL)isAltNamePrefixMatchOnlyTopHitExcludedQuery;
- (BOOL)isCJK;
- (BOOL)isCancelled;
- (BOOL)isContentWord;
- (BOOL)isFuzzySearch;
- (BOOL)isInternalDevice;
- (BOOL)isNLSearch;
- (BOOL)isPeopleSearch;
- (BOOL)isSearchToolClient;
- (BOOL)isSpellCorrectPrefixMatchOnlyTopHitExcludedQuery;
- (BOOL)policyDisabled;
- (BOOL)pommes;
- (BOOL)wasItemCreatedWithinAWeek:(id)a3;
- (NSArray)itemQPQUOutputTokenInfo;
- (NSArray)quIntentLabels;
- (NSArray)quIntentScores;
- (NSArray)queryTerms;
- (NSArray)rankCategories;
- (NSMapTable)bundleFeatures;
- (NSString)clientBundle;
- (NSString)keyboardLanguage;
- (NSString)meContactIdentifier;
- (NSString)parsedArgSearchTermFromQU;
- (NSString)parsedPersonFromQU;
- (NSString)parsedQueryFromQU;
- (NSString)searchString;
- (NSString)userQueryString;
- (PRSRankingItemRanker)initWithSearchString:(id)a3 queryID:(int64_t)a4 language:(id)a5 currentTime:(double)a6;
- (PRSRankingItemRanker)initWithSearchString:(id)a3 queryID:(int64_t)a4 language:(id)a5 isCJK:(BOOL)a6 experimentalWeight1:(double)a7 experimentalWeight2:(double)a8 currentTime:(double)a9;
- (PRSRankingItemRanker)initWithSearchString:(id)a3 userQueryString:(id)a4 queryID:(int64_t)a5 language:(id)a6 currentTime:(double)a7;
- (PRSRankingItemRanker)initWithSearchString:(id)a3 userQueryString:(id)a4 queryID:(int64_t)a5 language:(id)a6 isCJK:(BOOL)a7 experimentalWeight1:(double)a8 experimentalWeight2:(double)a9 currentTime:(double)a10;
- (_CSEmbedding)queryEmbedding;
- (double)currentTime;
- (double)experimentalWeight1;
- (double)experimentalWeight2;
- (float)computeScoresForVectors:(id)a3;
- (float)computeScoresForVectors:(id)a3 withBundleFeatures:(id)a4;
- (float)lastIsSpaceFeature;
- (id)comparatorByJoiningComparator:(id)a3 withPredicate:(id)a4;
- (id)filterRankedItems:(id)a3 bundle:(id)a4 userQuery:(id)a5;
- (id)rankingConfiguration;
- (id)rankingConfigurationWithMeContact:(id)a3 emailAddresses:(id)a4 phoneFavorites:(id)a5 vipList:(id)a6 clientBundle:(id)a7 isScopedSearch:(BOOL)a8 isAdvancedSyntax:(BOOL)a9 spotlightQuery:(id)a10 userQuery:(id)a11 tokenString:(id)a12 queryKind:(unint64_t)a13 isPeopleSearch:(BOOL)a14 keyboardLanguage:(id)a15;
- (id)rankingConfigurationWithMeContact:(id)a3 emailAddresses:(id)a4 phoneFavorites:(id)a5 vipList:(id)a6 clientBundle:(id)a7 isScopedSearch:(BOOL)a8 spotlightQuery:(id)a9 keyboardLanguage:(id)a10;
- (id)rankingConfigurationWithMeContact:(id)a3 emailAddresses:(id)a4 phoneFavorites:(id)a5 vipList:(id)a6 clientBundle:(id)a7 isScopedSearch:(BOOL)a8 spotlightQuery:(id)a9 userQuery:(id)a10 tokenString:(id)a11 queryKind:(unint64_t)a12 isPeopleSearch:(BOOL)a13 keyboardLanguage:(id)a14;
- (id)requery:(id *)a3;
- (id)userQuery;
- (int64_t)countQPUSpecialToken;
- (int64_t)queryID;
- (unint64_t)queryKind;
- (unint64_t)queryTermCount;
- (unint64_t)queryTermLength;
- (unint64_t)topHitMaxCount;
- (void)activate;
- (void)cancel;
- (void)computePolicyFeaturesForBundleItems:(id)a3 isCJK:(BOOL)a4;
- (void)computeRelativeFeatureForContext:(id)a3 items:(id)a4;
- (void)computeResultSetDependantFeatures:(id)a3 allItems:(id)a4;
- (void)deactivate;
- (void)dealloc;
- (void)parseLLMQUQuery:(id)a3;
- (void)parseQUQuery:(id)a3 isSearchToolClient:(BOOL)a4;
- (void)pickMostRecentDateForItem:(id)a3 pastItems:(id *)a4 futureItems:(id *)a5;
- (void)populateLocalResultSetDateFeaturesForItems:(id)a3;
- (void)populateMailContactFeaturesWithMailItems:(id)a3 contactItems:(id)a4;
- (void)populateRankResultSetBundleFeaturesWithBundleItems:(id)a3 withUniqueBundleMaxScores:(id)a4;
- (void)prepareForPurePommesL2RankingWithItems:(id)a3 inBundle:(id)a4;
- (void)prepareItems:(id)a3 inBundle:(id)a4;
- (void)prepareItemsForL1Ranking:(id)a3 inBundle:(id)a4;
- (void)prepareParsecResults:(id)a3 inBundle:(id)a4;
- (void)relevantResultSetPRSL2FeaturesFromBundleFeature:(unint64_t)a3 absRankFeatureOut:(unsigned __int16 *)a4 relRankFeatureOut:(unsigned __int16 *)a5;
- (void)rerankItemsWithPolicyForBundleItems:(id)a3 isCJK:(BOOL)a4;
- (void)resetWithSearchString:(id)a3;
- (void)resetWithSearchString:(id)a3 userQueryString:(id)a4;
- (void)resetbundleFeaturesScratchBuf:(float *)a3;
- (void)serializeAnonymousQueryLogFeaturesToJSONWithWriter:(void *)a3;
- (void)setBundleFeatures:(id)a3;
- (void)setClientBundle:(id)a3;
- (void)setContainsDigitInQuery:(BOOL)a3;
- (void)setContainsEnglishAlphabetInQuery:(BOOL)a3;
- (void)setCountQPUSpecialToken:(int64_t)a3;
- (void)setCurrentTime:(double)a3;
- (void)setExact:(BOOL)a3;
- (void)setExperimentalWeight1:(double)a3;
- (void)setExperimentalWeight2:(double)a3;
- (void)setHasParsecPolicyPhraseMatch:(BOOL)a3;
- (void)setHasPolicyMultipleTermsPhraseMatch:(BOOL)a3;
- (void)setHasPolicySingleTermPhraseMatch:(BOOL)a3;
- (void)setIsAltNamePrefixMatchOnlyTopHitExcludedQuery:(BOOL)a3;
- (void)setIsCJK:(BOOL)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setIsContentWord:(BOOL)a3;
- (void)setIsFuzzySearch:(BOOL)a3;
- (void)setIsInternalDevice:(BOOL)a3;
- (void)setIsNLSearch:(BOOL)a3;
- (void)setIsPeopleSearch:(BOOL)a3;
- (void)setIsSearchToolClient:(BOOL)a3;
- (void)setIsSpellCorrectPrefixMatchOnlyTopHitExcludedQuery:(BOOL)a3;
- (void)setItemQPQUOutputTokenInfo:(id)a3;
- (void)setKeyboardLanguage:(id)a3;
- (void)setLastIsSpaceFeature:(float)a3;
- (void)setMeContactIdentifier:(id)a3;
- (void)setParsedArgSearchTermFromQU:(id)a3;
- (void)setParsedPersonFromQU:(id)a3;
- (void)setParsedQueryFromQU:(id)a3;
- (void)setPolicyDisabled:(BOOL)a3;
- (void)setPommes:(BOOL)a3;
- (void)setQuIntentLabels:(id)a3;
- (void)setQuIntentScores:(id)a3;
- (void)setQueryEmbedding:(id)a3;
- (void)setQueryID:(int64_t)a3;
- (void)setQueryKind:(unint64_t)a3;
- (void)setQueryTermCount:(unint64_t)a3;
- (void)setQueryTermLength:(unint64_t)a3;
- (void)setQueryTerms:(id)a3;
- (void)setRankCategories:(id)a3;
- (void)setRenderEngagementFeaturesForItem:(id)a3 counts:(id)a4 isRender:(BOOL)a5 bundleDict:(id)a6;
- (void)setRenderEngagementFeaturesForItemAsShorts:(id)a3 counts:(signed __int16)a4[6] isRender:(BOOL)a5 bundleDict:(id)a6;
- (void)setSearchString:(id)a3;
- (void)setTopHitMaxCount:(unint64_t)a3;
- (void)setUserQueryString:(id)a3;
- (void)updateResultSetContext:(_resultset_computation_ctx *)a3 andUniqueScores:(id)a4 withResultSetItems:(id)a5;
- (void)updateResultSetFeaturesOnItems:(id)a3 withContext:(_resultset_computation_ctx *)a4 uniqueScores:(id)a5;
- (void)updateScoresForPreparedItems:(id)a3;
- (void)updateScoresForPreparedItems:(id)a3 isCJK:(BOOL)a4 clientBundleID:(id)a5 thresholdValue:(double)a6 queryNodeMatchInfo:(id)a7;
- (void)updateScoresForPreparedItems:(id)a3 isCJK:(BOOL)a4 clientBundleID:(id)a5 thresholdValue:(double)a6 queryNodeMatchInfo:(id)a7 collectL2Signals:(BOOL)a8;
@end

@implementation PRSRankingItemRanker

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("Ranking preheat queue", v3);
    v5 = (void *)sPreheatQueue;
    sPreheatQueue = (uint64_t)v4;
  }
}

+ (id)sortedUniqueBundleFeatureValuesFromBundleFeatures:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  v3 = objc_opt_new();
  uint64_t v4 = 46;
  do
  {
    v5 = objc_opt_new();
    [v3 addObject:v5];

    --v4;
  }
  while (v4);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obunint64_t j = [v20 keyEnumerator];
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = [v20 objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        for (unint64_t j = 0; j != 46; ++j)
        {
          if (j < 0x18 || j <= 0x2B && ((1 << j) & 0x9F000000000) != 0)
          {
            v12 = [v3 objectAtIndexedSubscript:j];
            v13 = [v10 objectAtIndexedSubscript:j];
            [v12 addObject:v13];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  uint64_t v14 = [v3 count];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t k = 0; k != v15; ++k)
    {
      v17 = [v3 objectAtIndexedSubscript:k];
      [v17 sortWithOptions:1 usingComparator:&__block_literal_global_791];
    }
  }

  return v3;
}

uint64_t __74__PRSRankingItemRanker_sortedUniqueBundleFeatureValuesFromBundleFeatures___block_invoke(uint64_t a1, void *a2)
{
  return -objc_msgSend(a2, "compare:");
}

+ (void)clearState
{
  pthread_mutex_lock(&sVIPLock_0);
  uint64_t v2 = (void *)sMeCardEmailsQuery;
  sMeCardEmailsQuery = 0;

  pthread_mutex_unlock(&sVIPLock_0);
}

+ (BOOL)isCJK
{
  if (isCJK_onceToken != -1) {
    dispatch_once(&isCJK_onceToken, &__block_literal_global_793);
  }
  return isCJK_sIsCJK;
}

void __29__PRSRankingItemRanker_isCJK__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v1 = [v0 firstObject];
  id v2 = [v1 lowercaseString];

  if (([v2 hasPrefix:@"ja"] & 1) != 0
    || ([v2 hasPrefix:@"zh"] & 1) != 0
    || [v2 hasPrefix:@"ko"])
  {
    isCJK_sIsCJK = 1;
  }
}

+ (BOOL)isKeywordsHidingEnabled
{
  if (isKeywordsHidingEnabled_onceToken != -1) {
    dispatch_once(&isKeywordsHidingEnabled_onceToken, &__block_literal_global_805);
  }
  id v2 = (void *)isKeywordsHidingEnabled_language;
  return +[SSRankingManager isKeywordsHidingEnabledForLanguage:]((uint64_t)SSRankingManager, v2);
}

void __47__PRSRankingItemRanker_isKeywordsHidingEnabled__block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v0 = [v2 languageCode];
  v1 = (void *)isKeywordsHidingEnabled_language;
  isKeywordsHidingEnabled_language = v0;
}

+ (unint64_t)spellCorrectedAppMinQueryLen
{
  if (spellCorrectedAppMinQueryLen_onceToken[0] != -1) {
    dispatch_once(spellCorrectedAppMinQueryLen_onceToken, &__block_literal_global_808);
  }
  id v2 = (void *)spellCorrectedAppMinQueryLen_language;
  return +[SSRankingManager getMinMisspellingLengthForLanguage:]((uint64_t)SSRankingManager, v2);
}

void __52__PRSRankingItemRanker_spellCorrectedAppMinQueryLen__block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v0 = [v2 languageCode];
  v1 = (void *)spellCorrectedAppMinQueryLen_language;
  spellCorrectedAppMinQueryLen_language = v0;
}

+ (_LanguageModel)languageModel
{
  if (languageModel_onceToken != -1) {
    dispatch_once(&languageModel_onceToken, &__block_literal_global_810);
  }
  return (_LanguageModel *)languageModel_languageModel;
}

void __37__PRSRankingItemRanker_languageModel__block_invoke()
{
  uint64_t v0 = dispatch_get_global_queue(9, 0);
  dispatch_async(v0, &__block_literal_global_812);
}

void __37__PRSRankingItemRanker_languageModel__block_invoke_2()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FA5D98];
  v4[0] = *MEMORY[0x1E4FA5D90];
  v4[1] = v0;
  v5[0] = MEMORY[0x1E4F1CC38];
  v5[1] = MEMORY[0x1E4F1CC38];
  v4[2] = *MEMORY[0x1E4FA5DA0];
  v1 = [MEMORY[0x1E4F1CA20] currentLocale];
  v5[2] = v1;
  v4[3] = *MEMORY[0x1E4FA5DA8];
  id v2 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v5[3] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];

  languageModel_languageModel = SILanguageModelCreateWithOptions();
}

+ (id)englishEmbedding
{
  if (englishEmbedding_onceToken != -1) {
    dispatch_once(&englishEmbedding_onceToken, &__block_literal_global_814);
  }
  id v2 = (void *)englishEmbedding_englishEmbedding;
  return v2;
}

void __40__PRSRankingItemRanker_englishEmbedding__block_invoke()
{
  uint64_t v0 = dispatch_get_global_queue(9, 0);
  dispatch_async(v0, &__block_literal_global_816);
}

uint64_t __40__PRSRankingItemRanker_englishEmbedding__block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x1E4F388C8] wordEmbeddingForLanguage:*MEMORY[0x1E4F386F0]];
  v1 = (void *)englishEmbedding_englishEmbedding;
  englishEmbedding_englishEmbedding = v0;

  id v2 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v3 = [v2 firstObject];
  uint64_t v4 = [v3 lowercaseString];
  v5 = (void *)englishEmbedding_preferredLanguage;
  englishEmbedding_preferredLanguage = v4;

  uint64_t result = [(id)englishEmbedding_preferredLanguage hasPrefix:@"en"];
  if ((result & 1) == 0)
  {
    if ([(id)englishEmbedding_preferredLanguage hasPrefix:@"fr"])
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F38700];
    }
    else if ([(id)englishEmbedding_preferredLanguage hasPrefix:@"de"])
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F38708];
    }
    else
    {
      uint64_t result = [(id)englishEmbedding_preferredLanguage hasPrefix:@"es"];
      if (!result) {
        return result;
      }
      uint64_t v7 = (void *)MEMORY[0x1E4F38770];
    }
    englishEmbedding_preferredEmbedding = [MEMORY[0x1E4F388C8] wordEmbeddingForLanguage:*v7];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (id)preferredEmbedding
{
  if (preferredEmbedding_onceToken != -1) {
    dispatch_once(&preferredEmbedding_onceToken, &__block_literal_global_831);
  }
  id v2 = (void *)preferredEmbedding_preferredEmbedding;
  return v2;
}

void __42__PRSRankingItemRanker_preferredEmbedding__block_invoke()
{
  uint64_t v0 = dispatch_get_global_queue(9, 0);
  dispatch_async(v0, &__block_literal_global_833);
}

void __42__PRSRankingItemRanker_preferredEmbedding__block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v1 = [v0 firstObject];
  id v5 = [v1 lowercaseString];

  if (([v5 hasPrefix:@"en"] & 1) == 0)
  {
    if ([v5 hasPrefix:@"fr"])
    {
      id v2 = (void *)MEMORY[0x1E4F38700];
    }
    else if ([v5 hasPrefix:@"de"])
    {
      id v2 = (void *)MEMORY[0x1E4F38708];
    }
    else
    {
      if (![v5 hasPrefix:@"es"]) {
        goto LABEL_9;
      }
      id v2 = (void *)MEMORY[0x1E4F38770];
    }
    uint64_t v3 = [MEMORY[0x1E4F388C8] wordEmbeddingForLanguage:*v2];
    uint64_t v4 = (void *)preferredEmbedding_preferredEmbedding;
    preferredEmbedding_preferredEmbedding = v3;
  }
LABEL_9:
}

+ (id)embeddingForLanguage:(id)a3
{
  id v3 = a3;
  if (embeddingForLanguage__onceToken != -1) {
    dispatch_once(&embeddingForLanguage__onceToken, &__block_literal_global_835);
  }
  if ([v3 hasPrefix:@"en"])
  {
    uint64_t v4 = +[PRSRankingItemRanker englishEmbedding];
LABEL_7:
    v9 = (void *)v4;
    goto LABEL_9;
  }
  id v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = [v6 lowercaseString];
  int v8 = [v3 hasPrefix:v7];

  if (v8)
  {
    uint64_t v4 = +[PRSRankingItemRanker preferredEmbedding];
    goto LABEL_7;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

void __45__PRSRankingItemRanker_embeddingForLanguage___block_invoke()
{
  uint64_t v0 = dispatch_get_global_queue(9, 0);
  dispatch_async(v0, &__block_literal_global_837);
}

uint64_t __45__PRSRankingItemRanker_embeddingForLanguage___block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x1E4F388C8] wordEmbeddingForLanguage:*MEMORY[0x1E4F386F0]];
  v1 = (void *)embeddingForLanguage__englishEmbedding;
  embeddingForLanguage__englishEmbedding = v0;

  id v2 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v3 = [v2 firstObject];
  uint64_t v4 = [v3 lowercaseString];
  id v5 = (void *)embeddingForLanguage__preferredLanguage;
  embeddingForLanguage__preferredLanguage = v4;

  uint64_t result = [(id)embeddingForLanguage__preferredLanguage hasPrefix:@"en"];
  if ((result & 1) == 0)
  {
    if ([(id)embeddingForLanguage__preferredLanguage hasPrefix:@"fr"])
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F38700];
    }
    else if ([(id)embeddingForLanguage__preferredLanguage hasPrefix:@"de"])
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F38708];
    }
    else
    {
      uint64_t result = [(id)embeddingForLanguage__preferredLanguage hasPrefix:@"es"];
      if (!result) {
        return result;
      }
      uint64_t v7 = (void *)MEMORY[0x1E4F38770];
    }
    embeddingForLanguage__preferredEmbedding = [MEMORY[0x1E4F388C8] wordEmbeddingForLanguage:*v7];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (BOOL)isBlendingScoreDemoted:(float)a3
{
  return a3 < -100.0;
}

+ (BOOL)isContentWordQuery:(id)a3 queryTermCount:(int64_t)a4 keyboardLanguage:(id)a5
{
  id v7 = a3;
  int v8 = (void *)MEMORY[0x1E4F1CA20];
  id v9 = a5;
  v10 = [v8 preferredLanguages];
  v11 = [v10 firstObject];
  v12 = [v11 lowercaseString];

  v13 = [v9 lowercaseString];

  if (v13)
  {
    if ([v13 hasPrefix:@"en"])
    {
      int v14 = [v12 hasPrefix:v13];
      if (a4 == 1
        && v7
        && v14
        && +[PRSRankingItemRanker languageModel])
      {
        [MEMORY[0x1E4F1CA20] currentLocale];
        SILanguageModelIsContentTokenInString();
      }
    }
  }

  return 1;
}

- (PRSRankingItemRanker)initWithSearchString:(id)a3 userQueryString:(id)a4 queryID:(int64_t)a5 language:(id)a6 currentTime:(double)a7
{
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [(PRSRankingItemRanker *)self initWithSearchString:v14 userQueryString:v13 queryID:a5 language:v12 isCJK:+[PRSRankingItemRanker isCJK] experimentalWeight1:0.0 experimentalWeight2:0.0 currentTime:a7];

  return v15;
}

- (PRSRankingItemRanker)initWithSearchString:(id)a3 userQueryString:(id)a4 queryID:(int64_t)a5 language:(id)a6 isCJK:(BOOL)a7 experimentalWeight1:(double)a8 experimentalWeight2:(double)a9 currentTime:(double)a10
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a6;
  v41.receiver = self;
  v41.super_class = (Class)PRSRankingItemRanker;
  long long v22 = [(PRSRankingItemRanker *)&v41 init];
  long long v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_userQueryString, a4);
    v23->_queryID = a5;
    objc_storeStrong((id *)&v23->_searchString, a3);
    objc_storeStrong((id *)&v23->_keyboardLanguage, a6);
    if ([v19 length])
    {
      int v24 = SSStringEndsWithSpace(v19);
      float v25 = 0.0;
      if (v24) {
        float v25 = 1.0;
      }
    }
    else
    {
      float v25 = 0.0;
    }
    v23->_lastIsSpaceFeature = v25;
    v23->_isCJK = a7;
    queryEmbedding = v23->_queryEmbedding;
    v23->_countQPUSpecialToken = -1;
    v23->_queryEmbedding = 0;

    [@"com.apple.searchd" UTF8String];
    v23->_isInternalDevice = os_variant_has_internal_diagnostics();
    uint64_t v27 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    bundleFeatures = v23->_bundleFeatures;
    v23->_bundleFeatures = (NSMapTable *)v27;

    rankCategories = v23->_rankCategories;
    v23->_rankCategories = 0;

    v23->_experimentalWeight1 = a8;
    v23->_experimentalWeight2 = a9;
    v30 = +[PRSModelManager sharedModelManager];
    v23->_policyDisabled = [v30 disablePolicy];

    if (v23->_isInternalDevice)
    {
      Boolean keyExistsAndHasValidFormat = 0;
      if (CFPreferencesGetAppBooleanValue(@"SearchRankingDisablePolicy", @"com.apple.searchd", &keyExistsAndHasValidFormat))
      {
        v23->_policyDisabled = keyExistsAndHasValidFormat != 0;
      }
    }
    v23->_currentTime = a10;
    *(_DWORD *)&v23->_hasPolicyMultipleTermsPhraseMatch = 0;
    v23->_isContentWord = 0;
    v31 = SSPhraseQueryUnquoteString(v23->_searchString);
    v32 = (void *)[objc_alloc(MEMORY[0x1E4F237B8]) initWithQuery:v31 language:v23->_keyboardLanguage fuzzyThreshold:0 options:0];
    [v32 setMatchOncePerTerm:0];
    v33 = [v32 queryTerms];
    v23->_queryTermCount = [v33 count];

    v23->_queryTermLength = [v31 length];
    v23->_containsEnglishAlphabetInQuery = +[PRSRankingUtilities aToZInString:v23->_searchString];
    v23->_containsDigitInQuery = +[PRSRankingUtilities digitInString:v23->_searchString];
    uint64_t v34 = [v32 queryTerms];
    queryTerms = v23->_queryTerms;
    v23->_queryTerms = (NSArray *)v34;

    v23->_topHitMaxCount = 0;
    *(_DWORD *)&v23->_isNLSearch = 0;
    v36 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v37 = [v31 stringByTrimmingCharactersInSet:v36];

    uint64_t v38 = 0;
    while ([v37 caseInsensitiveCompare:sSpecialAltNamePrefixMatchQueriesList[v38]])
    {
      if (++v38 == 5) {
        goto LABEL_15;
      }
    }
    v23->_isAltNamePrefixMatchOnlyTopHitExcludedQuery = 1;
LABEL_15:
    if (![v37 caseInsensitiveCompare:@"aapl"]) {
      v23->_isSpellCorrectPrefixMatchOnlyTopHitExcludedQuery = 1;
    }
  }
  return v23;
}

- (PRSRankingItemRanker)initWithSearchString:(id)a3 queryID:(int64_t)a4 language:(id)a5 currentTime:(double)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [(PRSRankingItemRanker *)self initWithSearchString:v11 queryID:a4 language:v10 isCJK:+[PRSRankingItemRanker isCJK] experimentalWeight1:0.0 experimentalWeight2:0.0 currentTime:a6];

  return v12;
}

- (PRSRankingItemRanker)initWithSearchString:(id)a3 queryID:(int64_t)a4 language:(id)a5 isCJK:(BOOL)a6 experimentalWeight1:(double)a7 experimentalWeight2:(double)a8 currentTime:(double)a9
{
  return [(PRSRankingItemRanker *)self initWithSearchString:a3 userQueryString:a3 queryID:a4 language:a5 isCJK:a6 experimentalWeight1:a7 experimentalWeight2:a8 currentTime:a9];
}

- (void)resetWithSearchString:(id)a3
{
}

- (void)resetWithSearchString:(id)a3 userQueryString:(id)a4
{
  id v21 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_userQueryString, a4);
  objc_storeStrong((id *)&self->_searchString, a3);
  if ([v21 length])
  {
    int v8 = SSStringEndsWithSpace(v21);
    float v9 = 0.0;
    if (v8) {
      float v9 = 1.0;
    }
  }
  else
  {
    float v9 = 0.0;
  }
  self->_lastIsSpaceFeature = v9;
  id v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  bundleFeatures = self->_bundleFeatures;
  self->_bundleFeatures = v10;

  rankCategories = self->_rankCategories;
  self->_rankCategories = 0;

  self->_isContentWord = 0;
  *(_DWORD *)&self->_hasPolicyMultipleTermsPhraseMatch = 0;
  id v13 = SSPhraseQueryUnquoteString(self->_searchString);
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F237B8]) initWithQuery:v13 language:self->_keyboardLanguage fuzzyThreshold:0 options:0];
  [v14 setMatchOncePerTerm:0];
  uint64_t v15 = [v14 queryTerms];
  self->_queryTermCount = [v15 count];

  self->_queryTermLength = [v13 length];
  self->_containsEnglishAlphabetInQuery = +[PRSRankingUtilities aToZInString:self->_searchString];
  self->_containsDigitInQuery = +[PRSRankingUtilities digitInString:self->_searchString];
  v16 = [v14 queryTerms];
  queryTerms = self->_queryTerms;
  self->_queryTerms = v16;

  self->_topHitMaxCount = 0;
  *(_DWORD *)&self->_isNLSearch = 0;
  v18 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v19 = [v13 stringByTrimmingCharactersInSet:v18];

  uint64_t v20 = 0;
  while ([v19 caseInsensitiveCompare:sSpecialAltNamePrefixMatchQueriesList[v20]])
  {
    if (++v20 == 5) {
      goto LABEL_11;
    }
  }
  self->_isAltNamePrefixMatchOnlyTopHitExcludedQuery = 1;
LABEL_11:
  if (![v19 caseInsensitiveCompare:@"aapl"]) {
    self->_isSpellCorrectPrefixMatchOnlyTopHitExcludedQuery = 1;
  }
}

- (void)parseLLMQUQuery:(id)a3
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 queryUnderstandingOutput];
  [v3 setEarliestTokenFromQU:0];
  [v3 setLatestTokenFromQU:0];
  [v3 setIsFlightEventSearch:0];
  [v3 setIsHotelEventSearch:0];
  [v3 setIsRestaurantEventSearch:0];
  [v3 setIsEventSearch:0];
  [v3 setEntityL1Score:0.0];
  [v3 setLlmQUIntentType:0];
  [v3 setInferredLlmQUIntentType:0];
  [v3 setIsSingle:0];
  [v3 setIsPlural:0];
  [v3 setHasSearchTerm:0];
  [v3 setIsLLMQUIntentEventSearch:0];
  id v5 = [v4 objectForKeyedSubscript:@"kQPQUIntentIds"];
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v122 objects:v148 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v123;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v123 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v122 + 1) + 8 * i);
        if ([v10 intValue] == 2 || objc_msgSend(v10, "intValue") == 3) {
          [v3 setIsLLMQUIntentEventSearch:1];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v122 objects:v148 count:16];
    }
    while (v7);
  }
  v91 = v4;
  v92 = v5;
  v100 = v3;
  id v11 = [v4 objectForKeyedSubscript:@"kQPQUOutputTokenInfo"];
  v104 = objc_opt_new();
  id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  obunint64_t j = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v118 objects:v147 count:16];
  if (!v12)
  {
    int64_t v111 = 0;
    goto LABEL_153;
  }
  uint64_t v13 = v12;
  int64_t v111 = 0;
  uint64_t v14 = *(void *)v119;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v119 != v14) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v118 + 1) + 8 * v15);
      v17 = [v16 objectForKeyedSubscript:@"kQPQUOutputToken"];
      v18 = [v16 objectForKeyedSubscript:@"kQPQUOutputTokenArgIds"];
      id v19 = objc_opt_new();
      [v19 setObject:v17 forKey:@"kQPQUOutputToken"];
      if ([v18 count])
      {
        uint64_t v20 = [v16 objectForKeyedSubscript:@"kQPQUOutputTokenArgScores"];
        [v19 setObject:v20 forKey:@"kQPQUOutputTokenArgScores"];

        id v21 = [v16 objectForKeyedSubscript:@"kQPQUOutputTokenArgLabels"];
        [v19 setObject:v21 forKey:@"kQPQUOutputTokenArgLabels"];

        long long v22 = [v18 objectAtIndexedSubscript:0];
        if (![v22 longValue]) {
          goto LABEL_24;
        }
        ++v111;
        if ([v22 longValue] == 61)
        {
          long long v23 = v100;
          [v100 setEarliestTokenFromQU:1];
          goto LABEL_20;
        }
        if ([v22 longValue] == 94)
        {
          [v100 setEarliestTokenFromQU:1];
          goto LABEL_24;
        }
        if ([v22 longValue] == 62)
        {
          long long v23 = v100;
          [v100 setLatestTokenFromQU:1];
LABEL_20:
          int v24 = v23;
LABEL_21:
          [v24 setIsSingle:1];
          goto LABEL_24;
        }
        if ([v22 longValue] == 95)
        {
          [v100 setLatestTokenFromQU:1];
          goto LABEL_24;
        }
        if ([v22 longValue] == 16)
        {
          uint64_t v26 = v100;
          [v100 setIsHotelEventSearch:1];
          [v100 setIntentFromQU:16];
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 0x4000;
        }
        else if ([v22 longValue] == 15)
        {
          uint64_t v26 = v100;
          [v100 setIsFlightEventSearch:1];
          [v100 setIntentFromQU:10];
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 0x8000;
        }
        else if ([v22 longValue] == 17)
        {
          uint64_t v26 = v100;
          [v100 setIsRestaurantEventSearch:1];
          [v100 setIntentFromQU:21];
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 0x10000;
        }
        else if ([v22 longValue] == 14)
        {
          uint64_t v26 = v100;
          [v100 setIsEventSearch:1];
          [v100 setIntentFromQU:23];
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 0x20000;
        }
        else if ([v22 longValue] == 79)
        {
          uint64_t v26 = v100;
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 0x40000;
        }
        else if ([v22 longValue] == 80)
        {
          uint64_t v26 = v100;
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 0x80000;
        }
        else if ([v22 longValue] == 81)
        {
          uint64_t v26 = v100;
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 0x100000;
        }
        else if ([v22 longValue] == 82)
        {
          uint64_t v26 = v100;
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 0x200000;
        }
        else if ([v22 longValue] == 83)
        {
          uint64_t v26 = v100;
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 0x400000;
        }
        else if ([v22 longValue] == 21 {
               || [v22 longValue] == 31
        }
               || [v22 longValue] == 30)
        {
          uint64_t v26 = v100;
          [v100 setIntentFromQU:1];
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 4;
        }
        else if ([v22 longValue] == 22 || objc_msgSend(v22, "longValue") == 34)
        {
          uint64_t v26 = v100;
          [v100 setIntentFromQU:24];
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 64;
        }
        else if ([v22 longValue] == 25)
        {
          uint64_t v26 = v100;
          [v100 setIntentFromQU:2];
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 2;
        }
        else if ([v22 longValue] == 19)
        {
          uint64_t v26 = v100;
          [v100 setIntentFromQU:3];
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 8;
        }
        else if ([v22 longValue] == 29)
        {
          uint64_t v26 = v100;
          [v100 setIntentFromQU:23];
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 32;
        }
        else if ([v22 longValue] == 18)
        {
          uint64_t v26 = v100;
          [v100 setIntentFromQU:5];
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 2048;
        }
        else if ([v22 longValue] == 26)
        {
          uint64_t v26 = v100;
          [v100 setIntentFromQU:5];
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 1024;
        }
        else if ([v22 longValue] == 28)
        {
          uint64_t v26 = v100;
          [v100 setIntentFromQU:5];
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 4096;
        }
        else if ([v22 longValue] == 27)
        {
          uint64_t v26 = v100;
          [v100 setIntentFromQU:5];
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 0x2000;
        }
        else if ([v22 longValue] == 24)
        {
          uint64_t v26 = v100;
          [v100 setIntentFromQU:22];
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 16;
        }
        else if ([v22 longValue] == 32)
        {
          uint64_t v26 = v100;
          [v100 setIntentFromQU:2];
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 512;
        }
        else if ([v22 longValue] == 20 || objc_msgSend(v22, "longValue") == 33)
        {
          uint64_t v26 = v100;
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 1;
        }
        else
        {
          if ([v22 longValue] != 35)
          {
            if ([v22 longValue] == 1)
            {
              [v100 entityL1Score];
              double v30 = v29 + 0.8005;
              *(float *)&double v30 = v30;
              [v100 setEntityL1Score:v30];
              [v93 addObject:v17];
              goto LABEL_24;
            }
            if ([v22 longValue] == 8
              || [v22 longValue] == 9
              || [v22 longValue] == 10
              || [v22 longValue] == 11
              || [v22 longValue] == 12
              || [v22 longValue] == 13)
            {
              v31 = v100;
              [v100 entityL1Score];
              double v33 = v32 + 1.276;
            }
            else if ([v22 longValue] == 104 {
                   || [v22 longValue] == 64
            }
                   || [v22 longValue] == 65
                   || [v22 longValue] == 66)
            {
              v31 = v100;
              [v100 entityL1Score];
              double v33 = v34 + 1.3168;
            }
            else
            {
              if ([v22 longValue] != 5
                && [v22 longValue] != 6
                && [v22 longValue] != 7)
              {
                if ([v22 longValue] == 96)
                {
                  int v24 = v100;
                  goto LABEL_21;
                }
                if ([v22 longValue] == 97)
                {
                  [v100 setIsPlural:1];
                }
                else
                {
                  if ([v22 longValue] == 105)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 2048;
                  }
                  else if ([v22 longValue] == 106)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 8;
                  }
                  else if ([v22 longValue] == 107 || objc_msgSend(v22, "longValue") == 120)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 1;
                  }
                  else if ([v22 longValue] == 108 {
                         || [v22 longValue] == 110
                  }
                         || [v22 longValue] == 117
                         || [v22 longValue] == 118)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 4;
                  }
                  else if ([v22 longValue] == 109 || objc_msgSend(v22, "longValue") == 121)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 64;
                  }
                  else if ([v22 longValue] == 112)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 2;
                  }
                  else if ([v22 longValue] == 113)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 1024;
                  }
                  else if ([v22 longValue] == 114)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 0x2000;
                  }
                  else if ([v22 longValue] == 115)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 4096;
                  }
                  else if ([v22 longValue] == 116)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 32;
                  }
                  else if ([v22 longValue] == 119)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 512;
                  }
                  else if ([v22 longValue] == 122)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 256;
                  }
                  else if ([v22 longValue] == 123 || objc_msgSend(v22, "longValue") == 125)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 0x800000;
                  }
                  else if ([v22 longValue] == 124)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 0x1000000;
                  }
                  else if ([v22 longValue] == 126)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 0x2000000;
                  }
                  else if ([v22 longValue] == 127)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 16;
                  }
                  else if ([v22 longValue] == 128)
                  {
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 0x4000000;
                  }
                  else
                  {
                    if ([v22 longValue] != 129) {
                      goto LABEL_24;
                    }
                    v36 = v100;
                    uint64_t v37 = [v100 inferredLlmQUIntentType];
                    uint64_t v38 = 0x8000000;
                  }
                  [v36 setInferredLlmQUIntentType:v38 | v37];
                }
LABEL_24:

                goto LABEL_25;
              }
              if ([v22 longValue] == 7) {
                [v100 setArrivalLocationFromQU:v17];
              }
              if ([v22 longValue] == 6) {
                [v100 setDepartureLocationFromQU:v17];
              }
              v31 = v100;
              [v100 entityL1Score];
              double v33 = v35 + 0.9583;
            }
            *(float *)&double v33 = v33;
            [v31 setEntityL1Score:v33];
            goto LABEL_24;
          }
          uint64_t v26 = v100;
          uint64_t v27 = [v100 llmQUIntentType];
          uint64_t v28 = 256;
        }
        [v26 setLlmQUIntentType:v28 | v27];
        goto LABEL_24;
      }
LABEL_25:
      float v25 = (void *)[v19 copy];
      [v104 addObject:v25];

      ++v15;
    }
    while (v13 != v15);
    uint64_t v39 = [obj countByEnumeratingWithState:&v118 objects:v147 count:16];
    uint64_t v13 = v39;
  }
  while (v39);
LABEL_153:

  self->_countQPUSpecialToken = v111;
  if ([v93 count])
  {
    v40 = [v93 componentsJoinedByString:@" "];
    [(PRSRankingItemRanker *)self setParsedArgSearchTermFromQU:v40];

    [v100 setHasSearchTerm:1];
  }
  BOOL v41 = ([v100 inferredLlmQUIntentType] & 0x100) != 0
     || ([v100 llmQUIntentType] & 0x100) != 0;
  BOOL v99 = v41;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v101 = obj;
  uint64_t v105 = [v101 countByEnumeratingWithState:&v114 objects:v146 count:16];
  if (!v105)
  {
    v44 = &stru_1F1824018;
    v107 = &stru_1F1824018;
    v97 = &stru_1F1824018;
    goto LABEL_209;
  }
  BOOL v42 = 0;
  uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v102 = *(void *)v115;
  v44 = &stru_1F1824018;
  v107 = &stru_1F1824018;
  v97 = &stru_1F1824018;
  while (2)
  {
    uint64_t v45 = 0;
    uint64_t v46 = v43;
    while (2)
    {
      if (*(void *)v115 != v102) {
        objc_enumerationMutation(v101);
      }
      v47 = *(void **)(*((void *)&v114 + 1) + 8 * v45);
      v48 = [v47 objectForKeyedSubscript:@"kQPQUOutputToken"];
      v112 = [v47 objectForKeyedSubscript:@"kQPQUOutputTokenArgIds"];
      v49 = [v47 objectForKeyedSubscript:@"kQPQUOutputTokenAttributeIndexes"];
      id obja = v49;
      if ([v49 count])
      {
        v50 = [v49 objectAtIndexedSubscript:0];
        uint64_t v43 = [v50 integerValue];
      }
      else
      {
        uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v51 = [v47 objectForKeyedSubscript:@"kQPQUOutputECRGroundNamesToken"];
      if ([v112 count])
      {
        v52 = [v112 objectAtIndexedSubscript:0];
        if ([v52 longValue] == 1
          || [v52 longValue] == 2
          || [v52 longValue] == 3
          || [v52 longValue] == 4
          || [v52 longValue] == 5
          || [v52 longValue] == 6
          || [v52 longValue] == 7
          || [v52 longValue] == 8
          || [v52 longValue] == 9
          || [v52 longValue] == 10
          || [v52 longValue] == 64
          || [v52 longValue] == 65
          || [v52 longValue] == 66)
        {
          v53 = v107;
          if ([(__CFString *)v107 length])
          {
            [(__CFString *)v107 stringByAppendingString:@" "];
            v54 = v48;
            BOOL v55 = v42;
            uint64_t v56 = v43;
            uint64_t v58 = v57 = v44;

            v53 = (void *)v58;
            v44 = v57;
            uint64_t v43 = v56;
            BOOL v42 = v55;
            v48 = v54;
          }
          v107 = [v53 stringByAppendingString:v48];

          if ([v52 longValue] == 64
            || [v52 longValue] == 65
            || [v52 longValue] == 66)
          {
            if ([(__CFString *)v44 length])
            {
              uint64_t v59 = [(__CFString *)v107 stringByAppendingString:@" "];

              v44 = (__CFString *)v59;
            }
            uint64_t v60 = [(__CFString *)v44 stringByAppendingString:v48];

            v44 = (__CFString *)v60;
          }
        }
        if (v43 == v46 && v42)
        {
LABEL_189:
          BOOL v42 = 1;
        }
        else
        {
          uint64_t v61 = [v51 count];
          BOOL v42 = v61 != 0;
          if (v61) {
            BOOL v62 = v99;
          }
          else {
            BOOL v62 = 0;
          }
          if (v62)
          {
            v63 = v97;
            if ([v52 longValue] != 64
              && [v52 longValue] != 65
              && [v52 longValue] != 66
              && [v52 longValue] != 104)
            {
              goto LABEL_189;
            }
            if ([(__CFString *)v97 length])
            {
              uint64_t v64 = [(__CFString *)v97 stringByAppendingString:@" "];

              v63 = (void *)v64;
            }
            if ([v51 count])
            {
              [v51 objectAtIndex:0];
              uint64_t v98 = v43;
              v63 = v65 = v63;
              [v63 componentsJoinedByString:@" "];
              v66 = v95 = v44;
              uint64_t v67 = [v65 stringByAppendingString:v66];

              uint64_t v43 = v98;
              v44 = v95;
            }
            else
            {
              uint64_t v67 = [v63 stringByAppendingString:v48];
            }

            BOOL v42 = 1;
            v97 = (__CFString *)v67;
          }
        }
      }
      ++v45;
      uint64_t v46 = v43;
      if (v105 != v45) {
        continue;
      }
      break;
    }
    uint64_t v105 = [v101 countByEnumeratingWithState:&v114 objects:v146 count:16];
    if (v105) {
      continue;
    }
    break;
  }
LABEL_209:

  v96 = v44;
  if ([(__CFString *)v107 length])
  {
    v68 = self;
    [(PRSRankingItemRanker *)self setParsedQueryFromQU:v107];
    if ([(__CFString *)v97 length]) {
      v69 = v97;
    }
    else {
      v69 = v44;
    }
    [(PRSRankingItemRanker *)self setParsedPersonFromQU:v69];
    v70 = v100;
    [v100 setParsedQueryFromQU:v107];
    v71 = v92;
  }
  else
  {
    v70 = v100;
    v71 = v92;
    v68 = self;
    if ([(__CFString *)v97 length]) {
      [(PRSRankingItemRanker *)self setParsedPersonFromQU:v97];
    }
  }
  v72 = [v70 spQUParse];
  v73 = [v72 getEncodedData];
  v74 = [v73 objectForKeyedSubscript:@"isPQA"];

  int v75 = [v70 isAppEntitySearch];
  v76 = @"PQA";
  if (!v74) {
    v76 = @"PCS";
  }
  if (v75) {
    v76 = @"AppEntity";
  }
  v77 = v76;
  v78 = SSGeneralLog();
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
  {
    v113 = [v70 searchString];
    v106 = SSRedactString(v113, 1);
    objb = v77;
    uint64_t v79 = +[SPSearchQueryContext llmQUIntentString:](SPSearchQueryContext, "llmQUIntentString:", [v70 llmQUIntentType]);
    uint64_t v80 = +[SPSearchQueryContext llmQUIntentString:](SPSearchQueryContext, "llmQUIntentString:", [v70 inferredLlmQUIntentType]);
    int v103 = [v70 earliestTokenFromQU];
    int v81 = [v70 latestTokenFromQU];
    v82 = [(PRSRankingItemRanker *)v68 parsedQueryFromQU];
    v83 = SSRedactString(v82, 1);
    v84 = [(PRSRankingItemRanker *)v68 parsedPersonFromQU];
    v85 = SSRedactString(v84, 1);
    [v100 entityL1Score];
    double v87 = v86;
    int v88 = [v100 hasQueryTextEmbedding];
    *(_DWORD *)buf = 138414594;
    v127 = v106;
    __int16 v128 = 2112;
    v89 = (void *)v79;
    uint64_t v129 = v79;
    __int16 v130 = 2112;
    uint64_t v131 = v80;
    v90 = (void *)v80;
    __int16 v132 = 1024;
    int v133 = v103;
    v77 = objb;
    __int16 v134 = 1024;
    int v135 = v81;
    __int16 v136 = 2112;
    v137 = v83;
    __int16 v138 = 2112;
    v139 = v85;
    __int16 v140 = 2048;
    double v141 = v87;
    __int16 v142 = 1024;
    int v143 = v88;
    __int16 v144 = 2112;
    v145 = objb;
    _os_log_impl(&dword_1BDB2A000, v78, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [QU] [LLM] query=%@ LLM_QU_Intent=%@ LLM_QU_Inferred_Intent=%@ detected earliest=%i latest=%i parsedQueryFromQU=[%@] parsedPersonFromQU=[%@] entityL1Score=%f hasQueryContextEmbedding=%i queryType=%@", buf, 0x5Au);

    v71 = v92;
    v70 = v100;
  }
}

- (void)parseQUQuery:(id)a3 isSearchToolClient:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = [v5 queryUnderstandingOutput];
    if (![v6 count])
    {
      float v9 = SSGeneralLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BDB2A000, v9, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [QU] No QU available, queryUnderstandingOutput empty", buf, 2u);
      }
      goto LABEL_135;
    }
    uint64_t v7 = [v6 objectForKeyedSubscript:@"kQPQueryTextEmbeddingEncodedData"];
    unsigned int v8 = v4;
    float v9 = v7;
    if (SSEnableSearchToolCleanSlate(v8))
    {
      if (SSEnableTextSemanticSearchCalibration())
      {
        id v10 = (_CSEmbedding *)[objc_alloc(MEMORY[0x1E4F238A8]) initWithEncodedData:v9];
        queryEmbedding = self->_queryEmbedding;
        self->_queryEmbedding = v10;

        if (!self->_queryEmbedding)
        {
          uint64_t v12 = v9;
          uint64_t v13 = SSGeneralLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[PRSRankingItemRanker parseQUQuery:isSearchToolClient:]((uint64_t)self);
          }

          float v9 = v12;
        }
      }
    }
    objc_msgSend(v5, "setHasQueryTextEmbedding:", -[NSObject length](v9, "length") != 0);
    uint64_t v14 = [v6 objectForKeyedSubscript:@"kQPQUParseType"];
    [v5 setIsFromLLMQUParse:0];
    uint64_t v129 = v14;
    if (v14 && [v14 isEqualToString:@"kQPQULLMParse"])
    {
      [v5 setIsFromLLMQUParse:1];
      [(PRSRankingItemRanker *)self parseLLMQUQuery:v5];
LABEL_134:

LABEL_135:
      goto LABEL_136;
    }
    if (parseQUQuery_isSearchToolClient__onceToken != -1) {
      dispatch_once(&parseQUQuery_isSearchToolClient__onceToken, &__block_literal_global_897);
    }
    objc_msgSend(v5, "setEarliestTokenFromQU:", 0, v9);
    [v5 setLatestTokenFromQU:0];
    [v5 setIsFlightEventSearch:0];
    [v5 setIsHotelEventSearch:0];
    [v5 setIsRestaurantEventSearch:0];
    [v5 setIsEventSearch:0];
    int v133 = [v6 objectForKeyedSubscript:@"kQPQUIntentScores"];
    __int16 v142 = [v6 objectForKeyedSubscript:@"kQPQUIntentIds"];
    __int16 v128 = v6;
    uint64_t v15 = [v6 objectForKeyedSubscript:@"kQPQUOutputTokenInfo"];
    v147 = objc_opt_new();
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    obuint64_t j = v15;
    uint64_t v16 = [obj countByEnumeratingWithState:&v166 objects:v188 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      int64_t v145 = 0;
      uint64_t v148 = *(void *)v167;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v167 != v148) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v166 + 1) + 8 * i);
          uint64_t v20 = objc_opt_new();
          id v21 = [v19 objectForKeyedSubscript:@"kQPQUOutputToken"];
          [v20 setObject:v21 forKey:@"kQPQUOutputToken"];
          long long v22 = [v19 objectForKeyedSubscript:@"kQPQUOutputTokenArgScores"];
          long long v23 = [v19 objectForKeyedSubscript:@"kQPQUOutputTokenArgLabels"];
          if ([v23 containsObject:@"QUPP_ARG_EVENT_TYPE_FLIGHT"]) {
            [v5 setIsFlightEventSearch:1];
          }
          if ([v23 containsObject:@"QUPP_ARG_EVENT_TYPE_HOTEL"]) {
            [v5 setIsHotelEventSearch:1];
          }
          if ([v23 containsObject:@"QUPP_ARG_EVENT_TYPE_RESTAURANT"]) {
            [v5 setIsRestaurantEventSearch:1];
          }
          if ([v23 containsObject:@"QUPP_ARG_EVENT_TYPE"]) {
            [v5 setIsEventSearch:1];
          }
          unint64_t v24 = [v22 count];
          unint64_t v25 = [v23 count];
          if (v24 >= v25) {
            unint64_t v26 = v25;
          }
          else {
            unint64_t v26 = v24;
          }
          if (v26)
          {
            uint64_t v27 = [v22 objectAtIndexedSubscript:0];
            uint64_t v28 = [v23 objectAtIndexedSubscript:0];
            float v29 = v28;
            if (v27 && v28) {
              v145 += [v28 isEqualToString:@"ARG_UNSPECIFIED"] ^ 1;
            }
            [v20 setObject:v27 forKey:@"kQPQUOutputTokenArgScores"];
            [v20 setObject:v29 forKey:@"kQPQUOutputTokenArgLabels"];
          }
          double v30 = (void *)[v20 copy];
          [v147 addObject:v30];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v166 objects:v188 count:16];
      }
      while (v17);
    }
    else
    {
      int64_t v145 = 0;
    }

    v31 = (NSArray *)[v147 copy];
    itemQPQUOutputTokenInfo = self->_itemQPQUOutputTokenInfo;
    self->_itemQPQUOutputTokenInfo = v31;

    self->_countQPUSpecialToken = v145;
    double v33 = (NSArray *)[v133 copy];
    quIntentScores = self->_quIntentScores;
    self->_quIntentScores = v33;

    v146 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v142, "count"));
    long long v162 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    id v35 = v142;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v162 objects:v187 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v163;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v163 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v162 + 1) + 8 * j);
          id v41 = [NSString alloc];
          [v40 intValue];
          BOOL v42 = (void *)[v41 initWithUTF8String:intentLabel()];
          [v146 addObject:v42];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v162 objects:v187 count:16];
      }
      while (v37);
    }

    uint64_t v43 = (NSArray *)[v146 copy];
    quIntentLabels = self->_quIntentLabels;
    self->_quIntentLabels = v43;

    if (![v133 count] || !objc_msgSend(v35, "count")) {
      goto LABEL_133;
    }
    unint64_t v45 = [v133 count];
    unint64_t v46 = [v35 count];
    if (v45 >= v46) {
      unint64_t v45 = v46;
    }
    if (!v45)
    {
LABEL_133:

      float v9 = v127;
      uint64_t v6 = v128;
      goto LABEL_134;
    }
    uint64_t v47 = 0;
    v48 = &dword_1BDB2A000;
    v49 = &_SpotlightDefineRankingTypes_[364];
    id v137 = v35;
    while (1)
    {
      uint64_t v134 = v47;
      v50 = SSGeneralLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        v69 = [v5 searchString];
        v70 = v49;
        v71 = [v35 objectAtIndexedSubscript:v47];
        [v71 intValue];
        uint64_t v72 = intentLabel();
        v73 = [v133 objectAtIndexedSubscript:v134];
        *(_DWORD *)buf = 138412802;
        v171 = v69;
        __int16 v172 = 2080;
        uint64_t v173 = v72;
        __int16 v174 = 2112;
        double v175 = *(double *)&v73;
        _os_log_debug_impl(v48, v50, OS_LOG_TYPE_DEBUG, "[SpotlightRanking] [QU] query=%@ QU_Intent=%s Score=%@", buf, 0x20u);

        v49 = v70;
      }

      v51 = [v133 objectAtIndexedSubscript:v134];
      [v51 floatValue];
      if (v52 <= 0.1 || ([v5 earliestTokenFromQU] & 1) != 0) {
        goto LABEL_58;
      }
      char v63 = [v5 latestTokenFromQU];

      if ((v63 & 1) == 0)
      {
        uint64_t v64 = [v35 objectAtIndexedSubscript:v134];
        [v64 intValue];
        unsigned int v65 = isEventSearchIntent();

        if (v65)
        {
          v66 = [v5 searchString];
          if ([v66 rangeOfString:@" next "] == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v67 = [v5 searchString];
            if ([v67 rangeOfString:@" upcoming "] == 0x7FFFFFFFFFFFFFFFLL)
            {
              v68 = [v5 searchString];
              objc_msgSend(v5, "setEarliestTokenFromQU:", objc_msgSend(v68, "rangeOfString:", @" earliest ") != 0x7FFFFFFFFFFFFFFFLL);
            }
            else
            {
              [v5 setEarliestTokenFromQU:1];
            }
          }
          else
          {
            [v5 setEarliestTokenFromQU:1];
          }

          v74 = [v5 searchString];
          if ([v74 rangeOfString:@" last "] == 0x7FFFFFFFFFFFFFFFLL)
          {
            int v75 = [v5 searchString];
            if ([v75 rangeOfString:@" previous "] == 0x7FFFFFFFFFFFFFFFLL)
            {
              v76 = [v5 searchString];
              objc_msgSend(v5, "setLatestTokenFromQU:", objc_msgSend(v76, "rangeOfString:", @" latest ") != 0x7FFFFFFFFFFFFFFFLL);
            }
            else
            {
              [v5 setLatestTokenFromQU:1];
            }
          }
          else
          {
            [v5 setLatestTokenFromQU:1];
          }

          if (([v5 earliestTokenFromQU] & 1) != 0 || objc_msgSend(v5, "latestTokenFromQU")) {
            break;
          }
        }
      }
LABEL_59:
      v53 = (void *)*((void *)v49 + 248);
      v54 = [v35 objectAtIndexedSubscript:v134];
      BOOL v55 = [v53 objectForKeyedSubscript:v54];

      uint64_t v131 = v55;
      if (v55)
      {
        [v55 floatValue];
        float v57 = v56;
      }
      else
      {
        uint64_t v58 = [v35 objectAtIndexedSubscript:v134];
        [v58 intValue];
        unsigned int v59 = isEventSearchIntent();

        if (v59) {
          float v57 = 0.6;
        }
        else {
          float v57 = 0.9;
        }
      }
      uint64_t v60 = [v133 objectAtIndexedSubscript:v134];
      [v60 floatValue];
      float v62 = v61;

      if (v62 > v57)
      {
        double v87 = [v35 objectAtIndexedSubscript:v134];
        objc_msgSend(v5, "setIntentFromQU:", objc_msgSend(v87, "intValue"));

        long long v160 = 0u;
        long long v161 = 0u;
        long long v158 = 0u;
        long long v159 = 0u;
        id v88 = obj;
        uint64_t v89 = [v88 countByEnumeratingWithState:&v158 objects:v186 count:16];
        if (!v89)
        {
          __int16 v132 = &stru_1F1824018;
          goto LABEL_128;
        }
        uint64_t v90 = v89;
        uint64_t v91 = *(void *)v159;
        __int16 v132 = &stru_1F1824018;
        uint64_t v135 = *(void *)v159;
        id v136 = v88;
        while (1)
        {
          uint64_t v92 = 0;
          uint64_t v138 = v90;
          do
          {
            if (*(void *)v159 != v91)
            {
              uint64_t v93 = v92;
              objc_enumerationMutation(v88);
              uint64_t v92 = v93;
            }
            uint64_t v139 = v92;
            v94 = *(void **)(*((void *)&v158 + 1) + 8 * v92);
            v95 = [v94 objectForKeyedSubscript:@"kQPQUOutputToken"];
            v96 = [v94 objectForKeyedSubscript:@"kQPQUOutputTokenArgScores"];
            v97 = [v94 objectForKeyedSubscript:@"kQPQUOutputTokenArgIds"];
            double v141 = v95;
            int v143 = v96;
            if ([v95 length] && objc_msgSend(v96, "count") && objc_msgSend(v97, "count"))
            {
              [v97 objectAtIndexedSubscript:0];
              v99 = uint64_t v98 = v97;
              uint64_t v149 = v98;
              if ([v99 intValue] == 1)
              {
                v100 = v96;
                goto LABEL_100;
              }
              id v101 = [v98 objectAtIndexedSubscript:0];
              int v102 = [v101 intValue];

              v100 = v96;
              if (v102)
              {
                if ([(__CFString *)v132 length])
                {
                  BOOL v99 = [(__CFString *)v132 stringByAppendingString:@" "];
                }
                else
                {
                  BOOL v99 = v132;
                }
                __int16 v132 = [v99 stringByAppendingString:v95];
LABEL_100:
              }
              long long v156 = 0u;
              long long v157 = 0u;
              long long v154 = 0u;
              long long v155 = 0u;
              id v103 = v100;
              uint64_t v104 = [v103 countByEnumeratingWithState:&v154 objects:v185 count:16];
              v97 = v149;
              if (v104)
              {
                uint64_t v105 = v104;
                uint64_t v106 = *(void *)v155;
                do
                {
                  for (uint64_t k = 0; k != v105; ++k)
                  {
                    if (*(void *)v155 != v106) {
                      objc_enumerationMutation(v103);
                    }
                    v108 = *(void **)(*((void *)&v154 + 1) + 8 * k);
                    if (v108)
                    {
                      [v108 floatValue];
                      if (v109 > 0.8)
                      {
                        long long v152 = 0u;
                        long long v153 = 0u;
                        long long v150 = 0u;
                        long long v151 = 0u;
                        id v110 = v97;
                        uint64_t v111 = [v110 countByEnumeratingWithState:&v150 objects:v184 count:16];
                        if (v111)
                        {
                          uint64_t v112 = v111;
                          uint64_t v113 = *(void *)v151;
                          do
                          {
                            for (uint64_t m = 0; m != v112; ++m)
                            {
                              if (*(void *)v151 != v113) {
                                objc_enumerationMutation(v110);
                              }
                              long long v115 = *(void **)(*((void *)&v150 + 1) + 8 * m);
                              if (v115)
                              {
                                if ([*(id *)(*((void *)&v150 + 1) + 8 * m) intValue] == 51)
                                {
                                  [v5 setEarliestTokenFromQU:1];
                                }
                                else if ([v115 intValue] == 52)
                                {
                                  [v5 setLatestTokenFromQU:1];
                                }
                              }
                            }
                            uint64_t v112 = [v110 countByEnumeratingWithState:&v150 objects:v184 count:16];
                          }
                          while (v112);
                        }

                        v97 = v149;
                      }
                    }
                  }
                  uint64_t v105 = [v103 countByEnumeratingWithState:&v154 objects:v185 count:16];
                }
                while (v105);
              }

              id v88 = v136;
              id v35 = v137;
              uint64_t v91 = v135;
              uint64_t v90 = v138;
            }

            uint64_t v92 = v139 + 1;
          }
          while (v139 + 1 != v90);
          uint64_t v90 = [v88 countByEnumeratingWithState:&v158 objects:v186 count:16];
          if (!v90)
          {
LABEL_128:

            if ([(__CFString *)v132 length])
            {
              [(PRSRankingItemRanker *)self setParsedQueryFromQU:v132];
              [v5 setParsedQueryFromQU:v132];
            }
            long long v116 = SSGeneralLog();
            if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
            {
              long long v117 = [v5 searchString];
              long long v118 = SSRedactString(v117, 1);
              [v5 intentFromQU];
              uint64_t v119 = intentLabel();
              long long v120 = [v133 objectAtIndexedSubscript:v134];
              [v120 floatValue];
              double v122 = v121;
              int v123 = [v5 earliestTokenFromQU];
              int v124 = [v5 latestTokenFromQU];
              long long v125 = [(PRSRankingItemRanker *)self parsedQueryFromQU];
              v126 = SSRedactString(v125, 1);
              *(_DWORD *)buf = 138413826;
              v171 = v118;
              __int16 v172 = 2080;
              uint64_t v173 = v119;
              __int16 v174 = 2048;
              double v175 = v122;
              __int16 v176 = 2048;
              double v177 = v57;
              __int16 v178 = 1024;
              int v179 = v123;
              __int16 v180 = 1024;
              int v181 = v124;
              id v35 = v137;
              __int16 v182 = 2112;
              v183 = v126;
              _os_log_impl(&dword_1BDB2A000, v116, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [QU] query=%@ QU_Intent=%s detected score=%f threshold=%f earliest=%i latest=%i parsedQueryFromQU=%@", buf, 0x40u);
            }
            goto LABEL_133;
          }
        }
      }

      uint64_t v47 = v134 + 1;
      if (v45 == v134 + 1) {
        goto LABEL_133;
      }
    }
    v51 = SSGeneralLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v140 = [v5 searchString];
      v77 = SSRedactString(v140, 1);
      v78 = [v35 objectAtIndexedSubscript:v134];
      [v78 intValue];
      uint64_t v79 = v49;
      uint64_t v80 = intentLabel();
      int v81 = [v133 objectAtIndexedSubscript:v134];
      [v81 floatValue];
      double v83 = v82;
      v84 = v48;
      int v85 = [v5 earliestTokenFromQU];
      int v86 = [v5 latestTokenFromQU];
      *(_DWORD *)buf = 138413570;
      v171 = v77;
      __int16 v172 = 2080;
      uint64_t v173 = v80;
      v49 = v79;
      __int16 v174 = 2048;
      double v175 = v83;
      __int16 v176 = 2048;
      double v177 = 0.100000001;
      __int16 v178 = 1024;
      int v179 = v85;
      v48 = v84;
      __int16 v180 = 1024;
      int v181 = v86;
      _os_log_impl(v84, v51, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [QU] query=%@ QU Event Token Intent detected %s crossed confidence threshold with score = %f (threshold = %f) and found lexical match for earliest=%i latest=%i", buf, 0x36u);

      id v35 = v137;
    }
LABEL_58:

    goto LABEL_59;
  }
LABEL_136:
}

uint64_t __56__PRSRankingItemRanker_parseQUQuery_isSearchToolClient___block_invoke()
{
  parseQUQuery_isSearchToolClient__sQUIntentThresholds = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", &unk_1F1864220, &unk_1F1863F50, 0);
  return MEMORY[0x1F41817F8]();
}

- (void)serializeAnonymousQueryLogFeaturesToJSONWithWriter:(void *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v5 setDateFormat:@"yyyy-MM-dd HH"];
  uint64_t v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v5 setTimeZone:v6];

  uint64_t v36 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_currentTime];
  uint64_t v7 = objc_msgSend(v5, "stringFromDate:");
  unsigned int v8 = [v7 componentsSeparatedByString:@" "];
  float v9 = [v8 objectAtIndexedSubscript:0];

  id v35 = v7;
  id v10 = [v7 componentsSeparatedByString:@" "];
  id v11 = [v10 objectAtIndexedSubscript:1];

  json_writer_add_key((uint64_t)a3, "queryDate", 0xFFFFFFFFFFFFFFFFLL, 1);
  id v34 = v9;
  json_writer_add_string(a3, (char *)[v34 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  json_writer_add_key((uint64_t)a3, "queryHour", 0xFFFFFFFFFFFFFFFFLL, 1);
  id v33 = v11;
  json_writer_add_string(a3, (char *)[v33 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  json_writer_add_key((uint64_t)a3, "keyboardLanguage", 0xFFFFFFFFFFFFFFFFLL, 1);
  if ([(NSString *)self->_keyboardLanguage length]) {
    json_writer_add_string(a3, (char *)[(NSString *)self->_keyboardLanguage UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  json_writer_add_key((uint64_t)a3, "isCJK", 0xFFFFFFFFFFFFFFFFLL, 1);
  json_writer_add_uint64((uint64_t)a3, self->_isCJK);
  uint64_t v12 = [MEMORY[0x1E4FA5D68] version];
  json_writer_add_key((uint64_t)a3, "embeddingModelVersion", 0xFFFFFFFFFFFFFFFFLL, 1);
  json_writer_add_uint64((uint64_t)a3, v12);
  if ([(NSArray *)self->_quIntentLabels count])
  {
    json_writer_add_key((uint64_t)a3, "quIntentLabels", 0xFFFFFFFFFFFFFFFFLL, 1);
    id v13 = [(NSArray *)self->_quIntentLabels objectAtIndexedSubscript:0];
    json_writer_add_string(a3, (char *)[v13 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  if ([(NSArray *)self->_quIntentScores count])
  {
    json_writer_add_key((uint64_t)a3, "quIntentScores", 0xFFFFFFFFFFFFFFFFLL, 1);
    uint64_t v14 = NSString;
    uint64_t v15 = [(NSArray *)self->_quIntentScores objectAtIndexedSubscript:0];
    [v15 floatValue];
    objc_msgSend(v14, "stringWithFormat:", @"%0.4f", v16);
    id v17 = objc_claimAutoreleasedReturnValue();
    json_writer_add_string(a3, (char *)[v17 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  v18 = [(NSArray *)self->_itemQPQUOutputTokenInfo valueForKey:@"kQPQUOutputTokenArgLabels"];
  id v19 = [(NSArray *)self->_itemQPQUOutputTokenInfo valueForKey:@"kQPQUOutputTokenArgScores"];
  json_writer_add_key((uint64_t)a3, "tokenParseLabel", 0xFFFFFFFFFFFFFFFFLL, 1);
  json_writer_begin_array((uint64_t)a3);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v42;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v42 != v23) {
          objc_enumerationMutation(v20);
        }
        json_writer_add_string(a3, (char *)[*(id *)(*((void *)&v41 + 1) + 8 * v24++) UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v22);
  }

  json_writer_end_array((uint64_t)a3);
  json_writer_add_key((uint64_t)a3, "tokenParseScore", 0xFFFFFFFFFFFFFFFFLL, 1);
  json_writer_begin_array((uint64_t)a3);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v25 = v19;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v38;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(v25);
        }
        double v30 = NSString;
        [*(id *)(*((void *)&v37 + 1) + 8 * v29) floatValue];
        objc_msgSend(v30, "stringWithFormat:", @"%0.4f", v31);
        id v32 = objc_claimAutoreleasedReturnValue();
        json_writer_add_string(a3, (char *)[v32 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v27);
  }

  json_writer_end_array((uint64_t)a3);
}

- (void)cancel
{
  self->_isCancelled = 1;
}

- (void)setQueryKind:(unint64_t)a3
{
  self->_queryKind = a3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PRSRankingItemRanker;
  [(PRSRankingItemRanker *)&v2 dealloc];
}

- (id)userQuery
{
  return self->_userQueryString;
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (BOOL)isContentWord
{
  return self->_isContentWord;
}

- (unint64_t)queryTermCount
{
  return self->_queryTermCount;
}

- (unint64_t)queryTermLength
{
  return self->_queryTermLength;
}

- (BOOL)isAltNamePrefixMatchOnlyTopHitExcludedQuery
{
  return self->_isAltNamePrefixMatchOnlyTopHitExcludedQuery;
}

- (BOOL)isSpellCorrectPrefixMatchOnlyTopHitExcludedQuery
{
  return self->_isSpellCorrectPrefixMatchOnlyTopHitExcludedQuery;
}

- (BOOL)containsEnglishAlphabetInQuery
{
  return self->_containsEnglishAlphabetInQuery;
}

- (BOOL)containsDigitInQuery
{
  return self->_containsDigitInQuery;
}

- (BOOL)isPeopleSearch
{
  return self->_isPeopleSearch;
}

- (BOOL)isNLSearch
{
  return self->_isNLSearch;
}

- (BOOL)isSearchToolClient
{
  return self->_isSearchToolClient;
}

- (BOOL)isFuzzySearch
{
  return self->_isFuzzySearch;
}

- (void)setRankCategories:(id)a3
{
}

- (void)setQueryTerms:(id)a3
{
}

- (void)setIsNLSearch:(BOOL)a3
{
  self->_isNLSearch = a3;
}

- (void)setIsPeopleSearch:(BOOL)a3
{
  self->_isPeopleSearch = a3;
}

- (void)setIsSearchToolClient:(BOOL)a3
{
  self->_isSearchToolClient = a3;
}

- (void)setIsFuzzySearch:(BOOL)a3
{
  self->_isFuzzySearch = a3;
}

- (NSArray)rankCategories
{
  objc_super v2 = (void *)[(NSArray *)self->_rankCategories copy];
  return (NSArray *)v2;
}

- (NSArray)queryTerms
{
  objc_super v2 = (void *)[(NSArray *)self->_queryTerms copy];
  return (NSArray *)v2;
}

- (void)setTopHitMaxCount:(unint64_t)a3
{
  self->_topHitMaxCount = a3;
}

- (id)rankingConfiguration
{
  rankingConfiguration = self->_rankingConfiguration;
  if (!rankingConfiguration)
  {
    LOBYTE(v7) = 0;
    BOOL v4 = [(PRSRankingItemRanker *)self rankingConfigurationWithMeContact:0 emailAddresses:0 phoneFavorites:0 vipList:0 clientBundle:0 isScopedSearch:0 spotlightQuery:&stru_1F1824018 userQuery:self->_searchString tokenString:0 queryKind:0 isPeopleSearch:v7 keyboardLanguage:0];
    id v5 = self->_rankingConfiguration;
    self->_rankingConfiguration = v4;

    rankingConfiguration = self->_rankingConfiguration;
  }
  return rankingConfiguration;
}

- (id)rankingConfigurationWithMeContact:(id)a3 emailAddresses:(id)a4 phoneFavorites:(id)a5 vipList:(id)a6 clientBundle:(id)a7 isScopedSearch:(BOOL)a8 spotlightQuery:(id)a9 keyboardLanguage:(id)a10
{
  LOBYTE(v11) = 0;
  return [(PRSRankingItemRanker *)self rankingConfigurationWithMeContact:a3 emailAddresses:a4 phoneFavorites:a5 vipList:a6 clientBundle:a7 isScopedSearch:a8 spotlightQuery:a9 userQuery:self->_searchString tokenString:0 queryKind:0 isPeopleSearch:v11 keyboardLanguage:a10];
}

- (id)rankingConfigurationWithMeContact:(id)a3 emailAddresses:(id)a4 phoneFavorites:(id)a5 vipList:(id)a6 clientBundle:(id)a7 isScopedSearch:(BOOL)a8 isAdvancedSyntax:(BOOL)a9 spotlightQuery:(id)a10 userQuery:(id)a11 tokenString:(id)a12 queryKind:(unint64_t)a13 isPeopleSearch:(BOOL)a14 keyboardLanguage:(id)a15
{
  BOOL v107 = a8;
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v111 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v110 = a7;
  uint64_t v23 = (__CFString *)a10;
  id v109 = a11;
  uint64_t v24 = self;
  id v25 = a12;
  id v26 = a15;
  if (![(NSString *)v24->_searchString length] && !a9 && !v107 || v24->_isCancelled)
  {
    uint64_t v27 = 0;
    uint64_t v29 = v110;
    uint64_t v28 = v111;
    goto LABEL_6;
  }
  v108 = v23;
  [(PRSRankingItemRanker *)v24 setMeContactIdentifier:v111];
  [(PRSRankingItemRanker *)v24 setClientBundle:v110];
  if (a14) {
    float v31 = 0;
  }
  else {
    float v31 = v24->_searchString;
  }
  uint64_t v104 = v25;
  id v116 = 0;
  v97 = v31;
  id v103 = SSPhraseQueryEscapeString(v31, &v116);
  id v102 = v116;
  searchString = v24->_searchString;
  if (searchString)
  {
    BOOL v33 = SSStringStartsWithDoubleQuote(searchString);
    BOOL v34 = SSStringEndsWithDoubleQuote(v24->_searchString);
    BOOL v35 = v33 & (v34 | SSStringEndsWithSpace(v24->_searchString));
  }
  else
  {
    LOBYTE(v35) = 0;
  }
  if ((a13 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    LOBYTE(v35) = 1;
  }
  v24->_exact = v35;
  v24->_isPeopleSearch = a14;
  v24->_isContentWord = +[PRSRankingItemRanker isContentWordQuery:queryTermCount:keyboardLanguage:](PRSRankingItemRanker, "isContentWordQuery:queryTermCount:keyboardLanguage:", v24->_searchString, [v102 count], v26);
  if (v23) {
    uint64_t v36 = v23;
  }
  else {
    uint64_t v36 = &stru_1F1824018;
  }
  id v100 = v22;
  long long v37 = PRSRankingQueriesWithUserQuery(v104, v24->_searchString, v36, v103, v102, v20, v111, v21, v22, v109, a13, a14, v26, v110);
  [(PRSRankingItemRanker *)v24 setQueryKind:a13];
  if (![(PRSRankingItemRanker *)v24 isSearchToolClient])
  {
    id v38 = v110;
    if (SPQueryKindIsSearchToolSearch_onceToken_1 != -1) {
      dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken_1, &__block_literal_global_1516);
    }
    if (!SPQueryKindIsSearchToolSearch_isSearchToolDebugMode_1)
    {
      if (!SPQueryKindIsSearchToolSearch_isSearchToolRanking_1)
      {
        uint64_t v39 = 0;
        goto LABEL_25;
      }
      if (([v38 hasPrefix:@"com.apple.omniSearch"] & 1) == 0
        && ([v38 hasPrefix:@"com.apple.intelligenceflow"] & 1) == 0)
      {
        unsigned int v93 = [v38 hasPrefix:@"com.apple.ondeviceeval"];
        if (a13 == 12) {
          uint64_t v39 = 1;
        }
        else {
          uint64_t v39 = v93;
        }
        goto LABEL_25;
      }
    }
    uint64_t v39 = 1;
LABEL_25:

    [(PRSRankingItemRanker *)v24 setIsSearchToolClient:v39];
  }
  id v98 = v26;
  p_isa = (id *)&v24->super.isa;
  id v105 = v20;
  id v106 = v21;
  uint64_t v27 = objc_alloc_init(PRSQueryRankingConfiguration);
  [(PRSQueryRankingConfiguration *)v27 setRankingQueries:v37];
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v40 = v37;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v112 objects:v117 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = 0;
    uint64_t v44 = *(void *)v113;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v113 != v44) {
          objc_enumerationMutation(v40);
        }
        unint64_t v46 = *(void **)(*((void *)&v112 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          ++v43;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v47 = [v46 objectForKey:@"kCIBitCount"];
            v43 += [v47 integerValue];
          }
        }
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v112 objects:v117 count:16];
    }
    while (v42);
  }
  else
  {
    uint64_t v43 = 0;
  }

  [(PRSQueryRankingConfiguration *)v27 setRankingBitCount:v43];
  v48 = PRSRankingQueryIndexDictionary();
  id v49 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  v50 = PRSRankingItemRequiredAttributes();
  v51 = (void *)[v49 initWithArray:v50];
  [(PRSQueryRankingConfiguration *)v27 setRequiredAttributes:v51];

  [(PRSQueryRankingConfiguration *)v27 setStrongRankingQueryCount:1];
  float v52 = [v48 objectForKey:@"PRSRankingTCNearMatch"];
  -[PRSQueryRankingConfiguration setDominantRankingQueryCount:](v27, "setDominantRankingQueryCount:", v43 - [v52 integerValue]);

  v53 = [v48 objectForKey:@"PRSRankingRecency365Days"];
  -[PRSQueryRankingConfiguration setDominatedRankingQueryCount:](v27, "setDominatedRankingQueryCount:", [v53 integerValue] - 1);

  v54 = [v48 objectForKey:@"kMDItemShortcutWithinBagParamValue"];
  -[PRSQueryRankingConfiguration setShortcutBit:](v27, "setShortcutBit:", [v54 integerValue]);

  BOOL v55 = [v48 objectForKey:@"PRSPolicyFieldsExactPhraseMatchBit"];
  -[PRSQueryRankingConfiguration setHighMatchBit:](v27, "setHighMatchBit:", [v55 integerValue]);

  float v56 = [v48 objectForKey:@"PRSRankingTCNearMatch"];
  -[PRSQueryRankingConfiguration setLowMatchBit:](v27, "setLowMatchBit:", [v56 integerValue]);

  float v57 = [v48 objectForKey:@"PRSRankingRecency1Days"];
  -[PRSQueryRankingConfiguration setHighRecencyBit:](v27, "setHighRecencyBit:", [v57 integerValue]);

  uint64_t v58 = [v48 objectForKey:@"PRSRankingRecency365Days"];
  -[PRSQueryRankingConfiguration setLowRecencyBit:](v27, "setLowRecencyBit:", [v58 integerValue]);

  unsigned int v59 = [v48 objectForKey:@"kMDItemEscapedWord"];
  char v60 = [v59 integerValue];
  if ((v60 & 0x40) != 0) {
    uint64_t v61 = 1 << v60;
  }
  else {
    uint64_t v61 = 0;
  }
  if ((v60 & 0x40) != 0) {
    uint64_t v62 = 0;
  }
  else {
    uint64_t v62 = 1 << v60;
  }
  char v63 = [v48 objectForKey:@"kMDItemDisplayNameCorrections"];
  char v64 = [v63 integerValue];
  uint64_t v65 = 1 << v64;
  if ((v64 & 0x40) != 0) {
    uint64_t v66 = 1 << v64;
  }
  else {
    uint64_t v66 = 0;
  }
  if ((v64 & 0x40) != 0) {
    uint64_t v65 = 0;
  }
  -[PRSQueryRankingConfiguration setFuzzyMatchMask:](v27, "setFuzzyMatchMask:", v65 | v62, v66 | v61);

  uint64_t v67 = [v48 objectForKey:@"kMDItemDisplayNameCorrections"];
  char v68 = [v67 integerValue];
  if ((v68 & 0x40) != 0) {
    uint64_t v69 = 0;
  }
  else {
    uint64_t v69 = 1 << v68;
  }
  if ((v68 & 0x40) != 0) {
    uint64_t v70 = 1 << v68;
  }
  else {
    uint64_t v70 = 0;
  }
  -[PRSQueryRankingConfiguration setFuzzyMatchCheck:](v27, "setFuzzyMatchCheck:", v69, v70);

  v71 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
    -[PRSRankingItemRanker rankingConfigurationWithMeContact:emailAddresses:phoneFavorites:vipList:clientBundle:isScopedSearch:isAdvancedSyntax:spotlightQuery:userQuery:tokenString:queryKind:isPeopleSearch:keyboardLanguage:](v27, v71);
  }

  uint64_t v72 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.searchd"];
  uint64_t v29 = v110;
  v73 = @"engagementCount";
  id v21 = v106;
  if ([v110 length])
  {
    v73 = [NSString stringWithFormat:@"%@-%@", @"engagementCount", v110];
  }
  id v101 = v72;
  uint64_t v74 = [v72 objectForKey:v73];
  int v75 = (void *)v74;
  v76 = &unk_1F1863F68;
  if (v74) {
    v76 = (void *)v74;
  }
  id v77 = v76;

  uint64_t v78 = [v77 integerValue];
  if ([p_isa isInternalDevice])
  {
    uint64_t v79 = 1;
  }
  else
  {
    uint64_t v80 = v78 + 1;
    if ([v110 isEqualToString:@"com.apple.searchd"])
    {
      int v81 = +[PRSBagHandler sharedHandler];
      int v82 = [v81 collectAnonymousData];

      if (v82)
      {
        uint64_t v83 = arc4random() % v80;
        uint64_t v84 = [v101 objectForKey:@"collectedBundleID"];
        uint64_t v94 = v83 | v84;
        int v85 = +[PRSBagHandler sharedHandler];
        int v86 = [v85 anonymousMetadataUndesiredBundleIDs];

        v95 = v86;
        v96 = (void *)v84;
        int v87 = [v86 containsObject:v84];
        uint32_t v88 = arc4random();
        BOOL v89 = v87;
        uint64_t v90 = v88 % v80;
        if (v90) {
          int v91 = 0;
        }
        else {
          int v91 = v87 ^ 1;
        }
        if ((v87 ^ 1))
        {
          id v20 = v105;
          uint64_t v23 = v108;
        }
        else
        {
          id v20 = v105;
          uint64_t v23 = v108;
          if (!v90)
          {
            uint32_t v92 = arc4random();
            int v91 = 0;
            BOOL v89 = v92 % v80 == 0;
          }
        }
        uint64_t v79 = (v94 == 0) | v89 | v91;

        id v21 = v106;
        goto LABEL_82;
      }
      uint64_t v79 = 0;
    }
    else
    {
      uint64_t v79 = arc4random() % v80 == 0;
    }
    id v21 = v106;
  }
  uint64_t v23 = v108;
LABEL_82:
  [(PRSQueryRankingConfiguration *)v27 setAllowAnonymousDataCollection:v79];
  if (!p_isa[1]) {
    objc_storeStrong(p_isa + 1, v27);
  }

  uint64_t v28 = v111;
  id v22 = v100;
  id v25 = v104;
  id v26 = v98;
LABEL_6:

  return v27;
}

- (id)rankingConfigurationWithMeContact:(id)a3 emailAddresses:(id)a4 phoneFavorites:(id)a5 vipList:(id)a6 clientBundle:(id)a7 isScopedSearch:(BOOL)a8 spotlightQuery:(id)a9 userQuery:(id)a10 tokenString:(id)a11 queryKind:(unint64_t)a12 isPeopleSearch:(BOOL)a13 keyboardLanguage:(id)a14
{
  LOBYTE(v16) = 0;
  LOBYTE(v15) = 0;
  return [(PRSRankingItemRanker *)self rankingConfigurationWithMeContact:a3 emailAddresses:a4 phoneFavorites:a5 vipList:a6 clientBundle:a7 isScopedSearch:a8 isAdvancedSyntax:v15 spotlightQuery:a9 userQuery:self->_searchString tokenString:0 queryKind:0 isPeopleSearch:v16 keyboardLanguage:a14];
}

+ (void)preheat
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PRSRankingItemRanker_preheat__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)sPreheatQueue, block);
}

uint64_t __31__PRSRankingItemRanker_preheat__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  if ((result & 1) == 0)
  {
    id v1 = (id)[(id)objc_opt_class() englishEmbedding];
    return (uint64_t)(id)[(id)objc_opt_class() preferredEmbedding];
  }
  return result;
}

- (void)activate
{
  id v2 = +[PRSModelManager sharedModelManager];
  [v2 activate];
}

- (void)deactivate
{
  id v2 = +[PRSModelManager sharedModelManager];
  [v2 deactivate];
}

- (void)updateResultSetContext:(_resultset_computation_ctx *)a3 andUniqueScores:(id)a4 withResultSetItems:(id)a5
{
  uint64_t v5 = ((uint64_t (*)(PRSRankingItemRanker *, SEL, _resultset_computation_ctx *, id, id))MEMORY[0x1F4188790])(self, a2, a3, a4, a5);
  uint64_t v7 = v6;
  float v9 = v8;
  id v10 = (unsigned char *)v5;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v12 = v11;
  id v13 = v7;
  if (!v10[39])
  {
    v51 = v9;
    uint64_t v14 = [v10 bundleFeatures];
    uint64_t v15 = [v14 objectForKey:@"com.apple.mobilemail"];

    if ([v15 count])
    {
      *((unsigned char *)v9 + 8) = 1;
      uint64_t v16 = [v15 objectAtIndexedSubscript:42];
      [v16 floatValue];
      *((_DWORD *)v9 + 3) = v17;
    }
    uint64_t v47 = v10;
    v18 = [v10 bundleFeatures];
    id v19 = [v18 objectForKey:@"com.apple.MobileSMS"];

    if ([v19 count])
    {
      *((unsigned char *)v9 + 9) = 1;
      id v20 = [v15 objectAtIndexedSubscript:42];
      [v20 floatValue];
      *((_DWORD *)v9 + 4) = v21;
    }
    unint64_t v45 = v15;
    id v46 = v13;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    obuint64_t j = v13;
    uint64_t v22 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = v9 + 3;
      id v49 = v12;
      uint64_t v50 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v53 != v50) {
            objc_enumerationMutation(obj);
          }
          id v26 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          bzero(v56, 0x328CuLL);
          uint64_t v27 = [v26 L2FeatureVector];
          uint64_t v28 = [v27 getAllScores:v56];

          uint64_t v29 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:-[PRSRankingItem inputToModelScore]((uint64_t)v26)];
          [v12 addObject:v29];

          uint64_t v30 = 0;
          uint64_t v31 = *v51;
          do
          {
            float v32 = *(float *)(v28 + 4 * (unsigned __int16)sResultSetFeatures[v30 + 1]);
            if (*(float *)(v31 + v30 * 2) < v32) {
              *(float *)(v31 + v30 * 2) = v32;
            }
            v30 += 2;
          }
          while (v30 != 86);
          BOOL v33 = [v26 sectionBundleIdentifier];
          if (([v33 isEqualToString:@"com.apple.mobilemail"] & 1) != 0
            || [v33 isEqualToString:@"com.apple.MobileSMS"])
          {
            if ([v33 isEqualToString:@"com.apple.mobilemail"])
            {
              unint64_t v34 = 0;
              uint64_t v35 = 22;
            }
            else
            {
              int v36 = [v33 isEqualToString:@"com.apple.MobileSMS"];
              if (v36) {
                unint64_t v34 = 22;
              }
              else {
                unint64_t v34 = 0;
              }
              if (!v36) {
                goto LABEL_33;
              }
              uint64_t v35 = 44;
            }
            do
            {
              if (v34 >= 0x2C) {
                shouldUpdateFuncForSnippetFeature_cold_1();
              }
              uint64_t v37 = (uint64_t)*(&off_1E635AFD8 + v34);
              float v38 = *(float *)(v28 + 4 * associatedL2FeatureFromSnippetFeature(v34));
              if ((*(unsigned int (**)(uint64_t, float, float))(v37 + 16))(v37, *((float *)v24 + v34), v38)) {
                *((float *)v24 + v34) = v38;
              }
              ++v34;
            }
            while (v35 != v34);
          }
          else
          {
            uint64_t v39 = [v47 bundleFeatures];
            id v40 = [v39 objectForKey:v33];

            if ([v40 count])
            {
              uint64_t v41 = [v40 objectAtIndexedSubscript:42];
              uint64_t v42 = [v41 integerValue];

              if (v42 == 1)
              {
                *((unsigned char *)v51 + 10) = 1;
                uint64_t v43 = [v40 objectAtIndexedSubscript:42];
                [v43 floatValue];
                *((_DWORD *)v51 + 5) = v44;
              }
            }
          }
LABEL_33:

          id v12 = v49;
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v23);
    }

    if (!v47[39]) {
      [v12 sortWithOptions:1 usingComparator:&__block_literal_global_975];
    }

    id v13 = v46;
  }
}

uint64_t __82__PRSRankingItemRanker_updateResultSetContext_andUniqueScores_withResultSetItems___block_invoke(uint64_t a1, void *a2)
{
  return -objc_msgSend(a2, "compare:");
}

- (void)populateRankResultSetBundleFeaturesWithBundleItems:(id)a3 withUniqueBundleMaxScores:(id)a4
{
  uint64_t v4 = ((uint64_t (*)(PRSRankingItemRanker *, SEL, id, id))MEMORY[0x1F4188790])(self, a2, a3, a4);
  uint64_t v6 = v5;
  uint64_t v7 = (unsigned char *)v4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = v8;
  id v10 = v6;
  if (!v7[39])
  {
    id v42 = v10;
    float v38 = v9;
    id v11 = objc_opt_class();
    id v12 = [v7 bundleFeatures];
    uint64_t v43 = [v11 sortedUniqueBundleFeatureValuesFromBundleFeatures:v12];

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v13 = [v7 bundleFeatures];
    uint64_t v14 = [v13 keyEnumerator];

    uint64_t v39 = [v14 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v39)
    {
      uint64_t v37 = *(void *)v50;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v50 != v37) {
            objc_enumerationMutation(v14);
          }
          uint64_t v41 = v15;
          uint64_t v16 = *(void *)(*((void *)&v49 + 1) + 8 * v15);
          int v17 = [v7 bundleFeatures];
          uint64_t v40 = v16;
          v18 = [v17 objectForKey:v16];

          bzero(v55, 0x328CuLL);
          bzero(v54, 0x1946uLL);
          unint64_t v19 = 0;
          uint64_t v20 = 0;
          do
          {
            if (v19 < 0x18 || v19 <= 0x2B && ((1 << v19) & 0x9F000000000) != 0)
            {
              int v21 = [v18 objectAtIndexedSubscript:v19];
              if (v19)
              {
                id v22 = [v43 objectAtIndexedSubscript:v19];
              }
              else
              {
                id v22 = v42;
              }
              uint64_t v23 = v22;
              unint64_t v24 = [v22 indexOfObject:v21];
              unint64_t v25 = v24 + 1;
              float v26 = (float)v24 / (float)(unint64_t)[v23 count];
              if (!v19)
              {
                uint64_t v27 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v25];
                [v18 setObject:v27 atIndexedSubscript:34];

                *(float *)&double v28 = v26;
                uint64_t v29 = [MEMORY[0x1E4F28ED0] numberWithFloat:v28];
                [v18 setObject:v29 atIndexedSubscript:35];
              }
              int v48 = 0;
              [v7 relevantResultSetPRSL2FeaturesFromBundleFeature:v19 absRankFeatureOut:(char *)&v48 + 2 relRankFeatureOut:&v48];
              *(float *)&v55[v20] = (float)v25;
              uint64_t v30 = v20 + 1;
              v54[v20] = HIWORD(v48);
              *(float *)&v55[v20 + 1] = v26;
              v20 += 2;
              v54[v30] = v48;
            }
            ++v19;
          }
          while (v19 != 46);
          uint64_t v31 = [v38 objectForKey:v40];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v44 objects:v53 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v45;
            do
            {
              for (uint64_t i = 0; i != v33; ++i)
              {
                if (*(void *)v45 != v34) {
                  objc_enumerationMutation(v31);
                }
                int v36 = [*(id *)(*((void *)&v44 + 1) + 8 * i) L2FeatureVector];
                [v36 setScores:v55 forFeatures:v54 count:v20];
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v44 objects:v53 count:16];
            }
            while (v33);
          }

          uint64_t v15 = v41 + 1;
        }
        while (v41 + 1 != v39);
        uint64_t v39 = [v14 countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v39);
    }

    id v9 = v38;
    id v10 = v42;
  }
}

- (void)updateResultSetFeaturesOnItems:(id)a3 withContext:(_resultset_computation_ctx *)a4 uniqueScores:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!self->_isCancelled)
  {
    int v36 = self;
    uint64_t v37 = a4;
    id v38 = v9;
    unint64_t v10 = [v9 count];
    unint64_t v11 = [v8 count];
    unint64_t v12 = [v8 count];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v32 = v8;
    obuint64_t j = v8;
    uint64_t v35 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v35)
    {
      float v13 = (float)v10;
      float v14 = (float)v11;
      uint64_t v34 = *(void *)v40;
      float v15 = (float)v12;
      p_var1 = &a4->var1;
      p_var2 = &a4->var2;
      var7 = a4->var7;
LABEL_4:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(obj);
        }
        if (v36->_isCancelled) {
          goto LABEL_27;
        }
        uint64_t v20 = *(void **)(*((void *)&v39 + 1) + 8 * v19);
        bzero(v45, 0x328CuLL);
        bzero(v43, 0x1946uLL);
        int v21 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:-[PRSRankingItem inputToModelScore]((uint64_t)v20)];
        unint64_t v22 = [v38 indexOfObject:v21];

        uint64_t v23 = 0;
        v45[0] = (float)(v22 + 1);
        v45[1] = (float)v22 / v13;
        v45[2] = v14;
        v45[3] = v15;
        v43[0] = 0x761018D01890188;
        var0 = v37->var0;
        unint64_t v25 = sResultSetFeatures;
        do
        {
          v45[v23 + 4] = var0[v23];
          __int16 v26 = *v25;
          v25 += 2;
          *((_WORD *)&v43[1] + v23++) = v26;
        }
        while (v23 != 43);
        if (v37->var3)
        {
          v45[47] = v37->var6;
          __int16 v44 = 1794;
          uint64_t v27 = 48;
        }
        else
        {
          uint64_t v27 = 47;
        }
        if (*p_var1) {
          break;
        }
        if (*p_var2) {
          goto LABEL_17;
        }
LABEL_25:
        uint64_t v31 = objc_msgSend(v20, "L2FeatureVector", v32);
        [v31 setScores:v45 forFeatures:v43 count:v27];

        if (++v19 == v35)
        {
          uint64_t v35 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
          if (v35) {
            goto LABEL_4;
          }
          goto LABEL_27;
        }
      }
      v45[v27] = v37->var4;
      uint64_t v28 = v27 + 1;
      *((_WORD *)v43 + v27++) = 1792;
      if (v37->var2)
      {
LABEL_17:
        v45[v27] = v37->var5;
        uint64_t v28 = v27 + 1;
        *((_WORD *)v43 + v27) = 1793;
      }
      unint64_t v29 = 0;
      uint64_t v27 = v28;
      do
      {
        if (v29 >= 0x16) {
          uint64_t v30 = p_var2;
        }
        else {
          uint64_t v30 = p_var1;
        }
        if (*v30)
        {
          v45[v27] = var7[v29];
          *((_WORD *)v43 + v27++) = associatedResultSetL2FeatureFromSnippetFeature(v29);
        }
        ++v29;
      }
      while (v29 != 44);
      goto LABEL_25;
    }
LABEL_27:

    id v8 = v32;
    id v9 = v38;
  }
}

- (void)pickMostRecentDateForItem:(id)a3 pastItems:(id *)a4 futureItems:(id *)a5
{
  unint64_t v24 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  uint64_t v7 = [v25 sectionBundleIdentifier];
  long long v26 = 0uLL;
  if (![v7 isEqualToString:@"com.apple.application"])
  {
    if ([v7 isEqualToString:@"com.apple.MobileAddressBook"])
    {
      long long v26 = xmmword_1BDC5F1D0;
      uint64_t v8 = 4;
      goto LABEL_15;
    }
    if ([v7 isEqualToString:@"com.apple.mobilecal"])
    {
      int v9 = 17;
LABEL_14:
      LODWORD(v26) = v9;
      uint64_t v8 = 1;
      goto LABEL_15;
    }
    if ([v7 isEqualToString:@"com.apple.reminders"])
    {
      uint64_t v10 = 0x1D0000001CLL;
    }
    else
    {
      if ([v7 isEqualToString:@"com.apple.mobilemail"])
      {
        int v9 = 350;
        goto LABEL_14;
      }
      if ([v7 isEqualToString:@"com.apple.MobileSMS"])
      {
        int v9 = 32;
        goto LABEL_14;
      }
      if ([v7 isEqualToString:@"com.apple.mobilenotes"]) {
        uint64_t v10 = 0x2000000019;
      }
      else {
        uint64_t v10 = 0x2000000009;
      }
    }
    *(void *)&long long v26 = v10;
    uint64_t v8 = 2;
    goto LABEL_15;
  }
  *(void *)&long long v26 = 0x90000015DLL;
  DWORD2(v26) = 32;
  uint64_t v8 = 3;
LABEL_15:
  uint64_t v11 = 0;
  uint64_t v12 = 4 * v8;
  double v13 = 0.0;
  double v14 = 1.79769313e308;
  do
  {
    float v15 = SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v25, "attributes", v24), *(int *)((char *)&v26 + v11));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = [v15 objectAtIndexedSubscript:0];
    }
    else
    {
      id v16 = v15;
    }
    int v17 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v17)
    {
      [v17 timeIntervalSinceReferenceDate];
      if (v18 <= self->_currentTime)
      {
        [v17 timeIntervalSinceReferenceDate];
        if (v19 > v13)
        {
          [v17 timeIntervalSinceReferenceDate];
          double v13 = v20;
        }
      }
      [v17 timeIntervalSinceReferenceDate];
      if (v21 > self->_currentTime)
      {
        [v17 timeIntervalSinceReferenceDate];
        if (v22 < v14)
        {
          [v17 timeIntervalSinceReferenceDate];
          double v14 = v23;
        }
      }
    }
    v11 += 4;
  }
  while (v12 != v11);
  if (v13 != 0.0)
  {
    [v25 setMostRecentUsedDate:v13];
    [*a4 addObject:v25];
  }
  if (v14 != 0.0)
  {
    [v25 setClosestUpComingDate:v14];
    [*v24 addObject:v25];
  }
}

- (void)populateLocalResultSetDateFeaturesForItems:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  id v6 = (id)objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      uint64_t v11 = 0;
      uint64_t v12 = v6;
      double v13 = v5;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * v11);
        id v27 = v12;
        id v28 = v13;
        [(PRSRankingItemRanker *)self pickMostRecentDateForItem:v14 pastItems:&v28 futureItems:&v27];
        id v5 = v28;

        id v6 = v27;
        ++v11;
        uint64_t v12 = v6;
        double v13 = v5;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  float v15 = +[PRSRankingItemRelativeFeatureContext relativeContextsForResultSetWithCurrentTime:self->_currentTime];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        double v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int v21 = [v20 relRankFeature];
        id v22 = v5;
        if (v21 != 1789)
        {
          if ([v20 relRankFeature] == 1791) {
            id v22 = v6;
          }
          else {
            id v22 = v7;
          }
        }
        [(PRSRankingItemRanker *)self computeRelativeFeatureForContext:v20 items:v22];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v17);
  }
}

- (void)computeResultSetDependantFeatures:(id)a3 allItems:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_isCancelled)
  {
    long long v24 = v6;
    uint64_t v41 = 0;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    *(_OWORD *)long long v29 = 0u;
    long long v30 = 0u;
    resultset_computation_ctx_init((uint64_t)v29);
    long long v23 = objc_opt_new();
    -[PRSRankingItemRanker updateResultSetContext:andUniqueScores:withResultSetItems:](self, "updateResultSetContext:andUniqueScores:withResultSetItems:", v29);
    id v8 = objc_alloc(MEMORY[0x1E4F1CA70]);
    uint64_t v9 = [(PRSRankingItemRanker *)self bundleFeatures];
    uint64_t v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v11 = [(PRSRankingItemRanker *)self bundleFeatures];
    uint64_t v12 = [v11 keyEnumerator];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v42 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v18 = [(PRSRankingItemRanker *)self bundleFeatures];
          double v19 = [v18 objectForKey:v17];
          double v20 = [v19 objectAtIndexedSubscript:0];
          [v10 addObject:v20];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v42 count:16];
      }
      while (v14);
    }

    [(PRSRankingItemRanker *)self updateResultSetFeaturesOnItems:v7 withContext:v29 uniqueScores:v23];
    if (v29[0]) {
      free(v29[0]);
    }
    id v6 = v24;
    if (!self->_isCancelled)
    {
      [(PRSRankingItemRanker *)self populateRankResultSetBundleFeaturesWithBundleItems:v24 withUniqueBundleMaxScores:v10];
      [(PRSRankingItemRanker *)self populateLocalResultSetDateFeaturesForItems:v7];
      if (!self->_isCancelled)
      {
        int v21 = [v24 objectForKey:@"com.apple.mobilemail"];
        id v22 = [v24 objectForKey:@"com.apple.MobileAddressBook"];
        [(PRSRankingItemRanker *)self populateMailContactFeaturesWithMailItems:v21 contactItems:v22];
      }
    }
  }
}

- (void)populateMailContactFeaturesWithMailItems:(id)a3 contactItems:(id)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] && objc_msgSend(v6, "count"))
  {
    long long v42 = v6;
    long long v50 = objc_opt_new();
    long long v49 = objc_opt_new();
    id v7 = objc_opt_new();
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v41 = v5;
    obuint64_t j = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v73 objects:v84 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v74 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          uint64_t v13 = [v12 L2FeatureVector];
          if ([v13 vipSenderMatchesQuery])
          {
            long long v71 = 0u;
            long long v72 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            uint64_t v14 = -[PRSRankingItem matchedVipSenders]((uint64_t)v12);
            uint64_t v15 = [v14 countByEnumeratingWithState:&v69 objects:v83 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v70;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v70 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  [v50 addObject:*(void *)(*((void *)&v69 + 1) + 8 * j)];
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v69 objects:v83 count:16];
              }
              while (v16);
            }
          }
          if ([v13 senderIsVip])
          {
            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            double v19 = -[PRSRankingItem matchedSenders]((uint64_t)v12);
            uint64_t v20 = [v19 countByEnumeratingWithState:&v65 objects:v82 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v66;
              do
              {
                for (uint64_t k = 0; k != v21; ++k)
                {
                  if (*(void *)v66 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  [v49 addObject:*(void *)(*((void *)&v65 + 1) + 8 * k)];
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v65 objects:v82 count:16];
              }
              while (v21);
            }
          }
          if ([v13 receiverIsVip])
          {
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            long long v24 = -[PRSRankingItem matchedRecipients]((uint64_t)v12);
            uint64_t v25 = [v24 countByEnumeratingWithState:&v61 objects:v81 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v62;
              do
              {
                for (uint64_t m = 0; m != v26; ++m)
                {
                  if (*(void *)v62 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  [v7 addObject:*(void *)(*((void *)&v61 + 1) + 8 * m)];
                }
                uint64_t v26 = [v24 countByEnumeratingWithState:&v61 objects:v81 count:16];
              }
              while (v26);
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v73 objects:v84 count:16];
      }
      while (v9);
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v43 = v42;
    uint64_t v46 = [v43 countByEnumeratingWithState:&v57 objects:v80 count:16];
    if (v46)
    {
      uint64_t v44 = *(void *)v58;
      do
      {
        for (id n = 0; n != (id)v46; id n = (char *)n + 1)
        {
          if (*(void *)v58 != v44) {
            objc_enumerationMutation(v43);
          }
          uint64_t v30 = *(void *)(*((void *)&v57 + 1) + 8 * (void)n);
          int v79 = 0;
          uint64_t v78 = 0;
          __int16 v56 = 0;
          int v55 = 0;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v31 = -[PRSRankingItem emailAddresses](v30);
          uint64_t v32 = [v31 countByEnumeratingWithState:&v51 objects:v77 count:16];
          if (!v32)
          {
LABEL_66:

            continue;
          }
          uint64_t v33 = v32;
          long long v45 = (void *)v30;
          id obja = n;
          char v34 = 0;
          char v35 = 0;
          char v36 = 0;
          uint64_t v37 = 0;
          uint64_t v38 = *(void *)v52;
          do
          {
            for (iuint64_t i = 0; ii != v33; ++ii)
            {
              if (*(void *)v52 != v38) {
                objc_enumerationMutation(v31);
              }
              uint64_t v40 = *(void *)(*((void *)&v51 + 1) + 8 * ii);
              if (v34) {
                goto LABEL_50;
              }
              if ([v7 containsObject:*(void *)(*((void *)&v51 + 1) + 8 * ii)])
              {
                *((_WORD *)&v55 + v37) = 1854;
                *((_DWORD *)&v78 + v37++) = 1065353216;
LABEL_50:
                char v34 = 1;
                if (v35) {
                  goto LABEL_55;
                }
                goto LABEL_53;
              }
              char v34 = 0;
              if (v35) {
                goto LABEL_55;
              }
LABEL_53:
              if ([v50 containsObject:v40])
              {
                *((_WORD *)&v55 + v37) = 1853;
                *((_DWORD *)&v78 + v37++) = 1065353216;
LABEL_55:
                char v35 = 1;
                if (v36) {
                  goto LABEL_60;
                }
                goto LABEL_58;
              }
              char v35 = 0;
              if (v36) {
                goto LABEL_60;
              }
LABEL_58:
              if ([v49 containsObject:v40])
              {
                *((_WORD *)&v55 + v37) = 1852;
                *((_DWORD *)&v78 + v37++) = 1065353216;
LABEL_60:
                char v36 = 1;
                continue;
              }
              char v36 = 0;
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v51 objects:v77 count:16];
          }
          while (v33);

          id n = obja;
          if (v37)
          {
            long long v31 = [v45 L2FeatureVector];
            [v31 setScores:&v78 forFeatures:&v55 count:v37];
            goto LABEL_66;
          }
        }
        uint64_t v46 = [v43 countByEnumeratingWithState:&v57 objects:v80 count:16];
      }
      while (v46);
    }

    id v5 = v41;
    id v6 = v42;
  }
}

- (void)relevantResultSetPRSL2FeaturesFromBundleFeature:(unint64_t)a3 absRankFeatureOut:(unsigned __int16 *)a4 relRankFeatureOut:(unsigned __int16 *)a5
{
  if (a3 >= 0x2C || ((0x9F000FFFFFFuLL >> a3) & 1) == 0) {
    -[PRSRankingItemRanker relevantResultSetPRSL2FeaturesFromBundleFeature:absRankFeatureOut:relRankFeatureOut:]();
  }
  unsigned __int16 v5 = word_1BDC5F524[a3];
  *a4 = word_1BDC5F4CC[a3];
  *a5 = v5;
}

- (void)computeRelativeFeatureForContext:(id)a3 items:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_isCancelled)
  {
    __int16 v8 = [v6 relRankFeature];
    __int16 v9 = [v6 absRankFeature];
    uint64_t v10 = [v6 predicate];
    uint64_t v11 = [v6 comparator];
    long long v28 = [v7 filteredArrayUsingPredicate:v10];
    if ([v28 count])
    {
      id v26 = v6;
      uint64_t v27 = v11;
      uint64_t v12 = [(PRSRankingItemRanker *)self comparatorByJoiningComparator:v11 withPredicate:v10];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __63__PRSRankingItemRanker_computeRelativeFeatureForContext_items___block_invoke;
      v30[3] = &unk_1E635ADE8;
      id v24 = v12;
      id v25 = v7;
      id v31 = v24;
      uint64_t v13 = [v7 sortedArrayWithOptions:1 usingComparator:v30];
      uint64_t v14 = [v13 count];
      if (v14)
      {
        uint64_t v15 = v14;
        unint64_t v16 = 0;
        uint64_t v17 = 0;
        float v18 = -1.0;
        float v19 = -1.0;
        do
        {
          if (v17)
          {
            uint64_t v20 = [v13 objectAtIndexedSubscript:v17 - 1];
          }
          else
          {
            uint64_t v20 = 0;
          }
          uint64_t v21 = [v13 objectAtIndexedSubscript:v17];
          float v22 = -2.0;
          if ([v10 evaluateWithObject:v21])
          {
            if (v20 && !v27[2](v27, v20, v21))
            {
              float v22 = v19;
            }
            else
            {
              float v18 = (float)v16;
              float v22 = 1.0 - (float)((float)v16++ / (float)(unint64_t)[v28 count]);
            }
          }
          else
          {
            float v18 = -2.0;
          }
          v29[0] = v9;
          v29[1] = v8;
          *(float *)uint64_t v32 = v18;
          *(float *)&v32[1] = v22;
          long long v23 = [v21 L2FeatureVector];
          [v23 setScores:v32 forFeatures:v29 count:2];

          ++v17;
          float v19 = v22;
        }
        while (v15 != v17);
      }

      id v7 = v25;
      id v6 = v26;
      uint64_t v11 = v27;
    }
  }
}

uint64_t __63__PRSRankingItemRanker_computeRelativeFeatureForContext_items___block_invoke(uint64_t a1)
{
  return -(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (float)computeScoresForVectors:(id)a3 withBundleFeatures:(id)a4
{
  p_isCancelled = &self->_isCancelled;
  if (self->_isCancelled) {
    return 0;
  }
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = +[PRSModelManager sharedModelManager];
  uint64_t v11 = [(PRSRankingItemRanker *)self bundleFeatures];
  [(PRSRankingItemRanker *)self experimentalWeight1];
  double v13 = v12;
  [(PRSRankingItemRanker *)self experimentalWeight2];
  uint64_t v15 = (float *)[v10 computeL2ScoresForVectors:v9 secondVector:v9 withServerFeatures:v8 withBundleFeatures:v11 experimentalWeight1:p_isCancelled experimentalWeight2:0 shouldCancel:v13 clientBundle:v14];

  return v15;
}

- (float)computeScoresForVectors:(id)a3
{
  p_isCancelled = &self->_isCancelled;
  if (self->_isCancelled) {
    return 0;
  }
  id v6 = a3;
  id v7 = +[PRSModelManager sharedModelManager];
  id v8 = [(PRSRankingItemRanker *)self bundleFeatures];
  [(PRSRankingItemRanker *)self experimentalWeight1];
  double v10 = v9;
  [(PRSRankingItemRanker *)self experimentalWeight2];
  double v12 = (float *)[v7 computeL2ScoresForVectors:v6 secondVector:v6 withServerFeatures:0 withBundleFeatures:v8 experimentalWeight1:p_isCancelled experimentalWeight2:0 shouldCancel:v10 clientBundle:v11];

  return v12;
}

+ (void)setDockApps:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock((os_unfair_lock_t)&s_dockapps_update_lock);
    objc_storeStrong((id *)&sDockApps, a3);
    os_unfair_lock_unlock((os_unfair_lock_t)&s_dockapps_update_lock);
    id v4 = v5;
  }
}

- (void)updateScoresForPreparedItems:(id)a3
{
  id v4 = a3;
  -[PRSRankingItemRanker updateScoresForPreparedItems:isCJK:clientBundleID:thresholdValue:queryNodeMatchInfo:collectL2Signals:](self, "updateScoresForPreparedItems:isCJK:clientBundleID:thresholdValue:queryNodeMatchInfo:collectL2Signals:", v4, [(id)objc_opt_class() isCJK], 0, 0, 0, -1.79769313e308);
}

- (void)updateScoresForPreparedItems:(id)a3 isCJK:(BOOL)a4 clientBundleID:(id)a5 thresholdValue:(double)a6 queryNodeMatchInfo:(id)a7
{
  id v8 = a3;
  -[PRSRankingItemRanker updateScoresForPreparedItems:isCJK:clientBundleID:thresholdValue:queryNodeMatchInfo:collectL2Signals:](self, "updateScoresForPreparedItems:isCJK:clientBundleID:thresholdValue:queryNodeMatchInfo:collectL2Signals:", v8, [(id)objc_opt_class() isCJK], 0, 0, 0, -1.79769313e308);
}

- (void)updateScoresForPreparedItems:(id)a3 isCJK:(BOOL)a4 clientBundleID:(id)a5 thresholdValue:(double)a6 queryNodeMatchInfo:(id)a7 collectL2Signals:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v12 = a4;
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  if (!self->_isCancelled)
  {
    BOOL v133 = v8;
    p_isCancelled = &self->_isCancelled;
    BOOL v107 = v12;
    id v108 = v16;
    uint64_t v17 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v150 = [v14 count];
      _os_log_impl(&dword_1BDB2A000, v17, OS_LOG_TYPE_INFO, "[SpotlightRanking] <Model> updating scores for %lu items", buf, 0xCu);
    }

    float v18 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    float v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
    long long v125 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
    os_unfair_lock_lock((os_unfair_lock_t)&s_dockapps_update_lock);
    int v124 = (void *)[(id)sDockApps copy];
    os_unfair_lock_unlock((os_unfair_lock_t)&s_dockapps_update_lock);
    if (PRSRankingSDEnabledFlagState_onceToken != -1) {
      dispatch_once(&PRSRankingSDEnabledFlagState_onceToken, &__block_literal_global_994);
    }
    id v110 = v15;
    char v119 = PRSRankingSDEnabledFlagState_sPRSRankingSDEnabledFlags;
    BOOL v117 = [(NSString *)self->_clientBundle isEqualToString:@"com.apple.searchd"];
    int v111 = SSStringEndsWithSpace(self->_searchString);
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    id v109 = v14;
    id v20 = v14;
    int v123 = v18;
    obuint64_t j = v20;
    uint64_t v128 = [v20 countByEnumeratingWithState:&v145 objects:v173 count:16];
    if (!v128)
    {
      int v21 = 0;
      goto LABEL_43;
    }
    char v131 = 0;
    int v21 = 0;
    uint64_t v126 = *(void *)v146;
    p_hasPolicyMultipleTermsPhraseMatch = &self->_hasPolicyMultipleTermsPhraseMatch;
    float v121 = v19;
LABEL_8:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v146 != v126) {
        objc_enumerationMutation(obj);
      }
      if (*p_isCancelled)
      {
        id v41 = obj;
        id v15 = v110;
        goto LABEL_41;
      }
      long long v23 = *(void **)(*((void *)&v145 + 1) + 8 * v22);
      id v24 = [v23 sectionBundleIdentifier];
      int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v24);

      if (IsSyndicatedPhotos)
      {
        id v26 = [v23 retrievalType];
        [v26 intValue];
        uint64_t v27 = [v23 retrievalType];
        int v28 = [v27 intValue] & 1;

        v21 += v28;
      }
      long long v29 = [v23 L2FeatureVector];
      if (!v29) {
        goto LABEL_37;
      }
      if ((v119 & 2) != 0)
      {
        uint64_t v40 = PRSModelManagerAssociatedObjectKeyForType(0);
        objc_setAssociatedObject(v29, v40, v23, (void *)1);
      }
      [v19 addObject:v29];
      [v125 addObject:v29];
      uint64_t v30 = [v23 sectionBundleIdentifier];
      id v31 = [v23 sectionBundleIdentifier];
      uint64_t v32 = [v18 objectForKey:v31];
      if (![v32 count])
      {
        uint64_t v33 = objc_opt_new();

        [v18 setObject:v33 forKey:v31];
        uint64_t v32 = (void *)v33;
      }
      if (v131) {
        char v131 = 1;
      }
      else {
        char v131 = [v30 isEqualToString:@"com.apple.mobilemail"];
      }
      [v32 addObject:v23];
      char v34 = [v23 identifier];
      int v35 = [v124 containsObject:v34];

      if (v35) {
        [v29 setIsAppInDock:1];
      }
      float v18 = v123;
      if (!v117 || ([v23 shouldHideUnderShowMore] & 1) == 0)
      {
        unint64_t queryTermCount = self->_queryTermCount;
        if (queryTermCount < 2)
        {
          if (queryTermCount != 1) {
            goto LABEL_36;
          }
          int v38 = v111;
          if (*p_hasPolicyMultipleTermsPhraseMatch) {
            int v38 = 0;
          }
          if (v38 != 1) {
            goto LABEL_36;
          }
          int v39 = hasPolicyPhraseMatch(v23, 1uLL, 1);
          p_hasPolicySingleTermPhraseMatch = &self->_hasPolicySingleTermPhraseMatch;
          if (!v39) {
            goto LABEL_36;
          }
        }
        else
        {
          if (!hasPolicyPhraseMatch(v23, queryTermCount, self->_exact)) {
            goto LABEL_36;
          }
          p_hasPolicySingleTermPhraseMatch = &self->_hasPolicyMultipleTermsPhraseMatch;
          if (*p_hasPolicyMultipleTermsPhraseMatch) {
            goto LABEL_36;
          }
        }
        BOOL *p_hasPolicySingleTermPhraseMatch = 1;
      }
LABEL_36:

      float v19 = v121;
LABEL_37:

      if (v128 == ++v22)
      {
        id v20 = obj;
        uint64_t v128 = [obj countByEnumeratingWithState:&v145 objects:v173 count:16];
        if (v128) {
          goto LABEL_8;
        }
LABEL_43:

        id v15 = v110;
        if (*p_isCancelled)
        {
LABEL_44:

          id v16 = v108;
          id v14 = v109;
          break;
        }
        double v122 = v19;
        [(PRSRankingItemRanker *)self computeResultSetDependantFeatures:v18 allItems:v20];
        [(PRSRankingItemRanker *)self computePolicyFeaturesForBundleItems:v18 isCJK:v107];
        long long v143 = 0u;
        long long v144 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        id v42 = v18;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v141 objects:v172 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          id v41 = 0;
          uint64_t v45 = *(void *)v142;
          do
          {
            for (uint64_t i = 0; i != v44; ++i)
            {
              if (*(void *)v142 != v45) {
                objc_enumerationMutation(v42);
              }
              uint64_t v47 = *(void **)(*((void *)&v141 + 1) + 8 * i);
              if (SSPommesRankingIsEnabled(v47, [(PRSRankingItemRanker *)self isSearchToolClient]))
              {
                if (!v41)
                {
                  id v41 = +[SSPommesRanker sharedPommesRanker];
                }
                int v48 = [v42 objectForKey:v47];
                LOBYTE(v106) = v21 == 0;
                [v41 updateScoresForItems:v48 withSectionBundle:v47 userQuery:self->_userQueryString queryID:self->_queryID currentTime:v133 collectL2Signals:self->_keyboardLanguage keyboardLanguage:self->_currentTime onlyEmbeddingResults:v106];
              }
            }
            uint64_t v44 = [v42 countByEnumeratingWithState:&v141 objects:v172 count:16];
          }
          while (v44);
        }
        else
        {
          id v41 = 0;
        }

        long long v139 = 0u;
        long long v140 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        id v49 = obj;
        uint64_t v50 = [v49 countByEnumeratingWithState:&v137 objects:v171 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v138;
          do
          {
            for (uint64_t j = 0; j != v51; ++j)
            {
              if (*(void *)v138 != v52) {
                objc_enumerationMutation(v49);
              }
              long long v54 = *(void **)(*((void *)&v137 + 1) + 8 * j);
              int v55 = [v54 sectionBundleIdentifier];
              int v56 = SSSectionIsSyndicatedPhotos(v55);

              if (v56)
              {
                if ([v54 photosMatch]) {
                  uint64_t v57 = 1;
                }
                else {
                  uint64_t v57 = [v54 isGoodPhotosMatch];
                }
                [v54 setPhotosMatch:v57];
              }
            }
            uint64_t v51 = [v49 countByEnumeratingWithState:&v137 objects:v171 count:16];
          }
          while (v51);
        }

        if ([(PRSRankingItemRanker *)self isSearchToolClient])
        {
          if (updateScoresForPreparedItems_isCJK_clientBundleID_thresholdValue_queryNodeMatchInfo_collectL2Signals__onceToken != -1) {
            dispatch_once(&updateScoresForPreparedItems_isCJK_clientBundleID_thresholdValue_queryNodeMatchInfo_collectL2Signals__onceToken, &__block_literal_global_980);
          }
          if (updateScoresForPreparedItems_isCJK_clientBundleID_thresholdValue_queryNodeMatchInfo_collectL2Signals__isDebug)
          {
            long long v58 = SSGeneralLog();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v59 = [v49 count];
              *(_DWORD *)buf = 134217984;
              uint64_t v150 = v59;
              _os_log_impl(&dword_1BDB2A000, v58, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] retrieved %lu items", buf, 0xCu);
            }

            if ([v49 count])
            {
              unint64_t v60 = 0;
              do
              {
                unint64_t v134 = v60;
                long long v61 = objc_msgSend(v49, "objectAtIndexedSubscript:");
                __int16 v132 = [v61 sectionBundleIdentifier];
                uint64_t v129 = SSCompactRankingAttrsGetValue((int8x8_t *)[v61 attributes], 1uLL);
                v127 = SSCompactRankingAttrsGetValue((int8x8_t *)[v61 attributes], 0xE3uLL);
                long long v120 = SSCompactRankingAttrsGetValue((int8x8_t *)[v61 attributes], 0xE4uLL);
                uint64_t v118 = SSCompactRankingAttrsGetValue((int8x8_t *)[v61 attributes], 0xDuLL);
                SSCompactRankingAttrsGetValue((int8x8_t *)[v61 attributes], 0x10DuLL);
                id obja = (id)objc_claimAutoreleasedReturnValue();
                long long v62 = SSCompactRankingAttrsGetValue((int8x8_t *)[v61 attributes], 7uLL);
                long long v63 = SSCompactRankingAttrsGetValue((int8x8_t *)[v61 attributes], 0xCuLL);
                uint64_t v64 = SSCompactRankingAttrsGetValue((int8x8_t *)[v61 attributes], 4uLL);
                long long v65 = (void *)v64;
                if (v63) {
                  long long v66 = v63;
                }
                else {
                  long long v66 = (void *)v64;
                }
                if (v62) {
                  long long v66 = v62;
                }
                id v114 = v66;
                long long v67 = SSGeneralLog();
                if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                {
                  long long v112 = [v61 identifier];
                  [v61 pommesL1Score];
                  double v69 = v68;
                  [v61 embeddingSimilarity];
                  *(_DWORD *)buf = 134220546;
                  unint64_t v135 = v134 + 1;
                  uint64_t v150 = v135;
                  __int16 v151 = 2112;
                  uint64_t v152 = (uint64_t)v132;
                  __int16 v153 = 2112;
                  long long v154 = v112;
                  __int16 v155 = 2112;
                  long long v156 = v129;
                  __int16 v157 = 2112;
                  long long v158 = v127;
                  __int16 v159 = 2112;
                  long long v160 = v120;
                  __int16 v161 = 2112;
                  long long v162 = v118;
                  __int16 v163 = 2112;
                  id v164 = obja;
                  __int16 v165 = 2112;
                  id v166 = v114;
                  __int16 v167 = 2048;
                  double v168 = v69;
                  __int16 v169 = 2048;
                  double v170 = v70;
                  _os_log_impl(&dword_1BDB2A000, v67, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] retrieved item %lu: bundleId=%@ identifier=%@ MDItemIdentifier=%@ messageID=%@ messageHeader=%@ contentURL=%@ appEntityInstanceId=%@ name=%@ pommesL1Score=%.3f embeddingSimilarity=%.3f", buf, 0x70u);
                }
                else
                {
                  unint64_t v135 = v134 + 1;
                }

                unint64_t v71 = [v49 count];
                unint64_t v60 = v135;
              }
              while (v135 < v71);
            }
          }
          else
          {
            id v72 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            if ([v49 count])
            {
              unint64_t v73 = 0;
              do
              {
                long long v74 = [v49 objectAtIndexedSubscript:v73];
                long long v75 = [v74 sectionBundleIdentifier];
                if (v75)
                {
                  long long v76 = [v72 objectForKeyedSubscript:v75];

                  if (v76)
                  {
                    id v77 = (void *)MEMORY[0x1E4F28ED0];
                    uint64_t v78 = [v72 objectForKeyedSubscript:v75];
                    int v79 = objc_msgSend(v77, "numberWithInt:", objc_msgSend(v78, "intValue") + 1);
                    [v72 setObject:v79 forKeyedSubscript:v75];
                  }
                  else
                  {
                    [v72 setObject:&unk_1F1863F80 forKeyedSubscript:v75];
                  }
                }

                ++v73;
              }
              while (v73 < [v49 count]);
            }
            if ([v72 count])
            {
              id v136 = 0;
              uint64_t v80 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v72 options:3 error:&v136];
              id v81 = v136;
              if (v80)
              {
                int v82 = (void *)[[NSString alloc] initWithData:v80 encoding:4];
                uint64_t v83 = SSGeneralLog();
                if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                {
                  int64_t v84 = [(PRSRankingItemRanker *)self queryID];
                  uint64_t v85 = [v49 count];
                  *(_DWORD *)buf = 134218498;
                  uint64_t v150 = v84;
                  __int16 v151 = 2048;
                  uint64_t v152 = v85;
                  __int16 v153 = 2112;
                  long long v154 = v82;
                  _os_log_impl(&dword_1BDB2A000, v83, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] qid=%ld retrieved %ld items from %@", buf, 0x20u);
                }
              }
            }
          }
        }
        BOOL v86 = [(PRSRankingItemRanker *)self isSearchToolClient];
        id v15 = v110;
        id v87 = v110;
        uint32_t v88 = v87;
        if (v86)
        {
          BOOL v89 = SSGeneralLog();
          float v19 = v122;
          if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BDB2A000, v89, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][SearchTool] bypass GBDT model for SearchTool", buf, 2u);
          }

LABEL_109:
        }
        else
        {
          float v19 = v122;
          if (!v87) {
            goto LABEL_124;
          }
          if ([v87 isEqualToString:@"com.apple.mobilemail"]) {
            goto LABEL_109;
          }
          char v90 = [v88 isEqualToString:@"com.apple.mobileslideshow"];

          if ((v90 & 1) == 0)
          {
LABEL_124:
            if ([v122 count] || objc_msgSend(v125, "count"))
            {
              int v91 = +[PRSModelManager sharedModelManager];
              uint32_t v92 = [(PRSRankingItemRanker *)self bundleFeatures];
              [(PRSRankingItemRanker *)self experimentalWeight1];
              double v94 = v93;
              [(PRSRankingItemRanker *)self experimentalWeight2];
              v96 = (_DWORD *)[v91 computeL2ScoresForVectors:v122 secondVector:v125 withServerFeatures:0 withBundleFeatures:v92 experimentalWeight1:p_isCancelled experimentalWeight2:v88 shouldCancel:v94 clientBundle:v95];

              if (v96)
              {
                uint64_t v97 = [v122 count];
                if (v97)
                {
                  uint64_t v98 = v97;
                  for (uint64_t k = 0; k != v98; ++k)
                  {
                    id v100 = [v49 objectAtIndexedSubscript:k];
                    LODWORD(v101) = v96[k];
                    [v100 setScore:v101];
                    LODWORD(v102) = v96[k];
                    [v100 setRawScore:v102];
                    id v103 = [v122 objectAtIndexedSubscript:k];
                    [v103 withinBundleScore];
                    objc_msgSend(v100, "setWithinBundleScore:");

                    if (*(float *)&v96[k] < a6)
                    {
                      [v100 setEligibleForDemotion:1];
                      uint64_t v104 = PRSLogCategoryDefault();
                      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                      {
                        id v105 = [v100 sectionBundleIdentifier];
                        *(_DWORD *)buf = 138412290;
                        uint64_t v150 = (uint64_t)v105;
                        _os_log_impl(&dword_1BDB2A000, v104, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Model> marking item as eligible for demotion as score less than threshold: %@", buf, 0xCu);
                      }
                    }
                  }
                }
                free(v96);
                [(PRSRankingItemRanker *)self rerankItemsWithPolicyForBundleItems:v42 isCJK:v107];
                id v15 = v110;
                float v19 = v122;
              }
            }
          }
        }
LABEL_41:

        float v18 = v123;
        goto LABEL_44;
      }
    }
  }
}

uint64_t __125__PRSRankingItemRanker_updateScoresForPreparedItems_isCJK_clientBundleID_thresholdValue_queryNodeMatchInfo_collectL2Signals___block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  updateScoresForPreparedItems_isCJK_clientBundleID_thresholdValue_queryNodeMatchInfo_collectL2Signals__isDebug = result;
  return result;
}

+ (void)sortResultsInSection:(id)a3 currentTime:(double)a4
{
  id v5 = a3;
  id v6 = [v5 bundleIdentifier];
  int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v6);

  if (IsSyndicatedPhotos)
  {
    BOOL v8 = (uint64_t *)&__block_literal_global_987;
LABEL_6:
    objc_msgSend(v5, "sortUsingComparator:", v8, v14, v15, v16, v17, *(void *)&v18);
    goto LABEL_7;
  }
  double v9 = [v5 bundleIdentifier];
  int v10 = SSPommesRankingForSectionBundle(v9);

  if (!v10)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __57__PRSRankingItemRanker_sortResultsInSection_currentTime___block_invoke_3;
    uint64_t v17 = &__block_descriptor_40_e75_q24__0__SFSearchResult_SpotlightExtras_8__SFSearchResult_SpotlightExtras_16l;
    double v18 = a4;
    BOOL v8 = &v14;
    goto LABEL_6;
  }
  double v11 = +[SSPommesRanker sharedPommesRanker];
  BOOL v12 = [v5 bundleIdentifier];
  char IsMailOrPommesCTL = SSSectionIsMailOrPommesCTL(v12);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__PRSRankingItemRanker_sortResultsInSection_currentTime___block_invoke_2;
  v19[3] = &__block_descriptor_33_e75_q24__0__SFSearchResult_SpotlightExtras_8__SFSearchResult_SpotlightExtras_16l;
  char v20 = IsMailOrPommesCTL;
  [v5 sortUsingComparator:v19];

LABEL_7:
}

int64_t __57__PRSRankingItemRanker_sortResultsInSection_currentTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 rankingItem];

  id v7 = [v5 rankingItem];

  if (v6)
  {
    if (v7)
    {
      BOOL v8 = [v4 rankingItem];
      double v9 = [v5 rankingItem];
      int64_t v10 = +[SSPommesPhotosRanker PhotosL2Compare:v8 to:v9];
    }
    else
    {
      int64_t v10 = -1;
    }
  }
  else
  {
    int64_t v10 = v7 != 0;
  }

  return v10;
}

uint64_t __57__PRSRankingItemRanker_sortResultsInSection_currentTime___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 rankingItem];
  if (v7
    && (BOOL v8 = (void *)v7,
        [v6 rankingItem],
        double v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    int v10 = *(unsigned __int8 *)(a1 + 32);
    double v11 = [v5 rankingItem];
    BOOL v12 = [v6 rankingItem];
    if (v10) {
      int64_t v13 = +[SSPommesRanker MailL2Compare:v11 to:v12];
    }
    else {
      int64_t v13 = +[SSPommesRanker BaseL2Compare:v11 to:v12];
    }
    uint64_t v15 = v13;
  }
  else
  {
    uint64_t v14 = [v5 rankingItem];

    if (v14)
    {
      uint64_t v15 = -1;
    }
    else
    {
      id v16 = [v6 rankingItem];

      uint64_t v15 = v16 != 0;
    }
  }

  return v15;
}

uint64_t __57__PRSRankingItemRanker_sortResultsInSection_currentTime___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 rankingItem];
  if (v7
    && (BOOL v8 = (void *)v7,
        [v6 rankingItem],
        double v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    int v10 = [v5 rankingItem];
    double v11 = [v6 rankingItem];
    uint64_t v12 = -[v10 compare:v11 currentTime:*(double *)(a1 + 32)];
  }
  else
  {
    int64_t v13 = [v5 rankingItem];

    if (v13)
    {
      uint64_t v12 = -1;
    }
    else
    {
      uint64_t v14 = [v6 rankingItem];

      uint64_t v12 = v14 != 0;
    }
  }

  return v12;
}

+ (BOOL)shouldFilterResult:(id)a3 currentTime:(double)a4 isScopedSearch:(BOOL)a5 clientBundleId:(id)a6 queryKind:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a6;
  int64_t v13 = [v11 sectionBundleIdentifier];
  int v14 = [v13 isEqualToString:@"com.apple.reminders"];

  if (!v14)
  {
    float v19 = [v11 sectionBundleIdentifier];
    if ([v19 isEqualToString:@"com.apple.tips"])
    {
LABEL_7:

      goto LABEL_8;
    }
    id v25 = [v11 sectionBundleIdentifier];
    if ([v25 isEqualToString:@"com.apple.Passbook"])
    {
      id v26 = v12;
      if (SPQueryKindIsSearchToolSearch_onceToken_1 != -1) {
        dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken_1, &__block_literal_global_1516);
      }
      if (!SPQueryKindIsSearchToolSearch_isSearchToolDebugMode_1)
      {
        if (!SPQueryKindIsSearchToolSearch_isSearchToolRanking_1)
        {

          goto LABEL_7;
        }
        if (([v26 hasPrefix:@"com.apple.omniSearch"] & 1) == 0
          && ([v26 hasPrefix:@"com.apple.intelligenceflow"] & 1) == 0)
        {
          char v40 = [v26 hasPrefix:@"com.apple.ondeviceeval"];

          if (a7 != 12 && (v40 & 1) == 0)
          {
LABEL_8:
            if (!a5)
            {
              uint64_t v20 = [v11 rankingItem];
              if (v20)
              {
                int v21 = (void *)v20;
                uint64_t v22 = [v11 rankingItem];
                [v22 topicalityScore];
                double v24 = v23;

                if (v24 < 2.22044605e-16) {
                  goto LABEL_26;
                }
              }
            }
            goto LABEL_24;
          }
LABEL_18:
          uint64_t v27 = [v11 sectionBundleIdentifier];
          if ([v27 isEqualToString:@"com.apple.people.screenTimeRequest"])
          {
          }
          else
          {
            int v28 = [v11 sectionBundleIdentifier];
            int v29 = [v28 isEqualToString:@"com.apple.people.askToBuyRequest"];

            if (!v29)
            {
              uint64_t v37 = [v11 resultBundleId];
              int v38 = [v37 isEqualToString:@"com.apple.shortcuts"];

              if (v38)
              {
                int v35 = [v11 rankingItem];
                int v39 = SSCompactRankingAttrsGetValue((int8x8_t *)[v35 attributes], 0xAAuLL);

                LOBYTE(v35) = [v39 BOOLValue];
              }
              else
              {
                uint64_t v17 = [v11 userActivityType];
                if (![v17 length])
                {
LABEL_23:

                  goto LABEL_24;
                }
                id v41 = [v11 rankingItem];
                id v42 = SSCompactRankingAttrsGetValue((int8x8_t *)[v41 attributes], 0x15uLL);

                if (!v42) {
                  goto LABEL_24;
                }
                uint64_t v43 = [v11 rankingItem];
                int v39 = SSCompactRankingAttrsGetValue((int8x8_t *)[v43 attributes], 0x16uLL);

                if (!v39) {
                  goto LABEL_24;
                }
                LODWORD(v35) = [v39 BOOLValue] ^ 1;
              }

              goto LABEL_27;
            }
          }
          uint64_t v30 = [v11 rankingItem];
          uint64_t v17 = SSCompactRankingAttrsGetValue((int8x8_t *)[v30 attributes], 0x24uLL);

          [v17 timeIntervalSinceReferenceDate];
          if (v31 < a4) {
            goto LABEL_25;
          }
          uint64_t v32 = [v11 rankingItem];
          [v32 bundleIDType];

          uint64_t v33 = [v11 rankingItem];
          char v34 = SSCompactRankingAttrsGetValue((int8x8_t *)[v33 attributes], 0x99uLL);

          LODWORD(v33) = [v34 intValue];
          if (!v33) {
            goto LABEL_25;
          }
          goto LABEL_23;
        }
      }
    }
    goto LABEL_18;
  }
  uint64_t v15 = [v11 rankingItem];

  if (v15)
  {
    id v16 = [v11 rankingItem];
    uint64_t v17 = SSCompactRankingAttrsGetValue((int8x8_t *)[v16 attributes], 0x1CuLL);

    if (v17)
    {
      [v17 timeIntervalSinceNow];
      *(float *)&double v18 = v18 / -86400.0;
      if (*(float *)&v18 > 30.0)
      {
LABEL_25:

LABEL_26:
        LOBYTE(v35) = 1;
        goto LABEL_27;
      }
    }
    goto LABEL_23;
  }
LABEL_24:
  LOBYTE(v35) = 0;
LABEL_27:

  return (char)v35;
}

+ (void)thresholdResultsInSection:(id)a3 userQuery:(id)a4 queryID:(int64_t)a5 isEntitiesSearch:(BOOL)a6 currentTime:(double)a7 isScopedSearch:(BOOL)a8 queryKind:(unint64_t)a9 clientBundleID:(id)a10 isSearchToolClient:(BOOL)a11
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a10;
  uint64_t v19 = [v16 resultsCount];
  uint64_t v20 = (void *)MEMORY[0x1E4F28F60];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  _DWORD v32[2] = __156__PRSRankingItemRanker_thresholdResultsInSection_userQuery_queryID_isEntitiesSearch_currentTime_isScopedSearch_queryKind_clientBundleID_isSearchToolClient___block_invoke;
  v32[3] = &unk_1E635AE50;
  id v21 = v16;
  id v33 = v21;
  BOOL v39 = a11;
  int64_t v22 = a5;
  id v23 = v17;
  BOOL v40 = a6;
  id v34 = v23;
  id v35 = v18;
  int64_t v36 = a5;
  unint64_t v37 = a9;
  double v38 = a7;
  BOOL v41 = a8;
  id v24 = v18;
  id v25 = [v20 predicateWithBlock:v32];
  [v21 filterUsingPredicate:v25];

  uint64_t v26 = [v21 resultsCount];
  uint64_t v27 = v19 - v26;
  if (v19 != v26)
  {
    int v28 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = SSRedactString(v23, 0);
      uint64_t v30 = [v21 bundleIdentifier];
      *(_DWORD *)buf = 134219010;
      int64_t v43 = v22;
      __int16 v44 = 2112;
      uint64_t v45 = v29;
      __int16 v46 = 2112;
      uint64_t v47 = v30;
      __int16 v48 = 2048;
      uint64_t v49 = v27;
      __int16 v50 = 2048;
      uint64_t v51 = v19;
      _os_log_impl(&dword_1BDB2A000, v28, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] Filtering qid: %lu, query: %@, bundleID: %@, thresholded: %ld, original count: %lu", buf, 0x34u);
    }
  }
}

uint64_t __156__PRSRankingItemRanker_thresholdResultsInSection_userQuery_queryID_isEntitiesSearch_currentTime_isScopedSearch_queryKind_clientBundleID_isSearchToolClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) bundleIdentifier];
  if ((SSPommesRankingIsEnabled(v4, *(unsigned __int8 *)(a1 + 80)) & 1) == 0)
  {

    goto LABEL_6;
  }
  id v5 = [*(id *)(a1 + 32) bundleIdentifier];
  char v6 = [v5 isEqualToString:@"com.apple.reminders"];

  if (v6)
  {
LABEL_6:
    uint64_t v9 = +[PRSRankingItemRanker shouldFilterResult:v3 currentTime:*(unsigned __int8 *)(a1 + 82) isScopedSearch:*(void *)(a1 + 48) clientBundleId:*(void *)(a1 + 64) queryKind:*(double *)(a1 + 72)] ^ 1;
    goto LABEL_7;
  }
  uint64_t v7 = [v3 rankingItem];

  if (v7)
  {
    BOOL v8 = [v3 rankingItem];
    uint64_t v9 = !SSThresholdRankedItem(v8, *(void **)(a1 + 40), *(void *)(a1 + 56), *(unsigned char *)(a1 + 81), *(void **)(a1 + 48), *(void *)(a1 + 64));
  }
  else
  {
    uint64_t v9 = 1;
  }
LABEL_7:

  return v9;
}

- (void)computePolicyFeaturesForBundleItems:(id)a3 isCJK:(BOOL)a4
{
  id v6 = a3;
  if (![(PRSRankingItemRanker *)self policyDisabled] && !self->_isCancelled)
  {
    if (computePolicyFeaturesForBundleItems_isCJK__onceToken[0] != -1) {
      dispatch_once(computePolicyFeaturesForBundleItems_isCJK__onceToken, &__block_literal_global_1013);
    }
    unint64_t queryTermCount = self->_queryTermCount;
    unint64_t v8 = [(PRSRankingItemRanker *)self queryTermLength];
    unint64_t v9 = [v6 count];
    unint64_t v10 = v9;
    if (v9 % 7) {
      size_t v11 = v9 / 7 + 1;
    }
    else {
      size_t v11 = v9 / 7;
    }
    unint64_t v12 = 6;
    uint64_t v13 = 4;
    while (v11 % computePolicyFeaturesForBundleItems_isCJK__core_count)
    {
      if (v9 % v12) {
        size_t v11 = v9 / v12 + 1;
      }
      else {
        size_t v11 = v9 / v12;
      }
      if (v12-- <= 4) {
        goto LABEL_16;
      }
    }
    uint64_t v13 = v12 + 1;
LABEL_16:
    uint64_t v15 = [v6 dictionaryRepresentation];
    id v16 = [v15 allKeys];

    id v17 = dispatch_get_global_queue(33, 0);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__PRSRankingItemRanker_computePolicyFeaturesForBundleItems_isCJK___block_invoke_2;
    v19[3] = &unk_1E635AEC8;
    uint64_t v23 = v13;
    unint64_t v24 = v10;
    id v20 = v16;
    id v21 = v6;
    int64_t v22 = self;
    unint64_t v25 = queryTermCount;
    unint64_t v26 = v8;
    BOOL v27 = a4;
    id v18 = v16;
    dispatch_apply(v11, v17, v19);
  }
}

void __66__PRSRankingItemRanker_computePolicyFeaturesForBundleItems_isCJK___block_invoke()
{
  if (get_thread_count_onceToken != -1) {
    dispatch_once(&get_thread_count_onceToken, &__block_literal_global_1005);
  }
  computePolicyFeaturesForBundleItems_isCJK__core_count = get_thread_count_batch_size;
}

void __66__PRSRankingItemRanker_computePolicyFeaturesForBundleItems_isCJK___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v178 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1C1885190]();
  uint64_t v4 = *(void *)(a1 + 56);
  unint64_t v5 = v4 * a2;
  unint64_t v6 = v5 + v4;
  if (v6 >= *(void *)(a1 + 64)) {
    unint64_t v7 = *(void *)(a1 + 64);
  }
  else {
    unint64_t v7 = v6;
  }
  long long v137 = PRSRankingQueryIndexDictionary();
  unint64_t v133 = v7;
  if (v5 >= v7) {
    goto LABEL_245;
  }
  unint64_t v8 = v5;
  unint64_t v9 = &off_1E634B000;
  do
  {
    unint64_t v132 = v8;
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
    id v136 = [v9[236] importantAttributesForBundle:v10];
    uint64_t v135 = [v136 count];
    long long v156 = (void *)v10;
    size_t v11 = [*(id *)(a1 + 40) objectForKey:v10];
    v172[0] = MEMORY[0x1E4F143A8];
    v172[1] = 3221225472;
    v172[2] = __66__PRSRankingItemRanker_computePolicyFeaturesForBundleItems_isCJK___block_invoke_3;
    v172[3] = &unk_1E635AE78;
    v172[4] = *(void *)(a1 + 48);
    int v146 = 1;
    unint64_t v12 = [v11 sortedArrayWithOptions:1 usingComparator:v172];

    if (*(void *)(a1 + 72) >= 2uLL)
    {
      long long v170 = 0u;
      long long v171 = 0u;
      long long v168 = 0u;
      long long v169 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v168 objects:v177 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v169;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v169 != v16) {
              objc_enumerationMutation(v13);
            }
            if (hasPolicyPhraseMatch(*(void **)(*((void *)&v168 + 1) + 8 * i), *(void *)(a1 + 72), *(unsigned __int8 *)(*(void *)(a1 + 48) + 44)))
            {
              int v146 = 0;
              goto LABEL_18;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v168 objects:v177 count:16];
          if (v15) {
            continue;
          }
          break;
        }
        int v146 = 1;
      }
      else
      {
        int v146 = 1;
      }
LABEL_18:

      unint64_t v9 = &off_1E634B000;
    }
    long long v139 = objc_opt_new();
    int v138 = SSStringEndsWithSpace(*(void **)(*(void *)(a1 + 48) + 64));
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    obuint64_t j = v12;
    uint64_t v143 = [obj countByEnumeratingWithState:&v164 objects:v176 count:16];
    if (!v143)
    {
      int v142 = 0;
      goto LABEL_227;
    }
    int v142 = 0;
    uint64_t v141 = *(void *)v165;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v165 != v141) {
          objc_enumerationMutation(obj);
        }
        if (*(unsigned char *)(*(void *)(a1 + 48) + 39))
        {

          goto LABEL_244;
        }
        uint64_t v152 = v18;
        uint64_t v19 = *(void **)(*((void *)&v164 + 1) + 8 * v18);
        id v20 = [v9[236] itemSpecificImportantAttributesForBundle:v156 withItem:v19];
        if (v20)
        {
          id v147 = v20;
          uint64_t v21 = [v20 count];
        }
        else
        {
          id v147 = v136;
          uint64_t v21 = v135;
        }
        memset(v175, 0, 128);
        memset(v174, 0, sizeof(v174));
        int v22 = hasPolicyPhraseMatch(v19, *(void *)(a1 + 72), *(unsigned __int8 *)(*(void *)(a1 + 48) + 44));
        unint64_t v23 = *(void *)(a1 + 72);
        int v155 = v22;
        if (v23 >= 2)
        {
          if (v22)
          {
            v175[0] = 1.0;
            v174[0] = 2079;
            [v19 setHasPolicyMultipleTermsPhraseMatch:1];
LABEL_39:
            uint64_t v29 = 1;
            goto LABEL_41;
          }
          v175[0] = 0.0;
          __int16 v28 = 2079;
LABEL_38:
          v174[0] = v28;
          goto LABEL_39;
        }
        BOOL v24 = v23 == 1;
        int v25 = v138;
        if (!v24) {
          int v25 = 0;
        }
        if (v25 == 1)
        {
          int v26 = hasPolicyPhraseMatch(v19, 1uLL, 1);
          float v27 = 0.0;
          if (v26)
          {
            objc_msgSend(v19, "setHasPolicySingleTermPhraseMatch:", 1, 0.0);
            float v27 = 1.0;
          }
          v175[0] = v27;
          __int16 v28 = 2080;
          goto LABEL_38;
        }
        uint64_t v29 = 0;
LABEL_41:
        if (*(unsigned char *)(*(void *)(a1 + 48) + 41)) {
          float v30 = 1.0;
        }
        else {
          float v30 = 0.0;
        }
        *(float *)((unint64_t)v175 | (4 * v29)) = v30;
        uint64_t v151 = v29;
        long long v145 = (_WORD *)((unint64_t)v174 | (2 * v29));
        _WORD *v145 = 2081;
        BOOL v31 = hasPolicyNearMatch(v19, *(void *)(a1 + 72));
        if (*(void *)(a1 + 72) >= 2uLL && v31) {
          [v19 setHasPolicyMultipleTermsNearMatch:1];
        }
        char v32 = [v19 didMatchRankingDescriptor:@"kMDItemTextContentTokenizedMatch"];
        if (!*(void *)(a1 + 72))
        {
          uint64_t v34 = 0;
          unint64_t v35 = 0;
LABEL_67:
          unint64_t v158 = 0;
          goto LABEL_68;
        }
        unint64_t v33 = 0;
        uint64_t v34 = 0;
        unint64_t v35 = 0;
        do
        {
          if (v21)
          {
            uint64_t v36 = 0;
            while (1)
            {
              unint64_t v37 = v33 + *(void *)(a1 + 72) * v36;
              if (((unint64_t)-[PRSRankingItem importantPropertiesPrefixMatched]((uint64_t)v19) >> v37)) {
                break;
              }
              if (v21 == ++v36) {
                goto LABEL_55;
              }
            }
            ++v35;
            v34 += ((unint64_t)~-[PRSRankingItem importantPropertiesWordMatched]((uint64_t)v19) >> v37) & 1;
          }
LABEL_55:
          ++v33;
          unint64_t v38 = *(void *)(a1 + 72);
        }
        while (v33 < v38);
        if (!v38) {
          goto LABEL_67;
        }
        unint64_t v39 = 0;
        unint64_t v158 = 0;
        do
        {
          if (v21)
          {
            uint64_t v40 = 0;
            while (1)
            {
              unint64_t v41 = v39 + *(void *)(a1 + 72) * v40;
              if (((unint64_t)-[PRSRankingItem importantPropertiesWordMatched]((uint64_t)v19) >> v41)) {
                break;
              }
              if (v21 == ++v40) {
                goto LABEL_64;
              }
            }
            ++v158;
          }
LABEL_64:
          ++v39;
        }
        while (v39 < *(void *)(a1 + 72));
LABEL_68:
        if (([v19 bundleIDType] & 0x100) != 0)
        {
          int64_t v43 = [v19 L2FeatureVector];
          [v43 scoreForFeature:1];
          float v45 = v44;

          __int16 v46 = [v19 L2FeatureVector];
          [v46 scoreForFeature:41];
          float v48 = v47;

          unint64_t v49 = *(void *)(a1 + 80);
          unint64_t v50 = +[PRSRankingItemRanker spellCorrectedAppMinQueryLen];
          BOOL v52 = v45 == 1.0 && v49 > v50;
          char v42 = v48 == 0.0 && v52;
        }
        else
        {
          char v42 = 0;
        }
        if (([v19 bundleIDType] & 0x100) != 0)
        {
          uint64_t v59 = [v19 L2FeatureVector];
          [v59 scoreForFeature:2327];
          float v61 = v60;

          long long v62 = [v19 L2FeatureVector];
          [v62 scoreForFeature:1614];
          float v64 = v63;

          long long v65 = [v19 L2FeatureVector];
          [v65 scoreForFeature:189];
          float v67 = v66;

          if (v61 == 1.0 || v64 == 0.0 && v67 != 2147500000.0 && v67 != -1.0) {
            goto LABEL_100;
          }
          if (v64 == 0.0)
          {
            if (*(void *)(a1 + 80) > 4uLL) {
              char v68 = 1;
            }
            else {
              char v68 = v42;
            }
            if (v68)
            {
LABEL_100:
              BOOL v69 = 1;
              goto LABEL_103;
            }
          }
          else if (v42)
          {
            goto LABEL_100;
          }
          if ([v19 isKeywordMatch]) {
            goto LABEL_100;
          }
        }
        else
        {
          long long v53 = [v19 sectionBundleIdentifier];
          int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v53);

          if (IsSyndicatedPhotos)
          {
            if ([v19 photosMatch]) {
              goto LABEL_100;
            }
            if ([v19 photosExactMatch]) {
              goto LABEL_100;
            }
            unint64_t v55 = *(void *)(a1 + 72);
            if (v55 >= 2 && v35 >= v55 - 1)
            {
              int v56 = [v19 L2FeatureVector];
              [v56 scoreForFeature:2843];
              float v58 = v57;

              if (v58 != 2147500000.0 && v58 != -1.0) {
                goto LABEL_100;
              }
            }
          }
        }
        if (!*(unsigned char *)(*(void *)(a1 + 48) + 32))
        {
          BOOL v157 = 0;
          goto LABEL_104;
        }
        float v70 = [v19 L2FeatureVector];
        [v70 scoreForFeature:2390];
        float v72 = v71;

        BOOL v69 = v72 == 1.0;
LABEL_103:
        BOOL v157 = v69;
LABEL_104:
        unint64_t v73 = [v19 L2FeatureVector];
        [v73 scoreForFeature:2];
        float v75 = v74;

        __int16 v76 = [v19 bundleIDType];
        id v77 = [v19 L2FeatureVector];
        [v77 scoreForFeature:2362];
        float v79 = v78;

        if ((v76 & 0x800) == 0) {
          goto LABEL_105;
        }
        if (v35) {
          char v81 = v32;
        }
        else {
          char v81 = 0;
        }
        int v154 = 1;
        if (v35 >= *(void *)(a1 + 72) || (v81 & 1) != 0) {
          goto LABEL_115;
        }
        if (v75 == 1.0 && *(void *)(a1 + 80) > 2uLL) {
LABEL_105:
        }
          BOOL v80 = 1;
        else {
          BOOL v80 = v79 == 1.0;
        }
        int v154 = v80;
LABEL_115:
        if (*(void *)(*(void *)(a1 + 48) + 216) == 2 && ([v19 bundleIDType] & 0x200) != 0) {
          unsigned int v82 = (v34 == 0) & ~[*(id *)(a1 + 48) isContentWord];
        }
        else {
          unsigned int v82 = 0;
        }
        int v83 = [v19 bundleIDType];
        __int16 v150 = v76;
        BOOL v149 = (v83 & 0x100000) == 0
            || (unint64_t v84 = *(void *)(a1 + 72), v35 >= v84)
            || v84 >= 2 && v75 == 1.0
            || hasPolicySecondaryMatch(v19, v84, *(void *)(*(void *)(a1 + 48) + 208), *(void **)(*(void *)(a1 + 48) + 72), *(unsigned char *)(*(void *)(a1 + 48) + 44), v137);
        char v85 = [v19 bundleIDType];
        BOOL v148 = (v85 & 2) == 0
            || (unint64_t v86 = *(void *)(a1 + 72), v35 >= v86)
            || v86 >= 2 && v75 == 1.0
            || hasPolicySecondaryMatch(v19, v86, *(void *)(*(void *)(a1 + 48) + 208), *(void **)(*(void *)(a1 + 48) + 72), *(unsigned char *)(*(void *)(a1 + 48) + 44), v137);
        char v87 = [v19 bundleIDType];
        BOOL v144 = (v87 & 8) == 0
            || (unint64_t v88 = *(void *)(a1 + 72), v35 >= v88)
            || v88 >= 2 && v75 == 1.0
            || hasPolicySecondaryMatch(v19, v88, *(void *)(*(void *)(a1 + 48) + 208), *(void **)(*(void *)(a1 + 48) + 72), *(unsigned char *)(*(void *)(a1 + 48) + 44), v137);
        int v89 = [*(id *)(*(void *)(a1 + 48) + 184) isEqualToString:@"com.apple.searchd"];
        if (v89
          && !-[PRSRankingItem recencyTestForVisibilityWithCurrentTime:]((uint64_t)v19, *(double *)(*(void *)(a1 + 48) + 192)))
        {
          if (([v19 bundleIDType] & 0x40000) != 0
            || ([v19 bundleIDType] & 0x2000000) != 0)
          {
            int v122 = v155;
          }
          else
          {
            int v122 = 1;
          }
          int v153 = v122;
        }
        else
        {
          int v153 = 0;
        }
        if (-[PRSRankingItem importantPropertiesPrefixMatched]((uint64_t)v19))
        {
          BOOL v90 = 1;
        }
        else if (([v19 bundleIDType] & 0x100) != 0 {
               && [*(id *)(*(void *)(a1 + 48) + 56) hasPrefix:@"en"]
        }
               && +[PRSRankingUtilities aToZInString:*(void *)(*(void *)(a1 + 48) + 64)])
        {
          int v91 = SSCompactRankingAttrsGetValue((int8x8_t *)[v19 attributes], 7uLL);
          objc_opt_class();
          BOOL v90 = (objc_opt_isKindOfClass() & 1) != 0
             && +[PRSRankingUtilities aToZInString:v91]
             && [v91 rangeOfString:*(void *)(*(void *)(a1 + 48) + 64) options:1] != 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          BOOL v90 = 0;
        }
        if (v35 == *(void *)(a1 + 72)) {
          [v19 setMatchedQueryTerms:1];
        }
        uint64_t v92 = v151 + 1;
        int v93 = v154 ^ 1;
        if ((v150 & 0x800) != 0) {
          int v94 = v154 ^ 1;
        }
        else {
          int v94 = 1;
        }
        BOOL v24 = (*(void *)&v83 & 0x100000) == 0;
        int v95 = !v149;
        int v96 = v24 || !v149;
        int v97 = v90 || v157;
        int v98 = !v148;
        if ((v85 & 2) == 0) {
          int v98 = 1;
        }
        unint64_t v99 = (unint64_t)v175 | (4 * v92);
        id v100 = (_WORD *)((unint64_t)v174 | (2 * v92));
        if (v97 != 1 && v94 && v96 && v98)
        {
          int v101 = !v144;
          if ((v87 & 8) == 0) {
            int v101 = 1;
          }
          if (((v101 | v153) & 1) == 0 && v146 | v155 && ((v82 | v93) & 1) == 0)
          {
LABEL_168:
            int v102 = 0;
            *(_DWORD *)unint64_t v99 = 1065353216;
            _WORD *v100 = 1909;
            *(float *)((unint64_t)v175 | (4 * (v151 | 2))) = (float)v35;
            *(_WORD *)((unint64_t)v174 | (2 * (v151 | 2))) = 1913;
            v175[v151 + 3] = (float)v158;
            uint64_t v103 = v151 | 4;
            *(_WORD *)((unint64_t)v174 | (2 * (v151 + 3))) = 1912;
            goto LABEL_170;
          }
        }
        else if (((v153 | (v146 | v155) ^ 1) & 1) == 0 && !(v82 | v93))
        {
          goto LABEL_168;
        }
        [v19 setShouldHideUnderShowMore:1];
        *(void *)unint64_t v99 = 0;
        *(void *)(v99 + 8) = 0;
        *(void *)id v100 = 0x777077807790775;
        *(_WORD *)((unint64_t)v174 | (2 * (v151 + 5))) = 1910;
        *(void *)&v175[v151 + 5] = 0;
        uint64_t v103 = v151 + 7;
        int v102 = 1;
        v145[6] = 1927;
        [v19 setEligibleForDemotion:1];
        v142 += v153;
LABEL_170:
        uint64_t v104 = -[PRSRankingItem importantPropertiesPrefixMatched]((uint64_t)v19);
        int v105 = v157;
        if (v104) {
          int v105 = 1;
        }
        if ((v89 & v105) == 1)
        {
          uint64_t v106 = -[PRSRankingItem recencyTestForTopHitWithCurrentTime:]((uint64_t)v19, *(double *)(*(void *)(a1 + 48) + 192));
          int v107 = v146 | v155;
          if (v106 != 1) {
            int v107 = 0;
          }
          if ((v107 & v154) == 1 && ((v82 | v95) & 1) == 0)
          {
            [v19 L2FeatureVector];
            int v108 = v102;
            v110 = unsigned int v109 = v82;
            char v111 = [v110 isSiriAction];

            unsigned int v82 = v109;
            int v102 = v108;
            if ((v111 & 1) == 0) {
              [v19 setRecentForTopHit:1];
            }
          }
        }
        uint64_t v112 = -[PRSRankingItem importantPropertiesPrefixMatched]((uint64_t)v19);
        int v113 = v157;
        if (v112) {
          int v113 = 1;
        }
        if ((v89 & v113) == 1
          && -[PRSRankingItem recencyTestForAboveThresholdTopHitWithCurrentTime:](v19, *(double *)(*(void *)(a1 + 48) + 192)) == 1)
        {
          if (v146 | v155)
          {
            if (((v82 | v95) & 1) == 0)
            {
              id v114 = [v19 L2FeatureVector];
              char v115 = [v114 isSiriAction];

              if ((v115 & 1) == 0) {
                [v19 setRecentForAboveThresholdTopHit:1];
              }
            }
          }
        }
        if (v102)
        {
          id v116 = [v19 L2FeatureVector];
          [v116 setScores:v175 forFeatures:v174 count:v103];
          unint64_t v9 = &off_1E634B000;
        }
        else
        {
          unint64_t v9 = &off_1E634B000;
          if (![v156 hasPrefix:@"com.apple."]
            || ([v156 isEqualToString:@"com.apple.Preferences"] & 1) != 0
            || (int v117 = [v156 isEqualToString:@"com.apple.CoreSuggestions"], v118 = 1.0, v117))
          {
            float v118 = -1.0;
          }
          v175[v103] = v118;
          v174[v103] = 1927;
          float v119 = -1.0;
          if ([v156 hasPrefix:@"com.apple."]
            && ([v156 isEqualToString:@"com.apple.Preferences"] & 1) == 0)
          {
            if ([v156 isEqualToString:@"com.apple.CoreSuggestions"]) {
              float v119 = -1.0;
            }
            else {
              float v119 = (float)v35;
            }
          }
          v175[v103 + 1] = v119;
          v174[v103 + 1] = 1911;
          if (v35 == *(void *)(a1 + 72))
          {
            [v139 addObject:v19];
          }
          else
          {
            if (*(unsigned char *)(a1 + 88)) {
              char v120 = 1;
            }
            else {
              char v120 = v157;
            }
            if ((v120 & 1) == 0) {
              [v19 setEligibleForDemotion:1];
            }
          }
          float v121 = -1.0;
          if ([v156 hasPrefix:@"com.apple."]
            && ([v156 isEqualToString:@"com.apple.Preferences"] & 1) == 0)
          {
            if ([v156 isEqualToString:@"com.apple.CoreSuggestions"]) {
              float v121 = -1.0;
            }
            else {
              float v121 = (float)v158;
            }
          }
          v175[v103 + 2] = v121;
          v174[v103 + 2] = 1910;
          id v116 = [v19 L2FeatureVector];
          [v116 setScores:v175 forFeatures:v174 count:v103 + 3];
        }

        uint64_t v18 = v152 + 1;
      }
      while (v152 + 1 != v143);
      uint64_t v123 = [obj countByEnumeratingWithState:&v164 objects:v176 count:16];
      uint64_t v143 = v123;
    }
    while (v123);
LABEL_227:

    if ([obj count] == v142)
    {
      long long v162 = 0u;
      long long v163 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      id v124 = obj;
      uint64_t v125 = [v124 countByEnumeratingWithState:&v160 objects:v173 count:16];
      if (v125)
      {
        uint64_t v126 = v125;
        uint64_t v127 = *(void *)v161;
        do
        {
          for (uint64_t j = 0; j != v126; ++j)
          {
            if (*(void *)v161 != v127) {
              objc_enumerationMutation(v124);
            }
            uint64_t v129 = *(void **)(*((void *)&v160 + 1) + 8 * j);
            if (-[PRSRankingItem importantPropertiesPrefixMatched]((uint64_t)v129)) {
              [v129 setEligibleForDemotion:0];
            }
          }
          uint64_t v126 = [v124 countByEnumeratingWithState:&v160 objects:v173 count:16];
        }
        while (v126);
      }

      unint64_t v9 = &off_1E634B000;
    }
    if (*(unsigned char *)(*(void *)(a1 + 48) + 39))
    {
LABEL_244:

      break;
    }
    if ([v139 count])
    {
      __int16 v130 = objc_opt_new();
      v159[0] = MEMORY[0x1E4F143A8];
      v159[1] = 3221225472;
      v159[2] = __66__PRSRankingItemRanker_computePolicyFeaturesForBundleItems_isCJK___block_invoke_4;
      v159[3] = &unk_1E635AEA0;
      v159[4] = *(void *)(a1 + 48);
      [v130 setComparator:v159];
      char v131 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
      [v130 setPredicate:v131];

      [v130 setAbsRankFeature:1907];
      [v130 setRelRankFeature:1908];
      [*(id *)(a1 + 48) computeRelativeFeatureForContext:v130 items:v139];
    }
    unint64_t v8 = v132 + 1;
  }
  while (v132 + 1 != v133);
LABEL_245:
}

uint64_t __66__PRSRankingItemRanker_computePolicyFeaturesForBundleItems_isCJK___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(void *)(a1 + 32) + 192));
}

uint64_t __66__PRSRankingItemRanker_computePolicyFeaturesForBundleItems_isCJK___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return -[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(void *)(a1 + 32) + 192));
}

- (void)rerankItemsWithPolicyForBundleItems:(id)a3 isCJK:(BOOL)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(PRSRankingItemRanker *)self policyDisabled] && !self->_isCancelled)
  {
    if (rerankItemsWithPolicyForBundleItems_isCJK__onceToken != -1) {
      dispatch_once(&rerankItemsWithPolicyForBundleItems_isCJK__onceToken, &__block_literal_global_1020);
    }
    unint64_t v6 = [v5 count];
    unint64_t v7 = v6;
    if (v6 % 7) {
      size_t v8 = v6 / 7 + 1;
    }
    else {
      size_t v8 = v6 / 7;
    }
    unint64_t v9 = 6;
    uint64_t v10 = 4;
    while (v8 % rerankItemsWithPolicyForBundleItems_isCJK__core_count)
    {
      if (v6 % v9) {
        size_t v8 = v6 / v9 + 1;
      }
      else {
        size_t v8 = v6 / v9;
      }
      if (v9-- <= 4) {
        goto LABEL_16;
      }
    }
    uint64_t v10 = v9 + 1;
LABEL_16:
    unint64_t v12 = [v5 dictionaryRepresentation];
    id v13 = [v12 allKeys];

    uint64_t v14 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_2;
    block[3] = &unk_1E635AF18;
    uint64_t v40 = v10;
    unint64_t v41 = v7;
    block[4] = self;
    id v15 = v13;
    id v38 = v15;
    id v16 = v5;
    id v39 = v16;
    dispatch_apply(v8, v14, block);

    if (!self->_isCancelled)
    {
      id v31 = v15;
      id v32 = v5;
      float v30 = v16;
      id v17 = [v16 objectForKey:@"com.apple.MobileAddressBook"];
      uint64_t v18 = (void *)[v17 mutableCopy];

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v19 = (void *)[v18 copy];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v19);
            }
            BOOL v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            int v25 = [v24 identifier];
            int v26 = [(PRSRankingItemRanker *)self meContactIdentifier];
            int v27 = [v25 isEqualToString:v26];

            if (v27)
            {
              LODWORD(v28) = -8388609;
              [v24 setScore:v28];
              LODWORD(v29) = -8388609;
              [v24 setWithinBundleScore:v29];
              [v18 removeObject:v24];
              [v18 addObject:v24];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v42 count:16];
        }
        while (v21);
      }

      [v30 setObject:v18 forKey:@"com.apple.MobileAddressBook"];
      id v15 = v31;
      id v5 = v32;
    }
  }
}

void __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke()
{
  if (get_thread_count_onceToken != -1) {
    dispatch_once(&get_thread_count_onceToken, &__block_literal_global_1005);
  }
  rerankItemsWithPolicyForBundleItems_isCJK__core_count = get_thread_count_batch_size;
}

void __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = MEMORY[0x1F4188790](a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v10 = v9;
  size_t v11 = (id *)v8;
  v468[16] = *MEMORY[0x1E4F143B8];
  unint64_t v12 = (void *)MEMORY[0x1C1885190]();
  v309 = v11;
  uint64_t v14 = v11 + 4;
  id v13 = v11[4];
  id v15 = v11[7];
  unint64_t v16 = (void)v15 * v10;
  unint64_t v17 = (unint64_t)v15 + (void)v15 * v10;
  if (v17 >= (unint64_t)v11[8]) {
    id v18 = v11[8];
  }
  else {
    id v18 = (id)v17;
  }
  uint64_t v19 = v13[27];
  unint64_t v331 = [v13 queryTermLength];
  int v20 = SSStringEndsWithSpace(*((void **)*v14 + 8));
  int v21 = *((unsigned __int8 *)*v14 + 44);
  BOOL v307 = SSEnableSpotlightTopHitPersonalizedRanking();
  int v332 = v20;
  if (*((void *)*v14 + 25) == 1) {
    int v22 = v20;
  }
  else {
    int v22 = 0;
  }
  BOOL v103 = v21 == 0;
  uint64_t v23 = v16;
  if (!v103) {
    int v22 = 1;
  }
  int v339 = v22;
  uint64_t v24 = PRSRankingQueryIndexDictionary();
  int v25 = (void *)v24;
  id v305 = v18;
  if (v16 >= (unint64_t)v18) {
    goto LABEL_383;
  }
  unint64_t v347 = v19 - 5;
  uint64_t v26 = 3221225472;
  float v27 = -10000.0;
  float v28 = -5000.0;
  v346 = (void *)v24;
  v349 = v14;
  v294 = v12;
  do
  {
    double v29 = [v309[5] objectAtIndexedSubscript:v23];
    if (SSPommesRankingIsEnabled(v29, [v309[4] isSearchToolClient]) & v307) {
      goto LABEL_378;
    }
    uint64_t v295 = v23;
    float v30 = [v309[6] objectForKey:v29];
    v410[0] = MEMORY[0x1E4F143A8];
    v410[1] = v26;
    v410[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_3;
    v410[3] = &unk_1E635AE78;
    v410[4] = v309[4];
    id v31 = [v30 sortedArrayWithOptions:1 usingComparator:v410];

    int v321 = 0;
    v310 = v29;
    BOOL matched = SSDemoteNonExactMatchBundle();
    if (matched && v347 <= 3)
    {
      if (!*((void *)*v14 + 25))
      {
        int v321 = 0;
LABEL_31:
        long long v405 = 0u;
        long long v404 = 0u;
        long long v403 = 0u;
        long long v402 = 0u;
        id v38 = v31;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v402 objects:v467 count:16];
        if (!v39) {
          goto LABEL_58;
        }
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v403;
        while (2)
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v403 != v41) {
              objc_enumerationMutation(v38);
            }
            uint64_t v43 = *(void **)(*((void *)&v402 + 1) + 8 * i);
            int v44 = hasPolicyPhraseMatch(v43, *((void *)*v14 + 25), 1);
            int v45 = v44;
            if (*((unsigned char *)*v14 + 44))
            {
              if (v44) {
                goto LABEL_60;
              }
            }
            else if (hasPolicyPhraseMatch(v43, *((void *)*v14 + 25), 0))
            {
LABEL_60:
              int v329 = v45;
              BOOL v342 = 0;
              BOOL v55 = 1;
              goto LABEL_62;
            }
          }
          int v329 = v45;
          uint64_t v40 = [v38 countByEnumeratingWithState:&v402 objects:v467 count:16];
          if (v40) {
            continue;
          }
          break;
        }
        BOOL v342 = 0;
        goto LABEL_59;
      }
      long long v409 = 0u;
      long long v408 = 0u;
      long long v407 = 0u;
      long long v406 = 0u;
      id v32 = v31;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v406 objects:v468 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v407;
        while (2)
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v407 != v35) {
              objc_enumerationMutation(v32);
            }
            unint64_t v37 = *(void **)(*((void *)&v406 + 1) + 8 * j);
            if (([v37 shouldHideUnderShowMore] & 1) == 0
              && (hasPolicyPhraseMatch(v37, *((void *)*v14 + 25), 1) & 1) != 0)
            {
              int v321 = 0;
              goto LABEL_27;
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v406 objects:v468 count:16];
          if (v34) {
            continue;
          }
          break;
        }
        int v321 = 1;
LABEL_27:
        double v29 = v310;
      }
      else
      {
        int v321 = 1;
      }
    }
    if (v347 <= 3) {
      goto LABEL_31;
    }
    long long v401 = 0u;
    long long v400 = 0u;
    long long v399 = 0u;
    long long v398 = 0u;
    id v46 = v31;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v398 objects:v466 count:16];
    if (!v47)
    {
      BOOL v342 = 0;
      int v329 = 0;
      BOOL v326 = 0;
      goto LABEL_64;
    }
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v399;
    while (2)
    {
      for (uint64_t k = 0; k != v48; ++k)
      {
        if (*(void *)v399 != v49) {
          objc_enumerationMutation(v46);
        }
        unint64_t v51 = *((void *)*v14 + 25);
        BOOL v342 = v51 < 2;
        if (v51 >= 2)
        {
          int v54 = *((unsigned __int8 *)*v14 + 44);
          unint64_t v53 = *((void *)*v14 + 25);
        }
        else
        {
          if (v51 == 1) {
            int v52 = v332;
          }
          else {
            int v52 = 0;
          }
          if (v52 != 1) {
            continue;
          }
          unint64_t v53 = 1;
          int v54 = 1;
        }
        if (hasPolicyPhraseMatch(*(void **)(*((void *)&v398 + 1) + 8 * k), v53, v54))
        {
          int v329 = 0;
          BOOL v55 = v51 > 1;
LABEL_62:
          BOOL v326 = v55;
          goto LABEL_63;
        }
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v398 objects:v466 count:16];
      if (v48) {
        continue;
      }
      break;
    }
LABEL_58:
    BOOL v342 = 0;
    int v329 = 0;
LABEL_59:
    BOOL v326 = 0;
LABEL_63:
    double v29 = v310;
LABEL_64:

    v333 = objc_opt_new();
    v348 = objc_opt_new();
    BOOL v334 = ([v29 isEqualToString:@"com.apple.mobilenotes"] & 1) != 0
        || ([v29 isEqualToString:@"com.apple.MobileSMS"] & 1) != 0
        || [v29 isEqualToString:@"com.apple.mobilemail"];
    long long v397 = 0u;
    long long v396 = 0u;
    long long v395 = 0u;
    long long v394 = 0u;
    obuint64_t j = v31;
    uint64_t v340 = [obj countByEnumeratingWithState:&v394 objects:v465 count:16];
    if (v340)
    {
      v302 = 0;
      v303 = 0;
      v304 = 0;
      v306 = 0;
      int v324 = 0;
      int v350 = 0;
      uint64_t v337 = *(void *)v395;
      float v56 = -3.4028e38;
      float v57 = -3.4028e38;
      float v58 = v348;
      while (2)
      {
        uint64_t v59 = 0;
LABEL_71:
        if (*(void *)v395 != v337) {
          objc_enumerationMutation(obj);
        }
        if (*((unsigned char *)*v14 + 39))
        {
          v288 = obj;

          unint64_t v12 = v294;
          double v29 = v310;
          goto LABEL_382;
        }
        float v60 = *(void **)(*((void *)&v394 + 1) + 8 * v59);
        [v60 score];
        if (v61 >= v57) {
          float v57 = v61;
        }
        [v60 withinBundleScore];
        if (v62 >= v56) {
          float v56 = v62;
        }
        if (([v60 bundleIDType] & 0x100) != 0)
        {
          long long v65 = [v60 L2FeatureVector];
          [v65 scoreForFeature:2327];
          float v67 = v66;

          BOOL v63 = v67 == 1.0;
          char v68 = [v60 L2FeatureVector];
          [v68 scoreForFeature:1];
          float v70 = v69;

          float v71 = [v60 L2FeatureVector];
          [v71 scoreForFeature:41];
          float v73 = v72;

          unint64_t v74 = +[PRSRankingItemRanker spellCorrectedAppMinQueryLen];
          BOOL v76 = v70 == 1.0 && v331 > v74;
          if (v73 != 0.0) {
            BOOL v76 = 0;
          }
          BOOL v344 = v76;
          id v77 = [v60 L2FeatureVector];
          [v77 scoreForFeature:2328];
          float v79 = v78;

          BOOL v64 = v79 == 1.0;
        }
        else
        {
          BOOL v63 = 0;
          BOOL v344 = 0;
          BOOL v64 = 0;
        }
        unint64_t v80 = *((void *)*v14 + 25);
        if (v347 > 3)
        {
          int v83 = hasPolicyPhraseMatch(v60, v80, v339);
          int v82 = 0;
        }
        else
        {
          int v81 = hasPolicyPhraseMatch(v60, v80, 1);
          int v82 = v81;
          if (*((unsigned char *)*v14 + 44)) {
            int v83 = v81;
          }
          else {
            int v83 = hasPolicyPhraseMatch(v60, *((void *)*v14 + 25), 0);
          }
        }
        unint64_t v84 = [v60 L2FeatureVector];
        [v84 scoreForFeature:2390];
        float v86 = v85;

        BOOL v87 = v86 == 1.0;
        BOOL v88 = v334
           && hasPolicySecondaryMatch(v60, *((void *)*v349 + 25), *((void *)*v349 + 26), *((void **)*v349 + 9), v339, v346);
        uint64_t v89 = [v60 L2FeatureVector];
        [(id)v89 scoreForFeature:2];
        float v91 = v90;

        LOWORD(v89) = [v60 bundleIDType];
        uint64_t v92 = [v60 L2FeatureVector];
        [v92 scoreForFeature:2362];
        float v94 = v93;

        if ((v89 & 0x800) != 0 && ([v60 shouldHideUnderShowMore] & 1) == 0)
        {
          if (*((void *)*v349 + 25) && v91 == 1.0 && v331 > 2)
          {
            int v95 = 1;
          }
          else
          {
            BOOL v103 = v94 == 1.0 && *((unsigned char *)*v349 + 44) == 0;
            int v95 = v103;
          }
        }
        else
        {
          int v95 = 0;
        }
        v350 |= v87;
        int v96 = [v60 L2FeatureVector];
        [v96 scoreForFeature:1927];
        float v98 = v97;

        int v99 = [v60 matchedQueryTerms];
        if (v98 == 1.0) {
          int v100 = v99;
        }
        else {
          int v100 = 0;
        }
        if ([v60 isNotExecutable])
        {
          [v348 addObject:v60];
          int v25 = v346;
          goto LABEL_105;
        }
        if (![v60 matchedQueryTerms]
          || v98 != 1.0
          && ([v60 bundleIDType] & 0x100000) == 0
          && ([v60 bundleIDType] & 8) == 0
          && ([v60 bundleIDType] & 2) == 0)
        {
          goto LABEL_122;
        }
        if (([v60 bundleIDType] & 0x40000) != 0 || (objc_msgSend(v60, "bundleIDType") & 0x2000000) != 0)
        {
          int v101 = v329;
          if (*((void *)*v349 + 25) != 1) {
            int v101 = 1;
          }
          if (((v342 || v326) | v101)) {
            goto LABEL_122;
          }
          goto LABEL_139;
        }
        if (!(v342 | v329 | v326)) {
          goto LABEL_139;
        }
LABEL_122:
        if (v329 & v82 & v83) == 1 || !(v329 | !v326 | v83 ^ 1) || ((v342 & v83 | v64 | v88 | v350))
        {
LABEL_139:
          [v333 addObject:v60];
          if (v350)
          {
            int v25 = v346;
            uint64_t v14 = v349;
            if ([v60 shouldHideUnderShowMore]) {
              [v60 setShouldHideUnderShowMore:0];
            }
            if ([v60 shouldHideUnderShowMoreIfNotTophit]) {
              [v60 setShouldHideUnderShowMoreIfNotTophit:0];
            }
            int v104 = v324;
            if ((v324 & 1) == 0) {
              int v104 = 1;
            }
            int v324 = v104;
          }
          else
          {
            int v25 = v346;
            uint64_t v14 = v349;
          }
          if (*((unsigned char *)*v14 + 34))
          {
            if ([v60 shouldHideUnderShowMore]) {
              [v60 setShouldHideUnderShowMore:0];
            }
            if ([v60 shouldHideUnderShowMoreIfNotTophit]) {
              [v60 setShouldHideUnderShowMoreIfNotTophit:0];
            }
          }
        }
        else
        {
          if (*((unsigned char *)*v349 + 34))
          {
            if (([v60 bundleIDType] & 0x100000) == 0
              && !(((unint64_t)[v60 bundleIDType] >> 3) & 1 | v95 & 1))
            {
              goto LABEL_128;
            }
            goto LABEL_139;
          }
          if (v95) {
            goto LABEL_139;
          }
LABEL_128:
          if ((v100 & v329 ^ 1 | v82 | v83 ^ 1))
          {
            int v25 = v346;
            if ((!v326 | v83 | v100 ^ 1))
            {
              uint64_t v14 = v349;
              if (([v60 bundleIDType] & 0x100) == 0) {
                goto LABEL_131;
              }
              if (v63)
              {
                int v102 = v303;
                if (!v303) {
                  int v102 = objc_opt_new();
                }
                v303 = v102;
              }
              else if (v344)
              {
                int v102 = v302;
                if (!v302) {
                  int v102 = objc_opt_new();
                }
                v302 = v102;
              }
              else
              {
LABEL_131:
                int v102 = v348;
              }
            }
            else
            {
              uint64_t v14 = v349;
              int v102 = v304;
              if (!v304) {
                int v102 = objc_opt_new();
              }
              v304 = v102;
            }
            [v102 addObject:v60];
          }
          else
          {
            int v25 = v346;
            float v121 = v306;
            if (!v306) {
              float v121 = objc_opt_new();
            }
            v306 = v121;
            [v121 addObject:v60];
LABEL_105:
            uint64_t v14 = v349;
          }
        }
        unint64_t v105 = [v60 bundleIDType] & 0x100;
        if (v105) {
          char v106 = v63;
        }
        else {
          char v106 = 1;
        }
        if (v106)
        {
          unint64_t v107 = v105 >> 8;
        }
        else
        {
          int v108 = [v60 firstMatchedAltName];
          if (v108) {
            LODWORD(v107) = 1;
          }
          else {
            LODWORD(v107) = v344;
          }
        }
        float v58 = v348;
        unint64_t v109 = *((void *)*v14 + 25);
        if (matched && v347 <= 3)
        {
          if (v109)
          {
            if (v321)
            {
              if ((v95 & 1) == 0)
              {
                [v60 setIsBundleDemotedForBullseyeCommittedSearch:1];
                id v110 = [v60 L2FeatureVector];
                [v110 originalL2Score];
                *(float *)&double v112 = v111 + v27;
                [v110 setOriginalL2Score:v112];

                goto LABEL_180;
              }
            }
            else if ((v82 & 1) == 0)
            {
LABEL_180:
              [v60 setShouldHideUnderShowMoreIfNotTophit:1];
            }
          }
        }
        else
        {
          if (v109 >= 2)
          {
            int v113 = v326;
            if (!*((unsigned char *)*v14 + 41)) {
              int v113 = 1;
            }
            if (((v113 | v107) & 1) == 0
              && !(((unint64_t)[v60 bundleIDType] >> 2) & 1 | v95 & 1))
            {
              id v114 = [v60 L2FeatureVector];
              [v114 originalL2Score];
              *(float *)&double v116 = v115 + v27;
              [v114 setOriginalL2Score:v116];
            }
          }
          if (*((void *)*v14 + 25) == 1)
          {
            int v117 = v342;
            if (!*((unsigned char *)*v14 + 42)) {
              int v117 = 1;
            }
            if (((v117 | v107) & 1) == 0)
            {
              float v118 = [v60 L2FeatureVector];
              [v118 originalL2Score];
              *(float *)&double v120 = v119 + v27;
              [v118 setOriginalL2Score:v120];
            }
          }
        }
        if (v340 == ++v59)
        {
          uint64_t v122 = [obj countByEnumeratingWithState:&v394 objects:v465 count:16];
          uint64_t v340 = v122;
          if (!v122)
          {
            int v123 = v324 & 1;
            unint64_t v12 = v294;
            double v29 = v310;
            goto LABEL_201;
          }
          continue;
        }
        goto LABEL_71;
      }
    }
    v302 = 0;
    v303 = 0;
    v304 = 0;
    v306 = 0;
    int v123 = 0;
    float v56 = -3.4028e38;
    float v57 = -3.4028e38;
    float v58 = v348;
LABEL_201:

    if (*((unsigned char *)*v14 + 39))
    {
      v288 = obj;
LABEL_382:

      break;
    }
    float v293 = v27;
    if (![v333 count]) {
      goto LABEL_338;
    }
    if (([v29 isEqualToString:@"com.apple.mobilenotes"] & 1) == 0
      && ([v29 isEqualToString:@"com.apple.MobileSMS"] & 1) == 0
      && ([v29 isEqualToString:@"com.apple.mobilemail"] & 1) == 0)
    {
      id v124 = *v14;
      if ((!v123 || !v124[32]) && !v124[34])
      {
        v357[0] = MEMORY[0x1E4F143A8];
        v357[1] = v26;
        v357[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_7;
        v357[3] = &unk_1E635AE78;
        v357[4] = v124;
        [v333 sortWithOptions:17 usingComparator:v357];
        goto LABEL_331;
      }
    }
    uint64_t v125 = [v25 objectForKey:@"kMDItemShortcutWithinBagParamValue"];
    uint64_t v126 = [v125 integerValue];

    uint64_t v127 = [v25 objectForKey:@"PRSPolicyFieldsPrefixMatch"];
    uint64_t v128 = [v127 integerValue];

    uint64_t v129 = [v25 objectForKey:@"PRSRankingTCNearMatch"];
    uint64_t v130 = [v129 integerValue];

    char v131 = *v14;
    if (v123 && v131[32])
    {
      v392[0] = MEMORY[0x1E4F143A8];
      v392[1] = v26;
      v392[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_4;
      v392[3] = &unk_1E635AEF0;
      char v393 = 1;
      v392[4] = v131;
      v392[5] = v126;
      v392[6] = v128;
      v392[7] = v130;
      unint64_t v132 = v392;
      unint64_t v133 = v333;
      goto LABEL_329;
    }
    if (!v131[34])
    {
      uint64_t v134 = [v333 count];
      v351 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v134];
      uint64_t v308 = v134;
      v343 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v134];
      long long v386 = 0u;
      long long v387 = 0u;
      long long v388 = 0u;
      long long v389 = 0u;
      id v345 = v333;
      uint64_t v135 = [v345 countByEnumeratingWithState:&v386 objects:v464 count:16];
      if (v135)
      {
        uint64_t v136 = v135;
        uint64_t v137 = *(void *)v387;
        do
        {
          for (uint64_t m = 0; m != v136; ++m)
          {
            if (*(void *)v387 != v137) {
              objc_enumerationMutation(v345);
            }
            long long v139 = *(void **)(*((void *)&v386 + 1) + 8 * m);
            if (isLowerScore(v139, *((void *)*v14 + 25), *((void *)*v14 + 26), *((void **)*v14 + 9), v25))
            {
              [v351 addObject:v139];
            }
            else
            {
              [v343 addObject:v139];
              bzero(&v438[4], 0x3288uLL);
              bzero((char *)&v411 + 2, 0x1944uLL);
              LOWORD(v411) = 2427;
              *(_DWORD *)v438 = 1065353216;
              long long v140 = [v139 L2FeatureVector];
              [v140 setScores:v438 forFeatures:&v411 count:1];
            }
          }
          uint64_t v136 = [v345 countByEnumeratingWithState:&v386 objects:v464 count:16];
        }
        while (v136);
      }

      uint64_t v141 = [v351 count];
      v317 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      int v142 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v341 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      uint64_t v143 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v338 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v330 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v336 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v327 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v325 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v323 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v320 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v322 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v319 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v318 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v316 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v315 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v314 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v313 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v312 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v311 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v301 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v300 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v299 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v298 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v297 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v296 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v291 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v290 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      v289 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v141];
      BOOL v144 = objc_opt_new();
      v292 = v144;
      if (!v141)
      {
LABEL_297:
        [v351 removeObjectsAtIndexes:v144];
        *(void *)v438 = 0;
        unint64_t v411 = 0;
        unint64_t v385 = 0;
        unint64_t v384 = 0;
        unint64_t v383 = 0;
        unint64_t v382 = 0;
        unint64_t v381 = 0;
        unint64_t v380 = 0;
        unint64_t v379 = 0;
        unint64_t v378 = 0;
        unint64_t v377 = 0;
        unint64_t v376 = 0;
        unint64_t v375 = 0;
        unint64_t v374 = 0;
        unint64_t v373 = 0;
        unint64_t v372 = 0;
        unint64_t v371 = 0;
        unint64_t v370 = 0;
        unint64_t v369 = 0;
        unint64_t v368 = 0;
        unint64_t v367 = 0;
        unint64_t v366 = 0;
        unint64_t v365 = 0;
        unint64_t v364 = 0;
        unint64_t v363 = 0;
        unint64_t v362 = 0;
        unint64_t v361 = 0;
        unint64_t v360 = 0;
        unint64_t v359 = 0;
        unint64_t v358 = 0;
        id v162 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v163 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v308];
        long long v164 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v308];
        uint64_t v165 = 0;
        char v166 = 1;
        do
        {
          char v167 = v166;
          uint64_t v168 = sDockApps_block_invoke_3_sRecencyFeatureList1[v165];
          uint64_t v169 = sDockApps_block_invoke_3_sPeriodList1[v165];
          updateBatch(v317, (unint64_t *)v438, v168, v169, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v142, &v411, v168, v169, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v341, &v385, v168, v169, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v338, &v383, v168, v169, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v336, &v381, v168, v169, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v143, &v384, v168, v169, v164, v162, v163, *((double *)*v349 + 24));
          if ((v332 & 1) == 0 && !*((unsigned char *)*v349 + 44))
          {
            updateBatch(v323, &v378, v168, v169, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v322, &v376, v168, v169, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v320, &v377, v168, v169, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v319, &v375, v168, v169, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v318, &v374, v168, v169, v164, v162, v163, *((double *)*v349 + 24));
          }
          char v166 = 0;
          uint64_t v165 = 1;
        }
        while ((v167 & 1) != 0);
        uint64_t v170 = 0;
        char v171 = 1;
        do
        {
          char v172 = v171;
          uint64_t v173 = sDockApps_block_invoke_3_sRecencyFeatureList2[v170];
          uint64_t v174 = sDockApps_block_invoke_3_sPeriodList2[v170];
          updateBatch(v317, (unint64_t *)v438, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v142, &v411, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v341, &v385, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v338, &v383, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v336, &v381, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v143, &v384, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
          double v175 = (double *)*v349;
          if (v332)
          {
            __int16 v176 = v330;
          }
          else
          {
            __int16 v176 = v330;
            if (!*((unsigned char *)v175 + 44))
            {
              updateBatch(v323, &v378, v173, v174, v164, v162, v163, v175[24]);
              updateBatch(v322, &v376, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
              updateBatch(v320, &v377, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
              updateBatch(v319, &v375, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
              updateBatch(v318, &v374, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
              __int16 v176 = v330;
              double v175 = (double *)*v349;
            }
          }
          updateBatch(v176, &v382, v173, v174, v164, v162, v163, v175[24]);
          updateBatch(v327, &v380, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v325, &v379, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
          if ((v332 & 1) == 0 && !*((unsigned char *)*v349 + 44))
          {
            updateBatch(v316, &v373, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v315, &v372, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v314, &v371, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v313, &v370, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v312, &v369, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v311, &v368, v173, v174, v164, v162, v163, *((double *)*v349 + 24));
          }
          char v171 = 0;
          uint64_t v170 = 1;
        }
        while ((v172 & 1) != 0);
        uint64_t v177 = 0;
        char v178 = 1;
        do
        {
          char v179 = v178;
          uint64_t v180 = sDockApps_block_invoke_3_sPeriodList3[v177];
          updateBatch(v317, (unint64_t *)v438, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v142, &v411, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v341, &v385, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v338, &v383, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v336, &v381, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v143, &v384, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
          int v181 = (double *)*v349;
          if (v332)
          {
            __int16 v182 = v330;
          }
          else
          {
            __int16 v182 = v330;
            if (!*((unsigned char *)v181 + 44))
            {
              updateBatch(v323, &v378, 0, v180, v164, v162, v163, v181[24]);
              updateBatch(v320, &v377, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
              updateBatch(v322, &v376, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
              updateBatch(v319, &v375, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
              updateBatch(v318, &v374, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
              __int16 v182 = v330;
              int v181 = (double *)*v349;
            }
          }
          updateBatch(v182, &v382, 0, v180, v164, v162, v163, v181[24]);
          updateBatch(v327, &v380, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v325, &v379, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
          if ((v332 & 1) == 0 && !*((unsigned char *)*v349 + 44))
          {
            updateBatch(v316, &v373, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v315, &v372, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v314, &v371, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v313, &v370, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v312, &v369, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v311, &v368, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v291, &v361, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v299, &v365, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v298, &v364, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v297, &v363, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v290, &v360, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v289, &v359, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v301, &v367, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v300, &v366, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
            updateBatch(v296, &v362, 0, v180, v164, v162, v163, *((double *)*v349 + 24));
          }
          char v178 = 0;
          uint64_t v177 = 1;
        }
        while ((v179 & 1) != 0);
        uint64_t v183 = 0;
        char v184 = 1;
        do
        {
          char v185 = v184;
          uint64_t v186 = sDockApps_block_invoke_3_sRecencyFeatureList1[v183];
          uint64_t v187 = sDockApps_block_invoke_3_sPeriodList1[v183];
          updateBatch(v317, (unint64_t *)v438, v186, v187, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v142, &v411, v186, v187, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v341, &v385, v186, v187, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v338, &v383, v186, v187, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v336, &v381, v186, v187, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v143, &v384, v186, v187, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v323, &v378, v186, v187, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v322, &v376, v186, v187, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v320, &v377, v186, v187, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v319, &v375, v186, v187, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v318, &v374, v186, v187, v164, v162, v163, *((double *)*v349 + 24));
          char v184 = 0;
          uint64_t v183 = 1;
        }
        while ((v185 & 1) != 0);
        uint64_t v188 = 0;
        char v189 = 1;
        do
        {
          char v190 = v189;
          uint64_t v191 = sDockApps_block_invoke_3_sRecencyFeatureList2[v188];
          uint64_t v192 = sDockApps_block_invoke_3_sPeriodList2[v188];
          updateBatch(v317, (unint64_t *)v438, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v142, &v411, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v341, &v385, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v338, &v383, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v336, &v381, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v143, &v384, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v323, &v378, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v322, &v376, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v320, &v377, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v319, &v375, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v318, &v374, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v330, &v382, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v327, &v380, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v325, &v379, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v316, &v373, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v315, &v372, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v314, &v371, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v313, &v370, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v312, &v369, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v311, &v368, v191, v192, v164, v162, v163, *((double *)*v349 + 24));
          char v189 = 0;
          uint64_t v188 = 1;
        }
        while ((v190 & 1) != 0);
        uint64_t v193 = 0;
        char v194 = 1;
        do
        {
          char v195 = v194;
          uint64_t v196 = sDockApps_block_invoke_3_sPeriodList3[v193];
          updateBatch(v317, (unint64_t *)v438, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v142, &v411, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v341, &v385, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v338, &v383, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v336, &v381, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v143, &v384, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v323, &v378, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v320, &v377, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v322, &v376, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v319, &v375, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v318, &v374, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v330, &v382, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v327, &v380, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v325, &v379, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v316, &v373, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v315, &v372, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v314, &v371, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v313, &v370, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v312, &v369, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v311, &v368, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v291, &v361, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v299, &v365, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v298, &v364, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v297, &v363, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v290, &v360, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v289, &v359, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v301, &v367, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v300, &v366, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          updateBatch(v296, &v362, 0, v196, v164, v162, v163, *((double *)*v349 + 24));
          char v194 = 0;
          uint64_t v193 = 1;
        }
        while ((v195 & 1) != 0);
        updateBatch(v351, &v358, 0, 0, v164, v162, v163, *((double *)*v349 + 24));
        [v164 addObjectsFromArray:v343];
        [v164 addObjectsFromArray:v163];
        id v197 = v164;

        v333 = v197;
        unint64_t v12 = v294;
        int v25 = v346;
        uint64_t v14 = v349;
        double v29 = v310;
        goto LABEL_330;
      }
      uint64_t v145 = 0;
      while (2)
      {
        int v146 = [v351 objectAtIndex:v145];
        bzero(&v438[4], 0x3288uLL);
        bzero((char *)&v411 + 2, 0x1944uLL);
        LOWORD(v411) = 2428;
        *(_DWORD *)v438 = 0;
        if (isUpper1_0(v146, v147, v25))
        {
          [v317 addObject:v146];
          [v144 addIndex:v145];
          WORD1(v411) = 2397;
          *(_DWORD *)&v438[4] = 1065353216;
          BOOL v148 = [v146 L2FeatureVector];
          BOOL v149 = v148;
          uint64_t v150 = 2;
          goto LABEL_237;
        }
        WORD1(v411) = 2397;
        *(_DWORD *)&v438[4] = 0;
        if (isUpper1(v146, *((void *)*v349 + 25), v25))
        {
          [v142 addObject:v146];
          BOOL v144 = v292;
          [v292 addIndex:v145];
          WORD2(v411) = 2398;
          *(_DWORD *)&v438[8] = 1065353216;
          BOOL v148 = [v146 L2FeatureVector];
          BOOL v149 = v148;
          uint64_t v150 = 3;
          goto LABEL_237;
        }
        WORD2(v411) = 2398;
        *(_DWORD *)&v438[8] = 0;
        if ((isUpper2_0_2(v146, *((void *)*v349 + 25), v25) & 1) != 0
          || isUpper2_0_3(v146, *((void *)*v349 + 25), v25))
        {
          [v341 addObject:v146];
          BOOL v144 = v292;
          [v292 addIndex:v145];
          HIWORD(v411) = 2399;
          *(_DWORD *)v439 = 1065353216;
          BOOL v148 = [v146 L2FeatureVector];
          BOOL v149 = v148;
          uint64_t v150 = 4;
          goto LABEL_237;
        }
        HIWORD(v411) = 2399;
        *(_DWORD *)v439 = 0;
        if ((isUpper2_1_2(v146, *((void *)*v349 + 25), v25) & 1) != 0
          || isUpper2_1_3(v146, *((void *)*v349 + 25), v25))
        {
          [v338 addObject:v146];
          BOOL v144 = v292;
          [v292 addIndex:v145];
          __int16 v412 = 2401;
          *(_DWORD *)&v439[4] = 1065353216;
          BOOL v148 = [v146 L2FeatureVector];
          BOOL v149 = v148;
          uint64_t v150 = 5;
          goto LABEL_237;
        }
        __int16 v412 = 2401;
        *(_DWORD *)&v439[4] = 0;
        if ((isUpper2_2_2(v146, *((void *)*v349 + 25), v25, *((void **)*v349 + 3)) & 1) != 0
          || isUpper2_2_3(v146, *((void *)*v349 + 25), v25, *((void **)*v349 + 3)))
        {
          [v336 addObject:v146];
          BOOL v144 = v292;
          [v292 addIndex:v145];
          __int16 v413 = 2403;
          *(_DWORD *)&v439[8] = 1065353216;
          BOOL v148 = [v146 L2FeatureVector];
          BOOL v149 = v148;
          uint64_t v150 = 6;
          goto LABEL_237;
        }
        __int16 v413 = 2403;
        *(_DWORD *)&v439[8] = 0;
        if (isUpper2_0(v146, v151, v25))
        {
          [v143 addObject:v146];
          BOOL v144 = v292;
          [v292 addIndex:v145];
          __int16 v414 = 2400;
          int v440 = 1065353216;
          BOOL v148 = [v146 L2FeatureVector];
          BOOL v149 = v148;
          uint64_t v150 = 7;
          goto LABEL_237;
        }
        __int16 v414 = 2400;
        int v440 = 0;
        if (isUpper3_0(v146, *((void *)*v349 + 25), v25))
        {
          [v323 addObject:v146];
          BOOL v144 = v292;
          [v292 addIndex:v145];
          __int16 v415 = 2406;
          int v441 = 1065353216;
          BOOL v148 = [v146 L2FeatureVector];
          BOOL v149 = v148;
          uint64_t v150 = 8;
          goto LABEL_237;
        }
        __int16 v415 = 2406;
        int v441 = 0;
        if (isUpper4_0(v146, *((void *)*v349 + 25), v25))
        {
          [v322 addObject:v146];
          BOOL v144 = v292;
          [v292 addIndex:v145];
          __int16 v416 = 2408;
          int v442 = 1065353216;
          BOOL v148 = [v146 L2FeatureVector];
          BOOL v149 = v148;
          uint64_t v150 = 9;
          goto LABEL_237;
        }
        __int16 v416 = 2408;
        int v442 = 0;
        if (isUpper3(v146, *((void *)*v349 + 25), v25))
        {
          [v320 addObject:v146];
          BOOL v144 = v292;
          [v292 addIndex:v145];
          __int16 v417 = 2407;
          int v443 = 1065353216;
          BOOL v148 = [v146 L2FeatureVector];
          BOOL v149 = v148;
          uint64_t v150 = 10;
          goto LABEL_237;
        }
        __int16 v417 = 2407;
        int v443 = 0;
        if (isUpper4(v146, v152, v25))
        {
          [v319 addObject:v146];
          BOOL v144 = v292;
          [v292 addIndex:v145];
          __int16 v418 = 2409;
          int v444 = 1065353216;
          BOOL v148 = [v146 L2FeatureVector];
          BOOL v149 = v148;
          uint64_t v150 = 11;
          goto LABEL_237;
        }
        __int16 v418 = 2409;
        int v444 = 0;
        if (isUpper2_1(v146, *((void *)*v349 + 25), v25))
        {
          [v330 addObject:v146];
          BOOL v144 = v292;
          [v292 addIndex:v145];
          __int16 v419 = 2402;
          int v445 = 1065353216;
          BOOL v148 = [v146 L2FeatureVector];
          BOOL v149 = v148;
          uint64_t v150 = 12;
LABEL_237:
          [v148 setScores:v438 forFeatures:&v411 count:v150];
LABEL_238:

          if (v141 == ++v145) {
            goto LABEL_297;
          }
          continue;
        }
        break;
      }
      __int16 v419 = 2402;
      int v445 = 0;
      if (isUpper2_2(v146, *((void *)*v349 + 25), v25, *((void **)*v349 + 3)))
      {
        [v327 addObject:v146];
        BOOL v144 = v292;
        [v292 addIndex:v145];
        __int16 v420 = 2404;
        int v446 = 1065353216;
        int v153 = [v146 L2FeatureVector];
        BOOL v149 = v153;
        uint64_t v154 = 13;
      }
      else
      {
        __int16 v420 = 2404;
        int v446 = 0;
        if (isUpper2(v146, *((void *)*v349 + 25), v346))
        {
          [v325 addObject:v146];
          BOOL v144 = v292;
          [v292 addIndex:v145];
          __int16 v421 = 2405;
          int v447 = 1065353216;
          int v153 = [v146 L2FeatureVector];
          BOOL v149 = v153;
          uint64_t v154 = 14;
        }
        else
        {
          __int16 v421 = 2405;
          int v447 = 0;
          if ((isUpper5__2(v146, *((void *)*v349 + 25), v346) & 1) != 0
            || isUpper5__3(v146, *((void *)*v349 + 25), v346))
          {
            [v318 addObject:v146];
            BOOL v144 = v292;
            [v292 addIndex:v145];
            __int16 v422 = 2410;
            int v448 = 1065353216;
            int v153 = [v146 L2FeatureVector];
            BOOL v149 = v153;
            uint64_t v154 = 15;
          }
          else
          {
            __int16 v422 = 2410;
            int v448 = 0;
            if (isUpper5_0(v146, *((void *)*v349 + 25), v346))
            {
              [v316 addObject:v146];
              BOOL v144 = v292;
              [v292 addIndex:v145];
              __int16 v423 = 2411;
              int v449 = 1065353216;
              int v153 = [v146 L2FeatureVector];
              BOOL v149 = v153;
              uint64_t v154 = 16;
            }
            else
            {
              __int16 v423 = 2411;
              int v449 = 0;
              if (isUpper5_0r(v146, *((void *)*v349 + 25), v346))
              {
                [v315 addObject:v146];
                BOOL v144 = v292;
                [v292 addIndex:v145];
                __int16 v424 = 2412;
                int v450 = 1065353216;
                int v153 = [v146 L2FeatureVector];
                BOOL v149 = v153;
                uint64_t v154 = 17;
              }
              else
              {
                __int16 v424 = 2412;
                int v450 = 0;
                if (isUpper5_1(v146, *((void *)*v349 + 25), v346))
                {
                  [v314 addObject:v146];
                  BOOL v144 = v292;
                  [v292 addIndex:v145];
                  __int16 v425 = 2413;
                  int v451 = 1065353216;
                  int v153 = [v146 L2FeatureVector];
                  BOOL v149 = v153;
                  uint64_t v154 = 18;
                }
                else
                {
                  __int16 v425 = 2413;
                  int v451 = 0;
                  if (isUpper5_s(v146, *((void *)*v349 + 25), v346))
                  {
                    [v313 addObject:v146];
                    BOOL v144 = v292;
                    [v292 addIndex:v145];
                    __int16 v426 = 2414;
                    int v452 = 1065353216;
                    int v153 = [v146 L2FeatureVector];
                    BOOL v149 = v153;
                    uint64_t v154 = 19;
                  }
                  else
                  {
                    __int16 v426 = 2415;
                    int v452 = 0;
                    if (isUpper5(v146, v155, v346))
                    {
                      [v312 addObject:v146];
                      BOOL v144 = v292;
                      [v292 addIndex:v145];
                      __int16 v427 = 2415;
                      int v453 = 1065353216;
                      int v153 = [v146 L2FeatureVector];
                      BOOL v149 = v153;
                      uint64_t v154 = 20;
                    }
                    else
                    {
                      __int16 v427 = 2415;
                      int v453 = 0;
                      if (isUpper5_c(v146, v156, v346))
                      {
                        [v311 addObject:v146];
                        BOOL v144 = v292;
                        [v292 addIndex:v145];
                        __int16 v428 = 2416;
                        int v454 = 1065353216;
                        int v153 = [v146 L2FeatureVector];
                        BOOL v149 = v153;
                        uint64_t v154 = 21;
                      }
                      else
                      {
                        __int16 v428 = 2416;
                        int v454 = 0;
                        if (isLowerScore_0(v146, *((void *)*v349 + 25), v346))
                        {
                          [v291 addObject:v146];
                          BOOL v144 = v292;
                          [v292 addIndex:v145];
                          __int16 v429 = 2423;
                          int v455 = 1065353216;
                          int v153 = [v146 L2FeatureVector];
                          BOOL v149 = v153;
                          uint64_t v154 = 22;
                        }
                        else
                        {
                          __int16 v429 = 2423;
                          int v455 = 0;
                          if (isUpper7_0(v146, v157, v346))
                          {
                            [v299 addObject:v146];
                            BOOL v144 = v292;
                            [v292 addIndex:v145];
                            __int16 v430 = 2419;
                            int v456 = 1065353216;
                            int v153 = [v146 L2FeatureVector];
                            BOOL v149 = v153;
                            uint64_t v154 = 23;
                          }
                          else
                          {
                            __int16 v430 = 2419;
                            int v456 = 0;
                            if (isUpper7_1(v146, v158, v346))
                            {
                              [v298 addObject:v146];
                              BOOL v144 = v292;
                              [v292 addIndex:v145];
                              __int16 v431 = 2420;
                              int v457 = 1065353216;
                              int v153 = [v146 L2FeatureVector];
                              BOOL v149 = v153;
                              uint64_t v154 = 24;
                            }
                            else
                            {
                              __int16 v431 = 2420;
                              int v457 = 0;
                              if (isUpper7(v146, v159, v346))
                              {
                                [v297 addObject:v146];
                                BOOL v144 = v292;
                                [v292 addIndex:v145];
                                __int16 v432 = 2421;
                                int v458 = 1065353216;
                                int v153 = [v146 L2FeatureVector];
                                BOOL v149 = v153;
                                uint64_t v154 = 25;
                              }
                              else
                              {
                                __int16 v432 = 2421;
                                int v458 = 0;
                                if (isLowerScore_c0(v146, *((void *)*v349 + 25), v346))
                                {
                                  [v290 addObject:v146];
                                  BOOL v144 = v292;
                                  [v292 addIndex:v145];
                                  __int16 v433 = 2424;
                                  int v459 = 1065353216;
                                  int v153 = [v146 L2FeatureVector];
                                  BOOL v149 = v153;
                                  uint64_t v154 = 26;
                                }
                                else
                                {
                                  __int16 v433 = 2424;
                                  int v459 = 0;
                                  if (isLowerScore_c(v146, v160, v346))
                                  {
                                    [v289 addObject:v146];
                                    BOOL v144 = v292;
                                    [v292 addIndex:v145];
                                    __int16 v434 = 2425;
                                    int v460 = 1065353216;
                                    int v153 = [v146 L2FeatureVector];
                                    BOOL v149 = v153;
                                    uint64_t v154 = 27;
                                  }
                                  else
                                  {
                                    __int16 v434 = 2425;
                                    int v460 = 0;
                                    if (isUpper6(v146, *((void *)*v349 + 25), *((void *)*v349 + 26), *((void **)*v349 + 9), v346))
                                    {
                                      [v301 addObject:v146];
                                      BOOL v144 = v292;
                                      [v292 addIndex:v145];
                                      __int16 v435 = 2417;
                                      int v461 = 1065353216;
                                      int v153 = [v146 L2FeatureVector];
                                      BOOL v149 = v153;
                                      uint64_t v154 = 28;
                                    }
                                    else
                                    {
                                      __int16 v435 = 2417;
                                      int v461 = 0;
                                      if (isUpper6_r(v146, v161, *((void *)*v349 + 26), *((void **)*v349 + 9), v346))
                                      {
                                        [v300 addObject:v146];
                                        BOOL v144 = v292;
                                        [v292 addIndex:v145];
                                        __int16 v436 = 2418;
                                        int v462 = 1065353216;
                                        int v153 = [v146 L2FeatureVector];
                                        BOOL v149 = v153;
                                        uint64_t v154 = 29;
                                      }
                                      else
                                      {
                                        __int16 v436 = 2418;
                                        int v462 = 0;
                                        if (!isUpper7_r(v146, *((void *)*v349 + 25), *((void *)*v349 + 26), *((void **)*v349 + 9)))
                                        {
                                          int v437 = 158992758;
                                          uint64_t v463 = 0x3F80000000000000;
                                          BOOL v149 = [v146 L2FeatureVector];
                                          [v149 setScores:v438 forFeatures:&v411 count:31];
                                          int v25 = v346;
                                          BOOL v144 = v292;
                                          goto LABEL_238;
                                        }
                                        [v296 addObject:v146];
                                        BOOL v144 = v292;
                                        [v292 addIndex:v145];
                                        LOWORD(v437) = 2422;
                                        LODWORD(v463) = 1065353216;
                                        int v153 = [v146 L2FeatureVector];
                                        BOOL v149 = v153;
                                        uint64_t v154 = 30;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      [v153 setScores:v438 forFeatures:&v411 count:v154];
      int v25 = v346;
      goto LABEL_238;
    }
    if (SSSectionIsSyndicatedPhotos(v29))
    {
      v390[0] = MEMORY[0x1E4F143A8];
      v390[1] = v26;
      v390[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_6;
      v390[3] = &unk_1E635AE78;
      v390[4] = *v14;
      unint64_t v132 = v390;
    }
    else
    {
      v391[0] = MEMORY[0x1E4F143A8];
      v391[1] = v26;
      v391[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_5;
      v391[3] = &unk_1E635AE78;
      v391[4] = *v14;
      unint64_t v132 = v391;
    }
    unint64_t v133 = v333;
LABEL_329:
    [v133 sortWithOptions:17 usingComparator:v132];
LABEL_330:
    float v58 = v348;
LABEL_331:
    float v198 = v28;
    v199 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v199, OS_LOG_TYPE_INFO))
    {
      uint64_t v200 = [v333 count];
      *(_DWORD *)v438 = 134218242;
      *(void *)&v438[4] = v200;
      *(_WORD *)v439 = 2112;
      *(void *)&v439[2] = v29;
      _os_log_impl(&dword_1BDB2A000, v199, OS_LOG_TYPE_INFO, "[SpotlightRanking] <Model> re-ranked %lu items matched query terms in bundle %@", v438, 0x16u);
    }

    unint64_t v201 = [v333 count];
    if (v201)
    {
      unint64_t v202 = v201;
      uint64_t v203 = v26;
      uint64_t v204 = 0;
      float v205 = (float)v201;
      do
      {
        float v206 = (float)v202 / v205;
        v207 = [v333 objectAtIndexedSubscript:v204];
        *(float *)&double v208 = v57 + v206;
        [v207 setScore:v208];

        v209 = [v333 objectAtIndexedSubscript:v204];
        *(float *)&double v210 = v56 + v206;
        [v209 setWithinBundleScore:v210];

        ++v204;
        --v202;
      }
      while (v202);
      uint64_t v26 = v203;
    }
    float v28 = v198;
LABEL_338:
    if ([v306 count])
    {
      v356[0] = MEMORY[0x1E4F143A8];
      v356[1] = v26;
      v356[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_1022;
      v356[3] = &unk_1E635AE78;
      v356[4] = *v14;
      [v306 sortWithOptions:17 usingComparator:v356];
      v211 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v211, OS_LOG_TYPE_INFO))
      {
        uint64_t v212 = [v306 count];
        *(_DWORD *)v438 = 134218242;
        *(void *)&v438[4] = v212;
        *(_WORD *)v439 = 2112;
        *(void *)&v439[2] = v29;
        _os_log_impl(&dword_1BDB2A000, v211, OS_LOG_TYPE_INFO, "[SpotlightRanking] <Model> re-ranked %lu items not word matched phrase in bundle %@", v438, 0x16u);
      }

      unint64_t v213 = [v306 count];
      if (v213)
      {
        unint64_t v214 = v213;
        uint64_t v215 = 0;
        float v216 = (float)v213;
        do
        {
          v217 = [v306 objectAtIndexedSubscript:v215];
          *(float *)&double v218 = (float)((float)v214 / v216) + v28;
          [v217 setScore:v218];

          v219 = [v306 objectAtIndexedSubscript:v215];
          *(float *)&double v220 = (float)((float)v214 / v216) + v28;
          [v219 setWithinBundleScore:v220];

          ++v215;
          --v214;
        }
        while (v214);
      }
    }
    if ([v304 count])
    {
      v355[0] = MEMORY[0x1E4F143A8];
      v355[1] = v26;
      v355[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_1023;
      v355[3] = &unk_1E635AE78;
      v355[4] = *v14;
      [v304 sortWithOptions:17 usingComparator:v355];
      v221 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v221, OS_LOG_TYPE_INFO))
      {
        uint64_t v222 = [v304 count];
        *(_DWORD *)v438 = 134218242;
        *(void *)&v438[4] = v222;
        *(_WORD *)v439 = 2112;
        *(void *)&v439[2] = v29;
        _os_log_impl(&dword_1BDB2A000, v221, OS_LOG_TYPE_INFO, "[SpotlightRanking] <Model> re-ranked %lu items not matched phrase in bundle %@", v438, 0x16u);
      }

      unint64_t v223 = [v304 count];
      if (v223)
      {
        unint64_t v224 = v223;
        uint64_t v225 = 0;
        float v226 = (float)v223;
        do
        {
          v227 = [v304 objectAtIndexedSubscript:v225];
          *(float *)&double v228 = (float)((float)v224 / v226) + -6000.0;
          [v227 setScore:v228];

          v229 = [v304 objectAtIndexedSubscript:v225];
          *(float *)&double v230 = (float)((float)v224 / v226) + -6000.0;
          [v229 setWithinBundleScore:v230];

          ++v225;
          --v224;
        }
        while (v224);
      }
    }
    float v27 = v293;
    if ([v303 count])
    {
      v354[0] = MEMORY[0x1E4F143A8];
      v354[1] = v26;
      v354[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_1024;
      v354[3] = &unk_1E635AE78;
      v354[4] = *v14;
      [v303 sortWithOptions:17 usingComparator:v354];
      v231 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v231, OS_LOG_TYPE_INFO))
      {
        uint64_t v232 = [v303 count];
        *(_DWORD *)v438 = 134218242;
        *(void *)&v438[4] = v232;
        *(_WORD *)v439 = 2112;
        *(void *)&v439[2] = v29;
        _os_log_impl(&dword_1BDB2A000, v231, OS_LOG_TYPE_INFO, "[SpotlightRanking] <Model> re-ranked %lu items alt names only matched query terms in bundle %@", v438, 0x16u);
      }

      unint64_t v233 = [v303 count];
      if (v233)
      {
        unint64_t v234 = v233;
        uint64_t v235 = 0;
        float v236 = (float)v233;
        do
        {
          v237 = [v303 objectAtIndexedSubscript:v235];
          *(float *)&double v238 = (float)((float)v234 / v236) + -8000.0;
          [v237 setScore:v238];

          v239 = [v303 objectAtIndexedSubscript:v235];
          *(float *)&double v240 = (float)((float)v234 / v236) + -8000.0;
          [v239 setWithinBundleScore:v240];

          ++v235;
          --v234;
        }
        while (v234);
      }
    }
    if ([v302 count])
    {
      v353[0] = MEMORY[0x1E4F143A8];
      v353[1] = v26;
      v353[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_1025;
      v353[3] = &unk_1E635AE78;
      v353[4] = *v14;
      [v302 sortWithOptions:17 usingComparator:v353];
      v241 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v241, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v242 = [v302 count];
        *(_DWORD *)v438 = 134218242;
        *(void *)&v438[4] = v242;
        *(_WORD *)v439 = 2112;
        *(void *)&v439[2] = v29;
        _os_log_impl(&dword_1BDB2A000, v241, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Model> re-ranked %lu items spell corrected matched query terms in bundle %@", v438, 0x16u);
      }

      unint64_t v243 = [v302 count];
      if (v243)
      {
        unint64_t v244 = v243;
        uint64_t v245 = 0;
        float v246 = (float)v243;
        do
        {
          v247 = [v302 objectAtIndexedSubscript:v245];
          *(float *)&double v248 = (float)((float)v244 / v246) + -9000.0;
          [v247 setScore:v248];

          v249 = [v302 objectAtIndexedSubscript:v245];
          *(float *)&double v250 = (float)((float)v244 / v246) + -9000.0;
          [v249 setWithinBundleScore:v250];

          ++v245;
          --v244;
        }
        while (v244);
      }
    }
    if ([v58 count])
    {
      v352[0] = MEMORY[0x1E4F143A8];
      v352[1] = v26;
      v352[2] = __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_1026;
      v352[3] = &unk_1E635AE78;
      v352[4] = *v14;
      [v58 sortWithOptions:17 usingComparator:v352];
      v251 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v252 = [v58 count];
        *(_DWORD *)v438 = 134218242;
        *(void *)&v438[4] = v252;
        *(_WORD *)v439 = 2112;
        *(void *)&v439[2] = v29;
        _os_log_impl(&dword_1BDB2A000, v251, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Model> re-ranked %lu items not matched query terms in bundle %@", v438, 0x16u);
      }

      unint64_t v253 = [v58 count];
      if (v253)
      {
        unint64_t v254 = v253;
        uint64_t v255 = 0;
        uint64_t v256 = 0;
        float v257 = (float)v253;
        do
        {
          float v258 = (float)(v254 + v255) / v257;
          float v259 = v258 + v293;
          v260 = [v58 objectAtIndexedSubscript:v256];
          *(float *)&double v261 = v258 + v293;
          [v260 setScore:v261];

          if (![v333 count] || *((unsigned char *)*v14 + 35)) {
            float v259 = v258 + v28;
          }
          v262 = [v58 objectAtIndexedSubscript:v256];
          *(float *)&double v263 = v259;
          [v262 setScore:v263];

          v264 = [v58 objectAtIndexedSubscript:v256];
          *(float *)&double v265 = v259;
          [v264 setWithinBundleScore:v265];

          float v58 = v348;
          if (SSEnableAppSearchV2())
          {
            v266 = [v348 objectAtIndexedSubscript:v256];
            __int16 v267 = [v266 bundleIDType];

            if ((v267 & 0x100) != 0)
            {
              v268 = [*v14 userQueryString];
              v269 = [v348 objectAtIndexedSubscript:v256];
              v270 = [v269 displayName];
              v271 = [v270 lowercaseString];
              appErrorScore();
              float v273 = v272;

              double v29 = v310;
              float v58 = v348;

              double v274 = v273;
              if (v273 > 0.9)
              {
                float v275 = v273 + 1.0;
                v276 = objc_msgSend(v348, "objectAtIndexedSubscript:", v256, v274);
                *(float *)&double v277 = v275;
                [v276 setScore:v277];

                v278 = [v348 objectAtIndexedSubscript:v256];
                *(float *)&double v279 = v275;
                [v278 setWithinBundleScore:v279];

                v280 = [v348 objectAtIndexedSubscript:v256];
                v281 = [v280 displayName];

                v282 = SSGeneralLog();
                if (os_log_type_enabled(v282, OS_LOG_TYPE_DEFAULT))
                {
                  SSRedactString(v281, 1);
                  id v283 = (id)objc_claimAutoreleasedReturnValue();
                  v284 = [v348 objectAtIndexedSubscript:v256];
                  [v284 score];
                  *(_DWORD *)v438 = 138412546;
                  *(void *)&v438[4] = v283;
                  *(_WORD *)v439 = 2048;
                  *(double *)&v439[2] = v285;
                  _os_log_impl(&dword_1BDB2A000, v282, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Model> <AppSpellCorrection> updating L2 score for %@ to %f", v438, 0x16u);
                }
                double v29 = v310;
                float v58 = v348;
              }
            }
          }
          bzero(&v438[4], 0x3288uLL);
          bzero((char *)&v411 + 2, 0x1944uLL);
          LOWORD(v411) = 2428;
          *(_DWORD *)v438 = 1065353216;
          v286 = [v58 objectAtIndexedSubscript:v256];
          v287 = [v286 L2FeatureVector];
          [v287 setScores:v438 forFeatures:&v411 count:1];

          ++v256;
          --v255;
        }
        while (v254 != v256);
      }
    }

    uint64_t v23 = v295;
LABEL_378:

    ++v23;
  }
  while ((id)v23 != v305);
LABEL_383:
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(void *)(a1 + 32) + 192));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDatesPlus:currentTime:hasCategory:topBit:upperBit:lowerBit:](a2, a3, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(double *)(*(void *)(a1 + 32) + 192));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(void *)(a1 + 32) + 192));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem comparePhotosOnlyWithDates:currentTime:](a2, a3, *(double *)(*(void *)(a1 + 32) + 192));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(void *)(a1 + 32) + 192));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_1022(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(void *)(a1 + 32) + 192));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_1023(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(void *)(a1 + 32) + 192));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_1024(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  if ([v7 isKeywordMatch]
    && [v7 wordMatchedKeyword]
    && [v8 isKeywordMatch]
    && ![v8 wordMatchedKeyword])
  {
    uint64_t v9 = -1;
  }
  else if ([v7 isKeywordMatch] {
         && ([v7 wordMatchedKeyword] & 1) == 0
  }
         && [v8 isKeywordMatch]
         && ([v8 wordMatchedKeyword] & 1) != 0)
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = --[PRSRankingItem compareWithDates:currentTime:]((uint64_t)v7, v8, *(double *)(*(void *)(a1 + 32) + 192));
  }

  return v9;
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_1025(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(void *)(a1 + 32) + 192));
}

uint64_t __66__PRSRankingItemRanker_rerankItemsWithPolicyForBundleItems_isCJK___block_invoke_1026(uint64_t a1, uint64_t a2, void *a3)
{
  return --[PRSRankingItem compareWithDates:currentTime:](a2, a3, *(double *)(*(void *)(a1 + 32) + 192));
}

- (BOOL)wasItemCreatedWithinAWeek:(id)a3
{
  uint64_t v4 = SSCompactRankingAttrsGetValue((int8x8_t *)[a3 attributes], 0x20uLL);
  id v5 = v4;
  BOOL v7 = 0;
  if (v4)
  {
    [v4 timeIntervalSinceReferenceDate];
    if (v6 <= 0.0 || v6 > self->_currentTime + -604800.0) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (id)comparatorByJoiningComparator:(id)a3 withPredicate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PRSRankingItemRanker_comparatorByJoiningComparator_withPredicate___block_invoke;
  v11[3] = &unk_1E635AF40;
  id v12 = v6;
  id v13 = v5;
  id v7 = v5;
  id v8 = v6;
  uint64_t v9 = (void *)MEMORY[0x1C1885400](v11);

  return v9;
}

uint64_t __68__PRSRankingItemRanker_comparatorByJoiningComparator_withPredicate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) evaluateWithObject:v5];
  unsigned int v8 = [*(id *)(a1 + 32) evaluateWithObject:v6];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v7) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = v8;
    }
  }
  else
  {
    uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v10;
}

- (void)resetbundleFeaturesScratchBuf:(float *)a3
{
  for (unint64_t i = 0; i != 46; ++i)
  {
    if (i >= 0x2E) {
      -[PRSRankingItemRanker resetbundleFeaturesScratchBuf:]();
    }
    a3[i] = flt_1BDC5F57C[i];
  }
}

+ (id)importantAttributesForBundle:(id)a3
{
  v143[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.application"])
  {
    v143[0] = *MEMORY[0x1E4F22CE8];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = v143;
LABEL_3:
    uint64_t v6 = 1;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"com.apple.mobilemail"])
  {
    uint64_t v7 = *MEMORY[0x1E4F22B30];
    v142[0] = *MEMORY[0x1E4F235C0];
    v142[1] = v7;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = v142;
LABEL_17:
    uint64_t v6 = 2;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"com.apple.MobileSMS"])
  {
    uint64_t v8 = *MEMORY[0x1E4F22C58];
    v141[0] = *MEMORY[0x1E4F22B30];
    v141[1] = v8;
    v141[2] = *MEMORY[0x1E4F22CE8];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = v141;
    goto LABEL_8;
  }
  if ([v3 isEqualToString:@"com.apple.mobilecal"])
  {
    uint64_t v9 = *MEMORY[0x1E4F23160];
    v140[0] = *MEMORY[0x1E4F23658];
    v140[1] = v9;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = v140;
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"com.apple.mobilenotes"])
  {
    uint64_t v10 = *MEMORY[0x1E4F22CD0];
    v139[0] = *MEMORY[0x1E4F22CE8];
    v139[1] = v10;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = v139;
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"com.apple.Music"])
  {
    uint64_t v11 = *MEMORY[0x1E4F22A68];
    v138[0] = *MEMORY[0x1E4F23658];
    v138[1] = v11;
    uint64_t v12 = *MEMORY[0x1E4F22C08];
    v138[2] = *MEMORY[0x1E4F22AD8];
    v138[3] = v12;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = v138;
    uint64_t v6 = 4;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"com.apple.MobileAddressBook"])
  {
    uint64_t v13 = *MEMORY[0x1E4F22A78];
    v137[0] = *MEMORY[0x1E4F22CE8];
    v137[1] = v13;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = v137;
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"com.apple.Preferences"])
  {
    uint64_t v16 = *MEMORY[0x1E4F235C0];
    v136[0] = *MEMORY[0x1E4F22CE8];
    v136[1] = v16;
    v136[2] = *MEMORY[0x1E4F22CD0];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = v136;
    goto LABEL_8;
  }
  if ([v3 isEqualToString:@"com.apple.DocumentsApp"])
  {
    uint64_t v135 = *MEMORY[0x1E4F22CE8];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = &v135;
    goto LABEL_3;
  }
  if ([v3 isEqualToString:@"com.apple.photos"])
  {
    uint64_t v134 = *MEMORY[0x1E4F235C0];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = &v134;
    goto LABEL_3;
  }
  if ([v3 isEqualToString:@"com.apple.mobileslideshow"])
  {
    uint64_t v17 = *MEMORY[0x1E4F23260];
    v133[0] = *MEMORY[0x1E4F23378];
    v133[1] = v17;
    uint64_t v18 = *MEMORY[0x1E4F232F8];
    v133[2] = *MEMORY[0x1E4F232E0];
    v133[3] = v18;
    uint64_t v19 = *MEMORY[0x1E4F232C0];
    v133[4] = *MEMORY[0x1E4F23340];
    v133[5] = v19;
    uint64_t v20 = *MEMORY[0x1E4F23248];
    v133[6] = *MEMORY[0x1E4F23250];
    v133[7] = v20;
    uint64_t v21 = *MEMORY[0x1E4F23280];
    v133[8] = *MEMORY[0x1E4F23278];
    v133[9] = v21;
    uint64_t v22 = *MEMORY[0x1E4F232D8];
    v133[10] = *MEMORY[0x1E4F23270];
    v133[11] = v22;
    uint64_t v23 = *MEMORY[0x1E4F23370];
    v133[12] = *MEMORY[0x1E4F22C58];
    v133[13] = v23;
    uint64_t v24 = *MEMORY[0x1E4F232B0];
    v133[14] = *MEMORY[0x1E4F232A0];
    v133[15] = v24;
    v133[16] = *MEMORY[0x1E4F22A20];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = v133;
    uint64_t v6 = 17;
    goto LABEL_18;
  }
  if (!SSSectionIsSyndicatedPhotos(v3))
  {
    if ([v3 isEqualToString:@"com.apple.people.findMy"])
    {
      uint64_t v34 = *MEMORY[0x1E4F22B30];
      uint64_t v73 = *MEMORY[0x1E4F23658];
      uint64_t v74 = v34;
      uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = &v73;
      goto LABEL_17;
    }
    if ([v3 isEqualToString:@"com.apple.people.askToBuyRequest"])
    {
      uint64_t v45 = *MEMORY[0x1E4F22B30];
      uint64_t v71 = *MEMORY[0x1E4F23658];
      uint64_t v72 = v45;
      uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = &v71;
      goto LABEL_17;
    }
    if ([v3 isEqualToString:@"com.apple.VoiceMemos"])
    {
      uint64_t v56 = *MEMORY[0x1E4F23598];
      uint64_t v69 = *MEMORY[0x1E4F22CE8];
      uint64_t v70 = v56;
      uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = &v69;
      goto LABEL_17;
    }
    uint64_t v65 = *MEMORY[0x1E4F23658];
    uint64_t v66 = *MEMORY[0x1E4F22CE8];
    uint64_t v67 = v65;
    uint64_t v68 = *MEMORY[0x1E4F22CD0];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = &v66;
LABEL_8:
    uint64_t v6 = 3;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"com.apple.searchd.syndicatedPhotos.MobileSMS"])
  {
    uint64_t v25 = *MEMORY[0x1E4F23260];
    v132[0] = *MEMORY[0x1E4F23378];
    v132[1] = v25;
    uint64_t v26 = *MEMORY[0x1E4F232F8];
    v132[2] = *MEMORY[0x1E4F232E0];
    v132[3] = v26;
    uint64_t v27 = *MEMORY[0x1E4F232C0];
    v132[4] = *MEMORY[0x1E4F23340];
    v132[5] = v27;
    uint64_t v28 = *MEMORY[0x1E4F23248];
    v132[6] = *MEMORY[0x1E4F23250];
    v132[7] = v28;
    uint64_t v29 = *MEMORY[0x1E4F23280];
    v132[8] = *MEMORY[0x1E4F23278];
    v132[9] = v29;
    uint64_t v30 = *MEMORY[0x1E4F232D8];
    v132[10] = *MEMORY[0x1E4F23270];
    v132[11] = v30;
    uint64_t v31 = *MEMORY[0x1E4F23370];
    v132[12] = *MEMORY[0x1E4F22C58];
    v132[13] = v31;
    uint64_t v32 = *MEMORY[0x1E4F232A0];
    v132[14] = *MEMORY[0x1E4F22B30];
    v132[15] = v32;
    uint64_t v33 = *MEMORY[0x1E4F22A20];
    v132[16] = *MEMORY[0x1E4F232B0];
    v132[17] = v33;
    v132[18] = *MEMORY[0x1E4F22FC0];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = v132;
LABEL_40:
    uint64_t v6 = 19;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"com.apple.searchd.syndicatedPhotos.mobilenotes"])
  {
    uint64_t v35 = *MEMORY[0x1E4F23260];
    uint64_t v112 = *MEMORY[0x1E4F23378];
    uint64_t v113 = v35;
    uint64_t v36 = *MEMORY[0x1E4F232F8];
    uint64_t v114 = *MEMORY[0x1E4F232E0];
    uint64_t v115 = v36;
    uint64_t v37 = *MEMORY[0x1E4F232C0];
    uint64_t v116 = *MEMORY[0x1E4F23340];
    uint64_t v117 = v37;
    uint64_t v38 = *MEMORY[0x1E4F23248];
    uint64_t v118 = *MEMORY[0x1E4F23250];
    uint64_t v119 = v38;
    uint64_t v39 = *MEMORY[0x1E4F23280];
    uint64_t v120 = *MEMORY[0x1E4F23278];
    uint64_t v121 = v39;
    uint64_t v40 = *MEMORY[0x1E4F232D8];
    uint64_t v122 = *MEMORY[0x1E4F23270];
    uint64_t v123 = v40;
    uint64_t v41 = *MEMORY[0x1E4F23370];
    uint64_t v124 = *MEMORY[0x1E4F22C58];
    uint64_t v125 = v41;
    uint64_t v42 = *MEMORY[0x1E4F22CD0];
    uint64_t v126 = *MEMORY[0x1E4F22CE8];
    uint64_t v127 = v42;
    uint64_t v43 = *MEMORY[0x1E4F232B0];
    uint64_t v128 = *MEMORY[0x1E4F232A0];
    uint64_t v129 = v43;
    uint64_t v44 = *MEMORY[0x1E4F22FC0];
    uint64_t v130 = *MEMORY[0x1E4F22A20];
    uint64_t v131 = v44;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = &v112;
    uint64_t v6 = 20;
    goto LABEL_18;
  }
  int v46 = [v3 isEqualToString:@"com.apple.spotlight.syndicatedPhotos.fileProvider"];
  uint64_t v47 = *MEMORY[0x1E4F23260];
  if (v46)
  {
    uint64_t v93 = *MEMORY[0x1E4F23378];
    uint64_t v94 = v47;
    uint64_t v48 = *MEMORY[0x1E4F232F8];
    uint64_t v95 = *MEMORY[0x1E4F232E0];
    uint64_t v96 = v48;
    uint64_t v49 = *MEMORY[0x1E4F232C0];
    uint64_t v97 = *MEMORY[0x1E4F23340];
    uint64_t v98 = v49;
    uint64_t v50 = *MEMORY[0x1E4F23248];
    uint64_t v99 = *MEMORY[0x1E4F23250];
    uint64_t v100 = v50;
    uint64_t v51 = *MEMORY[0x1E4F23280];
    uint64_t v101 = *MEMORY[0x1E4F23278];
    uint64_t v102 = v51;
    uint64_t v52 = *MEMORY[0x1E4F232D8];
    uint64_t v103 = *MEMORY[0x1E4F23270];
    uint64_t v104 = v52;
    uint64_t v53 = *MEMORY[0x1E4F23370];
    uint64_t v105 = *MEMORY[0x1E4F22C58];
    uint64_t v106 = v53;
    uint64_t v54 = *MEMORY[0x1E4F232A0];
    uint64_t v107 = *MEMORY[0x1E4F22CE8];
    uint64_t v108 = v54;
    uint64_t v55 = *MEMORY[0x1E4F22A20];
    uint64_t v109 = *MEMORY[0x1E4F232B0];
    uint64_t v110 = v55;
    uint64_t v111 = *MEMORY[0x1E4F22FC0];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = &v93;
    goto LABEL_40;
  }
  uint64_t v75 = *MEMORY[0x1E4F23378];
  uint64_t v76 = v47;
  uint64_t v57 = *MEMORY[0x1E4F232F8];
  uint64_t v77 = *MEMORY[0x1E4F232E0];
  uint64_t v78 = v57;
  uint64_t v58 = *MEMORY[0x1E4F232C0];
  uint64_t v79 = *MEMORY[0x1E4F23340];
  uint64_t v80 = v58;
  uint64_t v59 = *MEMORY[0x1E4F23248];
  uint64_t v81 = *MEMORY[0x1E4F23250];
  uint64_t v82 = v59;
  uint64_t v60 = *MEMORY[0x1E4F23280];
  uint64_t v83 = *MEMORY[0x1E4F23278];
  uint64_t v84 = v60;
  uint64_t v61 = *MEMORY[0x1E4F232D8];
  uint64_t v85 = *MEMORY[0x1E4F23270];
  uint64_t v86 = v61;
  uint64_t v62 = *MEMORY[0x1E4F23370];
  uint64_t v87 = *MEMORY[0x1E4F22C58];
  uint64_t v88 = v62;
  uint64_t v63 = *MEMORY[0x1E4F232B0];
  uint64_t v89 = *MEMORY[0x1E4F232A0];
  uint64_t v90 = v63;
  uint64_t v64 = *MEMORY[0x1E4F22FC0];
  uint64_t v91 = *MEMORY[0x1E4F22A20];
  uint64_t v92 = v64;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = &v75;
  uint64_t v6 = 18;
LABEL_18:
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87,
    v88,
    v89,
    v90,
    v91,
    v92,
    v93,
    v94,
    v95,
    v96,
    v97,
    v98,
    v99,
    v100,
    v101,
    v102,
    v103,
    v104,
    v105,
    v106,
    v107,
    v108,
    v109,
    v110,
    v111,
    v112,
    v113,
    v114,
    v115,
    v116,
    v117,
    v118,
    v119,
    v120,
    v121,
    v122,
    v123,
  uint64_t v14 = v124);

  return v14;
}

+ (id)importantAttributesForParsecBundle:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = *MEMORY[0x1E4F22CE8];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  return v3;
}

+ (id)itemSpecificImportantAttributesForBundle:(id)a3 withItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v6 bundleIDType] & 0x4000000) != 0
    && (([v5 isEqualToString:@"com.apple.MobileSMS"] & 1) != 0
     || ([v5 isEqualToString:@"com.apple.mobileslideshow"] & 1) != 0))
  {
    uint64_t v7 = SSSectionIdentifierSyndicatedPhotosMessages;
  }
  else if (([v6 bundleIDType] & 0x8000000) != 0 {
         && (([v5 isEqualToString:@"com.apple.mobilenotes"] & 1) != 0
  }
          || ([v5 isEqualToString:@"com.apple.mobileslideshow"] & 1) != 0))
  {
    uint64_t v7 = SSSectionIdentifierSyndicatedPhotosNotes;
  }
  else
  {
    if (([v6 bundleIDType] & 0x10000000) == 0
      || ([v5 isEqualToString:@"com.apple.DocumentsApp"] & 1) == 0
      && ([v5 isEqualToString:@"com.apple.FileProvider.LocalStorage"] & 1) == 0
      && ([v5 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"] & 1) == 0
      && ([v5 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"] & 1) == 0
      && ([v5 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"] & 1) == 0
      && ![v5 isEqualToString:@"com.apple.mobileslideshow"])
    {
      uint64_t v8 = 0;
      goto LABEL_19;
    }
    uint64_t v7 = SSSectionIdentifierSyndicatedPhotosFiles;
  }
  uint64_t v8 = +[PRSRankingItemRanker importantAttributesForBundle:*v7];
LABEL_19:

  return v8;
}

+ (id)phoneFavoritesCopy
{
  pthread_mutex_lock(&sVIPLock_0);
  id v2 = (void *)[(id)sPhoneFavorites copy];
  pthread_mutex_unlock(&sVIPLock_0);
  return v2;
}

- (void)setRenderEngagementFeaturesForItemAsShorts:(id)a3 counts:(signed __int16)a4[6] isRender:(BOOL)a5 bundleDict:(id)a6
{
  BOOL v7 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = 0;
  memset(v38, 0, sizeof(v38));
  memset(v37, 0, sizeof(v37));
  memset(&v36[1], 0, 32);
  if (v7) {
    uint64_t v12 = &renderFeatures;
  }
  else {
    uint64_t v12 = &engagementFeatures;
  }
  v36[0] = 0uLL;
  do
  {
    int v13 = a4[v11];
    double v14 = log10((double)v13);
    unint64_t v15 = vcvtpd_s64_f64(v14);
    *(float *)&double v14 = (float)v13;
    +[PRSRankingUtilities floatValue:(int)((v15 >> 1) + (v15 & 1)) withSigFigs:v14];
    *((_DWORD *)v37 + v11) = v16;
    *((_WORD *)v36 + v11) = v12[v11];
    ++v11;
  }
  while (v11 != 6);
  if ([v10 count])
  {
    if (v7) {
      uint64_t v17 = &bundleRenderFeatures;
    }
    else {
      uint64_t v17 = &bundleEngagementFeatures;
    }
    uint64_t v18 = [v9 sectionBundleIdentifier];
    uint64_t v19 = [v10 objectForKey:v18];
    uint64_t v20 = v19;
    if (v19)
    {
      int v35 = 0;
      uint64_t v34 = 0;
      uint64_t v21 = 6;
      if ([v19 getRankingValues:&v34 withRankingValueSize:6 forType:v7])
      {
        uint64_t v30 = v18;
        id v31 = v9;
        for (uint64_t i = 0; i != 6; ++i)
        {
          int v23 = *((__int16 *)&v34 + i);
          double v24 = log10((double)v23);
          unint64_t v25 = vcvtpd_s64_f64(v24);
          *(float *)&double v24 = (float)v23;
          +[PRSRankingUtilities floatValue:(int)((v25 >> 1) + (v25 & 1)) withSigFigs:v24];
          *((_DWORD *)&v37[1] + i + 2) = v26;
          *(_WORD *)(((unint64_t)v36 | 0xC) + 2 * i) = v17[i];
        }
        if (v7)
        {
          uint64_t v21 = 12;
          id v9 = v31;
        }
        else
        {
          int v33 = 0;
          uint64_t v32 = 0;
          id v9 = v31;
          if ([v20 getRankingValues:&v32 withRankingValueSize:6 forType:1])
          {
            uint64_t v28 = 0;
            uint64_t v21 = 18;
            do
            {
              if (*((_WORD *)&v32 + v28)) {
                float v29 = (float)*((__int16 *)&v34 + v28) / (float)*((__int16 *)&v32 + v28);
              }
              else {
                float v29 = 0.0;
              }
              *((float *)v38 + v28) = v29;
              *((_WORD *)&v36[1] + v28 + 4) = bundleEngagementRatioFeatures[v28];
              ++v28;
            }
            while (v28 != 6);
          }
          else
          {
            uint64_t v21 = 12;
          }
        }
      }
    }
    else
    {
      uint64_t v21 = 6;
    }
  }
  else
  {
    uint64_t v21 = 6;
  }
  uint64_t v27 = objc_msgSend(v9, "L2FeatureVector", v30);
  [v27 setScores:v37 forFeatures:v36 count:v21];
}

- (void)setRenderEngagementFeaturesForItem:(id)a3 counts:(id)a4 isRender:(BOOL)a5 bundleDict:(id)a6
{
  BOOL v23 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  int v30 = 0;
  uint64_t v29 = 0;
  if ([v10 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v21 = v11;
      id v22 = v9;
      int v15 = 0;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v15 > 5) {
              goto LABEL_14;
            }
            *((_WORD *)&v29 + v15++) = [v18 shortValue];
          }
          else if (self->_isInternalDevice)
          {
            getpid();
            uint64_t v19 = [NSString stringWithFormat:@"render/engagment count is not a number but:%@ isRender:%d", v18, v23];
            SimulateCrash();
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
LABEL_14:

      BOOL v20 = v15 == 6;
      id v9 = v22;
      id v11 = v21;
      if (v20) {
        [(PRSRankingItemRanker *)self setRenderEngagementFeaturesForItemAsShorts:v22 counts:&v29 isRender:v23 bundleDict:v21];
      }
    }
    else
    {
    }
  }
}

- (void)prepareForPurePommesL2RankingWithItems:(id)a3 inBundle:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] && !self->_isCancelled)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "populateOnlyPommesFeaturesForBundleID:queryID:isSearchToolClient:", v7, self->_queryID, -[PRSRankingItemRanker isSearchToolClient](self, "isSearchToolClient", (void)v13));
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)prepareItems:(id)a3 inBundle:(id)a4
{
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  if ([v6 count] && !self->_isCancelled)
  {
    id v8 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = [v6 count];
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_1BDB2A000, v8, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Model> preparing %lu items for bundle %@", buf, 0x16u);
    }

    uint64_t v9 = +[SSRankingManager getCoreDuetValues];
    uint64_t v130 = malloc_type_calloc(0x2EuLL, 4uLL, 0x100004052888210uLL);
    -[PRSRankingItemRanker resetbundleFeaturesScratchBuf:](self, "resetbundleFeaturesScratchBuf:");
    p_searchString = (void **)&self->_searchString;
    uint64_t v113 = SSPhraseQueryUnquoteString(self->_searchString);
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F237B8]) initWithQuery:v113 language:self->_keyboardLanguage isCJK:self->_isCJK fuzzyThreshold:0 options:0];
    [v10 setMatchOncePerTerm:0];
    [v10 setCountQPUSpecialToken:self->_countQPUSpecialToken];
    uint64_t v129 = v10;
    [v10 setItemQPQUOutputTokenInfo:self->_itemQPQUOutputTokenInfo];
    uint64_t v11 = [(PRSRankingItemRanker *)self parsedQueryFromQU];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F237B8]);
      long long v14 = [(PRSRankingItemRanker *)self parsedQueryFromQU];
      long long v15 = (void *)[v13 initWithQuery:v14 language:self->_keyboardLanguage isCJK:self->_isCJK fuzzyThreshold:0 options:0];

      [v15 setMatchOncePerTerm:0];
      [v15 setCountQPUSpecialToken:self->_countQPUSpecialToken];
      uint64_t v128 = v15;
      [v15 setItemQPQUOutputTokenInfo:self->_itemQPQUOutputTokenInfo];
    }
    else
    {
      uint64_t v128 = 0;
    }
    long long v16 = [(PRSRankingItemRanker *)self parsedPersonFromQU];
    uint64_t v17 = [v16 length];

    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F237B8]);
      uint64_t v19 = [(PRSRankingItemRanker *)self parsedPersonFromQU];
      BOOL v20 = (void *)[v18 initWithQuery:v19 language:self->_keyboardLanguage isCJK:self->_isCJK fuzzyThreshold:0 options:0];

      [v20 setMatchOncePerTerm:0];
      [v20 setCountQPUSpecialToken:self->_countQPUSpecialToken];
      uint64_t v127 = v20;
      [v20 setItemQPQUOutputTokenInfo:self->_itemQPQUOutputTokenInfo];
    }
    else
    {
      uint64_t v127 = 0;
    }
    id v21 = [(PRSRankingItemRanker *)self parsedArgSearchTermFromQU];
    uint64_t v22 = [v21 length];

    if (v22)
    {
      id v23 = objc_alloc(MEMORY[0x1E4F237B8]);
      long long v24 = [(PRSRankingItemRanker *)self parsedArgSearchTermFromQU];
      long long v25 = (void *)[v23 initWithQuery:v24 language:self->_keyboardLanguage isCJK:self->_isCJK fuzzyThreshold:0 options:0];

      uint64_t v126 = v25;
      [v25 setMatchOncePerTerm:0];
    }
    else
    {
      uint64_t v126 = 0;
    }
    uint64_t v131 = (void *)v9;
    long long v26 = SSGeneralLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[PRSRankingItemRanker prepareItems:inBundle:]((uint64_t)self, v129, v26);
    }

    long long v173 = 0u;
    long long v172 = 0u;
    long long v171 = 0u;
    long long v170 = 0u;
    long long v169 = 0u;
    long long v168 = 0u;
    long long v167 = 0u;
    long long v166 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    memset(buf, 0, sizeof(buf));
    prs_feature_population_ctx_init((uint64_t)buf, LOBYTE(self->_queryTermCount));
    uint64_t v117 = +[PRSRankingItemRanker importantAttributesForBundle:v7];
    uint64_t v115 = [v117 count];
    long long v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    id v114 = v6;
    id v28 = v6;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v142 objects:v162 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v143;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v143 != v31) {
            objc_enumerationMutation(v28);
          }
          int v33 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:-[PRSRankingItem inputToModelScore](*(void *)(*((void *)&v142 + 1) + 8 * i))];
          [v27 addObject:v33];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v142 objects:v162 count:16];
      }
      while (v30);
    }
    unint64_t v132 = self;

    [v27 sortWithOptions:1 usingComparator:&__block_literal_global_1034];
    unint64_t v34 = [v28 count];
    unint64_t v35 = [v27 count];
    unint64_t v36 = [v28 count];
    id v125 = objc_alloc_init(MEMORY[0x1E4F89ED0]);
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    obuint64_t j = v28;
    uint64_t v119 = v7;
    uint64_t v37 = v130;
    uint64_t v123 = [obj countByEnumeratingWithState:&v138 objects:v161 count:16];
    unint64_t v112 = v34;
    if (v123)
    {
      float v38 = (float)v35;
      float v39 = (float)v34;
      float v40 = (float)v36;
      uint64_t v121 = *(void *)v139;
      while (2)
      {
        for (uint64_t j = 0; j != v123; ++j)
        {
          if (*(void *)v139 != v121) {
            objc_enumerationMutation(obj);
          }
          uint64_t v42 = *(void **)(*((void *)&v138 + 1) + 8 * j);
          uint64_t v43 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:-[PRSRankingItem inputToModelScore]((uint64_t)v42)];
          unint64_t v44 = [v27 indexOfObject:v43];

          long long v159 = 0u;
          long long v160 = 0u;
          long long v157 = 0u;
          long long v158 = 0u;
          long long v155 = 0u;
          long long v156 = 0u;
          *(_OWORD *)&v154[4] = 0u;
          uint64_t v151 = 0;
          long long v149 = 0u;
          long long v150 = 0u;
          long long v148 = 0u;
          *(float *)uint64_t v152 = (float)(v44 + 1);
          *(float *)&int64_t v153 = (float)v44 / v38;
          *((float *)&v153 + 1) = v39;
          *(float *)uint64_t v154 = v40;
          uint64_t v147 = 0x760018E018B018ALL;
          [(PRSRankingItemRanker *)v132 lastIsSpaceFeature];
          *(_DWORD *)&v154[4] = v45;
          LOWORD(v148) = 67;
          if (v131)
          {
            int v46 = [v131 objectForKey:v7];

            if (v46)
            {
              uint64_t v48 = [v131 objectForKey:v7];
              [v48 floatValue];
              int v50 = v49;
            }
            else
            {
              int v50 = 0;
            }
            LODWORD(v47) = v50;
            +[PRSRankingUtilities floatValue:2 withSigFigs:v47];
            *(_DWORD *)&v154[8] = v52;
            WORD1(v148) = 1930;
            uint64_t v51 = 6;
          }
          else
          {
            uint64_t v51 = 5;
          }
          if ([(__CFString *)v7 isEqualToString:@"com.apple.mobilesafari"])
          {
            int v137 = 0;
            SSCompactRankingAttrsGetFloat([v42 attributes], 0x41uLL, &v137);
            *(_DWORD *)&v152[4 * v51] = v137;
            uint64_t v53 = v51 + 1;
            *((_WORD *)&v147 + v51) = 329;
            uint64_t v54 = SSCompactRankingAttrsGetValue((int8x8_t *)[v42 attributes], 9uLL);
            uint64_t v55 = v54;
            if (v54)
            {
              [v54 timeIntervalSinceReferenceDate];
              *(float *)&v152[4 * v53] = (float)((uint64_t)v56 / -86400 + (uint64_t)(v132->_currentTime / 86400.0));
              *((_WORD *)&v147 + v53) = 330;
              uint64_t v53 = v51 + 2;
            }

            uint64_t v51 = v53;
          }
          uint64_t v57 = [v42 L2FeatureVector];
          [v57 setScores:v152 forFeatures:&v147 count:v51];
          if (v132->_isCancelled)
          {
            prs_feature_population_ctx_destroy((uint64_t)buf);
            if (v130) {
              free(v130);
            }

            uint64_t v91 = obj;
            uint64_t v92 = (void *)v113;
            id v6 = v114;
            uint64_t v66 = v131;
            goto LABEL_107;
          }
          CFArrayRef v58 = +[PRSRankingItemRanker itemSpecificImportantAttributesForBundle:v7 withItem:v42];
          CFArrayRef v59 = v58;
          if (v58)
          {
            *(void *)&buf[16] = v58;
            CFIndex Count = CFArrayGetCount(v58);
          }
          else
          {
            CFIndex Count = v115;
            *(void *)&buf[16] = v117;
          }
          *(void *)&long long v173 = Count;
          uint64_t keyboardLanguage = (uint64_t)v132->_keyboardLanguage;
          uint64_t isCJK = v132->_isCJK;
          unsigned __int8 v110 = [(PRSRankingItemRanker *)v132 isSearchToolClient];
          uint64_t v63 = (uint64_t)v42;
          uint64_t v37 = v130;
          -[PRSRankingItem populateFeaturesWithEvaluator:updatingBundleFeatures:withContext:keyboardLanguage:isCJK:currentTime:withRanker:attributeHolder:quParsedEvaluator:isSearchToolClient:quParsedPersonEvaluator:quParsedArgSearchTermsEvaluator:](v63, (uint64_t)v129, (uint64_t)v130, (uint64_t)buf, keyboardLanguage, isCJK, (uint64_t)v132, (uint64_t)v125, v128, v110, v127, v126);

          id v7 = v119;
        }
        uint64_t v123 = [obj countByEnumeratingWithState:&v138 objects:v161 count:16];
        if (v123) {
          continue;
        }
        break;
      }
    }

    uint64_t v64 = v132;
    unint64_t v65 = 0x1E4F1C000;
    uint64_t v66 = v131;
    if (SSEnableSearchToolCleanSlate([(PRSRankingItemRanker *)v132 isSearchToolClient])
      && SSEnableTextSemanticSearchCalibration()
      && v132->_queryEmbedding)
    {
      uint64_t v67 = SSPommesRankerLog();
      os_signpost_id_t v68 = os_signpost_id_generate(v67);
      uint64_t v69 = v67;
      uint64_t v70 = v69;
      unint64_t v122 = v68 - 1;
      if (v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
      {
        *(_WORD *)uint64_t v152 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BDB2A000, v70, OS_SIGNPOST_INTERVAL_BEGIN, v68, "SearchToolCalibration", "Begin", v152, 2u);
      }

      if (prepareItems_inBundle__onceTokenCalibration != -1) {
        dispatch_once(&prepareItems_inBundle__onceTokenCalibration, &__block_literal_global_1038);
      }
      if (prepareItems_inBundle__searchToolCalibrationModel
        && ([(id)prepareItems_inBundle__searchToolCalibrationModel loaded] & 1) != 0)
      {
        uint64_t v116 = v70;
        os_signpost_id_t v120 = v68;
        uint64_t v71 = SSGeneralLog();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          int64_t queryID = v132->_queryID;
          uint64_t v73 = SSRedactString(v132->_searchString, 1);
          *(float *)uint64_t v152 = 3.8521e-34;
          int64_t v153 = queryID;
          *(_WORD *)uint64_t v154 = 2112;
          *(void *)&v154[2] = v73;
          _os_log_impl(&dword_1BDB2A000, v71, OS_LOG_TYPE_INFO, "[qid=%ld][SpotlightRanking][Calibration] search tool calibration enabled for query(%@)", v152, 0x16u);
        }
        uint64_t v74 = [obj count];
        uint64_t v75 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v74];
        uint64_t v124 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v74];
        if (v74)
        {
          for (uint64_t k = 0; k != v74; ++k)
          {
            uint64_t v77 = [obj objectAtIndexedSubscript:k];
            uint64_t v78 = -[PRSRankingItem embedding]((uint64_t)v77);

            if (v78)
            {
              uint64_t v79 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:k];
              [v75 addObject:v79];

              uint64_t v80 = [obj objectAtIndexedSubscript:k];
              uint64_t v81 = -[PRSRankingItem embedding]((uint64_t)v80);
              [v124 addObject:v81];
            }
          }
        }
        uint64_t v82 = [v75 count];
        uint64_t v83 = [(id)prepareItems_inBundle__searchToolCalibrationModel batchPredict:v132->_queryEmbedding documentEmbeddings:v124 queryID:v132->_queryID];
        if (v82 == [v83 count])
        {
          if (v82)
          {
            for (uint64_t m = 0; m != v82; ++m)
            {
              uint64_t v85 = [v83 objectAtIndexedSubscript:m];
              [v85 floatValue];
              int v87 = v86;
              uint64_t v88 = [v75 objectAtIndexedSubscript:m];
              uint64_t v89 = objc_msgSend(obj, "objectAtIndexedSubscript:", objc_msgSend(v88, "unsignedIntegerValue"));
              LODWORD(v90) = v87;
              [v89 setCalibratedEmbeddingSimilarity:v90];
            }
          }
        }
        else
        {
          uint64_t v93 = SSGeneralLog();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
          {
            int64_t v94 = v132->_queryID;
            *(float *)uint64_t v152 = 3.852e-34;
            int64_t v153 = v94;
            _os_log_impl(&dword_1BDB2A000, v93, OS_LOG_TYPE_INFO, "[qid=%ld][SpotlightRanking][Calibration] calibrated score count does not match the calibrated item count", v152, 0xCu);
          }
        }
        id v7 = v119;
        os_signpost_id_t v68 = v120;
        uint64_t v37 = v130;
        uint64_t v66 = v131;
        unint64_t v65 = 0x1E4F1C000uLL;
        uint64_t v70 = v116;
      }
      else
      {
        uint64_t v75 = SSGeneralLog();
        id v7 = v119;
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
          -[PRSRankingItemRanker prepareItems:inBundle:]((uint64_t)v132, p_searchString);
        }
      }

      uint64_t v95 = v70;
      uint64_t v96 = v95;
      if (v122 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v95))
      {
        *(_WORD *)uint64_t v152 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BDB2A000, v96, OS_SIGNPOST_INTERVAL_END, v68, "SearchToolCalibration", "End", v152, 2u);
      }

      uint64_t v64 = v132;
    }
    uint64_t v97 = 46;
    uint64_t v91 = (void *)[objc_alloc(*(Class *)(v65 + 2632)) initWithCapacity:46];
    do
    {
      [v91 addObject:&unk_1F1863F68];
      --v97;
    }
    while (v97);
    uint64_t v99 = 0;
    id v6 = v114;
    do
    {
      if ((unint64_t)(v99 - 34) >= 2)
      {
        if (v99 == 33)
        {
          uint64_t v100 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v112];
          uint64_t v101 = v91;
          uint64_t v102 = v100;
          uint64_t v103 = 33;
        }
        else if (v99)
        {
          LODWORD(v98) = v37[v99];
          uint64_t v100 = [MEMORY[0x1E4F28ED0] numberWithFloat:v98];
          uint64_t v101 = v91;
          uint64_t v102 = v100;
          uint64_t v103 = v99;
        }
        else
        {
          uint64_t v100 = [v27 objectAtIndexedSubscript:0];
          uint64_t v101 = v91;
          uint64_t v102 = v100;
          uint64_t v103 = 0;
        }
        [v101 setObject:v102 atIndexedSubscript:v103];

        uint64_t v66 = v131;
      }
      ++v99;
    }
    while (v99 != 46);
    if (!v7) {
      id v7 = &stru_1F1824018;
    }
    pthread_mutex_lock(&sBundleMapLock);
    uint64_t v104 = [(PRSRankingItemRanker *)v64 bundleFeatures];
    [v104 setObject:v91 forKey:v7];

    pthread_mutex_unlock(&sBundleMapLock);
    +[PRSRankingItemRelativeFeatureContext relativeContextsForBundle:v7 currentTime:v64->_currentTime];
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v105 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v106 = [v105 countByEnumeratingWithState:&v133 objects:v146 count:16];
    if (v106)
    {
      uint64_t v107 = v106;
      uint64_t v108 = *(void *)v134;
      while (2)
      {
        for (uint64_t n = 0; n != v107; ++n)
        {
          if (*(void *)v134 != v108) {
            objc_enumerationMutation(v105);
          }
          if (v64->_isCancelled)
          {
            prs_feature_population_ctx_destroy((uint64_t)buf);
            if (v130) {
              free(v130);
            }

            goto LABEL_106;
          }
          [(PRSRankingItemRanker *)v64 computeRelativeFeatureForContext:*(void *)(*((void *)&v133 + 1) + 8 * n) items:obj];
        }
        uint64_t v107 = [v105 countByEnumeratingWithState:&v133 objects:v146 count:16];
        if (v107) {
          continue;
        }
        break;
      }
    }

    if (v130) {
      free(v130);
    }
    prs_feature_population_ctx_destroy((uint64_t)buf);
LABEL_106:
    uint64_t v92 = (void *)v113;

LABEL_107:
  }
}

uint64_t __46__PRSRankingItemRanker_prepareItems_inBundle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 unsignedLongLongValue];
  unint64_t v6 = [v4 unsignedLongLongValue];

  if (v5 <= v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = -1;
  }
  if (v5 < v6) {
    return 1;
  }
  else {
    return v7;
  }
}

uint64_t __46__PRSRankingItemRanker_prepareItems_inBundle___block_invoke_1036()
{
  uint64_t v0 = [[CalibrationModelManager alloc] initWithChunkSize:2];
  id v1 = (void *)prepareItems_inBundle__searchToolCalibrationModel;
  prepareItems_inBundle__searchToolCalibrationModel = (uint64_t)v0;

  id v2 = (void *)prepareItems_inBundle__searchToolCalibrationModel;
  return [v2 loadModel];
}

- (void)prepareItemsForL1Ranking:(id)a3 inBundle:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] && !self->_isCancelled)
  {
    id v8 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v20 = [v6 count];
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_1BDB2A000, v8, OS_LOG_TYPE_INFO, "[SpotlightRanking] <Model> preparing %lu items for L1 Ranking with bundle %@", buf, 0x16u);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "populateOnlyPommesL1RankingFeaturesWithQueryID:isSearchToolClient:", self->_queryID, -[PRSRankingItemRanker isSearchToolClient](self, "isSearchToolClient", (void)v14));
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)prepareParsecResults:(id)a3 inBundle:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] && !self->_isCancelled)
  {
    id v8 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = [v6 count];
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_1BDB2A000, v8, OS_LOG_TYPE_INFO, "[SpotlightRanking] <Model> preparing %lu results for parsec bundle %@", buf, 0x16u);
    }

    uint64_t v23 = SSPhraseQueryUnquoteString(self->_searchString);
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F237B8]) initWithQuery:v23 language:self->_keyboardLanguage fuzzyThreshold:0 options:0];
    [v9 setMatchOncePerTerm:0];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    memset(buf, 0, sizeof(buf));
    prs_feature_population_ctx_init((uint64_t)buf, LOBYTE(self->_queryTermCount));
    *(void *)&buf[16] = +[PRSRankingItemRanker importantAttributesForParsecBundle:v7];
    *(void *)&long long v42 = CFArrayGetCount(*(CFArrayRef *)&buf[16]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v24 = v6;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v16 = [v15 rankingItem];
          uint64_t v19 = (void *)v16;
          if (self->_isCancelled)
          {
            prs_feature_population_ctx_destroy((uint64_t)buf);

            goto LABEL_20;
          }
          [(PRSRankingItem *)v16 populateFeaturesWithEvaluator:(uint64_t)buf withContext:(uint64_t)self->_keyboardLanguage keyboardLanguage:self->_isCJK isCJK:(uint64_t)v15 currentTime:v17 forParsecResult:v18];
          memset(v30, 0, sizeof(v30));
          memset(v29, 0, sizeof(v29));
          [(PRSRankingItemRanker *)self lastIsSpaceFeature];
          LODWORD(v30[0]) = v20;
          LOWORD(v29[0]) = 2295;
          BOOL v21 = hasParsecPolicyPhraseMatch(v19, self->_queryTermCount, self->_exact);
          if (self->_queryTermCount >= 2 && v21)
          {
            DWORD1(v30[0]) = 1065353216;
            WORD1(v29[0]) = 2088;
            if (![(PRSRankingItemRanker *)self hasParsecPolicyPhraseMatch]) {
              [(PRSRankingItemRanker *)self setHasParsecPolicyPhraseMatch:1];
            }
          }
          else
          {
            DWORD1(v30[0]) = 0;
            WORD1(v29[0]) = 2088;
          }
          id v22 = [v19 L2FeatureVector];
          [v22 setScores:v30 forFeatures:v29 count:2];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    prs_feature_population_ctx_destroy((uint64_t)buf);
LABEL_20:

    id v6 = v24;
  }
}

- (id)filterRankedItems:(id)a3 bundle:(id)a4 userQuery:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (filterRankedItems_bundle_userQuery__lastTopItem
    && ([(id)filterRankedItems_bundle_userQuery__lastUserQuery isEqualToString:v10] & 1) == 0)
  {
    uint64_t v11 = (void *)filterRankedItems_bundle_userQuery__lastUserQuery;
    filterRankedItems_bundle_userQuery__lastUserQuery = 0;

    uint64_t v12 = (void *)filterRankedItems_bundle_userQuery__lastTopItem;
    filterRankedItems_bundle_userQuery__lastTopIteuint64_t m = 0;

    filterRankedItems_bundle_userQuery__lastTopItemIsLowerC = -1082130432;
    filterRankedItems_bundle_userQuery__lastTopItemIsLowerC0 = -1082130432;
    filterRankedItems_bundle_userQuery__lastTopItemIsUpper6 = -1082130432;
    filterRankedItems_bundle_userQuery__lastTopItemIsUpper6_r = -1082130432;
    filterRankedItems_bundle_userQuery__lastTopItemIsUpper7_r = -1082130432;
    filterRankedItems_bundle_userQuery__lastTopItemIsLower = -1082130432;
    filterRankedItems_bundle_userQuery__lastTopItemIsLowest = -1082130432;
    filterRankedItems_bundle_userQuery__lastTopItemIsNotMatched = -1082130432;
    uint64_t v13 = (void *)filterRankedItems_bundle_userQuery__lastTopItemDate;
    filterRankedItems_bundle_userQuery__lastTopItemDate = 0;

    filterRankedItems_bundle_userQuery__lastTopItemInterval = 0;
  }
  uint64_t v14 = [v8 count];
  if (v14)
  {
    unint64_t v15 = v14;
    if ([v9 isEqualToString:@"com.apple.mobilemail"])
    {
      obuint64_t j = a5;
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
      if (filterRankedItems_bundle_userQuery__lastTopItem)
      {
        id v17 = (id)filterRankedItems_bundle_userQuery__lastTopItem;
        int v80 = filterRankedItems_bundle_userQuery__lastTopItemIsLowerC0;
        int v81 = filterRankedItems_bundle_userQuery__lastTopItemIsLowerC;
        int v78 = filterRankedItems_bundle_userQuery__lastTopItemIsUpper6_r;
        int v79 = filterRankedItems_bundle_userQuery__lastTopItemIsUpper6;
        int v76 = filterRankedItems_bundle_userQuery__lastTopItemIsLower;
        int v77 = filterRankedItems_bundle_userQuery__lastTopItemIsUpper7_r;
        int v74 = filterRankedItems_bundle_userQuery__lastTopItemIsNotMatched;
        int v75 = filterRankedItems_bundle_userQuery__lastTopItemIsLowest;
        id v71 = (id)filterRankedItems_bundle_userQuery__lastTopItemDate;
        unint64_t v18 = 0;
        uint64_t v73 = filterRankedItems_bundle_userQuery__lastTopItemInterval;
      }
      else
      {
        id v17 = [v8 firstObject];
        int v20 = [v17 L2FeatureVector];
        [v20 scoreForFeature:2425];
        int v81 = v21;

        id v22 = [v17 L2FeatureVector];
        [v22 scoreForFeature:2424];
        int v80 = v23;

        id v24 = [v17 L2FeatureVector];
        [v24 scoreForFeature:2417];
        int v79 = v25;

        long long v26 = [v17 L2FeatureVector];
        [v26 scoreForFeature:2418];
        int v78 = v27;

        long long v28 = [v17 L2FeatureVector];
        [v28 scoreForFeature:2422];
        int v77 = v29;

        uint64_t v30 = [v17 L2FeatureVector];
        [v30 scoreForFeature:2426];
        int v76 = v31;

        uint64_t v32 = [v17 L2FeatureVector];
        [v32 scoreForFeature:2427];
        int v75 = v33;

        long long v34 = [v17 L2FeatureVector];
        [v34 scoreForFeature:2428];
        int v74 = v35;

        id v71 = [v17 interestingDate];
        [v71 timeIntervalSinceReferenceDate];
        uint64_t v73 = v36;
        [v16 addObject:v17];
        unint64_t v18 = 1;
      }
      if (v18 < v15)
      {
        do
        {
          long long v37 = [v8 objectAtIndex:v18];
          long long v38 = [v37 L2FeatureVector];
          [v38 scoreForFeature:2425];
          float v40 = v39;

          long long v41 = [v37 L2FeatureVector];
          [v41 scoreForFeature:2424];
          float v43 = v42;

          unint64_t v44 = [v37 L2FeatureVector];
          [v44 scoreForFeature:2417];
          float v46 = v45;

          double v47 = [v37 L2FeatureVector];
          [v47 scoreForFeature:2418];
          float v49 = v48;

          int v50 = [v37 L2FeatureVector];
          [v50 scoreForFeature:2422];
          float v52 = v51;

          uint64_t v53 = [v37 L2FeatureVector];
          [v53 scoreForFeature:2426];
          float v55 = v54;

          double v56 = [v37 L2FeatureVector];
          [v56 scoreForFeature:2427];
          float v58 = v57;

          CFArrayRef v59 = [v37 L2FeatureVector];
          [v59 scoreForFeature:2428];
          float v61 = v60;

          LODWORD(v63) = -1.0;
          if (self->_isFuzzySearch) {
            goto LABEL_13;
          }
          BOOL v64 = v40 == 1.0;
          if (v43 == 1.0) {
            BOOL v64 = 1;
          }
          if (v46 == 1.0) {
            BOOL v64 = 1;
          }
          if (v49 == 1.0) {
            BOOL v64 = 1;
          }
          if (v52 == 1.0) {
            BOOL v64 = 1;
          }
          if (v55 == 1.0) {
            BOOL v64 = 1;
          }
          if (v58 == 1.0) {
            BOOL v64 = 1;
          }
          if ((v64 || v61 == 1.0)
            && *(float *)&v81 == -1.0
            && *(float *)&v80 == -1.0
            && *(float *)&v79 == -1.0
            && *(float *)&v78 == -1.0
            && *(float *)&v77 == -1.0
            && *(float *)&v76 == -1.0
            && *(float *)&v75 == -1.0
            && (LODWORD(v62) = v74, *(float *)&v74 == 0.0))
          {
            unint64_t v65 = objc_msgSend(v37, "interestingDate", v62, v63);
            [v65 timeIntervalSinceReferenceDate];
            if (v66 < *(double *)&v73 && (v61 != 1.0 || !filterRankedItems_bundle_userQuery__lastTopItem)) {
              [v16 addObject:v37];
            }
          }
          else
          {
LABEL_13:
            [v16 addObject:v37];
          }

          ++v18;
        }
        while (v15 != v18);
      }
      objc_storeStrong((id *)&filterRankedItems_bundle_userQuery__lastUserQuery, obj);
      uint64_t v67 = (void *)filterRankedItems_bundle_userQuery__lastTopItem;
      filterRankedItems_bundle_userQuery__lastTopIteuint64_t m = (uint64_t)v17;
      id v68 = v17;

      filterRankedItems_bundle_userQuery__lastTopItemIsLowerC = v81;
      filterRankedItems_bundle_userQuery__lastTopItemIsLowerC0 = v80;
      filterRankedItems_bundle_userQuery__lastTopItemIsUpper6 = v79;
      filterRankedItems_bundle_userQuery__lastTopItemIsUpper6_r = v78;
      filterRankedItems_bundle_userQuery__lastTopItemIsUpper7_r = v77;
      filterRankedItems_bundle_userQuery__lastTopItemIsLower = v76;
      filterRankedItems_bundle_userQuery__lastTopItemIsLowest = v75;
      filterRankedItems_bundle_userQuery__lastTopItemIsNotMatched = v74;
      uint64_t v69 = (void *)filterRankedItems_bundle_userQuery__lastTopItemDate;
      filterRankedItems_bundle_userQuery__lastTopItemDate = (uint64_t)v71;

      filterRankedItems_bundle_userQuery__lastTopItemInterval = v73;
      id v19 = v16;
    }
    else
    {
      id v19 = v8;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)requery:(id *)a3
{
  float v48 = a3;
  uint64_t v47 = (uint64_t)&v47;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = 3 * self->_queryTermCount;
  float v49 = (char *)(&v47 - 12 * self->_queryTermCount);
  uint64_t v5 = 32 * v4;
  if (32 * v4)
  {
    id v6 = (uint64_t *)v49;
    do
    {
      uint64_t *v6 = 0;
      v6[2] = 0;
      v6[5] = 0;
      v6 += 6;
    }
    while (v6 != &v47);
  }
  CFIndex queryTermCount = self->_queryTermCount;
  bzero(v49, 96 * queryTermCount);
  CFBinaryHeapRef v54 = CFBinaryHeapCreate(0, queryTermCount, &nextResultHeapCallBacks, 0);
  +[PRSRankingItemRanker embeddingForLanguage:](PRSRankingItemRanker, "embeddingForLanguage:", self->_keyboardLanguage, v47);
  id v51 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_queryTermCount) {
    goto LABEL_42;
  }
  id v8 = 0;
  uint64_t v53 = 0;
  float v52 = &v63;
  int v50 = &v64;
  id v9 = (id *)(v49 + 40);
  do
  {
    id v10 = [(NSArray *)self->_queryTerms objectAtIndex:v8];
    uint64_t v11 = [v10 lowercaseString];

    uint64_t v60 = 0;
    float v61 = &v60;
    uint64_t v62 = 0x3032000000;
    double v63 = __Block_byref_object_copy__12;
    BOOL v64 = __Block_byref_object_dispose__12;
    id v65 = 0;
    uint64_t v56 = 0;
    float v57 = &v56;
    uint64_t v58 = 0x2020000000;
    uint64_t v59 = 0;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __32__PRSRankingItemRanker_requery___block_invoke;
    v55[3] = &unk_1E635AF68;
    v55[4] = &v60;
    v55[5] = &v56;
    [v51 enumerateNeighborsForString:v11 maximumCount:5 maximumDistance:0 distanceType:v55 usingBlock:0.75];
    uint64_t v12 = v57[3];
    if (v12)
    {
      objc_storeStrong(v9 - 5, (id)v61[5]);
      *(v9 - 4) = (id)v57[3];
      uint64_t v13 = [(id)v61[5] firstObject];
      uint64_t v14 = *(v9 - 3);
      *(v9 - 3) = (id)v13;

      *((_WORD *)v9 - 8) = 0;
      *(v9 - 1) = v8;
      objc_storeStrong(v9, v11);
      CFBinaryHeapAddValue(v54, v9 - 5);
      v53 += v12;
    }
    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v60, 8);

    ++v8;
    unint64_t v15 = self->_queryTermCount;
    v9 += 6;
  }
  while ((unint64_t)v8 < v15);
  if ((unint64_t)v53 > 4) {
    goto LABEL_21;
  }
  if (v15)
  {
    unint64_t v16 = 0;
    do
    {
      id v17 = [(NSArray *)self->_queryTerms objectAtIndex:v16];
      float v52 = [v17 lowercaseString];

      unint64_t v18 = SSAllLengthyOriginals(v52, self->_keyboardLanguage);
      uint64_t v19 = [v18 count];
      if (v19)
      {
        uint64_t v20 = 0;
        int v21 = 0;
        do
        {
          if (!v21) {
            int v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
          }
          id v22 = [v18 objectAtIndex:v20];
          int v23 = [[NeighborItem alloc] initWithNeighbor:v22 type:1 distance:v20 position:99.0];
          [v21 addObject:v23];

          ++v20;
        }
        while (v19 != v20);
        id v24 = (id *)&v49[48 * v16];
        objc_storeStrong(v24, v21);
        *(void *)&v49[48 * v16 + 8] = v19;
        uint64_t v25 = [v21 firstObject];
        long long v26 = &v49[48 * v16];
        int v27 = (void *)*((void *)v26 + 2);
        *((void *)v26 + 2) = v25;

        long long v28 = &v49[48 * v16];
        *((_WORD *)v28 + 12) = 0;
        *((void *)v28 + 4) = v16;
        objc_storeStrong((id *)v28 + 5, v52);
        CFBinaryHeapAddValue(v54, v24);
        v53 += v19;
      }
      else
      {
        int v21 = 0;
      }

      ++v16;
    }
    while (v16 < self->_queryTermCount);
  }
  if (v53)
  {
LABEL_21:
    uint64_t v53 = 0;
    unsigned __int16 v29 = 0;
    do
    {
      Minimuuint64_t m = (id *)CFBinaryHeapGetMinimum(v54);
      if (!Minimum) {
        break;
      }
      int v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:self->_queryTermCount];
      if (self->_queryTermCount)
      {
        unint64_t v32 = 0;
        char v33 = 0;
        uint64_t v34 = -1;
        do
        {
          if ((v33 & 1) != 0 || (id)v32 != Minimum[4])
          {
            float v39 = [(NSArray *)self->_queryTerms objectAtIndex:v32];
            [v31 addObject:v39];
          }
          else
          {
            id v35 = Minimum[2];
            uint64_t v36 = [v35 neighbor];
            [v31 addObject:v36];

            CFBinaryHeapRemoveMinimumValue(v54);
            unint64_t v37 = *((unsigned __int16 *)Minimum + 12) + 1;
            if (v37 < (unint64_t)Minimum[1])
            {
              long long v38 = [*Minimum objectAtIndex:*((unsigned __int16 *)Minimum + 12) + 1];
              objc_storeStrong(Minimum + 2, v38);
              *((_WORD *)Minimum + 12) = v37;
              CFBinaryHeapAddValue(v54, Minimum);
            }
            float v39 = 0;
            ++v29;
            char v33 = 1;
            uint64_t v34 = v32;
          }

          ++v32;
        }
        while (v32 < self->_queryTermCount);
      }
      else
      {
        uint64_t v34 = -1;
      }
      float v40 = [v31 componentsJoinedByString:@" "];
      long long v41 = v40;
      if (v34 != self->_queryTermCount - 1 && self->_lastIsSpaceFeature != 0.0)
      {
        uint64_t v42 = [v40 stringByAppendingString:@" "];

        long long v41 = (void *)v42;
      }
      if (v29 == 1)
      {
        float v43 = v41;

        uint64_t v53 = v43;
      }
      else
      {
        [NSString stringWithFormat:@"(** =\"%@*\"cwdt)", v41];
        float v43 = (char *)objc_claimAutoreleasedReturnValue();

        [*v48 addObject:v43];
      }
    }
    while (v29 < 5u);
    CFRelease(v54);
  }
  else
  {
LABEL_42:
    CFRelease(v54);
    uint64_t v53 = 0;
  }

  if (v5)
  {
    unint64_t v44 = v49 - 48;
    do
    {
      __destructor_8_s0_s16_s40((uint64_t)&v44[v5]);
      v5 -= 48;
    }
    while (v5);
  }
  id v45 = v53;
  return v45;
}

void __32__PRSRankingItemRanker_requery___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v9 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  id v8 = [[NeighborItem alloc] initWithNeighbor:v9 type:0 distance:99 position:a3];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (BOOL)pommes
{
  return self->_pommes;
}

- (void)setPommes:(BOOL)a3
{
  self->_pommes = a3;
}

- (void)setKeyboardLanguage:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (NSString)userQueryString
{
  return self->_userQueryString;
}

- (void)setUserQueryString:(id)a3
{
}

- (int64_t)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(int64_t)a3
{
  self->_int64_t queryID = a3;
}

- (int64_t)countQPUSpecialToken
{
  return self->_countQPUSpecialToken;
}

- (void)setCountQPUSpecialToken:(int64_t)a3
{
  self->_countQPUSpecialTokeuint64_t n = a3;
}

- (_CSEmbedding)queryEmbedding
{
  return self->_queryEmbedding;
}

- (void)setQueryEmbedding:(id)a3
{
}

- (NSString)parsedQueryFromQU
{
  return self->_parsedQueryFromQU;
}

- (void)setParsedQueryFromQU:(id)a3
{
}

- (NSString)parsedPersonFromQU
{
  return self->_parsedPersonFromQU;
}

- (void)setParsedPersonFromQU:(id)a3
{
}

- (NSString)parsedArgSearchTermFromQU
{
  return self->_parsedArgSearchTermFromQU;
}

- (void)setParsedArgSearchTermFromQU:(id)a3
{
}

- (NSArray)itemQPQUOutputTokenInfo
{
  return self->_itemQPQUOutputTokenInfo;
}

- (void)setItemQPQUOutputTokenInfo:(id)a3
{
}

- (NSArray)quIntentScores
{
  return self->_quIntentScores;
}

- (void)setQuIntentScores:(id)a3
{
}

- (NSArray)quIntentLabels
{
  return self->_quIntentLabels;
}

- (void)setQuIntentLabels:(id)a3
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

- (NSMapTable)bundleFeatures
{
  return self->_bundleFeatures;
}

- (void)setBundleFeatures:(id)a3
{
}

- (double)experimentalWeight1
{
  return self->_experimentalWeight1;
}

- (void)setExperimentalWeight1:(double)a3
{
  self->_experimentalWeight1 = a3;
}

- (double)experimentalWeight2
{
  return self->_experimentalWeight2;
}

- (void)setExperimentalWeight2:(double)a3
{
  self->_experimentalWeight2 = a3;
}

- (NSString)meContactIdentifier
{
  return self->_meContactIdentifier;
}

- (void)setMeContactIdentifier:(id)a3
{
}

- (NSString)clientBundle
{
  return self->_clientBundle;
}

- (void)setClientBundle:(id)a3
{
}

- (BOOL)policyDisabled
{
  return self->_policyDisabled;
}

- (void)setPolicyDisabled:(BOOL)a3
{
  self->_policyDisabled = a3;
}

- (float)lastIsSpaceFeature
{
  return self->_lastIsSpaceFeature;
}

- (void)setLastIsSpaceFeature:(float)a3
{
  self->_lastIsSpaceFeature = a3;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)isCJK
{
  return self->_isCJK;
}

- (void)setIsCJK:(BOOL)a3
{
  self->_uint64_t isCJK = a3;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (BOOL)hasPolicyMultipleTermsPhraseMatch
{
  return self->_hasPolicyMultipleTermsPhraseMatch;
}

- (void)setHasPolicyMultipleTermsPhraseMatch:(BOOL)a3
{
  self->_hasPolicyMultipleTermsPhraseMatch = a3;
}

- (BOOL)hasPolicySingleTermPhraseMatch
{
  return self->_hasPolicySingleTermPhraseMatch;
}

- (void)setHasPolicySingleTermPhraseMatch:(BOOL)a3
{
  self->_hasPolicySingleTermPhraseMatch = a3;
}

- (BOOL)hasParsecPolicyPhraseMatch
{
  return self->_hasParsecPolicyPhraseMatch;
}

- (void)setHasParsecPolicyPhraseMatch:(BOOL)a3
{
  self->_hasParsecPolicyPhraseMatch = a3;
}

- (BOOL)exact
{
  return self->_exact;
}

- (void)setExact:(BOOL)a3
{
  self->_exact = a3;
}

- (void)setIsContentWord:(BOOL)a3
{
  self->_isContentWord = a3;
}

- (void)setQueryTermCount:(unint64_t)a3
{
  self->_CFIndex queryTermCount = a3;
}

- (void)setQueryTermLength:(unint64_t)a3
{
  self->_queryTermLength = a3;
}

- (void)setIsAltNamePrefixMatchOnlyTopHitExcludedQuery:(BOOL)a3
{
  self->_isAltNamePrefixMatchOnlyTopHitExcludedQuery = a3;
}

- (void)setIsSpellCorrectPrefixMatchOnlyTopHitExcludedQuery:(BOOL)a3
{
  self->_isSpellCorrectPrefixMatchOnlyTopHitExcludedQuery = a3;
}

- (void)setContainsEnglishAlphabetInQuery:(BOOL)a3
{
  self->_containsEnglishAlphabetInQuery = a3;
}

- (void)setContainsDigitInQuery:(BOOL)a3
{
  self->_containsDigitInQuery = a3;
}

- (unint64_t)queryKind
{
  return self->_queryKind;
}

- (unint64_t)topHitMaxCount
{
  return self->_topHitMaxCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundle, 0);
  objc_storeStrong((id *)&self->_meContactIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleFeatures, 0);
  objc_storeStrong((id *)&self->_quIntentLabels, 0);
  objc_storeStrong((id *)&self->_quIntentScores, 0);
  objc_storeStrong((id *)&self->_itemQPQUOutputTokenInfo, 0);
  objc_storeStrong((id *)&self->_parsedArgSearchTermFromQU, 0);
  objc_storeStrong((id *)&self->_parsedPersonFromQU, 0);
  objc_storeStrong((id *)&self->_parsedQueryFromQU, 0);
  objc_storeStrong((id *)&self->_queryEmbedding, 0);
  objc_storeStrong((id *)&self->_userQueryString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_queryTerms, 0);
  objc_storeStrong((id *)&self->_rankCategories, 0);
  objc_storeStrong((id *)&self->_rankingConfiguration, 0);
}

- (void)parseQUQuery:(uint64_t)a1 isSearchToolClient:.cold.1(uint64_t a1)
{
  id v1 = SSRedactString(*(void **)(a1 + 64), 1);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_1BDB2A000, v2, v3, "[qid=%ld][SpotlightRanking][Calibration] query embedding is empty for query: (%@)", v4, v5, v6, v7, v8);
}

- (void)rankingConfigurationWithMeContact:(void *)a1 emailAddresses:(NSObject *)a2 phoneFavorites:vipList:clientBundle:isScopedSearch:isAdvancedSyntax:spotlightQuery:userQuery:tokenString:queryKind:isPeopleSearch:keyboardLanguage:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = 134219520;
  uint64_t v5 = [a1 dominantRankingQueryCount];
  __int16 v6 = 2048;
  uint64_t v7 = [a1 dominatedRankingQueryCount];
  __int16 v8 = 2048;
  uint64_t v9 = [a1 shortcutBit];
  __int16 v10 = 2048;
  uint64_t v11 = [a1 highMatchBit];
  __int16 v12 = 2048;
  uint64_t v13 = [a1 lowMatchBit];
  __int16 v14 = 2048;
  uint64_t v15 = [a1 highRecencyBit];
  __int16 v16 = 2048;
  uint64_t v17 = [a1 lowRecencyBit];
  _os_log_debug_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_DEBUG, "[SpotlightRanking] <Model> 1: dominantRankingQueryCount:%ld dominatedRankingQueryCount:%ld shortcutBit:%ld, highMatchBit:%ld, lowMatchBit:%ld, highRecencyBit:%ld, lowRecencyBit:%ld", (uint8_t *)&v4, 0x48u);
}

- (void)relevantResultSetPRSL2FeaturesFromBundleFeature:absRankFeatureOut:relRankFeatureOut:.cold.1()
{
}

- (void)resetbundleFeaturesScratchBuf:.cold.1()
{
}

- (void)prepareItems:(uint64_t)a1 inBundle:(void *)a2 .cold.1(uint64_t a1, void **a2)
{
  uint64_t v2 = SSRedactString(*a2, 1);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_1BDB2A000, v3, v4, "[qid=%ld][SpotlightRanking][Calibration] calibration model not loaded for query(%@)", v5, v6, v7, v8, v9);
}

- (void)prepareItems:(NSObject *)a3 inBundle:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 72);
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a2 countQPUSpecialToken];
  _os_log_debug_impl(&dword_1BDB2A000, a3, OS_LOG_TYPE_DEBUG, "[Spotlightranking] <Adjusted pommesL1> Query: %@, Number of QPU Token> %ld", (uint8_t *)&v5, 0x16u);
}

@end