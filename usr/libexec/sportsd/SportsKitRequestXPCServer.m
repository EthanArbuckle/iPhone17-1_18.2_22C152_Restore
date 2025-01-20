@interface SportsKitRequestXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC7sportsd25SportsKitRequestXPCServer)init;
@end

@implementation SportsKitRequestXPCServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100009958((uint64_t)v8, v7);

  return 1;
}

- (_TtC7sportsd25SportsKitRequestXPCServer)init
{
}

- (void).cxx_destruct
{
  sub_100006178((uint64_t)self + OBJC_IVAR____TtC7sportsd25SportsKitRequestXPCServer_apsListening);
  sub_100006178((uint64_t)self + OBJC_IVAR____TtC7sportsd25SportsKitRequestXPCServer_metadataProvider);
  sub_100006178((uint64_t)self + OBJC_IVAR____TtC7sportsd25SportsKitRequestXPCServer_tempoApiProvider);
  sub_100006178((uint64_t)self + OBJC_IVAR____TtC7sportsd25SportsKitRequestXPCServer_supressionManager);

  swift_bridgeObjectRelease();
}

@end