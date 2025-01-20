@interface TTSAssetServer
+ (TTSAssetServer)livability;
+ (TTSAssetServer)production;
+ (TTSAssetServer)staging;
- (BOOL)isEqual:(id)a3;
- (int64_t)hash;
@end

@implementation TTSAssetServer

+ (TTSAssetServer)production
{
  id v2 = static TTSAssetServer.production.getter();
  return (TTSAssetServer *)v2;
}

+ (TTSAssetServer)livability
{
  id v2 = static TTSAssetServer.livability.getter();
  return (TTSAssetServer *)v2;
}

+ (TTSAssetServer)staging
{
  id v2 = static TTSAssetServer.staging.getter();
  return (TTSAssetServer *)v2;
}

- (BOOL)isEqual:(id)a3
{
  return sub_19CDB557C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))TTSAssetServer.isEqual(_:));
}

- (int64_t)hash
{
  id v2 = self;
  int64_t v3 = TTSAssetServer.hash.getter();

  return v3;
}

@end