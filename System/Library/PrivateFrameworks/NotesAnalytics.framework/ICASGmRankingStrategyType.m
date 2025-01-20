@interface ICASGmRankingStrategyType
- (ICASGmRankingStrategyType)initWithGmRankingStrategyType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)gmRankingStrategyType;
@end

@implementation ICASGmRankingStrategyType

- (ICASGmRankingStrategyType)initWithGmRankingStrategyType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASGmRankingStrategyType;
  result = [(ICASGmRankingStrategyType *)&v5 init];
  if (result) {
    result->_gmRankingStrategyType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASGmRankingStrategyType *)self gmRankingStrategyType];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B9988[v3 - 1];
  }
}

- (int64_t)gmRankingStrategyType
{
  return self->_gmRankingStrategyType;
}

@end