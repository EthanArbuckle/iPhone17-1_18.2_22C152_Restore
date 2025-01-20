@interface NMBUIMediaTableCellDownloadState
- (NMBUIMediaTableCellDownloadState)initWithState:(unint64_t)a3 progress:(double)a4;
- (double)progress;
- (unint64_t)state;
- (void)setProgress:(double)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation NMBUIMediaTableCellDownloadState

- (NMBUIMediaTableCellDownloadState)initWithState:(unint64_t)a3 progress:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NMBUIMediaTableCellDownloadState;
  result = [(NMBUIMediaTableCellDownloadState *)&v7 init];
  if (result)
  {
    result->_state = a3;
    result->_progress = a4;
  }
  return result;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

@end