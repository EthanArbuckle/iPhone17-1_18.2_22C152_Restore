@interface FCTopicTranslation
- (BOOL)isEligibleForGrouping;
- (BOOL)isEligibleForGroupingIfFavorited;
- (BOOL)isHidden;
- (FCTopicTranslation)init;
- (FCTopicTranslation)initWithLanguageBucket:(id)a3;
- (FCTopicTranslation)initWithTagID:(id)a3;
- (NSString)tagID;
- (NTPBArticleTopic)articleTopic;
- (id)description;
- (void)setArticleTopic:(id)a3;
- (void)setIsEligibleForGrouping:(BOOL)a3;
- (void)setIsEligibleForGroupingIfFavorited:(BOOL)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setTagID:(id)a3;
@end

@implementation FCTopicTranslation

- (FCTopicTranslation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTopicTranslation init]";
    __int16 v9 = 2080;
    v10 = "FCTopicTranslation.m";
    __int16 v11 = 1024;
    int v12 = 22;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCTopicTranslation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCTopicTranslation)initWithTagID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCTopicTranslation;
  v5 = [(FCTopicTranslation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    tagID = v5->_tagID;
    v5->_tagID = (NSString *)v6;
  }
  return v5;
}

- (FCTopicTranslation)initWithLanguageBucket:(id)a3
{
  id v4 = a3;
  v5 = [v4 key];
  uint64_t v6 = [(FCTopicTranslation *)self initWithTagID:v5];

  if (v6)
  {
    v7 = [v4 groupingFlags];
    -[FCTopicTranslation setIsHidden:](v6, "setIsHidden:", [v7 isHidden]);

    v8 = [v4 groupingFlags];
    -[FCTopicTranslation setIsEligibleForGrouping:](v6, "setIsEligibleForGrouping:", [v8 isEligibleForGrouping]);

    objc_super v9 = [v4 groupingFlags];
    -[FCTopicTranslation setIsEligibleForGroupingIfFavorited:](v6, "setIsEligibleForGroupingIfFavorited:", [v9 isEligibleForGroupingIfFavorited]);
  }
  return v6;
}

- (NTPBArticleTopic)articleTopic
{
  articleTopic = self->_articleTopic;
  if (!articleTopic)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F829B8]);
    v5 = [(FCTopicTranslation *)self tagID];
    [v4 setTagID:v5];

    objc_msgSend(v4, "setIsHidden:", -[FCTopicTranslation isHidden](self, "isHidden"));
    objc_msgSend(v4, "setIsEligibleForGrouping:", -[FCTopicTranslation isEligibleForGrouping](self, "isEligibleForGrouping"));
    objc_msgSend(v4, "setIsEligibleForGroupingIfFavorited:", -[FCTopicTranslation isEligibleForGroupingIfFavorited](self, "isEligibleForGroupingIfFavorited"));
    uint64_t v6 = self->_articleTopic;
    self->_articleTopic = (NTPBArticleTopic *)v4;

    articleTopic = self->_articleTopic;
  }
  return articleTopic;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(FCTopicTranslation *)self tagID];
  v5 = [v3 stringWithFormat:@"TopicTranslation tagID: %@ isHidden: %d isEligibleForGrouping: %d isEligibleForGroupingIfFavorited: %d", v4, -[FCTopicTranslation isHidden](self, "isHidden"), -[FCTopicTranslation isEligibleForGrouping](self, "isEligibleForGrouping"), -[FCTopicTranslation isEligibleForGroupingIfFavorited](self, "isEligibleForGroupingIfFavorited")];

  return v5;
}

- (NSString)tagID
{
  return self->_tagID;
}

- (void)setTagID:(id)a3
{
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (BOOL)isEligibleForGrouping
{
  return self->_isEligibleForGrouping;
}

- (void)setIsEligibleForGrouping:(BOOL)a3
{
  self->_isEligibleForGrouping = a3;
}

- (BOOL)isEligibleForGroupingIfFavorited
{
  return self->_isEligibleForGroupingIfFavorited;
}

- (void)setIsEligibleForGroupingIfFavorited:(BOOL)a3
{
  self->_isEligibleForGroupingIfFavorited = a3;
}

- (void)setArticleTopic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleTopic, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
}

@end