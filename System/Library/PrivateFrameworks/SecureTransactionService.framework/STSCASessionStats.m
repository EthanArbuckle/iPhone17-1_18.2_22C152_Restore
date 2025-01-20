@interface STSCASessionStats
- (STSCASessionStats)init;
- (int64_t)totalSuccessfulTransactionsInSession;
- (int64_t)totalTransactionsInSession;
- (void)postReaderSessionEvent;
- (void)setTotalSuccessfulTransactionsInSession:(int64_t)a3;
- (void)setTotalTransactionsInSession:(int64_t)a3;
@end

@implementation STSCASessionStats

- (STSCASessionStats)init
{
  v3.receiver = self;
  v3.super_class = (Class)STSCASessionStats;
  result = [(STSCASessionStats *)&v3 init];
  if (result)
  {
    result->_totalTransactionsInSession = 0;
    result->_totalSuccessfulTransactionsInSession = 0;
  }
  return result;
}

- (void)postReaderSessionEvent
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = 0x26D300400;
  objc_super v3 = [NSNumber numberWithInteger:self->_totalTransactionsInSession];
  v7[1] = 0x26D300420;
  v8[0] = v3;
  v4 = [NSNumber numberWithInteger:self->_totalSuccessfulTransactionsInSession];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  v6 = +[STSReaderAnalyticsLogger sharedCALogger];
  [v6 postReaderSessionEvent:v5];
}

- (int64_t)totalTransactionsInSession
{
  return self->_totalTransactionsInSession;
}

- (void)setTotalTransactionsInSession:(int64_t)a3
{
  self->_totalTransactionsInSession = a3;
}

- (int64_t)totalSuccessfulTransactionsInSession
{
  return self->_totalSuccessfulTransactionsInSession;
}

- (void)setTotalSuccessfulTransactionsInSession:(int64_t)a3
{
  self->_totalSuccessfulTransactionsInSession = a3;
}

@end