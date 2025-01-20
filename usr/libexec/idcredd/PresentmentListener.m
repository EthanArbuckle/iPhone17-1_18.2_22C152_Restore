@interface PresentmentListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC7idcredd19PresentmentListener)init;
- (void)dealloc;
@end

@implementation PresentmentListener

- (void)dealloc
{
  v2 = self;
  sub_10004E01C();
}

- (void).cxx_destruct
{
  swift_release();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100051974(v7);

  return v9 & 1;
}

- (_TtC7idcredd19PresentmentListener)init
{
  result = (_TtC7idcredd19PresentmentListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end