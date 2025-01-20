@interface CLRavenControllerAdapter
- (BOOL)valid;
- (CLRavenControllerAdapter)initWithController:(void *)a3;
- (void)handleARSessionState:(unint64_t)a3 fromClient:(id)a4;
- (void)handleVIOEstimation:(id)a3 fromClient:(id)a4;
- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4;
- (void)invalidate;
- (void)setValid:(BOOL)a3;
@end

@implementation CLRavenControllerAdapter

- (CLRavenControllerAdapter)initWithController:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLRavenControllerAdapter;
  result = [(CLRavenControllerAdapter *)&v5 init];
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
  unint64_t v6 = a3;
  adaptee = self->_adaptee;
  if (adaptee)
  {
    if (self->_valid) {
      sub_100CCB068((uint64_t)adaptee, &v6);
    }
  }
}

- (void)handleVIOEstimation:(id)a3 fromClient:(id)a4
{
  adaptee = self->_adaptee;
  if (adaptee)
  {
    if (self->_valid) {
      sub_100CCB11C((uint64_t)adaptee, a3);
    }
  }
}

- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4
{
  adaptee = self->_adaptee;
  if (adaptee)
  {
    if (self->_valid) {
      sub_100CCB1D0((uint64_t)adaptee, a3);
    }
  }
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