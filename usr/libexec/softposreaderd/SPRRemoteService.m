@interface SPRRemoteService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14softposreaderd16SPRRemoteService)init;
@end

@implementation SPRRemoteService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10000DDD8(v7);

  return v9 & 1;
}

- (_TtC14softposreaderd16SPRRemoteService)init
{
  return (_TtC14softposreaderd16SPRRemoteService *)sub_10000C3D8(self, (uint64_t)a2, type metadata accessor for SPRRemoteService);
}

@end