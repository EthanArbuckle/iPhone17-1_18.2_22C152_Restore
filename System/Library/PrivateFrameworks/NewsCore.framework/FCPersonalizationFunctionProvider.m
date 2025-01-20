@interface FCPersonalizationFunctionProvider
- (FCPersonalizationFunctionProvider)init;
- (FCPersonalizationFunctionProvider)initWithAppConfiguration:(id)a3;
- (double)articleDiversificationSimilarityExpectationEnd;
- (double)articleDiversificationSimilarityExpectationStart;
- (double)articleDiversificationUniquePublisherExpectationSlope;
- (double)articleDiversificationUniquePublisherExpectationYIntercept;
- (id)diversifyItems:(id)a3 limit:(unint64_t)a4;
- (id)diversifyItems:(id)a3 limit:(unint64_t)a4 preselectedItems:(id)a5;
- (void)setArticleDiversificationSimilarityExpectationEnd:(double)a3;
- (void)setArticleDiversificationSimilarityExpectationStart:(double)a3;
- (void)setArticleDiversificationUniquePublisherExpectationSlope:(double)a3;
- (void)setArticleDiversificationUniquePublisherExpectationYIntercept:(double)a3;
@end

@implementation FCPersonalizationFunctionProvider

- (FCPersonalizationFunctionProvider)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPersonalizationFunctionProvider init]";
    __int16 v9 = 2080;
    v10 = "FCPersonalizationFunctionProvider.m";
    __int16 v11 = 1024;
    int v12 = 28;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPersonalizationFunctionProvider init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCPersonalizationFunctionProvider)initWithAppConfiguration:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "appConfiguration");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCPersonalizationFunctionProvider initWithAppConfiguration:]";
    __int16 v15 = 2080;
    v16 = "FCPersonalizationFunctionProvider.m";
    __int16 v17 = 1024;
    int v18 = 33;
    __int16 v19 = 2114;
    v20 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v12.receiver = self;
  v12.super_class = (Class)FCPersonalizationFunctionProvider;
  v5 = [(FCPersonalizationFunctionProvider *)&v12 init];
  if (v5)
  {
    [v4 articleDiversificationSimilarityExpectationStart];
    v5->_articleDiversificationSimilarityExpectationStart = v6;
    [v4 articleDiversificationSimilarityExpectationEnd];
    v5->_articleDiversificationSimilarityExpectationEnd = v7;
    [v4 articleDiversificationUniquePublisherExpectationSlope];
    v5->_articleDiversificationUniquePublisherExpectationSlope = v8;
    [v4 articleDiversificationUniquePublisherExpectationYIntercept];
    v5->_articleDiversificationUniquePublisherExpectationYIntercept = v9;
  }

  return v5;
}

- (id)diversifyItems:(id)a3 limit:(unint64_t)a4
{
  return [(FCPersonalizationFunctionProvider *)self diversifyItems:a3 limit:a4 preselectedItems:MEMORY[0x1E4F1CBF0]];
}

- (id)diversifyItems:(id)a3 limit:(unint64_t)a4 preselectedItems:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(FCPersonalizationFunctionProvider *)self articleDiversificationSimilarityExpectationStart];
  double v11 = v10;
  [(FCPersonalizationFunctionProvider *)self articleDiversificationSimilarityExpectationEnd];
  double v13 = v12;
  [(FCPersonalizationFunctionProvider *)self articleDiversificationUniquePublisherExpectationSlope];
  double v15 = v14;
  [(FCPersonalizationFunctionProvider *)self articleDiversificationUniquePublisherExpectationYIntercept];
  __int16 v17 = +[FCPersonalizationUtilities diversifyItems:v9 withPreselectedItems:v8 limit:a4 similarityStartExpectation:v11 similarityEndExpectation:v13 publisherDiversificationSlope:v15 publisherDiversificationYIntercept:v16];

  return v17;
}

- (double)articleDiversificationSimilarityExpectationStart
{
  return self->_articleDiversificationSimilarityExpectationStart;
}

- (void)setArticleDiversificationSimilarityExpectationStart:(double)a3
{
  self->_articleDiversificationSimilarityExpectationStart = a3;
}

- (double)articleDiversificationSimilarityExpectationEnd
{
  return self->_articleDiversificationSimilarityExpectationEnd;
}

- (void)setArticleDiversificationSimilarityExpectationEnd:(double)a3
{
  self->_articleDiversificationSimilarityExpectationEnd = a3;
}

- (double)articleDiversificationUniquePublisherExpectationSlope
{
  return self->_articleDiversificationUniquePublisherExpectationSlope;
}

- (void)setArticleDiversificationUniquePublisherExpectationSlope:(double)a3
{
  self->_articleDiversificationUniquePublisherExpectationSlope = a3;
}

- (double)articleDiversificationUniquePublisherExpectationYIntercept
{
  return self->_articleDiversificationUniquePublisherExpectationYIntercept;
}

- (void)setArticleDiversificationUniquePublisherExpectationYIntercept:(double)a3
{
  self->_articleDiversificationUniquePublisherExpectationYIntercept = a3;
}

@end