@interface FCFeedTransformationLimit
+ (id)transformationWithLimit:(unint64_t)a3;
- (id)transformFeedItems:(id)a3;
- (unint64_t)limit;
- (void)setLimit:(unint64_t)a3;
@end

@implementation FCFeedTransformationLimit

+ (id)transformationWithLimit:(unint64_t)a3
{
  v4 = objc_opt_new();
  [v4 setLimit:a3];
  return v4;
}

- (id)transformFeedItems:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "fc_subarrayWithMaxCount:", -[FCFeedTransformationLimit limit](self, "limit"));

  return v5;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

@end