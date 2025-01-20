@interface CLPedestrianFenceClientDelegate
- (BOOL)valid;
- (CLPedestrianFenceClientDelegate)initWithPedestrianFenceClient:(void *)a3;
- (void)client;
- (void)didExitFence:(id)a3;
- (void)didFailWithError:(int64_t)a3;
- (void)sessionStatusReport:(id)a3;
- (void)setClient:(void *)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLPedestrianFenceClientDelegate

- (CLPedestrianFenceClientDelegate)initWithPedestrianFenceClient:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLPedestrianFenceClientDelegate;
  result = [(CLPedestrianFenceClientDelegate *)&v5 init];
  if (result) {
    result->_client = a3;
  }
  return result;
}

- (void)didExitFence:(id)a3
{
}

- (void)didFailWithError:(int64_t)a3
{
}

- (void)sessionStatusReport:(id)a3
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)client
{
  return self->_client;
}

- (void)setClient:(void *)a3
{
  self->_client = a3;
}

@end