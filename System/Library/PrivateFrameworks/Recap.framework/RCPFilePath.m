@interface RCPFilePath
- (BOOL)finished;
- (CGPath)path;
- (unint64_t)endTimestamp;
- (unint64_t)timestamp;
- (void)setEndTimestamp:(unint64_t)a3;
- (void)setFinished:(BOOL)a3;
- (void)setPath:(CGPath *)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation RCPFilePath

- (CGPath)path
{
  return self->_path;
}

- (void)setPath:(CGPath *)a3
{
  self->_path = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)endTimestamp
{
  return self->_endTimestamp;
}

- (void)setEndTimestamp:(unint64_t)a3
{
  self->_endTimestamp = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

@end