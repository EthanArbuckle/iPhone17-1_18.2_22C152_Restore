@interface FCMyArticlesTiming
- (FCMyArticlesTiming)init;
- (FCMyArticlesTiming)initWithTotalTime:(double)a3 feedsNetworkTime:(double)a4 evergreenNetworkTime:(double)a5 scoringTime:(double)a6;
- (double)evergreenNetworkTime;
- (double)feedsNetworkTime;
- (double)scoringTime;
- (double)totalTime;
@end

@implementation FCMyArticlesTiming

- (FCMyArticlesTiming)initWithTotalTime:(double)a3 feedsNetworkTime:(double)a4 evergreenNetworkTime:(double)a5 scoringTime:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)FCMyArticlesTiming;
  result = [(FCMyArticlesTiming *)&v11 init];
  if (result)
  {
    result->_totalTime = a3;
    result->_feedsNetworkTime = a4;
    result->_evergreenNetworkTime = a5;
    result->_scoringTime = a6;
  }
  return result;
}

- (FCMyArticlesTiming)init
{
  return [(FCMyArticlesTiming *)self initWithTotalTime:0.0 feedsNetworkTime:0.0 evergreenNetworkTime:0.0 scoringTime:0.0];
}

uint64_t __110__FCMyArticlesTiming_initWithOperationDateInterval_feedNetworkEvents_evergreenNetworkEvents_timeSpentScoring___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dateInterval];
}

uint64_t __110__FCMyArticlesTiming_initWithOperationDateInterval_feedNetworkEvents_evergreenNetworkEvents_timeSpentScoring___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dateInterval];
}

- (double)totalTime
{
  return self->_totalTime;
}

- (double)feedsNetworkTime
{
  return self->_feedsNetworkTime;
}

- (double)evergreenNetworkTime
{
  return self->_evergreenNetworkTime;
}

- (double)scoringTime
{
  return self->_scoringTime;
}

@end