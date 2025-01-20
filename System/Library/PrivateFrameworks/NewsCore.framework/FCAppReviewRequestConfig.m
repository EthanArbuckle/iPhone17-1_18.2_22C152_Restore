@interface FCAppReviewRequestConfig
- (FCAppReviewRequestConfig)initWithDictionary:(id)a3;
- (int64_t)minNumberOfCombinedActions;
- (int64_t)minNumberOfEndOfArticleReads;
- (int64_t)minNumberOfLikedArticles;
- (int64_t)minNumberOfSavedArticles;
- (int64_t)minNumberOfSharedArticles;
- (int64_t)quiescenceInterval;
@end

@implementation FCAppReviewRequestConfig

- (FCAppReviewRequestConfig)initWithDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCAppReviewRequestConfig;
  v5 = [(FCAppReviewRequestConfig *)&v7 init];
  if (v5)
  {
    v5->_quiescenceInterval = FCAppConfigurationIntegerValue(v4, @"quiescenceInterval", 0x7FFFFFFFFFFFFFFFLL);
    v5->_minNumberOfLikedArticles = FCAppConfigurationIntegerValue(v4, @"minNumberOfLikedArticles", 0x7FFFFFFFFFFFFFFFLL);
    v5->_minNumberOfSavedArticles = FCAppConfigurationIntegerValue(v4, @"minNumberOfSavedArticles", 0x7FFFFFFFFFFFFFFFLL);
    v5->_minNumberOfSharedArticles = FCAppConfigurationIntegerValue(v4, @"minNumberOfSharedArticles", 0x7FFFFFFFFFFFFFFFLL);
    v5->_minNumberOfEndOfArticleReads = FCAppConfigurationIntegerValue(v4, @"minNumberOfEndOfArticleReads", 0x7FFFFFFFFFFFFFFFLL);
    v5->_minNumberOfCombinedActions = FCAppConfigurationIntegerValue(v4, @"minNumberOfCombinedActions", 0x7FFFFFFFFFFFFFFFLL);
  }

  return v5;
}

- (int64_t)quiescenceInterval
{
  return self->_quiescenceInterval;
}

- (int64_t)minNumberOfLikedArticles
{
  return self->_minNumberOfLikedArticles;
}

- (int64_t)minNumberOfSavedArticles
{
  return self->_minNumberOfSavedArticles;
}

- (int64_t)minNumberOfSharedArticles
{
  return self->_minNumberOfSharedArticles;
}

- (int64_t)minNumberOfEndOfArticleReads
{
  return self->_minNumberOfEndOfArticleReads;
}

- (int64_t)minNumberOfCombinedActions
{
  return self->_minNumberOfCombinedActions;
}

@end