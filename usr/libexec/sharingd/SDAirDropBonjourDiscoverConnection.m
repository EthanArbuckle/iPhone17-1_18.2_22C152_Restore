@interface SDAirDropBonjourDiscoverConnection
- (_TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection)init;
@end

@implementation SDAirDropBonjourDiscoverConnection

- (_TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection)init
{
  result = (_TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_endpoint;
  uint64_t v4 = type metadata accessor for NWEndpoint();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_deviceStatus));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_nearbyAgent));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_browserQueue));
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_rpClient);
}

@end