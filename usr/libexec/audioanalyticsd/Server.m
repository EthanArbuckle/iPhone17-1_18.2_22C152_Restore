@interface Server
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC15audioanalyticsd6Server)init;
@end

@implementation Server

- (_TtC15audioanalyticsd6Server)init
{
  result = (_TtC15audioanalyticsd6Server *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC15audioanalyticsd6Server_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();

  swift_release();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000208FC(v7);

  return v9 & 1;
}

@end