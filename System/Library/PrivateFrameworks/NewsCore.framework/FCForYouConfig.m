@interface FCForYouConfig
- (FCForYouConfig)initWithRecord:(id)a3 interestToken:(id)a4;
- (FCGroupConfig)trendingGroupConfig;
- (FCInterestToken)interestToken;
- (FCSpotlightGroupConfig)spotlightGroupConfig;
- (FCTopStoriesGroupConfig)topStoriesGroupConfig;
- (NSArray)demoGroupConfigs;
- (NSArray)editorialArticleListIDs;
- (NSArray)editorialGroupConfigs;
- (NSArray)editorialSectionTagIDs;
- (NSArray)todayFeedTopStoriesArticleIDs;
- (NSArray)topVideosArticleIDs;
- (NSDate)fetchedDate;
- (NSString)moreVideosArticleListID;
- (NSString)spotlightArticleID;
- (NSString)trendingArticleListID;
- (NTPBForYouConfigRecord)forYouConfigRecord;
- (void)setEditorialGroupConfigs:(id)a3;
- (void)setForYouConfigRecord:(id)a3;
- (void)setInterestToken:(id)a3;
- (void)setSpotlightGroupConfig:(id)a3;
- (void)setTopStoriesGroupConfig:(id)a3;
- (void)setTrendingGroupConfig:(id)a3;
@end

@implementation FCForYouConfig

- (FCForYouConfig)initWithRecord:(id)a3 interestToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)FCForYouConfig;
  v9 = [(FCForYouConfig *)&v32 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_forYouConfigRecord, a3);
    objc_storeStrong((id *)&v10->_interestToken, a4);
    v11 = (void *)MEMORY[0x1E4F1C9E8];
    v12 = [v7 configuration];
    v13 = objc_msgSend(v11, "fc_dictionaryFromJSON:", v12);

    v14 = [FCTopStoriesGroupConfig alloc];
    v15 = [v13 objectForKeyedSubscript:@"top_stories"];
    uint64_t v16 = [(FCTopStoriesGroupConfig *)v14 initWithDictionary:v15];
    topStoriesGroupConfig = v10->_topStoriesGroupConfig;
    v10->_topStoriesGroupConfig = (FCTopStoriesGroupConfig *)v16;

    v18 = [FCGroupConfig alloc];
    v19 = [v13 objectForKeyedSubscript:@"trending"];
    uint64_t v20 = [(FCGroupConfig *)v18 initWithDictionary:v19];
    trendingGroupConfig = v10->_trendingGroupConfig;
    v10->_trendingGroupConfig = (FCGroupConfig *)v20;

    v22 = [FCSpotlightGroupConfig alloc];
    v23 = [v13 objectForKeyedSubscript:@"spotlight"];
    uint64_t v24 = [(FCSpotlightGroupConfig *)v22 initWithDictionary:v23];
    spotlightGroupConfig = v10->_spotlightGroupConfig;
    v10->_spotlightGroupConfig = (FCSpotlightGroupConfig *)v24;

    objc_opt_class();
    v26 = [v13 objectForKeyedSubscript:@"editorial"];
    if (v26)
    {
      if (objc_opt_isKindOfClass()) {
        v27 = v26;
      }
      else {
        v27 = 0;
      }
    }
    else
    {
      v27 = 0;
    }
    id v28 = v27;

    if (v28)
    {
      uint64_t v29 = objc_msgSend(v28, "fc_arrayByTransformingWithBlock:", &__block_literal_global_62);
      editorialGroupConfigs = v10->_editorialGroupConfigs;
      v10->_editorialGroupConfigs = (NSArray *)v29;
    }
  }

  return v10;
}

FCGroupConfig *__47__FCForYouConfig_initWithRecord_interestToken___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FCGroupConfig alloc] initWithDictionary:v2];

  return v3;
}

- (NSArray)todayFeedTopStoriesArticleIDs
{
  id v2 = [(FCForYouConfig *)self forYouConfigRecord];
  v3 = [v2 todayFeedTopStoriesArticleIDs];

  return (NSArray *)v3;
}

- (NSString)trendingArticleListID
{
  id v2 = [(FCForYouConfig *)self forYouConfigRecord];
  v3 = [v2 trendingArticleListID];

  return (NSString *)v3;
}

- (NSArray)editorialArticleListIDs
{
  id v2 = [(FCForYouConfig *)self forYouConfigRecord];
  v3 = [v2 editorialArticleListIDs];

  return (NSArray *)v3;
}

- (NSArray)editorialSectionTagIDs
{
  id v2 = [(FCForYouConfig *)self forYouConfigRecord];
  v3 = [v2 editorialSectionTagIDs];

  return (NSArray *)v3;
}

- (NSString)spotlightArticleID
{
  id v2 = [(FCForYouConfig *)self forYouConfigRecord];
  v3 = [v2 spotlightArticleID];

  return (NSString *)v3;
}

- (NSDate)fetchedDate
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  v3 = [(FCForYouConfig *)self forYouConfigRecord];
  v4 = [v3 base];
  v5 = [v4 fetchDate];
  v6 = [v2 dateWithPBDate:v5];

  return (NSDate *)v6;
}

- (FCTopStoriesGroupConfig)topStoriesGroupConfig
{
  return self->_topStoriesGroupConfig;
}

- (void)setTopStoriesGroupConfig:(id)a3
{
}

- (FCGroupConfig)trendingGroupConfig
{
  return self->_trendingGroupConfig;
}

- (void)setTrendingGroupConfig:(id)a3
{
}

- (FCSpotlightGroupConfig)spotlightGroupConfig
{
  return self->_spotlightGroupConfig;
}

- (void)setSpotlightGroupConfig:(id)a3
{
}

- (NSArray)editorialGroupConfigs
{
  return self->_editorialGroupConfigs;
}

- (void)setEditorialGroupConfigs:(id)a3
{
}

- (NSArray)demoGroupConfigs
{
  return self->_demoGroupConfigs;
}

- (NSArray)topVideosArticleIDs
{
  return self->_topVideosArticleIDs;
}

- (NSString)moreVideosArticleListID
{
  return self->_moreVideosArticleListID;
}

- (NTPBForYouConfigRecord)forYouConfigRecord
{
  return self->_forYouConfigRecord;
}

- (void)setForYouConfigRecord:(id)a3
{
}

- (FCInterestToken)interestToken
{
  return self->_interestToken;
}

- (void)setInterestToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_forYouConfigRecord, 0);
  objc_storeStrong((id *)&self->_moreVideosArticleListID, 0);
  objc_storeStrong((id *)&self->_topVideosArticleIDs, 0);
  objc_storeStrong((id *)&self->_demoGroupConfigs, 0);
  objc_storeStrong((id *)&self->_editorialGroupConfigs, 0);
  objc_storeStrong((id *)&self->_spotlightGroupConfig, 0);
  objc_storeStrong((id *)&self->_trendingGroupConfig, 0);
  objc_storeStrong((id *)&self->_topStoriesGroupConfig, 0);
}

@end