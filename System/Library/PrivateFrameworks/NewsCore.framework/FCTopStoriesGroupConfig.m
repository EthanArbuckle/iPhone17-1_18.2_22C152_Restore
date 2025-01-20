@interface FCTopStoriesGroupConfig
- (FCTopStoriesGroupConfig)initWithDictionary:(id)a3;
- (NSArray)mandatoryArticleIDPairs;
- (NSArray)optionalArticleIDs;
- (NSDate)publishDate;
- (NSDictionary)topStoriesMetadataByArticleID;
- (void)setTopStoriesMetadataByArticleID:(id)a3;
@end

@implementation FCTopStoriesGroupConfig

- (FCTopStoriesGroupConfig)initWithDictionary:(id)a3
{
  v31.receiver = self;
  v31.super_class = (Class)FCTopStoriesGroupConfig;
  v3 = [(FCGroupConfig *)&v31 initWithDictionary:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = [MEMORY[0x1E4F1CA48] array];
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    v7 = [(FCGroupConfig *)v3 dictionary];
    v8 = [v7 objectForKeyedSubscript:@"mandatory_articles"];

    if (v8)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __46__FCTopStoriesGroupConfig_initWithDictionary___block_invoke;
      v28[3] = &unk_1E5B53E10;
      v29 = v6;
      v30 = v4;
      [v8 enumerateObjectsUsingBlock:v28];
    }
    v9 = [(FCGroupConfig *)v3 dictionary];
    v10 = [v9 objectForKeyedSubscript:@"personalized_articles"];

    if (v10)
    {
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __46__FCTopStoriesGroupConfig_initWithDictionary___block_invoke_2;
      v25 = &unk_1E5B53E10;
      v26 = v5;
      v27 = v6;
      [v10 enumerateObjectsUsingBlock:&v22];
    }
    v11 = [(FCGroupConfig *)v3 dictionary];
    v12 = [v11 objectForKeyedSubscript:@"publishDate"];

    if (v12)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "fc_dateFromStringWithISO8601Format:", v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
    mandatoryArticleIDPairs = v3->_mandatoryArticleIDPairs;
    v3->_mandatoryArticleIDPairs = v4;
    v15 = v4;

    optionalArticleIDs = v3->_optionalArticleIDs;
    v3->_optionalArticleIDs = v5;
    v17 = v5;

    topStoriesMetadataByArticleID = v3->_topStoriesMetadataByArticleID;
    v3->_topStoriesMetadataByArticleID = v6;
    v19 = v6;

    publishDate = v3->_publishDate;
    v3->_publishDate = (NSDate *)v13;
  }
  return v3;
}

void __46__FCTopStoriesGroupConfig_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = [v3 objectForKeyedSubscript:@"id"];
  v4 = [[FCArticleMetadata alloc] initWithDictionary:v3];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v10];

  v5 = FCAppConfigurationDictionaryValueWithDefaultValue(v3, @"paidArticle", 0);

  if (v5)
  {
    v6 = [v5 objectForKeyedSubscript:@"id"];
    if (v6)
    {
      v7 = [[FCArticleMetadata alloc] initWithDictionary:v5];
      [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
    }
  }
  else
  {
    v6 = 0;
  }
  v8 = *(void **)(a1 + 40);
  v9 = +[FCPair pairWithFirst:v10 second:v6];
  [v8 addObject:v9];
}

void __46__FCTopStoriesGroupConfig_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 objectForKeyedSubscript:@"id"];
  [*(id *)(a1 + 32) addObject:v5];
  v4 = [[FCArticleMetadata alloc] initWithDictionary:v3];

  [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:v5];
}

- (NSArray)mandatoryArticleIDPairs
{
  return self->_mandatoryArticleIDPairs;
}

- (NSArray)optionalArticleIDs
{
  return self->_optionalArticleIDs;
}

- (NSDictionary)topStoriesMetadataByArticleID
{
  return self->_topStoriesMetadataByArticleID;
}

- (void)setTopStoriesMetadataByArticleID:(id)a3
{
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_topStoriesMetadataByArticleID, 0);
  objc_storeStrong((id *)&self->_optionalArticleIDs, 0);
  objc_storeStrong((id *)&self->_mandatoryArticleIDPairs, 0);
}

@end