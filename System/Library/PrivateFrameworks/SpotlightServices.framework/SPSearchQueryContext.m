@interface SPSearchQueryContext
+ (SPSearchQueryContext)queryContextWithSearchString:(id)a3;
+ (id)getAppEntityParams:(id)a3;
+ (id)llmQUIntentString:(unint64_t)a3;
+ (id)normalizeSearchString:(id)a3 queryContext:(id)a4;
+ (id)removeAppEntitySpecificStopwords:(id)a3 withEntityTypeIdentifier:(id)a4 bundleID:(id)a5;
- (BOOL)allowInternet;
- (BOOL)disableOCR;
- (BOOL)earliestTokenFromQU;
- (BOOL)enablePersonalAnswers;
- (BOOL)fetchL2Signals;
- (BOOL)forceQueryEvenIfSame;
- (BOOL)hasMarkedText;
- (BOOL)hasQueryTextEmbedding;
- (BOOL)hasSearchTerm;
- (BOOL)internalDebug;
- (BOOL)internalValidation;
- (BOOL)isAdvancedSyntax;
- (BOOL)isAppEntitySearch;
- (BOOL)isEventSearch;
- (BOOL)isFlightEventSearch;
- (BOOL)isFromLLMQUParse;
- (BOOL)isHotelEventSearch;
- (BOOL)isLLMQUIntentEventSearch;
- (BOOL)isPasscodeLocked;
- (BOOL)isPlural;
- (BOOL)isRestaurantEventSearch;
- (BOOL)isSingle;
- (BOOL)latestTokenFromQU;
- (BOOL)noTokenize;
- (BOOL)promoteLocalResults;
- (BOOL)promoteParsecResults;
- (BOOL)retainBackendData;
- (CSSuggestion)backingSearchModel;
- (NSArray)answerAttributes;
- (NSArray)bundleIDs;
- (NSArray)disabledApps;
- (NSArray)disabledBundles;
- (NSArray)disabledDomains;
- (NSArray)filterQueries;
- (NSArray)groupingRules;
- (NSArray)markedTextArray;
- (NSArray)searchDomains;
- (NSArray)searchEntities;
- (NSDate)referenceDate;
- (NSDictionary)queryUnderstandingOutput;
- (NSString)arrivalLocationFromQU;
- (NSString)clientBundleID;
- (NSString)departureLocationFromQU;
- (NSString)displayedText;
- (NSString)getTrimmedSearchString;
- (NSString)keyboardLanguage;
- (NSString)keyboardPrimaryLanguage;
- (NSString)normalizedSearchString;
- (NSString)parsedQueryFromQU;
- (NSString)searchString;
- (SPQUParse)spQUParse;
- (SPSearchQueryContext)init;
- (SPSearchQueryContext)initWithSearchString:(id)a3;
- (SPSearchQueryContext)initWithSearchString:(id)a3 currentTime:(double)a4;
- (SSQueryIntent)queryIntent;
- (double)currentTime;
- (double)scaleFactor;
- (float)entityL1Score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)evaluator;
- (id)evaluatorForPersonMatching;
- (id)evaluatorWithSearchString:(id)a3;
- (int)intentFromQU;
- (unint64_t)deviceAuthenticationState;
- (unint64_t)inferredLlmQUIntentType;
- (unint64_t)llmQUIntentType;
- (unint64_t)options;
- (unint64_t)queryIdent;
- (unint64_t)queryKind;
- (unint64_t)whyClear;
- (unint64_t)whyQuery;
- (void)incrementQueryId;
- (void)setAllowInternet:(BOOL)a3;
- (void)setAnswerAttributes:(id)a3;
- (void)setArrivalLocationFromQU:(id)a3;
- (void)setBackingSearchModel:(id)a3;
- (void)setBundleIDs:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setDepartureLocationFromQU:(id)a3;
- (void)setDeviceAuthenticationState:(unint64_t)a3;
- (void)setDisableOCR:(BOOL)a3;
- (void)setDisabledApps:(id)a3;
- (void)setDisabledBundles:(id)a3;
- (void)setDisabledDomains:(id)a3;
- (void)setEarliestTokenFromQU:(BOOL)a3;
- (void)setEnablePersonalAnswers:(BOOL)a3;
- (void)setEntityL1Score:(float)a3;
- (void)setFetchL2Signals:(BOOL)a3;
- (void)setFilterQueries:(id)a3;
- (void)setForceQueryEvenIfSame:(BOOL)a3;
- (void)setGroupingRules:(id)a3;
- (void)setHasQueryTextEmbedding:(BOOL)a3;
- (void)setHasSearchTerm:(BOOL)a3;
- (void)setInferredLlmQUIntentType:(unint64_t)a3;
- (void)setIntentFromQU:(int)a3;
- (void)setInternalDebug:(BOOL)a3;
- (void)setInternalValidation:(BOOL)a3;
- (void)setIsAdvancedSyntax:(BOOL)a3;
- (void)setIsAppEntitySearch:(BOOL)a3;
- (void)setIsEventSearch:(BOOL)a3;
- (void)setIsFlightEventSearch:(BOOL)a3;
- (void)setIsFromLLMQUParse:(BOOL)a3;
- (void)setIsHotelEventSearch:(BOOL)a3;
- (void)setIsLLMQUIntentEventSearch:(BOOL)a3;
- (void)setIsPasscodeLocked:(BOOL)a3;
- (void)setIsPlural:(BOOL)a3;
- (void)setIsRestaurantEventSearch:(BOOL)a3;
- (void)setIsSingle:(BOOL)a3;
- (void)setKeyboardLanguage:(id)a3;
- (void)setKeyboardPrimaryLanguage:(id)a3;
- (void)setLatestTokenFromQU:(BOOL)a3;
- (void)setLlmQUIntentType:(unint64_t)a3;
- (void)setMarkedTextArray:(id)a3;
- (void)setNoTokenize:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setParsedQueryFromQU:(id)a3;
- (void)setPromoteLocalResults:(BOOL)a3;
- (void)setPromoteParsecResults:(BOOL)a3;
- (void)setQueryIdent:(unint64_t)a3;
- (void)setQueryIntent:(id)a3;
- (void)setQueryKind:(unint64_t)a3;
- (void)setQueryUnderstandingOutput:(id)a3;
- (void)setReferenceDate:(id)a3;
- (void)setRetainBackendData:(BOOL)a3;
- (void)setScaleFactor:(double)a3;
- (void)setSearchDomains:(id)a3;
- (void)setSearchEntities:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSpQUParse:(id)a3;
- (void)setWhyClear:(unint64_t)a3;
- (void)setWhyQuery:(unint64_t)a3;
@end

@implementation SPSearchQueryContext

+ (SPSearchQueryContext)queryContextWithSearchString:(id)a3
{
  id v3 = a3;
  v4 = [[SPSearchQueryContext alloc] initWithSearchString:v3];

  return v4;
}

+ (id)getAppEntityParams:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (getAppEntityParams__onceToken != -1) {
    dispatch_once(&getAppEntityParams__onceToken, &__block_literal_global_22);
  }
  v4 = (void *)[&unk_1F18648F8 mutableCopy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v22 = v3;
  v5 = [v3 filterQueries];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v11 = objc_msgSend((id)getAppEntityParams__regex, "firstMatchInString:options:range:", v10, 0, 0, objc_msgSend(v10, "length"));
        v12 = v11;
        if (v11 && [v11 numberOfRanges] == 3)
        {
          uint64_t v13 = [v12 rangeAtIndex:1];
          v15 = objc_msgSend(v10, "substringWithRange:", v13, v14);
          uint64_t v16 = [v12 rangeAtIndex:2];
          uint64_t v18 = objc_msgSend(v10, "substringWithRange:", v16, v17);
          v19 = (void *)v18;
          if (v15) {
            BOOL v20 = v18 == 0;
          }
          else {
            BOOL v20 = 1;
          }
          if (!v20)
          {
            [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isAppEntitySearch"];
            [v4 setObject:v15 forKeyedSubscript:@"bundleID"];
            [v4 setObject:v19 forKeyedSubscript:@"entityTypeIdentifier"];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  return v4;
}

uint64_t __43__SPSearchQueryContext_getAppEntityParams___block_invoke()
{
  getAppEntityParams__regex = objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"(?=.*_kMDItemBundleID==([^ ]+))(?=.*_kMDItemAppEntityTypeIdentifier==([^)]+)"), 0, 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)removeAppEntitySpecificStopwords:(id)a3 withEntityTypeIdentifier:(id)a4 bundleID:(id)a5
{
  v38[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (removeAppEntitySpecificStopwords_withEntityTypeIdentifier_bundleID__onceToken != -1) {
    dispatch_once(&removeAppEntitySpecificStopwords_withEntityTypeIdentifier_bundleID__onceToken, &__block_literal_global_92);
  }
  v38[0] = v9;
  v38[1] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  v11 = [(id)removeAppEntitySpecificStopwords_withEntityTypeIdentifier_bundleID__stopwordsMap objectForKeyedSubscript:v10];
  v12 = v11;
  if (v11)
  {
    long long v25 = v10;
    id v27 = v8;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
    id v26 = v9;
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v18 = [NSString stringWithFormat:@"\\b%@\\b", v17];
          id v28 = 0;
          v19 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v18 options:1 error:&v28];
          id v20 = v28;
          if (v20)
          {
            v21 = SSGeneralLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v34 = v17;
              __int16 v35 = 2112;
              id v36 = v20;
              _os_log_error_impl(&dword_1BDB2A000, v21, OS_LOG_TYPE_ERROR, "[POMMES][SearchTool][Query Normalization] Error creating regex for appEntity stopword %@: %@", buf, 0x16u);
            }
          }
          else
          {
            objc_msgSend(v19, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, -[NSObject length](v7, "length"), &stru_1F1824018);
            uint64_t v7 = v21 = v7;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v14);
    }
    v22 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v23 = [v7 stringByTrimmingCharactersInSet:v22];

    uint64_t v7 = v23;
    id v9 = v26;
    id v8 = v27;
    v10 = v25;
  }
  else
  {
    v22 = SSGeneralLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v9;
      __int16 v35 = 2112;
      id v36 = v8;
      _os_log_impl(&dword_1BDB2A000, v22, OS_LOG_TYPE_INFO, "[POMMES][SearchTool][Query Normalization] No stopwords found for bundleID %@ and typeIdentifier %@", buf, 0x16u);
    }
  }

  return v7;
}

void __91__SPSearchQueryContext_removeAppEntitySpecificStopwords_withEntityTypeIdentifier_bundleID___block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1864550;
  v2[1] = &unk_1F1864580;
  v3[0] = &unk_1F1864568;
  v3[1] = &unk_1F1864598;
  v2[2] = &unk_1F18645B0;
  v2[3] = &unk_1F18645E0;
  v3[2] = &unk_1F18645C8;
  v3[3] = &unk_1F18645F8;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)removeAppEntitySpecificStopwords_withEntityTypeIdentifier_bundleID__stopwordsMap;
  removeAppEntitySpecificStopwords_withEntityTypeIdentifier_bundleID__stopwordsMap = v0;
}

+ (id)normalizeSearchString:(id)a3 queryContext:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    id v8 = v6;
  }
  else
  {
    id v9 = +[SPSearchQueryContext getAppEntityParams:v7];
    v10 = [v9 objectForKeyedSubscript:@"isAppEntitySearch"];
    int v11 = [v10 BOOLValue];

    if (v11)
    {
      v12 = [v9 objectForKeyedSubscript:@"entityTypeIdentifier"];
      uint64_t v13 = [v9 objectForKeyedSubscript:@"bundleID"];
      uint64_t v14 = SSGeneralLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v26 = 138412546;
        id v27 = v13;
        __int16 v28 = 2112;
        long long v29 = v12;
        _os_log_impl(&dword_1BDB2A000, v14, OS_LOG_TYPE_INFO, "[POMMES][SearchTool][Query Normalization] SearchTool AppEntity Search detected with bundleID: %@ and typeIdentifier: %@", (uint8_t *)&v26, 0x16u);
      }

      if (v12 && v13)
      {
        uint64_t v15 = [a1 removeAppEntitySpecificStopwords:v6 withEntityTypeIdentifier:v12 bundleID:v13];

        id v6 = (id)v15;
      }
    }
    if (normalizeSearchString_queryContext__onceToken != -1) {
      dispatch_once(&normalizeSearchString_queryContext__onceToken, &__block_literal_global_173);
    }
    uint64_t v16 = objc_msgSend((id)normalizeSearchString_queryContext__punctuationRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v6, 0, 0, objc_msgSend(v6, "length"), @" ");

    uint64_t v17 = objc_msgSend((id)normalizeSearchString_queryContext__specialApostropheSRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v16, 0, 0, objc_msgSend(v16, "length"), @"$1 is");

    uint64_t v18 = objc_msgSend((id)normalizeSearchString_queryContext__specialApostropheReRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v17, 0, 0, objc_msgSend(v17, "length"), @"$1 are");

    v19 = objc_msgSend((id)normalizeSearchString_queryContext__apostropheSRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v18, 0, 0, objc_msgSend(v18, "length"), &stru_1F1824018);

    id v20 = objc_msgSend((id)normalizeSearchString_queryContext__ordinalNumberRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v19, 0, 0, objc_msgSend(v19, "length"), @"$1");

    v21 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v22 = [v20 stringByTrimmingCharactersInSet:v21];

    uint64_t v23 = SSGeneralLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      long long v24 = SSRedactString(v22, 1);
      int v26 = 138412290;
      id v27 = v24;
      _os_log_impl(&dword_1BDB2A000, v23, OS_LOG_TYPE_INFO, "[POMMES][SearchTool][Query Normalization] Normalized Query: %@", (uint8_t *)&v26, 0xCu);
    }
    id v8 = v22;
  }
  return v8;
}

void __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke()
{
  id v24 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"[’']s\\b" options:0 error:&v24];
  id v1 = v24;
  v2 = (void *)normalizeSearchString_queryContext__apostropheSRegex;
  normalizeSearchString_queryContext__apostropheSRegex = v0;

  if (v1)
  {
    id v3 = SSGeneralLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_5();
    }
  }
  id v23 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\b(\\d+)(st|nd|rd|th)\\b" options:1 error:&v23];
  id v5 = v23;
  id v6 = (void *)normalizeSearchString_queryContext__ordinalNumberRegex;
  normalizeSearchString_queryContext__ordinalNumberRegex = v4;

  if (v5)
  {
    id v7 = SSGeneralLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_4();
    }
  }
  id v22 = 0;
  uint64_t v8 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"[,.:?-]+" options:0 error:&v22];
  id v9 = v22;
  v10 = (void *)normalizeSearchString_queryContext__punctuationRegex;
  normalizeSearchString_queryContext__punctuationRegex = v8;

  if (v9)
  {
    int v11 = SSGeneralLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_3();
    }
  }
  id v21 = v9;
  uint64_t v12 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\b(What|Where|When|How)[’']s\\b" options:1 error:&v21];
  id v13 = v21;

  uint64_t v14 = (void *)normalizeSearchString_queryContext__specialApostropheSRegex;
  normalizeSearchString_queryContext__specialApostropheSRegex = v12;

  if (v13)
  {
    uint64_t v15 = SSGeneralLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_2();
    }
  }
  id v20 = v13;
  uint64_t v16 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\b(What|Where|When|How)[’']re\\b" options:1 error:&v20];
  id v17 = v20;

  uint64_t v18 = (void *)normalizeSearchString_queryContext__specialApostropheReRegex;
  normalizeSearchString_queryContext__specialApostropheReRegex = v16;

  if (v17)
  {
    v19 = SSGeneralLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_1();
    }
  }
}

- (SPSearchQueryContext)init
{
  return [(SPSearchQueryContext *)self initWithSearchString:0];
}

- (SPSearchQueryContext)initWithSearchString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SPSearchQueryContext;
  id v5 = [(SPSearchQueryContext *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    [(SPSearchQueryContext *)v5 setSearchString:v4];
    [(SPSearchQueryContext *)v6 setCurrentTime:CFAbsoluteTimeGetCurrent()];
    id v7 = (void *)MEMORY[0x1E4F1C9C8];
    [(SPSearchQueryContext *)v6 currentTime];
    uint64_t v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    [(SPSearchQueryContext *)v6 setReferenceDate:v8];

    [(SPSearchQueryContext *)v6 incrementQueryId];
  }

  return v6;
}

- (SPSearchQueryContext)initWithSearchString:(id)a3 currentTime:(double)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SPSearchQueryContext;
  id v7 = [(SPSearchQueryContext *)&v12 init];
  uint64_t v8 = v7;
  if (v7)
  {
    [(SPSearchQueryContext *)v7 setSearchString:v6];
    [(SPSearchQueryContext *)v8 setCurrentTime:a4];
    id v9 = (void *)MEMORY[0x1E4F1C9C8];
    [(SPSearchQueryContext *)v8 currentTime];
    objc_super v10 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    [(SPSearchQueryContext *)v8 setReferenceDate:v10];

    [(SPSearchQueryContext *)v8 incrementQueryId];
  }

  return v8;
}

- (void)incrementQueryId
{
  self->_queryIdent = atomic_fetch_add(&s_currentQueryID, arc4random_uniform(0xAu) + 1);
}

- (void)setSearchString:(id)a3
{
  id v4 = a3;
  id obj = v4;
  if (setSearchString__once != -1)
  {
    dispatch_once(&setSearchString__once, &__block_literal_global_203);
    id v4 = obj;
  }
  uint64_t v5 = [v4 rangeOfCharacterFromSet:setSearchString__characterSet];
  if (v5) {
    BOOL v6 = v5 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = [obj substringFromIndex:v5];

    id obj = (id)v7;
  }
  objc_storeStrong((id *)&self->_searchString, obj);
  if (obj)
  {
    uint64_t v8 = SSNormalizedQueryString(obj);
    id v9 = [v8 lowercaseString];
    normalizedSearchString = self->_normalizedSearchString;
    self->_normalizedSearchString = v9;
  }
  else
  {
    uint64_t v8 = self->_normalizedSearchString;
    self->_normalizedSearchString = 0;
  }
}

uint64_t __40__SPSearchQueryContext_setSearchString___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  id v1 = (void *)setSearchString__characterSet;
  setSearchString__characterSet = v0;

  v2 = (void *)setSearchString__characterSet;
  return [v2 invert];
}

- (NSString)getTrimmedSearchString
{
  searchString = self->_searchString;
  id v3 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v4 = [(NSString *)searchString stringByTrimmingCharactersInSet:v3];

  return (NSString *)v4;
}

- (NSString)displayedText
{
  id v3 = [(SPSearchQueryContext *)self searchString];
  if ([(SPSearchQueryContext *)self hasMarkedText])
  {
    uint64_t v4 = [(NSArray *)self->_markedTextArray componentsJoinedByString:&stru_1F1824018];

    id v3 = (void *)v4;
  }
  return (NSString *)v3;
}

- (BOOL)hasMarkedText
{
  return [(NSArray *)self->_markedTextArray count] == 3;
}

- (id)evaluatorWithSearchString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SPSearchQueryContext *)self keyboardLanguage];
  BOOL v6 = (void *)v5;
  uint64_t v7 = @"en";
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  uint64_t v8 = v7;

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F237B8]) initWithQuery:v4 language:v8 fuzzyThreshold:0 options:1];
  [v9 setMatchOncePerTerm:1];
  return v9;
}

- (id)evaluator
{
  evaluator = self->_evaluator;
  if (!evaluator
    || ([(CSAttributeEvaluator *)evaluator queryString],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [(SPSearchQueryContext *)self searchString],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v4 isEqual:v5],
        v5,
        v4,
        (v6 & 1) == 0))
  {
    uint64_t v7 = [(SPSearchQueryContext *)self searchString];
    uint64_t v8 = [(SPSearchQueryContext *)self evaluatorWithSearchString:v7];
    id v9 = self->_evaluator;
    self->_evaluator = v8;
  }
  objc_super v10 = self->_evaluator;
  return v10;
}

- (id)evaluatorForPersonMatching
{
  evaluatorForPersonMatching = self->_evaluatorForPersonMatching;
  if (!evaluatorForPersonMatching)
  {
    id v4 = [(SPSearchQueryContext *)self searchEntities];
    uint64_t v5 = [v4 firstObject];

    if ([v5 isContactEntitySearch])
    {
      char v6 = [v5 tokenText];
    }
    else
    {
      uint64_t v7 = [(SPSearchQueryContext *)self searchString];
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [v5 searchString];
      }
      char v6 = v9;
    }
    objc_super v10 = [(SPSearchQueryContext *)self evaluatorWithSearchString:v6];
    int v11 = self->_evaluatorForPersonMatching;
    self->_evaluatorForPersonMatching = v10;

    evaluatorForPersonMatching = self->_evaluatorForPersonMatching;
  }
  return evaluatorForPersonMatching;
}

- (BOOL)isPasscodeLocked
{
  return [(SPSearchQueryContext *)self deviceAuthenticationState] != 0;
}

- (void)setIsPasscodeLocked:(BOOL)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  uint64_t v5 = [(SPSearchQueryContext *)self searchString];
  [v4 setSearchString:v5];

  char v6 = [(SPSearchQueryContext *)self markedTextArray];
  [v4 setMarkedTextArray:v6];

  uint64_t v7 = [(SPSearchQueryContext *)self keyboardLanguage];
  [v4 setKeyboardLanguage:v7];

  uint64_t v8 = [(SPSearchQueryContext *)self keyboardPrimaryLanguage];
  [v4 setKeyboardPrimaryLanguage:v8];

  id v9 = [(SPSearchQueryContext *)self searchDomains];
  [v4 setSearchDomains:v9];

  objc_super v10 = [(SPSearchQueryContext *)self disabledDomains];
  [v4 setDisabledDomains:v10];

  int v11 = [(SPSearchQueryContext *)self disabledBundles];
  [v4 setDisabledBundles:v11];

  objc_super v12 = [(SPSearchQueryContext *)self groupingRules];
  [v4 setGroupingRules:v12];

  objc_msgSend(v4, "setForceQueryEvenIfSame:", -[SPSearchQueryContext forceQueryEvenIfSame](self, "forceQueryEvenIfSame"));
  objc_msgSend(v4, "setWhyQuery:", -[SPSearchQueryContext whyQuery](self, "whyQuery"));
  objc_msgSend(v4, "setQueryKind:", -[SPSearchQueryContext queryKind](self, "queryKind"));
  objc_msgSend(v4, "setWhyClear:", -[SPSearchQueryContext whyClear](self, "whyClear"));
  objc_msgSend(v4, "setQueryIdent:", -[SPSearchQueryContext queryIdent](self, "queryIdent"));
  [(SPSearchQueryContext *)self currentTime];
  objc_msgSend(v4, "setCurrentTime:");
  id v13 = [(SPSearchQueryContext *)self referenceDate];
  [v4 setReferenceDate:v13];

  [(SPSearchQueryContext *)self scaleFactor];
  objc_msgSend(v4, "setScaleFactor:");
  objc_msgSend(v4, "setAllowInternet:", -[SPSearchQueryContext allowInternet](self, "allowInternet"));
  objc_msgSend(v4, "setNoTokenize:", -[SPSearchQueryContext noTokenize](self, "noTokenize"));
  objc_msgSend(v4, "setInternalDebug:", -[SPSearchQueryContext internalDebug](self, "internalDebug"));
  objc_msgSend(v4, "setInternalValidation:", -[SPSearchQueryContext internalValidation](self, "internalValidation"));
  objc_msgSend(v4, "setDisableOCR:", -[SPSearchQueryContext disableOCR](self, "disableOCR"));
  objc_msgSend(v4, "setIsAdvancedSyntax:", -[SPSearchQueryContext isAdvancedSyntax](self, "isAdvancedSyntax"));
  uint64_t v14 = [(SPSearchQueryContext *)self searchEntities];
  [v4 setSearchEntities:v14];

  uint64_t v15 = [(SPSearchQueryContext *)self backingSearchModel];
  [v4 setBackingSearchModel:v15];

  uint64_t v16 = [(SPSearchQueryContext *)self queryUnderstandingOutput];
  [v4 setQueryUnderstandingOutput:v16];

  objc_msgSend(v4, "setOptions:", -[SPSearchQueryContext options](self, "options"));
  objc_msgSend(v4, "setEnablePersonalAnswers:", -[SPSearchQueryContext enablePersonalAnswers](self, "enablePersonalAnswers"));
  objc_msgSend(v4, "setRetainBackendData:", -[SPSearchQueryContext retainBackendData](self, "retainBackendData"));
  id v17 = [(SPSearchQueryContext *)self answerAttributes];
  [v4 setAnswerAttributes:v17];

  objc_msgSend(v4, "setDeviceAuthenticationState:", -[SPSearchQueryContext deviceAuthenticationState](self, "deviceAuthenticationState"));
  uint64_t v18 = [(SPSearchQueryContext *)self disabledApps];
  [v4 setDisabledApps:v18];

  objc_msgSend(v4, "setPromoteParsecResults:", -[SPSearchQueryContext promoteParsecResults](self, "promoteParsecResults"));
  v19 = [(SPSearchQueryContext *)self queryIntent];
  [v4 setQueryIntent:v19];

  id v20 = [(SPSearchQueryContext *)self bundleIDs];
  [v4 setBundleIDs:v20];

  id v21 = [(SPSearchQueryContext *)self filterQueries];
  [v4 setFilterQueries:v21];

  return v4;
}

+ (id)llmQUIntentString:(unint64_t)a3
{
  int v3 = a3;
  if (a3)
  {
    id v4 = [@"[" stringByAppendingString:@"LLMQUIntentNote "];
    if ((v3 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v4 = @"[";
  if ((a3 & 2) != 0)
  {
LABEL_5:
    uint64_t v5 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentEmail "];

    id v4 = (__CFString *)v5;
  }
LABEL_6:
  if ((v3 & 4) != 0)
  {
    uint64_t v9 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentPhoto "];

    id v4 = (__CFString *)v9;
    if ((v3 & 8) == 0)
    {
LABEL_8:
      if ((v3 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_37;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_8;
  }
  uint64_t v10 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentMessage "];

  id v4 = (__CFString *)v10;
  if ((v3 & 0x10) == 0)
  {
LABEL_9:
    if ((v3 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v11 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentSafari "];

  id v4 = (__CFString *)v11;
  if ((v3 & 0x20) == 0)
  {
LABEL_10:
    if ((v3 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v12 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentCalendar "];

  id v4 = (__CFString *)v12;
  if ((v3 & 0x40) == 0)
  {
LABEL_11:
    if ((v3 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v13 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentReminder "];

  id v4 = (__CFString *)v13;
  if ((v3 & 0x100) == 0)
  {
LABEL_12:
    if ((v3 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v14 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentContact "];

  id v4 = (__CFString *)v14;
  if ((v3 & 0x200) == 0)
  {
LABEL_13:
    if ((v3 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v15 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentConversation "];

  id v4 = (__CFString *)v15;
  if ((v3 & 0x400) == 0)
  {
LABEL_14:
    if ((v3 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v16 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentKeynote "];

  id v4 = (__CFString *)v16;
  if ((v3 & 0x800) == 0)
  {
LABEL_15:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v17 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentDocument "];

  id v4 = (__CFString *)v17;
  if ((v3 & 0x1000) == 0)
  {
LABEL_16:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v18 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentNumber "];

  id v4 = (__CFString *)v18;
  if ((v3 & 0x2000) == 0)
  {
LABEL_17:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v19 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentPage "];

  id v4 = (__CFString *)v19;
  if ((v3 & 0x4000) == 0)
  {
LABEL_18:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v20 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentHotelEvent "];

  id v4 = (__CFString *)v20;
  if ((v3 & 0x8000) == 0)
  {
LABEL_19:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v21 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentFlightEvent "];

  id v4 = (__CFString *)v21;
  if ((v3 & 0x10000) == 0)
  {
LABEL_20:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v22 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentRestaurantEvent "];

  id v4 = (__CFString *)v22;
  if ((v3 & 0x20000) == 0)
  {
LABEL_21:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v23 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentEvent "];

  id v4 = (__CFString *)v23;
  if ((v3 & 0x40000) == 0)
  {
LABEL_22:
    if ((v3 & 0x80000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v24 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentTicketShowEvent "];

  id v4 = (__CFString *)v24;
  if ((v3 & 0x80000) == 0)
  {
LABEL_23:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v25 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentAppointmentEvent "];

  id v4 = (__CFString *)v25;
  if ((v3 & 0x100000) == 0)
  {
LABEL_24:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v26 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentPartyEvent "];

  id v4 = (__CFString *)v26;
  if ((v3 & 0x200000) == 0)
  {
LABEL_25:
    if ((v3 & 0x400000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v27 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentTicketTransportEvent "];

  id v4 = (__CFString *)v27;
  if ((v3 & 0x400000) == 0)
  {
LABEL_26:
    if ((v3 & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v28 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentCarRentalEvent "];

  id v4 = (__CFString *)v28;
  if ((v3 & 0x800000) == 0)
  {
LABEL_27:
    if ((v3 & 0x1000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v29 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentPhone "];

  id v4 = (__CFString *)v29;
  if ((v3 & 0x1000000) == 0)
  {
LABEL_28:
    if ((v3 & 0x2000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v30 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentVoiceMemo "];

  id v4 = (__CFString *)v30;
  if ((v3 & 0x2000000) == 0)
  {
LABEL_29:
    if ((v3 & 0x4000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v31 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentJournal "];

  id v4 = (__CFString *)v31;
  if ((v3 & 0x4000000) == 0)
  {
LABEL_30:
    if ((v3 & 0x8000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_58:
  uint64_t v32 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentWallet "];

  id v4 = (__CFString *)v32;
  if ((v3 & 0x8000000) != 0)
  {
LABEL_31:
    uint64_t v6 = [(__CFString *)v4 stringByAppendingString:@"LLMQUIntentFreeform "];

    id v4 = (__CFString *)v6;
  }
LABEL_32:
  uint64_t v7 = [(__CFString *)v4 stringByAppendingString:@"]"];

  return v7;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSString)normalizedSearchString
{
  return self->_normalizedSearchString;
}

- (NSArray)markedTextArray
{
  return self->_markedTextArray;
}

- (void)setMarkedTextArray:(id)a3
{
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (void)setKeyboardLanguage:(id)a3
{
}

- (NSString)keyboardPrimaryLanguage
{
  return self->_keyboardPrimaryLanguage;
}

- (void)setKeyboardPrimaryLanguage:(id)a3
{
}

- (NSArray)searchDomains
{
  return self->_searchDomains;
}

- (void)setSearchDomains:(id)a3
{
}

- (NSArray)disabledDomains
{
  return self->_disabledDomains;
}

- (void)setDisabledDomains:(id)a3
{
}

- (NSArray)disabledBundles
{
  return self->_disabledBundles;
}

- (void)setDisabledBundles:(id)a3
{
}

- (NSArray)groupingRules
{
  return self->_groupingRules;
}

- (void)setGroupingRules:(id)a3
{
}

- (NSArray)answerAttributes
{
  return self->_answerAttributes;
}

- (void)setAnswerAttributes:(id)a3
{
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
}

- (BOOL)forceQueryEvenIfSame
{
  return self->_forceQueryEvenIfSame;
}

- (void)setForceQueryEvenIfSame:(BOOL)a3
{
  self->_forceQueryEvenIfSame = a3;
}

- (unint64_t)whyQuery
{
  return self->_whyQuery;
}

- (void)setWhyQuery:(unint64_t)a3
{
  self->_whyQuery = a3;
}

- (unint64_t)queryKind
{
  return self->_queryKind;
}

- (void)setQueryKind:(unint64_t)a3
{
  self->_queryKind = a3;
}

- (unint64_t)whyClear
{
  return self->_whyClear;
}

- (void)setWhyClear:(unint64_t)a3
{
  self->_whyClear = a3;
}

- (unint64_t)queryIdent
{
  return self->_queryIdent;
}

- (void)setQueryIdent:(unint64_t)a3
{
  self->_queryIdent = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (BOOL)allowInternet
{
  return self->_allowInternet;
}

- (void)setAllowInternet:(BOOL)a3
{
  self->_allowInternet = a3;
}

- (BOOL)noTokenize
{
  return self->_noTokenize;
}

- (void)setNoTokenize:(BOOL)a3
{
  self->_noTokenize = a3;
}

- (BOOL)internalDebug
{
  return self->_internalDebug;
}

- (void)setInternalDebug:(BOOL)a3
{
  self->_internalDebug = a3;
}

- (BOOL)internalValidation
{
  return self->_internalValidation;
}

- (void)setInternalValidation:(BOOL)a3
{
  self->_internalValidation = a3;
}

- (BOOL)disableOCR
{
  return self->_disableOCR;
}

- (void)setDisableOCR:(BOOL)a3
{
  self->_disableOCR = a3;
}

- (BOOL)isAdvancedSyntax
{
  return self->_isAdvancedSyntax;
}

- (void)setIsAdvancedSyntax:(BOOL)a3
{
  self->_isAdvancedSyntax = a3;
}

- (BOOL)fetchL2Signals
{
  return self->_fetchL2Signals;
}

- (void)setFetchL2Signals:(BOOL)a3
{
  self->_fetchL2Signals = a3;
}

- (NSArray)searchEntities
{
  return self->_searchEntities;
}

- (void)setSearchEntities:(id)a3
{
}

- (CSSuggestion)backingSearchModel
{
  return self->_backingSearchModel;
}

- (void)setBackingSearchModel:(id)a3
{
}

- (NSDictionary)queryUnderstandingOutput
{
  return self->_queryUnderstandingOutput;
}

- (void)setQueryUnderstandingOutput:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (BOOL)enablePersonalAnswers
{
  return self->_enablePersonalAnswers;
}

- (void)setEnablePersonalAnswers:(BOOL)a3
{
  self->_enablePersonalAnswers = a3;
}

- (BOOL)retainBackendData
{
  return self->_retainBackendData;
}

- (void)setRetainBackendData:(BOOL)a3
{
  self->_retainBackendData = a3;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
}

- (NSArray)filterQueries
{
  return self->_filterQueries;
}

- (void)setFilterQueries:(id)a3
{
}

- (SPQUParse)spQUParse
{
  return self->_spQUParse;
}

- (void)setSpQUParse:(id)a3
{
}

- (unint64_t)deviceAuthenticationState
{
  return self->_deviceAuthenticationState;
}

- (void)setDeviceAuthenticationState:(unint64_t)a3
{
  self->_deviceAuthenticationState = a3;
}

- (NSArray)disabledApps
{
  return self->_disabledApps;
}

- (void)setDisabledApps:(id)a3
{
}

- (BOOL)promoteLocalResults
{
  return self->_promoteLocalResults;
}

- (void)setPromoteLocalResults:(BOOL)a3
{
  self->_promoteLocalResults = a3;
}

- (BOOL)promoteParsecResults
{
  return self->_promoteParsecResults;
}

- (void)setPromoteParsecResults:(BOOL)a3
{
  self->_promoteParsecResults = a3;
}

- (SSQueryIntent)queryIntent
{
  return self->_queryIntent;
}

- (void)setQueryIntent:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (int)intentFromQU
{
  return self->_intentFromQU;
}

- (void)setIntentFromQU:(int)a3
{
  self->_intentFromQU = a3;
}

- (NSString)parsedQueryFromQU
{
  return self->_parsedQueryFromQU;
}

- (void)setParsedQueryFromQU:(id)a3
{
}

- (BOOL)earliestTokenFromQU
{
  return self->_earliestTokenFromQU;
}

- (void)setEarliestTokenFromQU:(BOOL)a3
{
  self->_earliestTokenFromQU = a3;
}

- (BOOL)latestTokenFromQU
{
  return self->_latestTokenFromQU;
}

- (void)setLatestTokenFromQU:(BOOL)a3
{
  self->_latestTokenFromQU = a3;
}

- (NSString)departureLocationFromQU
{
  return self->_departureLocationFromQU;
}

- (void)setDepartureLocationFromQU:(id)a3
{
}

- (NSString)arrivalLocationFromQU
{
  return self->_arrivalLocationFromQU;
}

- (void)setArrivalLocationFromQU:(id)a3
{
}

- (BOOL)isAppEntitySearch
{
  return self->_isAppEntitySearch;
}

- (void)setIsAppEntitySearch:(BOOL)a3
{
  self->_isAppEntitySearch = a3;
}

- (BOOL)isFlightEventSearch
{
  return self->_isFlightEventSearch;
}

- (void)setIsFlightEventSearch:(BOOL)a3
{
  self->_isFlightEventSearch = a3;
}

- (BOOL)isHotelEventSearch
{
  return self->_isHotelEventSearch;
}

- (void)setIsHotelEventSearch:(BOOL)a3
{
  self->_isHotelEventSearch = a3;
}

- (BOOL)isRestaurantEventSearch
{
  return self->_isRestaurantEventSearch;
}

- (void)setIsRestaurantEventSearch:(BOOL)a3
{
  self->_isRestaurantEventSearch = a3;
}

- (BOOL)isEventSearch
{
  return self->_isEventSearch;
}

- (void)setIsEventSearch:(BOOL)a3
{
  self->_isEventSearch = a3;
}

- (float)entityL1Score
{
  return self->_entityL1Score;
}

- (void)setEntityL1Score:(float)a3
{
  self->_entityL1Score = a3;
}

- (unint64_t)llmQUIntentType
{
  return self->_llmQUIntentType;
}

- (void)setLlmQUIntentType:(unint64_t)a3
{
  self->_llmQUIntentType = a3;
}

- (unint64_t)inferredLlmQUIntentType
{
  return self->_inferredLlmQUIntentType;
}

- (void)setInferredLlmQUIntentType:(unint64_t)a3
{
  self->_inferredLlmQUIntentType = a3;
}

- (BOOL)isFromLLMQUParse
{
  return self->_isFromLLMQUParse;
}

- (void)setIsFromLLMQUParse:(BOOL)a3
{
  self->_isFromLLMQUParse = a3;
}

- (BOOL)isSingle
{
  return self->_isSingle;
}

- (void)setIsSingle:(BOOL)a3
{
  self->_isSingle = a3;
}

- (BOOL)isPlural
{
  return self->_isPlural;
}

- (void)setIsPlural:(BOOL)a3
{
  self->_isPlural = a3;
}

- (BOOL)hasQueryTextEmbedding
{
  return self->_hasQueryTextEmbedding;
}

- (void)setHasQueryTextEmbedding:(BOOL)a3
{
  self->_hasQueryTextEmbedding = a3;
}

- (BOOL)hasSearchTerm
{
  return self->_hasSearchTerm;
}

- (void)setHasSearchTerm:(BOOL)a3
{
  self->_hasSearchTerm = a3;
}

- (BOOL)isLLMQUIntentEventSearch
{
  return self->_isLLMQUIntentEventSearch;
}

- (void)setIsLLMQUIntentEventSearch:(BOOL)a3
{
  self->_isLLMQUIntentEventSearch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalLocationFromQU, 0);
  objc_storeStrong((id *)&self->_departureLocationFromQU, 0);
  objc_storeStrong((id *)&self->_parsedQueryFromQU, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_queryIntent, 0);
  objc_storeStrong((id *)&self->_disabledApps, 0);
  objc_storeStrong((id *)&self->_spQUParse, 0);
  objc_storeStrong((id *)&self->_filterQueries, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_queryUnderstandingOutput, 0);
  objc_storeStrong((id *)&self->_backingSearchModel, 0);
  objc_storeStrong((id *)&self->_searchEntities, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_answerAttributes, 0);
  objc_storeStrong((id *)&self->_groupingRules, 0);
  objc_storeStrong((id *)&self->_disabledBundles, 0);
  objc_storeStrong((id *)&self->_disabledDomains, 0);
  objc_storeStrong((id *)&self->_searchDomains, 0);
  objc_storeStrong((id *)&self->_keyboardPrimaryLanguage, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_markedTextArray, 0);
  objc_storeStrong((id *)&self->_normalizedSearchString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_evaluatorForPersonMatching, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
}

void __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "[POMMES][SearchTool][Query Normalization] Error creating specialApostropheReRegex: %@", v2, v3, v4, v5, v6);
}

void __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "[POMMES][SearchTool][Query Normalization] Error creating specialApostropheSRegex: %@", v2, v3, v4, v5, v6);
}

void __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "[POMMES][SearchTool][Query Normalization] Error creating punctuationRegex: %@", v2, v3, v4, v5, v6);
}

void __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "[POMMES][SearchTool][Query Normalization] Error creating ordinalNumberRegex: %@", v2, v3, v4, v5, v6);
}

void __59__SPSearchQueryContext_normalizeSearchString_queryContext___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "[POMMES][SearchTool][Query Normalization] Error creating apostropheSRegex: %@", v2, v3, v4, v5, v6);
}

@end