@interface XPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC7peopled11XPCListener)init;
@end

@implementation XPCListener

- (_TtC7peopled11XPCListener)init
{
  return (_TtC7peopled11XPCListener *)sub_100023F4C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100024304(v6, v7);

  return v9 & 1;
}

@end