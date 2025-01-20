@interface SDAirDropNearFieldServer
- (_TtC16DaemoniOSLibrary24SDAirDropNearFieldServer)init;
@end

@implementation SDAirDropNearFieldServer

- (_TtC16DaemoniOSLibrary24SDAirDropNearFieldServer)init
{
  result = (_TtC16DaemoniOSLibrary24SDAirDropNearFieldServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_transactionID;
  uint64_t v4 = type metadata accessor for UUID();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  sub_100250CC4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_remotePublicKey), *(void *)&self->listener[OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_remotePublicKey]);
  swift_unknownObjectRelease();
  v5((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_listenerUUID, v4);
  sub_100261080((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_delegate);
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_queue);
}

@end