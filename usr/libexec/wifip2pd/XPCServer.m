@interface XPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC12wifip2pdCore9XPCServer)init;
- (void)endpointForType:(unint64_t)a3 processName:(id)a4 completionHandler:(id)a5;
@end

@implementation XPCServer

- (_TtC12wifip2pdCore9XPCServer)init
{
  result = (_TtC12wifip2pdCore9XPCServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_newSessionGracePeriod;
  uint64_t v4 = type metadata accessor for DispatchTimeInterval();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100011E30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_newSessionHandler));
  v5 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_serverStartedTime;
  uint64_t v6 = type metadata accessor for DispatchTime();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore9XPCServer_logger;
  uint64_t v8 = type metadata accessor for Logger();
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  v9(v7, v8);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  char v9 = sub_10036ED4C(v6, v7);

  return v9 & 1;
}

- (void)endpointForType:(unint64_t)a3 processName:(id)a4 completionHandler:(id)a5
{
  id v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  _Block_copy(v7);
  v11 = self;
  sub_10036FAF8(a3, v8, v10, (uint64_t)v11, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

@end