@interface SentinelSample
- (SentinelSample)initWithTimestamp:(unint64_t)a3;
- (unint64_t)timestamp;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation SentinelSample

- (SentinelSample)initWithTimestamp:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SentinelSample;
  result = [(SentinelSample *)&v5 init];
  if (result) {
    result->timestamp = a3;
  }
  return result;
}

- (unint64_t)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->timestamp = a3;
}

@end