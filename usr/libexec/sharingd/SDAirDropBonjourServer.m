@interface SDAirDropBonjourServer
- (_TtC16DaemoniOSLibrary22SDAirDropBonjourServer)init;
@end

@implementation SDAirDropBonjourServer

- (_TtC16DaemoniOSLibrary22SDAirDropBonjourServer)init
{
  result = (_TtC16DaemoniOSLibrary22SDAirDropBonjourServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBonjourServer_deviceSupportManager));
  swift_release();

  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBonjourServer_delegate;

  sub_100261080((uint64_t)v3);
}

@end