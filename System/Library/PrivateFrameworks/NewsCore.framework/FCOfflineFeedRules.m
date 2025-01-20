@interface FCOfflineFeedRules
- (FCOfflineFeedRules)initWithDictionary:(id)a3 defaultMaxGroups:(int64_t)a4 defaultMaxArticleDownloads:(int64_t)a5 defaultMaxIssueDownloads:(int64_t)a6 defaultMaxPuzzleDownloads:(int64_t)a7 defaultMaxAudioDownloads:(int64_t)a8;
- (FCOfflineFeedRules)initWithMaxGroups:(int64_t)a3 maxArticleDownloads:(int64_t)a4 maxIssueDownloads:(int64_t)a5 maxPuzzleDownloads:(int64_t)a6 maxAudioDownloads:(int64_t)a7;
- (int64_t)maxArticleDownloads;
- (int64_t)maxAudioDownloads;
- (int64_t)maxGroups;
- (int64_t)maxIssueDownloads;
- (int64_t)maxPuzzleDownloads;
@end

@implementation FCOfflineFeedRules

- (FCOfflineFeedRules)initWithMaxGroups:(int64_t)a3 maxArticleDownloads:(int64_t)a4 maxIssueDownloads:(int64_t)a5 maxPuzzleDownloads:(int64_t)a6 maxAudioDownloads:(int64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)FCOfflineFeedRules;
  result = [(FCOfflineFeedRules *)&v13 init];
  if (result)
  {
    result->_maxGroups = a3;
    result->_maxArticleDownloads = a4;
    result->_maxIssueDownloads = a5;
    result->_maxPuzzleDownloads = a6;
    result->_maxAudioDownloads = a7;
  }
  return result;
}

- (FCOfflineFeedRules)initWithDictionary:(id)a3 defaultMaxGroups:(int64_t)a4 defaultMaxArticleDownloads:(int64_t)a5 defaultMaxIssueDownloads:(int64_t)a6 defaultMaxPuzzleDownloads:(int64_t)a7 defaultMaxAudioDownloads:(int64_t)a8
{
  id v14 = a3;
  uint64_t v15 = FCAppConfigurationIntegerValue(v14, @"maxGroups", a4);
  uint64_t v16 = FCAppConfigurationIntegerValue(v14, @"maxArticleDownloads", a5);
  uint64_t v17 = FCAppConfigurationIntegerValue(v14, @"maxIssueDownloads", a6);
  uint64_t v18 = FCAppConfigurationIntegerValue(v14, @"maxPuzzleDownloads", a7);
  uint64_t v19 = FCAppConfigurationIntegerValue(v14, @"maxAudioDownloads", a8);

  return [(FCOfflineFeedRules *)self initWithMaxGroups:v15 maxArticleDownloads:v16 maxIssueDownloads:v17 maxPuzzleDownloads:v18 maxAudioDownloads:v19];
}

- (int64_t)maxGroups
{
  return self->_maxGroups;
}

- (int64_t)maxArticleDownloads
{
  return self->_maxArticleDownloads;
}

- (int64_t)maxIssueDownloads
{
  return self->_maxIssueDownloads;
}

- (int64_t)maxPuzzleDownloads
{
  return self->_maxPuzzleDownloads;
}

- (int64_t)maxAudioDownloads
{
  return self->_maxAudioDownloads;
}

@end