@interface ICASRankingStrategyType
- (ICASRankingStrategyType)initWithRankingStrategyType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)rankingStrategyType;
@end

@implementation ICASRankingStrategyType

- (ICASRankingStrategyType)initWithRankingStrategyType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASRankingStrategyType;
  result = [(ICASRankingStrategyType *)&v5 init];
  if (result) {
    result->_rankingStrategyType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASRankingStrategyType *)self rankingStrategyType];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B89C8[v3 - 1];
  }
}

- (int64_t)rankingStrategyType
{
  return self->_rankingStrategyType;
}

@end