@interface NTCatchUpOperationResults
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (NSObject)supplementalInterestToken;
- (NTCatchUpOperationResults)init;
- (NTCatchUpOperationResults)initWithFeedItems:(id)a3 supplementalInterestToken:(id)a4 feedContextByFeedID:(id)a5;
- (NTCatchUpOperationResults)initWithHeadlines:(id)a3 rankingFeedback:(id)a4 actionURLsByArticleID:(id)a5;
- (NTCatchUpOperationResults)initWithItems:(id)a3 rankingFeedback:(id)a4 supplementalInterestToken:(id)a5;
- (SFRankingFeedback)rankingFeedback;
- (id)copyWithItems:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)resultsByCombiningWithResults:(id)a3;
- (unint64_t)hash;
@end

@implementation NTCatchUpOperationResults

- (NTCatchUpOperationResults)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTCatchUpOperationResults init]";
    __int16 v9 = 2080;
    v10 = "NTCatchUpOperation.m";
    __int16 v11 = 1024;
    int v12 = 30;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTCatchUpOperationResults init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTCatchUpOperationResults)initWithHeadlines:(id)a3 rankingFeedback:(id)a4 actionURLsByArticleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperationResults initWithHeadlines:rankingFeedback:actionURLsByArticleID:]();
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __85__NTCatchUpOperationResults_initWithHeadlines_rankingFeedback_actionURLsByArticleID___block_invoke;
  v15[3] = &unk_26475C800;
  id v16 = v10;
  id v11 = v10;
  int v12 = objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v15);
  __int16 v13 = [(NTCatchUpOperationResults *)self initWithItems:v12 rankingFeedback:v9 supplementalInterestToken:0];

  return v13;
}

NTFeedTransformationHeadlineItem *__85__NTCatchUpOperationResults_initWithHeadlines_rankingFeedback_actionURLsByArticleID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [NTFeedTransformationHeadlineItem alloc];
  v5 = [MEMORY[0x263EFF910] distantFuture];
  id v6 = *(void **)(a1 + 32);
  v7 = [v3 articleID];
  id v8 = [v6 objectForKeyedSubscript:v7];
  id v9 = [(NTFeedTransformationHeadlineItem *)v4 initWithHeadline:v3 cacheExpirationDate:v5 actionURL:v8];

  return v9;
}

- (NTCatchUpOperationResults)initWithFeedItems:(id)a3 supplementalInterestToken:(id)a4 feedContextByFeedID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperationResults initWithFeedItems:supplementalInterestToken:feedContextByFeedID:]();
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __93__NTCatchUpOperationResults_initWithFeedItems_supplementalInterestToken_feedContextByFeedID___block_invoke;
  v15[3] = &unk_26475C828;
  id v16 = v10;
  id v11 = v10;
  int v12 = objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v15);
  __int16 v13 = [(NTCatchUpOperationResults *)self initWithItems:v12 rankingFeedback:0 supplementalInterestToken:v9];

  return v13;
}

NTFeedTransformationFeedItem *__93__NTCatchUpOperationResults_initWithFeedItems_supplementalInterestToken_feedContextByFeedID___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 feedID];
  v5 = objc_msgSend(v2, "fc_safeObjectForKey:", v4);

  id v6 = [NTFeedTransformationFeedItem alloc];
  v7 = [MEMORY[0x263EFF910] distantFuture];
  id v8 = [v5 channelID];
  id v9 = [(NTFeedTransformationFeedItem *)v6 initWithFeedItem:v3 cacheExpirationDate:v7 surfacedByChannelID:v8];

  return v9;
}

- (NTCatchUpOperationResults)initWithItems:(id)a3 rankingFeedback:(id)a4 supplementalInterestToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperationResults initWithItems:rankingFeedback:supplementalInterestToken:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)NTCatchUpOperationResults;
  id v11 = [(NTCatchUpOperationResults *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    items = v11->_items;
    v11->_items = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    rankingFeedback = v11->_rankingFeedback;
    v11->_rankingFeedback = (SFRankingFeedback *)v14;

    objc_storeStrong((id *)&v11->_supplementalInterestToken, a5);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[NTCatchUpOperationResults allocWithZone:a3];
  v5 = [(NTCatchUpOperationResults *)self items];
  id v6 = [(NTCatchUpOperationResults *)self rankingFeedback];
  v7 = [(NTCatchUpOperationResults *)self supplementalInterestToken];
  id v8 = [(NTCatchUpOperationResults *)v4 initWithItems:v5 rankingFeedback:v6 supplementalInterestToken:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = FCDynamicCast();

  if (v5)
  {
    id v6 = [(NTCatchUpOperationResults *)self items];
    v7 = [v5 items];
    if ([v6 isEqual:v7])
    {
      id v8 = [(NTCatchUpOperationResults *)self rankingFeedback];
      id v9 = [v5 rankingFeedback];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = [(NTCatchUpOperationResults *)self items];
  uint64_t v4 = [v3 hash];
  v5 = [(NTCatchUpOperationResults *)self rankingFeedback];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)copyWithItems:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperationResults copyWithItems:]();
  }
  v5 = [NTCatchUpOperationResults alloc];
  unint64_t v6 = [(NTCatchUpOperationResults *)self rankingFeedback];
  v7 = [(NTCatchUpOperationResults *)self supplementalInterestToken];
  id v8 = [(NTCatchUpOperationResults *)v5 initWithItems:v4 rankingFeedback:v6 supplementalInterestToken:v7];

  return v8;
}

- (id)resultsByCombiningWithResults:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperationResults resultsByCombiningWithResults:]();
  }
  v5 = [(NTCatchUpOperationResults *)self rankingFeedback];

  if (v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperationResults resultsByCombiningWithResults:]();
  }
  unint64_t v6 = [v4 rankingFeedback];

  if (v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperationResults resultsByCombiningWithResults:]();
  }
  v7 = [NTCatchUpOperationResults alloc];
  id v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = [v4 items];
  char v10 = [(NTCatchUpOperationResults *)self items];
  id v11 = objc_msgSend(v8, "fc_arrayByAddingObjectsFromArray:toArray:", v9, v10);
  uint64_t v12 = [(NTCatchUpOperationResults *)self supplementalInterestToken];
  __int16 v13 = [(NTCatchUpOperationResults *)v7 initWithItems:v11 rankingFeedback:0 supplementalInterestToken:v12];

  return v13;
}

- (NSArray)items
{
  return self->_items;
}

- (SFRankingFeedback)rankingFeedback
{
  return self->_rankingFeedback;
}

- (NSObject)supplementalInterestToken
{
  return self->_supplementalInterestToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalInterestToken, 0);
  objc_storeStrong((id *)&self->_rankingFeedback, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (void)initWithHeadlines:rankingFeedback:actionURLsByArticleID:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headlines", v6, 2u);
}

- (void)initWithFeedItems:supplementalInterestToken:feedContextByFeedID:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedItems", v6, 2u);
}

- (void)initWithItems:rankingFeedback:supplementalInterestToken:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"items", v6, 2u);
}

- (void)copyWithItems:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"items", v6, 2u);
}

- (void)resultsByCombiningWithResults:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"otherResults.rankingFeedback == nil", v6, 2u);
}

- (void)resultsByCombiningWithResults:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"self.rankingFeedback == nil", v6, 2u);
}

- (void)resultsByCombiningWithResults:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"otherResults", v6, 2u);
}

@end