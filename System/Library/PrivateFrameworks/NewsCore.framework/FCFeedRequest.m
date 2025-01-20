@interface FCFeedRequest
- (BOOL)cachedOnly;
- (BOOL)isExpendable;
- (FCFeedItemFeature)requiredFeature;
- (FCFeedRange)feedRange;
- (NSString)feedID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)maxCount;
- (void)setCachedOnly:(BOOL)a3;
- (void)setFeedID:(id)a3;
- (void)setFeedRange:(id)a3;
- (void)setIsExpendable:(BOOL)a3;
- (void)setMaxCount:(unint64_t)a3;
- (void)setRequiredFeature:(id)a3;
@end

@implementation FCFeedRequest

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(FCFeedRequest);
  v5 = [(FCFeedRequest *)self feedID];
  [(FCFeedRequest *)v4 setFeedID:v5];

  v6 = [(FCFeedRequest *)self feedRange];
  [(FCFeedRequest *)v4 setFeedRange:v6];

  [(FCFeedRequest *)v4 setMaxCount:[(FCFeedRequest *)self maxCount]];
  [(FCFeedRequest *)v4 setIsExpendable:[(FCFeedRequest *)self isExpendable]];
  [(FCFeedRequest *)v4 setCachedOnly:[(FCFeedRequest *)self cachedOnly]];
  v7 = [(FCFeedRequest *)self requiredFeature];
  [(FCFeedRequest *)v4 setRequiredFeature:v7];

  return v4;
}

- (NSString)feedID
{
  return self->_feedID;
}

- (void)setFeedID:(id)a3
{
}

- (FCFeedRange)feedRange
{
  return self->_feedRange;
}

- (void)setFeedRange:(id)a3
{
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(unint64_t)a3
{
  self->_maxCount = a3;
}

- (BOOL)isExpendable
{
  return self->_isExpendable;
}

- (void)setIsExpendable:(BOOL)a3
{
  self->_isExpendable = a3;
}

- (BOOL)cachedOnly
{
  return self->_cachedOnly;
}

- (void)setCachedOnly:(BOOL)a3
{
  self->_cachedOnly = a3;
}

- (FCFeedItemFeature)requiredFeature
{
  return self->_requiredFeature;
}

- (void)setRequiredFeature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredFeature, 0);
  objc_storeStrong((id *)&self->_feedRange, 0);
  objc_storeStrong((id *)&self->_feedID, 0);
}

@end