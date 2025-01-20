@interface FCFeedContext
+ (id)feedContextForBreakingNewsChannelID:(id)a3;
+ (id)feedContextForChannel:(id)a3 sectionID:(id)a4;
+ (id)feedContextForCoverArticlesFeed;
+ (id)feedContextForEditorialChannel:(id)a3 editorialGemsSectionID:(id)a4;
+ (id)feedContextForEditorialChannel:(id)a3 sectionID:(id)a4;
+ (id)feedContextForEditorialTag:(id)a3;
+ (id)feedContextForHiddenFeed;
+ (id)feedContextForPaidBundleFeed;
+ (id)feedContextForTag:(id)a3;
+ (id)feedContextForTopStoriesChannel:(id)a3 sectionID:(id)a4;
+ (id)feedContextForTopStoriesTag:(id)a3;
- (BOOL)isCoverArticles;
- (BOOL)isEditorial;
- (BOOL)isEditorialGems;
- (BOOL)isHiddenFeed;
- (BOOL)isPaidBundleFeed;
- (BOOL)isTopStories;
- (NSString)channelID;
- (NSString)sectionID;
- (NSString)topicID;
- (void)setChannelID:(id)a3;
- (void)setIsCoverArticles:(BOOL)a3;
- (void)setIsEditorial:(BOOL)a3;
- (void)setIsEditorialGems:(BOOL)a3;
- (void)setIsHiddenFeed:(BOOL)a3;
- (void)setIsPaidBundleFeed:(BOOL)a3;
- (void)setIsTopStories:(BOOL)a3;
- (void)setSectionID:(id)a3;
- (void)setTopicID:(id)a3;
@end

@implementation FCFeedContext

+ (id)feedContextForTag:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 asChannel];
  v6 = [v3 asSection];
  v7 = [v3 asTopic];

  if (v5)
  {
    v8 = [v5 identifier];
    [v4 setChannelID:v8];

    uint64_t v9 = [v5 defaultSectionID];
LABEL_5:
    v11 = (void *)v9;
    [v4 setSectionID:v9];
LABEL_6:

    goto LABEL_7;
  }
  if (v6)
  {
    v10 = [v6 parentID];
    [v4 setChannelID:v10];

    uint64_t v9 = [v6 identifier];
    goto LABEL_5;
  }
  if (v7)
  {
    v11 = [v7 identifier];
    [v4 setTopicID:v11];
    goto LABEL_6;
  }
LABEL_7:

  return v4;
}

+ (id)feedContextForTopStoriesTag:(id)a3
{
  id v3 = [a1 feedContextForTag:a3];
  [v3 setIsTopStories:1];
  return v3;
}

+ (id)feedContextForEditorialTag:(id)a3
{
  id v3 = [a1 feedContextForTag:a3];
  [v3 setIsEditorial:1];
  return v3;
}

+ (id)feedContextForChannel:(id)a3 sectionID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [v6 identifier];

  [v7 setChannelID:v8];
  [v7 setSectionID:v5];

  return v7;
}

+ (id)feedContextForTopStoriesChannel:(id)a3 sectionID:(id)a4
{
  v4 = [a1 feedContextForChannel:a3 sectionID:a4];
  [v4 setIsTopStories:1];
  return v4;
}

+ (id)feedContextForEditorialChannel:(id)a3 sectionID:(id)a4
{
  v4 = [a1 feedContextForChannel:a3 sectionID:a4];
  [v4 setIsEditorial:1];
  return v4;
}

+ (id)feedContextForEditorialChannel:(id)a3 editorialGemsSectionID:(id)a4
{
  v4 = [a1 feedContextForChannel:a3 sectionID:a4];
  [v4 setIsEditorialGems:1];
  return v4;
}

+ (id)feedContextForBreakingNewsChannelID:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setChannelID:v3];

  return v4;
}

+ (id)feedContextForCoverArticlesFeed
{
  v2 = objc_opt_new();
  [v2 setIsCoverArticles:1];
  return v2;
}

+ (id)feedContextForHiddenFeed
{
  v2 = objc_opt_new();
  [v2 setIsHiddenFeed:1];
  return v2;
}

+ (id)feedContextForPaidBundleFeed
{
  v2 = objc_opt_new();
  [v2 setIsPaidBundleFeed:1];
  return v2;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
}

- (NSString)topicID
{
  return self->_topicID;
}

- (void)setTopicID:(id)a3
{
}

- (BOOL)isHiddenFeed
{
  return self->_isHiddenFeed;
}

- (void)setIsHiddenFeed:(BOOL)a3
{
  self->_isHiddenFeed = a3;
}

- (BOOL)isPaidBundleFeed
{
  return self->_isPaidBundleFeed;
}

- (void)setIsPaidBundleFeed:(BOOL)a3
{
  self->_isPaidBundleFeed = a3;
}

- (BOOL)isTopStories
{
  return self->_isTopStories;
}

- (void)setIsTopStories:(BOOL)a3
{
  self->_isTopStories = a3;
}

- (BOOL)isEditorial
{
  return self->_isEditorial;
}

- (void)setIsEditorial:(BOOL)a3
{
  self->_isEditorial = a3;
}

- (BOOL)isEditorialGems
{
  return self->_isEditorialGems;
}

- (void)setIsEditorialGems:(BOOL)a3
{
  self->_isEditorialGems = a3;
}

- (BOOL)isCoverArticles
{
  return self->_isCoverArticles;
}

- (void)setIsCoverArticles:(BOOL)a3
{
  self->_isCoverArticles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicID, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end