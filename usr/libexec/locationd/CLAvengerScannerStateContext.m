@interface CLAvengerScannerStateContext
- (BOOL)startScanningAwaitingResponse;
- (BOOL)stopScanningAwaitingResponse;
- (CLAvengerScannerStateContext)init;
- (int64_t)currentWPState;
- (int64_t)requestedScanType;
- (void)setCurrentWPState:(int64_t)a3;
- (void)setRequestedScanType:(int64_t)a3;
- (void)setStartScanningAwaitingResponse:(BOOL)a3;
- (void)setStopScanningAwaitingResponse:(BOOL)a3;
@end

@implementation CLAvengerScannerStateContext

- (CLAvengerScannerStateContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLAvengerScannerStateContext;
  result = [(CLAvengerScannerStateContext *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->startScanningAwaitingResponse = 0;
    result->currentWPState = 0;
    result->requestedScanType = 0;
  }
  return result;
}

- (int64_t)currentWPState
{
  return self->currentWPState;
}

- (void)setCurrentWPState:(int64_t)a3
{
  self->currentWPState = a3;
}

- (BOOL)startScanningAwaitingResponse
{
  return self->startScanningAwaitingResponse;
}

- (void)setStartScanningAwaitingResponse:(BOOL)a3
{
  self->startScanningAwaitingResponse = a3;
}

- (BOOL)stopScanningAwaitingResponse
{
  return self->stopScanningAwaitingResponse;
}

- (void)setStopScanningAwaitingResponse:(BOOL)a3
{
  self->stopScanningAwaitingResponse = a3;
}

- (int64_t)requestedScanType
{
  return self->requestedScanType;
}

- (void)setRequestedScanType:(int64_t)a3
{
  self->requestedScanType = a3;
}

@end