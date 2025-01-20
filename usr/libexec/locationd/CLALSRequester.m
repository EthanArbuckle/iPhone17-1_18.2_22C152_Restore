@interface CLALSRequester
- (BOOL)finished;
- (BOOL)processingCellTowers;
- (BOOL)processingWirelessAPs;
- (double)timestamp;
- (int)tag;
- (int)type;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)setFinished:(BOOL)a3;
- (void)setProcessingCellTowers:(BOOL)a3;
- (void)setProcessingWirelessAPs:(BOOL)a3;
- (void)setTag:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int)a3;
@end

@implementation CLALSRequester

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
}

- (int)tag
{
  return self->tag;
}

- (void)setTag:(int)a3
{
  self->tag = a3;
}

- (int)type
{
  return self->type;
}

- (void)setType:(int)a3
{
  self->type = a3;
}

- (double)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->timestamp = a3;
}

- (BOOL)processingCellTowers
{
  return self->processingCellTowers;
}

- (void)setProcessingCellTowers:(BOOL)a3
{
  self->processingCellTowers = a3;
}

- (BOOL)processingWirelessAPs
{
  return self->processingWirelessAPs;
}

- (void)setProcessingWirelessAPs:(BOOL)a3
{
  self->processingWirelessAPs = a3;
}

- (BOOL)finished
{
  return self->finished;
}

- (void)setFinished:(BOOL)a3
{
  self->finished = a3;
}

@end