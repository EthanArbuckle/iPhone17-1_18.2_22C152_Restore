@interface CLVisionControllerAdapter
- (BOOL)valid;
- (CLVisionControllerAdapter)initWithController:(void *)a3;
- (void)handleARSessionState:(unint64_t)a3 fromClient:(id)a4;
- (void)handleVIOEstimation:(id)a3 fromClient:(id)a4;
- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4;
- (void)invalidate;
- (void)setValid:(BOOL)a3;
@end

@implementation CLVisionControllerAdapter

- (CLVisionControllerAdapter)initWithController:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLVisionControllerAdapter;
  result = [(CLVisionControllerAdapter *)&v5 init];
  if (result)
  {
    result->_adaptee = a3;
    result->_valid = a3 != 0;
  }
  return result;
}

- (void)invalidate
{
  self->_valid = 0;
  self->_adaptee = 0;
}

- (void)handleARSessionState:(unint64_t)a3 fromClient:(id)a4
{
}

- (void)handleVIOEstimation:(id)a3 fromClient:(id)a4
{
}

- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4
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