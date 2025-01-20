@interface SDAirDropApplicationServiceServer
- (_TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer)init;
@end

@implementation SDAirDropApplicationServiceServer

- (_TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer)init
{
  result = (_TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer_deviceStatus));
  swift_release();
  sub_100261080((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer_delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer_queue);
}

@end