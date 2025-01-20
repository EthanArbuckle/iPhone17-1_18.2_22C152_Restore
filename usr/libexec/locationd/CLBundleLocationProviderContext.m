@interface CLBundleLocationProviderContext
- (BOOL)isValid;
- (CLBundleLocationProviderContext)initWithBundleLocationProvider:(void *)a3 inSilo:(id)a4;
- (CLSilo)silo;
- (void)dealloc;
- (void)invalidate;
- (void)provider;
@end

@implementation CLBundleLocationProviderContext

- (CLSilo)silo
{
  return self->_silo;
}

- (void)provider
{
  return self->_provider;
}

- (BOOL)isValid
{
  return self->_provider != 0;
}

- (CLBundleLocationProviderContext)initWithBundleLocationProvider:(void *)a3 inSilo:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CLBundleLocationProviderContext;
  v6 = [(CLBundleLocationProviderContext *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_provider = a3;
    v6->_silo = (CLSilo *)a4;
    id v8 = a4;
  }
  return v7;
}

- (void)dealloc
{
  self->_provider = 0;
  self->_silo = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLBundleLocationProviderContext;
  [(CLBundleLocationProviderContext *)&v3 dealloc];
}

- (void)invalidate
{
  self->_provider = 0;
}

@end