@interface SPSearchQuery
- (BOOL)cancelled;
- (BOOL)grouped;
- (BOOL)hasMarkedText;
- (BOOL)infinitePatience;
- (BOOL)internalDebug;
- (BOOL)internalValidation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWideScreen;
- (BOOL)noTokenize;
- (BOOL)plausiblyMatchesQuery:(id)a3;
- (BOOL)promoteLocalResults;
- (BOOL)promoteParsecResults;
- (NSArray)disabledApps;
- (NSArray)disabledBundles;
- (SPSearchQuery)initWithQuery:(id)a3 domains:(id)a4;
- (SPSearchQuery)initWithSearchQueryContext:(id)a3;
- (SPSearchQueryContext)queryContext;
- (double)cancellationTime;
- (double)creationTime;
- (double)currentTime;
- (int64_t)contentFilters;
- (int64_t)maxCount;
- (unint64_t)creationStamp;
- (unint64_t)hash;
- (unint64_t)queryID;
- (unint64_t)queryIdent;
- (void)cancel;
- (void)execute:(id)a3;
- (void)setContentFilters:(int64_t)a3;
- (void)setDisabledApps:(id)a3;
- (void)setDisabledBundles:(id)a3;
- (void)setGrouped:(BOOL)a3;
- (void)setInfinitePatience:(BOOL)a3;
- (void)setInternalDebug:(BOOL)a3;
- (void)setInternalValidation:(BOOL)a3;
- (void)setIsWideScreen:(BOOL)a3;
- (void)setMaxCount:(int64_t)a3;
- (void)setNoTokenize:(BOOL)a3;
- (void)setPromoteLocalResults:(BOOL)a3;
- (void)setPromoteParsecResults:(BOOL)a3;
- (void)setQueryIdent:(unint64_t)a3;
@end

@implementation SPSearchQuery

- (SPSearchQueryContext)queryContext
{
  return self->_queryContext;
}

- (SPSearchQuery)initWithSearchQueryContext:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 searchString];
  v7 = SPLogForSPLogCategoryQuery();
  os_log_type_t v8 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v6;
    _os_log_impl(&dword_21E5D7000, v7, v8, "Started search on %@", buf, 0xCu);
  }

  v22.receiver = self;
  v22.super_class = (Class)SPSearchQuery;
  v9 = [(SPSearchQuery *)&v22 init];
  v10 = v9;
  if (v9)
  {
    v9->_queryID = atomic_fetch_add(initWithSearchQueryContext____queryIDIter, 1u);
    v9->_queryIdent = atomic_fetch_add(&initWithSearchQueryContext____queryIdentIter, 1uLL);
    objc_storeStrong((id *)&v9->_queryContext, a3);
    objc_storeStrong((id *)&v10->_searchString, v6);
    uint64_t v11 = [v5 keyboardLanguage];
    keyboardLanguage = v10->_keyboardLanguage;
    v10->_keyboardLanguage = (NSString *)v11;

    uint64_t v13 = [v5 keyboardPrimaryLanguage];
    keyboardPrimaryLanguage = v10->_keyboardPrimaryLanguage;
    v10->_keyboardPrimaryLanguage = (NSString *)v13;

    [v5 scaleFactor];
    v10->_scaleFactor = v15;
    v10->_creationTime = CFAbsoluteTimeGetCurrent();
    v10->_creationStamp = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    uint64_t v16 = [v5 disabledBundles];
    disabledBundles = v10->_disabledBundles;
    v10->_disabledBundles = (NSArray *)v16;

    uint64_t v18 = [v5 disabledApps];
    disabledApps = v10->_disabledApps;
    v10->_disabledApps = (NSArray *)v18;

    v10->_promoteLocalResults = [v5 promoteLocalResults];
    v10->_promoteParsecResults = [v5 promoteParsecResults];
    v10->_noTokenize = [v5 noTokenize];
    if ([v5 queryIdent]) {
      v10->_queryIdent = [v5 queryIdent];
    }
    v10->_internalValidation = [v5 internalValidation];
    v10->_internalDebug = [v5 internalDebug];
    [v5 currentTime];
    v10->_currentTime = v20;
  }

  return v10;
}

- (unint64_t)queryIdent
{
  return self->_queryIdent;
}

- (BOOL)cancelled
{
  return atomic_load_explicit((atomic_uchar *volatile)&self->_cancelled, memory_order_acquire) & 1;
}

- (void)cancel
{
  self->_cancellationTime = CFAbsoluteTimeGetCurrent();
  atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
}

- (void)execute:(id)a3
{
}

- (SPSearchQuery)initWithQuery:(id)a3 domains:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x263F78DB0]);
  v7 = [v5 queryContext];
  os_log_type_t v8 = [v7 searchString];
  v9 = (void *)[v6 initWithSearchString:v8];

  v10 = [(SPSearchQuery *)self initWithSearchQueryContext:v9];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_queryID = v5[1];
    v10->_queryIdent = v5[16];
    v10->_creationTime = (double)v5[8];
    v10->_creationStamp = v5[10];
    v10->_currentTime = (double)v5[18];
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  return self->_queryID == *((void *)a3 + 1);
}

- (unint64_t)hash
{
  return self->_queryID;
}

- (BOOL)hasMarkedText
{
  v2 = [(SPSearchQuery *)self queryContext];
  v3 = [v2 markedTextArray];
  BOOL v4 = [v3 count] == 3;

  return v4;
}

- (BOOL)plausiblyMatchesQuery:(id)a3
{
  BOOL v4 = (id *)a3;
  if ([v4[2] length] && -[NSString length](self->_searchString, "length")) {
    BOOL v5 = ([v4[2] hasPrefix:self->_searchString] & 1) != 0
  }
      || [(NSString *)self->_searchString hasPrefix:v4[2]];
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (BOOL)grouped
{
  return self->_grouped;
}

- (void)setGrouped:(BOOL)a3
{
  self->_grouped = a3;
}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(int64_t)a3
{
  self->_maxCount = a3;
}

- (NSArray)disabledBundles
{
  return self->_disabledBundles;
}

- (void)setDisabledBundles:(id)a3
{
}

- (NSArray)disabledApps
{
  return self->_disabledApps;
}

- (void)setDisabledApps:(id)a3
{
}

- (BOOL)noTokenize
{
  return self->_noTokenize;
}

- (void)setNoTokenize:(BOOL)a3
{
  self->_noTokenize = a3;
}

- (BOOL)infinitePatience
{
  return self->_infinitePatience;
}

- (void)setInfinitePatience:(BOOL)a3
{
  self->_infinitePatience = a3;
}

- (BOOL)isWideScreen
{
  return self->_isWideScreen;
}

- (void)setIsWideScreen:(BOOL)a3
{
  self->_isWideScreen = a3;
}

- (void)setQueryIdent:(unint64_t)a3
{
  self->_queryIdent = a3;
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

- (int64_t)contentFilters
{
  return self->_contentFilters;
}

- (void)setContentFilters:(int64_t)a3
{
  self->_contentFilters = a3;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (double)cancellationTime
{
  return self->_cancellationTime;
}

- (unint64_t)creationStamp
{
  return self->_creationStamp;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledApps, 0);
  objc_storeStrong((id *)&self->_disabledBundles, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->markedTextArray, 0);
  objc_storeStrong((id *)&self->_keyboardPrimaryLanguage, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);

  objc_storeStrong((id *)&self->_searchString, 0);
}

@end