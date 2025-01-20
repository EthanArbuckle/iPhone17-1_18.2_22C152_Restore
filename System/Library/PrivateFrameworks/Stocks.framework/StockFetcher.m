@interface StockFetcher
- (NSTimer)timeoutTimer;
- (StockFetcher)init;
- (StockFetcher)initWithValidator:(id)a3;
- (SymbolValidator)validator;
- (double)timeoutDuration;
- (id)completionHandler;
- (void)attemptRemoteFetchOfStockWithSymbol:(id)a3 completionHandler:(id)a4;
- (void)cleanUpAndReportResult:(id)a3;
- (void)fetchStockWithSymbol:(id)a3 completionHandler:(id)a4;
- (void)remoteFetchTimedOut;
- (void)setCompletionHandler:(id)a3;
- (void)setTimeoutDuration:(double)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setValidator:(id)a3;
- (void)symbolValidator:(id)a3 didFailWithError:(id)a4;
- (void)symbolValidator:(id)a3 didValidateSymbols:(id)a4;
@end

@implementation StockFetcher

- (StockFetcher)init
{
  v3 = objc_alloc_init(SymbolValidator);
  v4 = [(StockFetcher *)self initWithValidator:v3];

  return v4;
}

- (StockFetcher)initWithValidator:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)StockFetcher;
  v6 = [(StockFetcher *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_validator, a3);
    [(SymbolValidator *)v7->_validator setDelegate:v7];
    v7->_timeoutDuration = 5.0;
    v8 = v7;
  }

  return v7;
}

- (void)fetchStockWithSymbol:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, void *, uint64_t))a4;
  v7 = [(StockFetcher *)self completionHandler];

  if (v7) {
    [(StockFetcher *)self cleanUpAndReportResult:0];
  }
  v8 = +[StockManager sharedManager];
  v9 = [v8 stockWithSymbol:v10];

  if (v9)
  {
    v6[2](v6, v9, 1);
  }
  else
  {
    [(StockFetcher *)self setCompletionHandler:v6];
    [(StockFetcher *)self attemptRemoteFetchOfStockWithSymbol:v10 completionHandler:v6];
  }
}

- (void)attemptRemoteFetchOfStockWithSymbol:(id)a3 completionHandler:(id)a4
{
  [(SymbolValidator *)self->_validator validateSymbol:a3 withMaxResults:1];
  id v5 = (void *)MEMORY[0x263EFFA20];
  [(StockFetcher *)self timeoutDuration];
  objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_remoteFetchTimedOut, 0, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(StockFetcher *)self setTimeoutTimer:v6];
}

- (void)remoteFetchTimedOut
{
}

- (void)cleanUpAndReportResult:(id)a3
{
  id v7 = a3;
  v4 = [(StockFetcher *)self completionHandler];

  if (v4)
  {
    id v5 = [(StockFetcher *)self completionHandler];
    ((void (**)(void, id, void))v5)[2](v5, v7, 0);

    [(StockFetcher *)self setCompletionHandler:0];
  }
  id v6 = [(StockFetcher *)self timeoutTimer];
  [v6 invalidate];

  [(StockFetcher *)self setTimeoutTimer:0];
}

- (void)symbolValidator:(id)a3 didValidateSymbols:(id)a4
{
  objc_msgSend(a4, "firstObject", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [[Stock alloc] initWithDictionary:v6];
  [(StockFetcher *)self cleanUpAndReportResult:v5];
}

- (void)symbolValidator:(id)a3 didFailWithError:(id)a4
{
}

- (double)timeoutDuration
{
  return self->_timeoutDuration;
}

- (void)setTimeoutDuration:(double)a3
{
  self->_timeoutDuration = a3;
}

- (SymbolValidator)validator
{
  return (SymbolValidator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setValidator:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_validator, 0);
}

@end