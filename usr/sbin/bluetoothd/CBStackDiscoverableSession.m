@interface CBStackDiscoverableSession
- (BTSessionImpl)btSessionHandle;
- (void)setBtSessionHandle:(BTSessionImpl *)a3;
@end

@implementation CBStackDiscoverableSession

- (BTSessionImpl)btSessionHandle
{
  return self->_btSessionHandle;
}

- (void)setBtSessionHandle:(BTSessionImpl *)a3
{
  self->_btSessionHandle = a3;
}

@end