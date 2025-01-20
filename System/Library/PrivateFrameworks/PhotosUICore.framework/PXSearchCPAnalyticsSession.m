@interface PXSearchCPAnalyticsSession
+ (id)_bucketedTimeInterval:(double)a3;
+ (id)_cappedSearchCount:(unint64_t)a3;
+ (id)_stringForActionType:(unint64_t)a3;
+ (id)_stringForResultType:(unint64_t)a3;
+ (id)_stringForSessionBeginType:(unint64_t)a3;
- (BOOL)isValid;
- (BOOL)successful;
- (BOOL)userInteractedWithCurrentSearch;
- (PXSearchActiveSearch)lastActiveSearch;
- (PXSearchCPAnalyticsSession)initWithBeginType:(unint64_t)a3;
- (PXSearchQuery)lastSearch;
- (double)startTime;
- (double)timeIntervalFirstAssetAction;
- (double)timeIntervalFirstEnteredCollection;
- (double)timeIntervalFirstOneUpInTopAssets;
- (double)timeIntervalSuccess;
- (unint64_t)beginType;
- (unint64_t)firstAssetActionResultType;
- (unint64_t)firstAssetActionType;
- (unint64_t)firstEnteredCollectionResultType;
- (unint64_t)numberOfCompletionSelections;
- (unint64_t)numberOfNextTokenSelections;
- (unint64_t)numberOfSearches;
- (unint64_t)numberOfSearchesUntilFirstAssetAction;
- (unint64_t)numberOfSearchesUntilFirstEnteredCollection;
- (unint64_t)numberOfSearchesUntilFirstOneUpInTopAssets;
- (unint64_t)numberOfSearchesUntilFirstSuccess;
- (unint64_t)numberOfSearchesWithNoResults;
- (unint64_t)numberOfSearchesWithWordEmbeddings;
- (unint64_t)numberOfWordEmbeddingSelections;
- (void)_logSuccess;
- (void)endAndInvalidateSession;
- (void)logActiveSearch:(id)a3;
- (void)logAssetAction:(unint64_t)a3 inResult:(unint64_t)a4;
- (void)logEnteredCollectionResult:(unint64_t)a3;
- (void)logNoSearchResultsFound;
- (void)logOneUpInTopAssets;
- (void)logSearch:(id)a3;
- (void)logSearchNextTokenSuggestionTapped;
- (void)logSearchWordCompletionTapped;
- (void)logSearchWordEmbeddingSelected;
- (void)logSearchWordEmbeddingsPresented;
- (void)setBeginType:(unint64_t)a3;
- (void)setFirstAssetActionResultType:(unint64_t)a3;
- (void)setFirstAssetActionType:(unint64_t)a3;
- (void)setFirstEnteredCollectionResultType:(unint64_t)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setLastActiveSearch:(id)a3;
- (void)setLastSearch:(id)a3;
- (void)setNumberOfCompletionSelections:(unint64_t)a3;
- (void)setNumberOfNextTokenSelections:(unint64_t)a3;
- (void)setNumberOfSearches:(unint64_t)a3;
- (void)setNumberOfSearchesUntilFirstAssetAction:(unint64_t)a3;
- (void)setNumberOfSearchesUntilFirstEnteredCollection:(unint64_t)a3;
- (void)setNumberOfSearchesUntilFirstOneUpInTopAssets:(unint64_t)a3;
- (void)setNumberOfSearchesUntilFirstSuccess:(unint64_t)a3;
- (void)setNumberOfSearchesWithNoResults:(unint64_t)a3;
- (void)setNumberOfSearchesWithWordEmbeddings:(unint64_t)a3;
- (void)setNumberOfWordEmbeddingSelections:(unint64_t)a3;
- (void)setStartTime:(double)a3;
- (void)setSuccessful:(BOOL)a3;
- (void)setTimeIntervalFirstAssetAction:(double)a3;
- (void)setTimeIntervalFirstEnteredCollection:(double)a3;
- (void)setTimeIntervalFirstOneUpInTopAssets:(double)a3;
- (void)setTimeIntervalSuccess:(double)a3;
- (void)setUserInteractedWithCurrentSearch:(BOOL)a3;
@end

@implementation PXSearchCPAnalyticsSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActiveSearch, 0);
  objc_storeStrong((id *)&self->_lastSearch, 0);
}

- (void)setLastActiveSearch:(id)a3
{
}

- (PXSearchActiveSearch)lastActiveSearch
{
  return self->_lastActiveSearch;
}

- (void)setLastSearch:(id)a3
{
}

- (PXSearchQuery)lastSearch
{
  return self->_lastSearch;
}

- (void)setSuccessful:(BOOL)a3
{
  self->_successful = a3;
}

- (BOOL)successful
{
  return self->_successful;
}

- (void)setFirstEnteredCollectionResultType:(unint64_t)a3
{
  self->_firstEnteredCollectionResultType = a3;
}

- (unint64_t)firstEnteredCollectionResultType
{
  return self->_firstEnteredCollectionResultType;
}

- (void)setFirstAssetActionResultType:(unint64_t)a3
{
  self->_firstAssetActionResultType = a3;
}

- (unint64_t)firstAssetActionResultType
{
  return self->_firstAssetActionResultType;
}

- (void)setFirstAssetActionType:(unint64_t)a3
{
  self->_firstAssetActionType = a3;
}

- (unint64_t)firstAssetActionType
{
  return self->_firstAssetActionType;
}

- (void)setNumberOfCompletionSelections:(unint64_t)a3
{
  self->_numberOfCompletionSelections = a3;
}

- (unint64_t)numberOfCompletionSelections
{
  return self->_numberOfCompletionSelections;
}

- (void)setNumberOfNextTokenSelections:(unint64_t)a3
{
  self->_numberOfNextTokenSelections = a3;
}

- (unint64_t)numberOfNextTokenSelections
{
  return self->_numberOfNextTokenSelections;
}

- (void)setNumberOfWordEmbeddingSelections:(unint64_t)a3
{
  self->_numberOfWordEmbeddingSelections = a3;
}

- (unint64_t)numberOfWordEmbeddingSelections
{
  return self->_numberOfWordEmbeddingSelections;
}

- (void)setNumberOfSearchesWithWordEmbeddings:(unint64_t)a3
{
  self->_numberOfSearchesWithWordEmbeddings = a3;
}

- (unint64_t)numberOfSearchesWithWordEmbeddings
{
  return self->_numberOfSearchesWithWordEmbeddings;
}

- (void)setNumberOfSearchesWithNoResults:(unint64_t)a3
{
  self->_numberOfSearchesWithNoResults = a3;
}

- (unint64_t)numberOfSearchesWithNoResults
{
  return self->_numberOfSearchesWithNoResults;
}

- (void)setNumberOfSearchesUntilFirstEnteredCollection:(unint64_t)a3
{
  self->_numberOfSearchesUntilFirstEnteredCollection = a3;
}

- (unint64_t)numberOfSearchesUntilFirstEnteredCollection
{
  return self->_numberOfSearchesUntilFirstEnteredCollection;
}

- (void)setNumberOfSearchesUntilFirstOneUpInTopAssets:(unint64_t)a3
{
  self->_numberOfSearchesUntilFirstOneUpInTopAssets = a3;
}

- (unint64_t)numberOfSearchesUntilFirstOneUpInTopAssets
{
  return self->_numberOfSearchesUntilFirstOneUpInTopAssets;
}

- (void)setNumberOfSearchesUntilFirstAssetAction:(unint64_t)a3
{
  self->_numberOfSearchesUntilFirstAssetAction = a3;
}

- (unint64_t)numberOfSearchesUntilFirstAssetAction
{
  return self->_numberOfSearchesUntilFirstAssetAction;
}

- (void)setNumberOfSearchesUntilFirstSuccess:(unint64_t)a3
{
  self->_numberOfSearchesUntilFirstSuccess = a3;
}

- (unint64_t)numberOfSearchesUntilFirstSuccess
{
  return self->_numberOfSearchesUntilFirstSuccess;
}

- (void)setNumberOfSearches:(unint64_t)a3
{
  self->_numberOfSearches = a3;
}

- (unint64_t)numberOfSearches
{
  return self->_numberOfSearches;
}

- (void)setTimeIntervalFirstEnteredCollection:(double)a3
{
  self->_timeIntervalFirstEnteredCollection = a3;
}

- (double)timeIntervalFirstEnteredCollection
{
  return self->_timeIntervalFirstEnteredCollection;
}

- (void)setTimeIntervalFirstOneUpInTopAssets:(double)a3
{
  self->_timeIntervalFirstOneUpInTopAssets = a3;
}

- (double)timeIntervalFirstOneUpInTopAssets
{
  return self->_timeIntervalFirstOneUpInTopAssets;
}

- (void)setTimeIntervalFirstAssetAction:(double)a3
{
  self->_timeIntervalFirstAssetAction = a3;
}

- (double)timeIntervalFirstAssetAction
{
  return self->_timeIntervalFirstAssetAction;
}

- (void)setTimeIntervalSuccess:(double)a3
{
  self->_timeIntervalSuccess = a3;
}

- (double)timeIntervalSuccess
{
  return self->_timeIntervalSuccess;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setBeginType:(unint64_t)a3
{
  self->_beginType = a3;
}

- (unint64_t)beginType
{
  return self->_beginType;
}

- (void)setUserInteractedWithCurrentSearch:(BOOL)a3
{
  self->_userInteractedWithCurrentSearch = a3;
}

- (BOOL)userInteractedWithCurrentSearch
{
  return self->_userInteractedWithCurrentSearch;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)_logSuccess
{
  if ([(PXSearchCPAnalyticsSession *)self isValid]
    && ![(PXSearchCPAnalyticsSession *)self successful])
  {
    [(PXSearchCPAnalyticsSession *)self setSuccessful:1];
    v3 = [MEMORY[0x1E4F28F80] processInfo];
    [v3 systemUptime];
    double v5 = v4;

    [(PXSearchCPAnalyticsSession *)self startTime];
    [(PXSearchCPAnalyticsSession *)self setTimeIntervalSuccess:v5 - v6];
    unint64_t v7 = [(PXSearchCPAnalyticsSession *)self numberOfSearches];
    [(PXSearchCPAnalyticsSession *)self setNumberOfSearchesUntilFirstSuccess:v7];
  }
}

- (void)logSearchWordCompletionTapped
{
  if ([(PXSearchCPAnalyticsSession *)self isValid])
  {
    unint64_t v3 = [(PXSearchCPAnalyticsSession *)self numberOfCompletionSelections] + 1;
    [(PXSearchCPAnalyticsSession *)self setNumberOfCompletionSelections:v3];
  }
}

- (void)logSearchNextTokenSuggestionTapped
{
  if ([(PXSearchCPAnalyticsSession *)self isValid])
  {
    unint64_t v3 = [(PXSearchCPAnalyticsSession *)self numberOfNextTokenSelections] + 1;
    [(PXSearchCPAnalyticsSession *)self setNumberOfNextTokenSelections:v3];
  }
}

- (void)logSearchWordEmbeddingSelected
{
  if ([(PXSearchCPAnalyticsSession *)self isValid])
  {
    unint64_t v3 = [(PXSearchCPAnalyticsSession *)self numberOfWordEmbeddingSelections] + 1;
    [(PXSearchCPAnalyticsSession *)self setNumberOfWordEmbeddingSelections:v3];
  }
}

- (void)logSearchWordEmbeddingsPresented
{
  if ([(PXSearchCPAnalyticsSession *)self isValid])
  {
    unint64_t v3 = [(PXSearchCPAnalyticsSession *)self numberOfSearchesWithWordEmbeddings]
       + 1;
    [(PXSearchCPAnalyticsSession *)self setNumberOfSearchesWithWordEmbeddings:v3];
  }
}

- (void)logNoSearchResultsFound
{
  if ([(PXSearchCPAnalyticsSession *)self isValid])
  {
    unint64_t v3 = [(PXSearchCPAnalyticsSession *)self numberOfSearchesWithNoResults] + 1;
    [(PXSearchCPAnalyticsSession *)self setNumberOfSearchesWithNoResults:v3];
  }
}

- (void)logEnteredCollectionResult:(unint64_t)a3
{
  if ([(PXSearchCPAnalyticsSession *)self isValid])
  {
    [(PXSearchCPAnalyticsSession *)self timeIntervalFirstEnteredCollection];
    if (v5 == 0.0)
    {
      double v6 = [MEMORY[0x1E4F28F80] processInfo];
      [v6 systemUptime];
      double v8 = v7;

      [(PXSearchCPAnalyticsSession *)self startTime];
      [(PXSearchCPAnalyticsSession *)self setTimeIntervalFirstEnteredCollection:v8 - v9];
      [(PXSearchCPAnalyticsSession *)self setNumberOfSearchesUntilFirstEnteredCollection:[(PXSearchCPAnalyticsSession *)self numberOfSearches]];
      [(PXSearchCPAnalyticsSession *)self setFirstEnteredCollectionResultType:a3];
      [(PXSearchCPAnalyticsSession *)self _logSuccess];
    }
  }
}

- (void)logOneUpInTopAssets
{
  if ([(PXSearchCPAnalyticsSession *)self isValid])
  {
    unint64_t v3 = [MEMORY[0x1E4F28F80] processInfo];
    [v3 systemUptime];
    double v5 = v4;

    [(PXSearchCPAnalyticsSession *)self startTime];
    double v7 = v6;
    [(PXSearchCPAnalyticsSession *)self timeIntervalFirstOneUpInTopAssets];
    if (v8 == 0.0)
    {
      [(PXSearchCPAnalyticsSession *)self setTimeIntervalFirstOneUpInTopAssets:v5 - v7];
      [(PXSearchCPAnalyticsSession *)self setNumberOfSearchesUntilFirstOneUpInTopAssets:[(PXSearchCPAnalyticsSession *)self numberOfSearches]];
      [(PXSearchCPAnalyticsSession *)self _logSuccess];
    }
  }
}

- (void)logAssetAction:(unint64_t)a3 inResult:(unint64_t)a4
{
  if ([(PXSearchCPAnalyticsSession *)self isValid])
  {
    [(PXSearchCPAnalyticsSession *)self timeIntervalFirstAssetAction];
    if (v7 == 0.0)
    {
      double v8 = [MEMORY[0x1E4F28F80] processInfo];
      [v8 systemUptime];
      -[PXSearchCPAnalyticsSession setTimeIntervalFirstAssetAction:](self, "setTimeIntervalFirstAssetAction:");

      [(PXSearchCPAnalyticsSession *)self setNumberOfSearchesUntilFirstAssetAction:[(PXSearchCPAnalyticsSession *)self numberOfSearches]];
      [(PXSearchCPAnalyticsSession *)self _logSuccess];
    }
    if (![(PXSearchCPAnalyticsSession *)self firstAssetActionType]) {
      [(PXSearchCPAnalyticsSession *)self setFirstAssetActionType:a3];
    }
    if (![(PXSearchCPAnalyticsSession *)self firstAssetActionResultType])
    {
      [(PXSearchCPAnalyticsSession *)self setFirstAssetActionResultType:a4];
    }
  }
}

- (void)logActiveSearch:(id)a3
{
  id v7 = a3;
  if ([(PXSearchCPAnalyticsSession *)self isValid])
  {
    double v4 = [(PXSearchCPAnalyticsSession *)self lastActiveSearch];
    char v5 = [v7 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      double v6 = (void *)[v7 copy];
      [(PXSearchCPAnalyticsSession *)self setLastActiveSearch:v6];

      [(PXSearchCPAnalyticsSession *)self setNumberOfSearches:[(PXSearchCPAnalyticsSession *)self numberOfSearches] + 1];
    }
  }
}

- (void)logSearch:(id)a3
{
  id v7 = a3;
  if ([(PXSearchCPAnalyticsSession *)self isValid])
  {
    double v4 = [(PXSearchCPAnalyticsSession *)self lastSearch];
    char v5 = [v7 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      double v6 = (void *)[v7 copy];
      [(PXSearchCPAnalyticsSession *)self setLastSearch:v6];

      [(PXSearchCPAnalyticsSession *)self setNumberOfSearches:[(PXSearchCPAnalyticsSession *)self numberOfSearches] + 1];
    }
  }
}

- (void)endAndInvalidateSession
{
  v31[20] = *MEMORY[0x1E4F143B8];
  if ([(PXSearchCPAnalyticsSession *)self isValid])
  {
    unint64_t v3 = [MEMORY[0x1E4F28F80] processInfo];
    [v3 systemUptime];
    double v5 = v4;

    v20 = +[PXSearchCPAnalyticsSession _stringForSessionBeginType:[(PXSearchCPAnalyticsSession *)self beginType]];
    [(PXSearchCPAnalyticsSession *)self timeIntervalFirstOneUpInTopAssets];
    v29 = [NSNumber numberWithBool:v6 != 0.0];
    [(PXSearchCPAnalyticsSession *)self timeIntervalFirstEnteredCollection];
    v28 = [NSNumber numberWithBool:v7 != 0.0];
    v27 = +[PXSearchCPAnalyticsSession _stringForResultType:[(PXSearchCPAnalyticsSession *)self firstEnteredCollectionResultType]];
    v26 = +[PXSearchCPAnalyticsSession _cappedSearchCount:[(PXSearchCPAnalyticsSession *)self numberOfSearches]];
    v19 = +[PXSearchCPAnalyticsSession _cappedSearchCount:[(PXSearchCPAnalyticsSession *)self numberOfSearchesUntilFirstSuccess]];
    v25 = +[PXSearchCPAnalyticsSession _cappedSearchCount:[(PXSearchCPAnalyticsSession *)self numberOfSearchesUntilFirstAssetAction]];
    v24 = +[PXSearchCPAnalyticsSession _cappedSearchCount:[(PXSearchCPAnalyticsSession *)self numberOfSearchesUntilFirstOneUpInTopAssets]];
    v23 = +[PXSearchCPAnalyticsSession _cappedSearchCount:[(PXSearchCPAnalyticsSession *)self numberOfSearchesUntilFirstEnteredCollection]];
    v22 = +[PXSearchCPAnalyticsSession _cappedSearchCount:[(PXSearchCPAnalyticsSession *)self numberOfSearchesWithNoResults]];
    v21 = +[PXSearchCPAnalyticsSession _cappedSearchCount:[(PXSearchCPAnalyticsSession *)self numberOfSearchesWithWordEmbeddings]];
    v18 = +[PXSearchCPAnalyticsSession _cappedSearchCount:[(PXSearchCPAnalyticsSession *)self numberOfWordEmbeddingSelections]];
    v17 = +[PXSearchCPAnalyticsSession _cappedSearchCount:[(PXSearchCPAnalyticsSession *)self numberOfNextTokenSelections]];
    double v8 = +[PXSearchCPAnalyticsSession _cappedSearchCount:[(PXSearchCPAnalyticsSession *)self numberOfCompletionSelections]];
    [(PXSearchCPAnalyticsSession *)self startTime];
    v10 = +[PXSearchCPAnalyticsSession _bucketedTimeInterval:v5 - v9];
    [(PXSearchCPAnalyticsSession *)self timeIntervalSuccess];
    v13 = +[PXSearchCPAnalyticsSession _bucketedTimeInterval:](PXSearchCPAnalyticsSession, "_bucketedTimeInterval:");
    [(PXSearchCPAnalyticsSession *)self timeIntervalFirstAssetAction];
    v16 = +[PXSearchCPAnalyticsSession _bucketedTimeInterval:](PXSearchCPAnalyticsSession, "_bucketedTimeInterval:");
    [(PXSearchCPAnalyticsSession *)self timeIntervalFirstOneUpInTopAssets];
    v15 = +[PXSearchCPAnalyticsSession _bucketedTimeInterval:](PXSearchCPAnalyticsSession, "_bucketedTimeInterval:");
    [(PXSearchCPAnalyticsSession *)self timeIntervalFirstEnteredCollection];
    v14 = +[PXSearchCPAnalyticsSession _bucketedTimeInterval:](PXSearchCPAnalyticsSession, "_bucketedTimeInterval:");
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[PXSearchCPAnalyticsSession successful](self, "successful"));
    v30[0] = @"beginType";
    v30[1] = @"oneUpInTopAssets";
    v31[0] = v20;
    v31[1] = v29;
    v30[2] = @"enterCollectionResult";
    v30[3] = @"firstEnteredCollectionType";
    v31[2] = v28;
    v31[3] = v27;
    v30[4] = @"searchCount";
    v30[5] = @"searchCountUntilFirstSuccess";
    v31[4] = v26;
    v31[5] = v19;
    v30[6] = @"searchCountUntilFirstAssetAction";
    v30[7] = @"searchCountUntilFirstOneUpTopAssets";
    v31[6] = v25;
    v31[7] = v24;
    v30[8] = @"searchCountUntilFirstEnteredCollection";
    v30[9] = @"searchesWithNoResultsCount";
    v31[8] = v23;
    v31[9] = v22;
    v30[10] = @"searchesWithWordEmbeddingsCount";
    v30[11] = @"wordEmbeddingSelectionCount";
    v31[10] = v21;
    v31[11] = v18;
    v30[12] = @"nextTokenSelectionCount";
    v30[13] = @"completionSelectionCount";
    v31[12] = v17;
    v31[13] = v8;
    v30[14] = @"timeInterval";
    v30[15] = @"timeIntervalUntilSuccess";
    v31[14] = v10;
    v31[15] = v13;
    v30[16] = @"timeIntervalUntilFirstAssetInteraction";
    v30[17] = @"timeIntervalUntilFirstOneUpInTopAssets";
    v31[16] = v16;
    v31[17] = v15;
    v30[18] = @"timeIntervalUntilFirstEnteredCollection";
    v30[19] = @"success";
    v31[18] = v14;
    v31[19] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:20];
    [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.search.session" withPayload:v12];
    [(PXSearchCPAnalyticsSession *)self setIsValid:0];
  }
}

- (PXSearchCPAnalyticsSession)initWithBeginType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXSearchCPAnalyticsSession;
  double v4 = [(PXSearchCPAnalyticsSession *)&v9 init];
  double v5 = v4;
  if (v4)
  {
    v4->_beginType = a3;
    v4->_isValid = 1;
    double v6 = [MEMORY[0x1E4F28F80] processInfo];
    [v6 systemUptime];
    v5->_startTime = v7;
  }
  return v5;
}

+ (id)_cappedSearchCount:(unint64_t)a3
{
  if (a3 <= 0x1E)
  {
    double v5 = [NSNumber numberWithUnsignedInteger:v3];
  }
  else
  {
    double v5 = &unk_1F02D8050;
  }
  return v5;
}

+ (id)_bucketedTimeInterval:(double)a3
{
  uint64_t v3 = &unk_1F02D7FD8;
  uint64_t v4 = &unk_1F02D7FF0;
  double v5 = &unk_1F02D8008;
  double v6 = &unk_1F02D8038;
  if (a3 < 60.0) {
    double v6 = &unk_1F02D8020;
  }
  if (a3 >= 30.0) {
    double v5 = v6;
  }
  if (a3 >= 10.0) {
    uint64_t v4 = v5;
  }
  if (a3 >= 5.0) {
    uint64_t v3 = v4;
  }
  if (a3 == 0.0) {
    return &unk_1F02D7FC0;
  }
  else {
    return v3;
  }
}

+ (id)_stringForResultType:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    return @"none";
  }
  else {
    return off_1E5DBBCE0[a3 - 1];
  }
}

+ (id)_stringForActionType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"none";
  }
  else {
    return off_1E5DBBCC0[a3 - 1];
  }
}

+ (id)_stringForSessionBeginType:(unint64_t)a3
{
  if (a3 - 1 > 9) {
    return @"none";
  }
  else {
    return off_1E5DBBC70[a3 - 1];
  }
}

@end