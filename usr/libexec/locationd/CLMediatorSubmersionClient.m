@interface CLMediatorSubmersionClient
- (BOOL)valid;
- (CLMediatorSubmersionClient)initWithMediator:(void *)a3;
- (void)onSubmersionMeasurementUpdate:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLMediatorSubmersionClient

- (CLMediatorSubmersionClient)initWithMediator:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLMediatorSubmersionClient;
  result = [(CLMediatorSubmersionClient *)&v5 init];
  if (result)
  {
    result->_client = a3;
    result->_valid = 1;
  }
  else
  {
    MEMORY[0x10] = 0;
  }
  return result;
}

- (void)onSubmersionMeasurementUpdate:(id)a3
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

@end