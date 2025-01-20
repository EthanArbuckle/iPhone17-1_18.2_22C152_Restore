@interface FCUserEventHistoryEventCounts
+ (FCUserEventHistoryEventCounts)empty;
- (FCUserEventHistoryEventCounts)initWithArticleSeenEventCount:(int64_t)a3 articleVisitedEventCount:(int64_t)a4 articleReadEventCount:(int64_t)a5 articleLikedEventCount:(int64_t)a6 articleDislikedEventCount:(int64_t)a7 articleSharedEventCount:(int64_t)a8 articleSavedEventCount:(int64_t)a9 feedViewEventCount:(int64_t)a10 tagFollowedEventCount:(int64_t)a11 tagUnfollowedEventCount:(int64_t)a12 tagMutedEventCount:(int64_t)a13;
- (id)description;
- (int64_t)articleDislikedEventCount;
- (int64_t)articleLikedEventCount;
- (int64_t)articleReadEventCount;
- (int64_t)articleSavedEventCount;
- (int64_t)articleSeenEventCount;
- (int64_t)articleSharedEventCount;
- (int64_t)articleVisitedEventCount;
- (int64_t)feedViewEventCount;
- (int64_t)tagFollowedEventCount;
- (int64_t)tagMutedEventCount;
- (int64_t)tagUnfollowedEventCount;
- (void)setArticleDislikedEventCount:(int64_t)a3;
- (void)setArticleLikedEventCount:(int64_t)a3;
- (void)setArticleReadEventCount:(int64_t)a3;
- (void)setArticleSavedEventCount:(int64_t)a3;
- (void)setArticleSeenEventCount:(int64_t)a3;
- (void)setArticleSharedEventCount:(int64_t)a3;
- (void)setArticleVisitedEventCount:(int64_t)a3;
- (void)setFeedViewEventCount:(int64_t)a3;
- (void)setTagFollowedEventCount:(int64_t)a3;
- (void)setTagMutedEventCount:(int64_t)a3;
- (void)setTagUnfollowedEventCount:(int64_t)a3;
@end

@implementation FCUserEventHistoryEventCounts

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; articleSeenEventCount: %lld",
    [(FCUserEventHistoryEventCounts *)self articleSeenEventCount]);
  objc_msgSend(v3, "appendFormat:", @"; articleVisitedEventCount: %lld",
    [(FCUserEventHistoryEventCounts *)self articleVisitedEventCount]);
  objc_msgSend(v3, "appendFormat:", @"; articleReadEventCount: %lld",
    [(FCUserEventHistoryEventCounts *)self articleReadEventCount]);
  objc_msgSend(v3, "appendFormat:", @"; articleLikedEventCount: %lld",
    [(FCUserEventHistoryEventCounts *)self articleLikedEventCount]);
  objc_msgSend(v3, "appendFormat:", @"; articleDislikedEventCount: %lld",
    [(FCUserEventHistoryEventCounts *)self articleDislikedEventCount]);
  objc_msgSend(v3, "appendFormat:", @"; articleSharedEventCount: %lld",
    [(FCUserEventHistoryEventCounts *)self articleSharedEventCount]);
  objc_msgSend(v3, "appendFormat:", @"; articleSavedEventCount: %lld",
    [(FCUserEventHistoryEventCounts *)self articleSavedEventCount]);
  objc_msgSend(v3, "appendFormat:", @"; feedViewEventCount: %lld",
    [(FCUserEventHistoryEventCounts *)self feedViewEventCount]);
  objc_msgSend(v3, "appendFormat:", @"; tagFollowedEventCount: %lld",
    [(FCUserEventHistoryEventCounts *)self tagFollowedEventCount]);
  objc_msgSend(v3, "appendFormat:", @"; tagUnfollowedEventCount: %lld",
    [(FCUserEventHistoryEventCounts *)self tagUnfollowedEventCount]);
  objc_msgSend(v3, "appendFormat:", @"; tagMutedEventCount: %lld",
    [(FCUserEventHistoryEventCounts *)self tagMutedEventCount]);
  [v3 appendString:@">"];
  return v3;
}

- (int64_t)tagUnfollowedEventCount
{
  return self->_tagUnfollowedEventCount;
}

- (int64_t)tagMutedEventCount
{
  return self->_tagMutedEventCount;
}

- (int64_t)tagFollowedEventCount
{
  return self->_tagFollowedEventCount;
}

- (int64_t)feedViewEventCount
{
  return self->_feedViewEventCount;
}

- (int64_t)articleVisitedEventCount
{
  return self->_articleVisitedEventCount;
}

- (int64_t)articleSharedEventCount
{
  return self->_articleSharedEventCount;
}

- (int64_t)articleSeenEventCount
{
  return self->_articleSeenEventCount;
}

- (int64_t)articleSavedEventCount
{
  return self->_articleSavedEventCount;
}

- (int64_t)articleReadEventCount
{
  return self->_articleReadEventCount;
}

- (int64_t)articleLikedEventCount
{
  return self->_articleLikedEventCount;
}

- (int64_t)articleDislikedEventCount
{
  return self->_articleDislikedEventCount;
}

- (FCUserEventHistoryEventCounts)initWithArticleSeenEventCount:(int64_t)a3 articleVisitedEventCount:(int64_t)a4 articleReadEventCount:(int64_t)a5 articleLikedEventCount:(int64_t)a6 articleDislikedEventCount:(int64_t)a7 articleSharedEventCount:(int64_t)a8 articleSavedEventCount:(int64_t)a9 feedViewEventCount:(int64_t)a10 tagFollowedEventCount:(int64_t)a11 tagUnfollowedEventCount:(int64_t)a12 tagMutedEventCount:(int64_t)a13
{
  v20.receiver = self;
  v20.super_class = (Class)FCUserEventHistoryEventCounts;
  result = [(FCUserEventHistoryEventCounts *)&v20 init];
  if (result)
  {
    result->_articleSeenEventCount = a3;
    result->_articleVisitedEventCount = a4;
    result->_articleReadEventCount = a5;
    result->_articleLikedEventCount = a6;
    result->_articleDislikedEventCount = a7;
    result->_articleSharedEventCount = a8;
    result->_articleSavedEventCount = a9;
    result->_feedViewEventCount = a10;
    result->_tagFollowedEventCount = a11;
    result->_tagUnfollowedEventCount = a12;
    result->_tagMutedEventCount = a13;
  }
  return result;
}

+ (FCUserEventHistoryEventCounts)empty
{
  v2 = [[FCUserEventHistoryEventCounts alloc] initWithArticleSeenEventCount:-1 articleVisitedEventCount:-1 articleReadEventCount:-1 articleLikedEventCount:-1 articleDislikedEventCount:-1 articleSharedEventCount:-1 articleSavedEventCount:-1 feedViewEventCount:-1 tagFollowedEventCount:-1 tagUnfollowedEventCount:-1 tagMutedEventCount:-1];
  return v2;
}

- (void)setArticleSeenEventCount:(int64_t)a3
{
  self->_articleSeenEventCount = a3;
}

- (void)setArticleVisitedEventCount:(int64_t)a3
{
  self->_articleVisitedEventCount = a3;
}

- (void)setArticleReadEventCount:(int64_t)a3
{
  self->_articleReadEventCount = a3;
}

- (void)setArticleLikedEventCount:(int64_t)a3
{
  self->_articleLikedEventCount = a3;
}

- (void)setArticleDislikedEventCount:(int64_t)a3
{
  self->_articleDislikedEventCount = a3;
}

- (void)setArticleSharedEventCount:(int64_t)a3
{
  self->_articleSharedEventCount = a3;
}

- (void)setArticleSavedEventCount:(int64_t)a3
{
  self->_articleSavedEventCount = a3;
}

- (void)setFeedViewEventCount:(int64_t)a3
{
  self->_feedViewEventCount = a3;
}

- (void)setTagFollowedEventCount:(int64_t)a3
{
  self->_tagFollowedEventCount = a3;
}

- (void)setTagUnfollowedEventCount:(int64_t)a3
{
  self->_tagUnfollowedEventCount = a3;
}

- (void)setTagMutedEventCount:(int64_t)a3
{
  self->_tagMutedEventCount = a3;
}

@end