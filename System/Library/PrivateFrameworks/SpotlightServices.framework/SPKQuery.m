@interface SPKQuery
+ (BOOL)isQuerySupported:(unint64_t)a3;
+ (unsigned)searchDomain;
- (BOOL)completedGather;
- (BOOL)isApplicationQuery;
- (BOOL)isCalculatorQuery;
- (BOOL)isCanceled;
- (BOOL)isCompleted;
- (BOOL)isCoreSpotlightQuery;
- (BOOL)isDictionaryQuery;
- (BOOL)isDocumentQuery;
- (BOOL)isExtensionQuery;
- (BOOL)isFinished;
- (BOOL)isParsecQuery;
- (BOOL)isStarted;
- (BOOL)isURLQuery;
- (BOOL)needsIO;
- (BOOL)sendEmptyResponseIfNecessary;
- (BOOL)shouldReturnEarly;
- (BOOL)supportsRefinement;
- (BOOL)wantsSuggestions;
- (NSArray)childQueries;
- (NSString)internalUnmodifiedUserQueryString;
- (NSString)trimmedUserQueryString;
- (NSString)unmodifiedUserQueryString;
- (NSString)userQueryString;
- (PRSRankingItemRanker)ranker;
- (SPKQuery)initWithUserQuery:(id)a3;
- (SPKQuery)initWithUserQuery:(id)a3 options:(unint64_t)a4;
- (SPKQuery)initWithUserQuery:(id)a3 queryGroupId:(unint64_t)a4;
- (SPKQuery)initWithUserQuery:(id)a3 queryGroupId:(unint64_t)a4 options:(unint64_t)a5 queryContext:(id)a6;
- (SPKQuery)parentQuery;
- (SPKQueryDelegate)delegate;
- (SPSearchQueryContext)queryContext;
- (double)queryStartTime;
- (double)startTime;
- (id)clientResponseHandler;
- (id)description;
- (id)responseHandler;
- (int)getQueryStatePtr;
- (int)queryState;
- (unint64_t)queryGroupId;
- (unint64_t)queryId;
- (unint64_t)queryOptions;
- (void)_queryDidComplete;
- (void)_queryWillStart;
- (void)addChildQuery:(id)a3;
- (void)cancel;
- (void)setClientResponseHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInternalUnmodifiedUserQueryString:(id)a3;
- (void)setParentQuery:(id)a3;
- (void)setQueryOptions:(unint64_t)a3;
- (void)setQueryStartTime:(double)a3;
- (void)setQueryState:(int)a3;
- (void)setWantsSuggestions:(BOOL)a3;
- (void)start;
@end

@implementation SPKQuery

- (BOOL)needsIO
{
  return 0;
}

+ (BOOL)isQuerySupported:(unint64_t)a3
{
  return 1;
}

+ (unsigned)searchDomain
{
  return 12;
}

- (SPKQuery)initWithUserQuery:(id)a3 queryGroupId:(unint64_t)a4
{
  return [(SPKQuery *)self initWithUserQuery:a3 queryGroupId:a4 options:0 queryContext:0];
}

- (SPKQuery)initWithUserQuery:(id)a3
{
  return [(SPKQuery *)self initWithUserQuery:a3 options:0];
}

- (SPKQuery)initWithUserQuery:(id)a3 options:(unint64_t)a4
{
  return [(SPKQuery *)self initWithUserQuery:a3 queryGroupId:0 options:0 queryContext:0];
}

- (SPKQuery)initWithUserQuery:(id)a3 queryGroupId:(unint64_t)a4 options:(unint64_t)a5 queryContext:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SPKQuery;
  v13 = [(SPKQuery *)&v19 init];
  v14 = v13;
  if (v13)
  {
    v13->_queryId = ++gQueryId;
    v13->_queryGroupId = a4;
    objc_storeStrong((id *)&v13->_userQueryString, a3);
    v15 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v16 = [v11 stringByTrimmingCharactersInSet:v15];
    trimmedUserQueryString = v14->_trimmedUserQueryString;
    v14->_trimmedUserQueryString = (NSString *)v16;

    v14->_queryOptions = a5;
    v14->_queryStartTime = CFAbsoluteTimeGetCurrent();
    objc_storeStrong((id *)&v14->_queryContext, a6);
    v14->_wantsSuggestions = [v12 queryKind] == 2;
    v14->_queryState = 0;
  }

  return v14;
}

- (int)getQueryStatePtr
{
  return &self->_queryState;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(SPKQuery *)self queryId];
  unsigned int v7 = [(SPKQuery *)self queryState];
  if (v7 > 6) {
    v8 = @"unknown state";
  }
  else {
    v8 = off_1E634C0F8[v7];
  }
  v9 = [(SPKQuery *)self userQueryString];
  v10 = SSRedactString(v9, 1);
  id v11 = [v3 stringWithFormat:@"<%@>[%p] (%lu:%@ - %@)", v5, self, v6, v8, v10];

  return v11;
}

- (NSString)unmodifiedUserQueryString
{
  v3 = [(SPKQuery *)self internalUnmodifiedUserQueryString];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SPKQuery *)self userQueryString];
  }
  unint64_t v6 = v5;

  return (NSString *)v6;
}

- (id)responseHandler
{
  id location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__SPKQuery_responseHandler__block_invoke;
  v5[3] = &unk_1E634C0D8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v3 = (void *)MEMORY[0x1C1885400](v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __27__SPKQuery_responseHandler__block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (!WeakRetained || ([WeakRetained isCanceled] & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v5 = [v14 userQueryString];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [v4 userQueryString];
    if (v7)
    {
      v8 = (void *)v7;
      v9 = [v4 userQueryString];
      v10 = [v14 userQueryString];
      if (([v9 isEqualToString:v10] & 1) == 0)
      {
        char v13 = [v14 isRewrite];

        if ((v13 & 1) == 0) {
          goto LABEL_14;
        }
        goto LABEL_8;
      }
    }
  }
LABEL_8:
  int v11 = [v14 kind];
  if (v11)
  {
    if (v11 == 6 || v11 == 4) {
      [v4 _queryDidComplete];
    }
  }
  else
  {
    [v4 setQueryState:6];
  }
  id v12 = [*(id *)(a1 + 32) delegate];
  [v12 queryTask:*(void *)(a1 + 32) gotResponse:v14];

LABEL_14:
}

- (NSArray)childQueries
{
  v2 = (void *)[(NSMutableArray *)self->_childQueries copy];
  return (NSArray *)v2;
}

- (void)addChildQuery:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!self->_childQueries)
  {
    uint64_t v5 = (NSMutableArray *)objc_opt_new();
    childQueries = self->_childQueries;
    self->_childQueries = v5;

    id v4 = v7;
  }
  [v4 setParentQuery:self];
  [(NSMutableArray *)self->_childQueries addObject:v7];
}

- (BOOL)isStarted
{
  return [(SPKQuery *)self queryState] != 0;
}

- (BOOL)isCompleted
{
  return [(SPKQuery *)self queryState] == 4;
}

- (BOOL)isCanceled
{
  return [(SPKQuery *)self queryState] == 5;
}

- (BOOL)isFinished
{
  return [(SPKQuery *)self queryState] > 3;
}

- (BOOL)completedGather
{
  return [(SPKQuery *)self queryState] > 2;
}

- (BOOL)shouldReturnEarly
{
  v2 = [(SPKQuery *)self queryContext];
  v3 = [v2 searchDomains];

  uint64_t v4 = [(id)objc_opt_class() searchDomain];
  if ([v3 count])
  {
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v4];
    int v6 = [v3 containsObject:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)sendEmptyResponseIfNecessary
{
  if ([(SPKQuery *)self shouldReturnEarly]) {
    goto LABEL_9;
  }
  v3 = [(SPKQuery *)self userQueryString];
  if ([v3 length])
  {
    id v4 = [(SPKQuery *)self userQueryString];
    if ([v4 UTF8String])
    {
      NSUInteger v5 = [(NSString *)self->_trimmedUserQueryString length];

      if (!v5) {
        goto LABEL_9;
      }
      return 0;
    }
  }
  else
  {
    NSUInteger v6 = [(NSString *)self->_trimmedUserQueryString length];

    if (v6) {
      return 0;
    }
  }
LABEL_9:
  v8 = [[SPKResponse alloc] initWithQueryID:[(SPKQuery *)self queryGroupId] sections:0];
  v9 = [(SPKQuery *)self responseHandler];
  ((void (**)(void, SPKResponse *))v9)[2](v9, v8);

  return 1;
}

- (void)start
{
  if (![(SPKQuery *)self isStarted])
  {
    [(SPKQuery *)self _queryWillStart];
  }
}

- (void)cancel
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(SPKQuery *)self setQueryState:5];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(SPKQuery *)self childQueries];
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
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) cancel];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (double)startTime
{
  return self->_startTime;
}

- (void)_queryWillStart
{
  [(SPKQuery *)self setQueryState:1];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_startTime = v3;
}

- (void)_queryDidComplete
{
}

- (BOOL)isParsecQuery
{
  return 0;
}

- (BOOL)isURLQuery
{
  return 0;
}

- (BOOL)isDocumentQuery
{
  return 0;
}

- (BOOL)isCoreSpotlightQuery
{
  return 0;
}

- (BOOL)isApplicationQuery
{
  return 0;
}

- (BOOL)isCalculatorQuery
{
  return 0;
}

- (BOOL)supportsRefinement
{
  return 0;
}

- (BOOL)isDictionaryQuery
{
  return 0;
}

- (unint64_t)queryOptions
{
  return self->_queryOptions;
}

- (void)setQueryOptions:(unint64_t)a3
{
  self->_queryOptions = a3;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (unint64_t)queryGroupId
{
  return self->_queryGroupId;
}

- (NSString)userQueryString
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)trimmedUserQueryString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)wantsSuggestions
{
  return self->_wantsSuggestions;
}

- (void)setWantsSuggestions:(BOOL)a3
{
  self->_wantsSuggestions = a3;
}

- (SPKQueryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SPKQueryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PRSRankingItemRanker)ranker
{
  return (PRSRankingItemRanker *)objc_getProperty(self, a2, 80, 1);
}

- (SPKQuery)parentQuery
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentQuery);
  return (SPKQuery *)WeakRetained;
}

- (void)setParentQuery:(id)a3
{
}

- (double)queryStartTime
{
  return self->_queryStartTime;
}

- (void)setQueryStartTime:(double)a3
{
  self->_queryStartTime = a3;
}

- (SPSearchQueryContext)queryContext
{
  return (SPSearchQueryContext *)objc_getProperty(self, a2, 104, 1);
}

- (int)queryState
{
  return self->_queryState;
}

- (void)setQueryState:(int)a3
{
  self->_queryState = a3;
}

- (BOOL)isExtensionQuery
{
  return self->_extensionQuery;
}

- (id)clientResponseHandler
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setClientResponseHandler:(id)a3
{
}

- (NSString)internalUnmodifiedUserQueryString
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInternalUnmodifiedUserQueryString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalUnmodifiedUserQueryString, 0);
  objc_storeStrong(&self->_clientResponseHandler, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_destroyWeak((id *)&self->_parentQuery);
  objc_storeStrong((id *)&self->_ranker, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trimmedUserQueryString, 0);
  objc_storeStrong((id *)&self->_userQueryString, 0);
  objc_storeStrong((id *)&self->_childQueries, 0);
}

@end