@interface RDClientConnectionListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC7remindd26RDClientConnectionListener)init;
- (void)dealloc;
@end

@implementation RDClientConnectionListener

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd26RDClientConnectionListener_xpcListener);
  v3 = self;
  [v2 invalidate];
  [*(id *)((char *)&v3->super.isa + OBJC_IVAR____TtC7remindd26RDClientConnectionListener_xpcListenerUserInteractive) invalidate];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for RDClientConnectionListener();
  [(RDClientConnectionListener *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd26RDClientConnectionListener_xpcListenerUserInteractive));
  swift_unknownObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC7remindd26RDClientConnectionListener)init
{
  result = (_TtC7remindd26RDClientConnectionListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1001210A8((uint64_t)v6, v7);

  return v9 & 1;
}

@end