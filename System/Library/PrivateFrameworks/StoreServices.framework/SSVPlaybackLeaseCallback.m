@interface SSVPlaybackLeaseCallback
- (NSError)error;
- (SSVPlaybackLeaseResponse)response;
- (id)block;
- (void)setBlock:(id)a3;
- (void)setError:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation SSVPlaybackLeaseCallback

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (SSVPlaybackLeaseResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_block, 0);
}

@end