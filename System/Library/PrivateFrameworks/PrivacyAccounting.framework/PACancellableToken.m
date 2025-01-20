@interface PACancellableToken
- (BOOL)cancelled;
- (PACancellableToken)init;
- (void)cancel;
@end

@implementation PACancellableToken

- (PACancellableToken)init
{
  v3.receiver = self;
  v3.super_class = (Class)PACancellableToken;
  result = [(PACancellableToken *)&v3 init];
  if (result) {
    atomic_store(0, (unsigned __int8 *)&result->_cancelled);
  }
  return result;
}

- (void)cancel
{
}

- (BOOL)cancelled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  return v2 & 1;
}

@end