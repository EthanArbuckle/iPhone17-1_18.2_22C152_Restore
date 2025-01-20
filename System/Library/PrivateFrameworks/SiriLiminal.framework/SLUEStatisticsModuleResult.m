@interface SLUEStatisticsModuleResult
- (SLUEStatisticsModuleResult)initWithScore:(float)a3;
- (float)score;
@end

@implementation SLUEStatisticsModuleResult

- (float)score
{
  return self->_score;
}

- (SLUEStatisticsModuleResult)initWithScore:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SLUEStatisticsModuleResult;
  result = [(SLUEStatisticsModuleResult *)&v5 init];
  if (result) {
    result->_score = a3;
  }
  return result;
}

@end