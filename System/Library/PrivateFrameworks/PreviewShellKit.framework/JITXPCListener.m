@interface JITXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC15PreviewShellKitP33_1C89A0595A9F44E3FEB21A13643147FF14JITXPCListener)init;
@end

@implementation JITXPCListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_25A1B0070((uint64_t)v6, v7);

  return v9 & 1;
}

- (_TtC15PreviewShellKitP33_1C89A0595A9F44E3FEB21A13643147FF14JITXPCListener)init
{
  result = (_TtC15PreviewShellKitP33_1C89A0595A9F44E3FEB21A13643147FF14JITXPCListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PreviewShellKitP33_1C89A0595A9F44E3FEB21A13643147FF14JITXPCListener_listener));
  swift_release();
  swift_release();

  swift_release();
}

@end