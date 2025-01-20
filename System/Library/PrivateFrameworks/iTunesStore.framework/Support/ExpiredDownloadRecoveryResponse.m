@interface ExpiredDownloadRecoveryResponse
- (NSError)error;
- (int64_t)downloadIdentifier;
- (int64_t)result;
- (void)setDownloadIdentifier:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setResult:(int64_t)a3;
@end

@implementation ExpiredDownloadRecoveryResponse

- (int64_t)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (void)setDownloadIdentifier:(int64_t)a3
{
  self->_downloadIdentifier = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int64_t)result
{
  return self->_result;
}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (void).cxx_destruct
{
}

@end