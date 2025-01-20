@interface DownloadDataConsumer
- (BOOL)consumeData:(id)a3 error:(id *)a4;
- (BOOL)finish:(id *)a3;
- (BOOL)hasConsumedData;
- (BOOL)overrideProgress;
- (double)percentComplete;
- (unint64_t)diskUsage;
- (unint64_t)resumptionOffset;
- (void)setOverrideProgress:(BOOL)a3;
@end

@implementation DownloadDataConsumer

- (BOOL)consumeData:(id)a3 error:(id *)a4
{
  return 0;
}

- (unint64_t)diskUsage
{
  return 0;
}

- (BOOL)hasConsumedData
{
  return 0;
}

- (BOOL)finish:(id *)a3
{
  return 0;
}

- (double)percentComplete
{
  return 0.0;
}

- (unint64_t)resumptionOffset
{
  return 0;
}

- (BOOL)overrideProgress
{
  return self->_overrideProgress;
}

- (void)setOverrideProgress:(BOOL)a3
{
  self->_overrideProgress = a3;
}

@end