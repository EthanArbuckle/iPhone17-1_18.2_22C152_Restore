@interface CLTranscriptSubscriptionAdapter
- (BOOL)valid;
- (CLTranscriptSubscriptionAdapter)init;
- (void)invalidate;
- (void)setValid:(BOOL)a3;
@end

@implementation CLTranscriptSubscriptionAdapter

- (CLTranscriptSubscriptionAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLTranscriptSubscriptionAdapter;
  result = [(CLTranscriptSubscriptionAdapter *)&v3 init];
  if (result) {
    result->_valid = 1;
  }
  return result;
}

- (void)invalidate
{
  self->_valid = 0;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end