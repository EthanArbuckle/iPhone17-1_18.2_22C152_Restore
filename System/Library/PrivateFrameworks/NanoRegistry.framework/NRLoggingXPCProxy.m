@interface NRLoggingXPCProxy
- (id)initWithBlahBlahBlahProxy:(id *)a1;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation NRLoggingXPCProxy

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[self->_proxy methodSignatureForSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)initWithBlahBlahBlahProxy:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    objc_storeStrong(a1 + 1, a2);
    v5 = a1;
  }

  return a1;
}

@end