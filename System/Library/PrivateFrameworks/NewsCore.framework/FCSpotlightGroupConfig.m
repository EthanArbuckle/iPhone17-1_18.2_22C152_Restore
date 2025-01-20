@interface FCSpotlightGroupConfig
- (FCCardStyleProviding)spotlightItemDarkStyle;
- (FCCardStyleProviding)spotlightItemStyle;
- (FCSpotlightGroupConfig)initWithDictionary:(id)a3;
- (NSDate)publishDate;
- (NSString)spotlightArticleID;
- (NSString)spotlightCallToActionTitle;
- (NSString)spotlightEyebrowTitle;
@end

@implementation FCSpotlightGroupConfig

- (FCSpotlightGroupConfig)initWithDictionary:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)FCSpotlightGroupConfig;
  v3 = [(FCGroupConfig *)&v12 initWithDictionary:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(FCGroupConfig *)v3 dictionary];
    v6 = [v5 objectForKeyedSubscript:@"publishDate"];

    if (v6)
    {
      v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "fc_dateFromStringWithISO8601Format:", v6);
    }
    else
    {
      v7 = 0;
    }
    objc_storeStrong((id *)&v4->_publishDate, v7);
    if (v6) {

    }
    v8 = [(FCGroupConfig *)v4 dictionary];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"articleID"];
    spotlightArticleID = v4->_spotlightArticleID;
    v4->_spotlightArticleID = (NSString *)v9;
  }
  return v4;
}

- (NSString)spotlightCallToActionTitle
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"spotlightCallToActionTitle"];

  return (NSString *)v3;
}

- (NSString)spotlightEyebrowTitle
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"spotlightEyebrowTitle"];

  return (NSString *)v3;
}

- (FCCardStyleProviding)spotlightItemStyle
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"spotlightStyle"];

  v4 = +[FCCardStyle styleWithConfigDict:v3];

  return (FCCardStyleProviding *)v4;
}

- (FCCardStyleProviding)spotlightItemDarkStyle
{
  v2 = [(FCGroupConfig *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"spotlightStyleDark"];

  v4 = +[FCCardStyle styleWithConfigDict:v3];

  return (FCCardStyleProviding *)v4;
}

- (NSString)spotlightArticleID
{
  return self->_spotlightArticleID;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_spotlightArticleID, 0);
}

@end