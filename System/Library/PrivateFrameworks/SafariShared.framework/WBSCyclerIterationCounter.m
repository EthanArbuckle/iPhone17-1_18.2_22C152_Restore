@interface WBSCyclerIterationCounter
- (BOOL)hasReachedMaximumIterationCount;
- (WBSCyclerIterationCounter)init;
- (WBSCyclerIterationCounter)initWithMaximumIterationCount:(unint64_t)a3;
- (unint64_t)iterationCount;
- (unint64_t)maximumIterationCount;
- (void)incrementIterationCount;
@end

@implementation WBSCyclerIterationCounter

- (WBSCyclerIterationCounter)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBSCyclerIterationCounter;
  v2 = [(WBSCyclerIterationCounter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_iterationCount = 0;
    v2->_maximumIterationCount = 0;
    v4 = v2;
  }

  return v3;
}

- (WBSCyclerIterationCounter)initWithMaximumIterationCount:(unint64_t)a3
{
  v4 = [(WBSCyclerIterationCounter *)self init];
  v5 = v4;
  if (v4)
  {
    v4->_maximumIterationCount = a3;
    objc_super v6 = v4;
  }

  return v5;
}

- (void)incrementIterationCount
{
}

- (BOOL)hasReachedMaximumIterationCount
{
  unint64_t maximumIterationCount = self->_maximumIterationCount;
  return maximumIterationCount && self->_iterationCount >= maximumIterationCount;
}

- (unint64_t)iterationCount
{
  return self->_iterationCount;
}

- (unint64_t)maximumIterationCount
{
  return self->_maximumIterationCount;
}

@end