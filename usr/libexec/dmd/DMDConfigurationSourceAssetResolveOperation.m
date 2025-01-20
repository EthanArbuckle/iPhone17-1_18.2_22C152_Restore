@interface DMDConfigurationSourceAssetResolveOperation
- (BOOL)isAsynchronous;
- (DMDRemoteAssetResolutionContext)context;
- (void)main;
- (void)setContext:(id)a3;
@end

@implementation DMDConfigurationSourceAssetResolveOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  [(DMDConfigurationSourceAssetResolveOperation *)self context];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034EC4;
  v4[3] = &unk_1000CAB48;
  v4[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v5;
  [(DMDConfigurationSourceTaskOperation *)self fetchRemoteProxy:v4];
}

- (DMDRemoteAssetResolutionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end