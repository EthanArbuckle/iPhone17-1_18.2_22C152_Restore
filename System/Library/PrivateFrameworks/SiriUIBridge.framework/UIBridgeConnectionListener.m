@interface UIBridgeConnectionListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC12SiriUIBridge26UIBridgeConnectionListener)init;
- (void)dealloc;
@end

@implementation UIBridgeConnectionListener

- (void)dealloc
{
  v2 = self;
  sub_25DD9A52C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_connectionQueue));

  swift_unknownObjectWeakDestroy();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_25DD9A620((int)v8, v7);

  return v9 & 1;
}

- (_TtC12SiriUIBridge26UIBridgeConnectionListener)init
{
}

@end