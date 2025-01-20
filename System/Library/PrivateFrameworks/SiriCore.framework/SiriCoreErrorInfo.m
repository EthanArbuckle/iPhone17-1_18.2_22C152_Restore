@interface SiriCoreErrorInfo
- (BOOL)isPeerConnectionError;
- (BOOL)isPeerNotNearbyError;
- (NSError)error;
- (void)setError:(id)a3;
- (void)setIsPeerConnectionError:(BOOL)a3;
- (void)setIsPeerNotNearbyError:(BOOL)a3;
@end

@implementation SiriCoreErrorInfo

- (void).cxx_destruct
{
}

- (void)setIsPeerNotNearbyError:(BOOL)a3
{
  self->_isPeerNotNearbyError = a3;
}

- (BOOL)isPeerNotNearbyError
{
  return self->_isPeerNotNearbyError;
}

- (void)setIsPeerConnectionError:(BOOL)a3
{
  self->_isPeerConnectionError = a3;
}

- (BOOL)isPeerConnectionError
{
  return self->_isPeerConnectionError;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

@end