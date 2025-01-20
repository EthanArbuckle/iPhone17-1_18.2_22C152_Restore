@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14dockaccessoryd15ServiceDelegate)init;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1001341C0(v7);

  return v9 & 1;
}

- (_TtC14dockaccessoryd15ServiceDelegate)init
{
  result = (_TtC14dockaccessoryd15ServiceDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end