@interface DirectActivityRequestXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC7sportsd30DirectActivityRequestXPCServer)init;
@end

@implementation DirectActivityRequestXPCServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10000A09C((uint64_t)v8, v7);

  return 1;
}

- (_TtC7sportsd30DirectActivityRequestXPCServer)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100006178((uint64_t)self + OBJC_IVAR____TtC7sportsd30DirectActivityRequestXPCServer_apsListening);
  sub_100006178((uint64_t)self + OBJC_IVAR____TtC7sportsd30DirectActivityRequestXPCServer_metadataProvider);
  sub_100006178((uint64_t)self + OBJC_IVAR____TtC7sportsd30DirectActivityRequestXPCServer_tempoApiProvider);
  v3 = (char *)self + OBJC_IVAR____TtC7sportsd30DirectActivityRequestXPCServer_supressionManager;

  sub_100006178((uint64_t)v3);
}

@end