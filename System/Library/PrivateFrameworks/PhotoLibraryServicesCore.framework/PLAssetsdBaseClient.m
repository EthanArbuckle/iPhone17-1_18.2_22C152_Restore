@interface PLAssetsdBaseClient
- (PLAssetsdBaseClient)initWithQueue:(id)a3 proxyCreating:(id)a4 proxyGetter:(SEL)a5;
- (PLXPCProxyCreating)proxyFactory;
@end

@implementation PLAssetsdBaseClient

- (PLXPCProxyCreating)proxyFactory
{
  return (PLXPCProxyCreating *)objc_getProperty(self, a2, 8, 1);
}

- (PLAssetsdBaseClient)initWithQueue:(id)a3 proxyCreating:(id)a4 proxyGetter:(SEL)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLAssetsdBaseClient;
  v10 = [(PLAssetsdBaseClient *)&v14 init];
  if (v10)
  {
    v11 = [[PLAssetsdServiceProxyFactory alloc] initWithQueue:v8 proxyCreating:v9 proxyGetter:a5];
    proxyFactory = v10->_proxyFactory;
    v10->_proxyFactory = (PLXPCProxyCreating *)v11;
  }
  return v10;
}

- (void).cxx_destruct
{
}

@end