@interface DebugServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14dockaccessoryd20DebugServiceDelegate)init;
@end

@implementation DebugServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1001E8D48(v7);

  return v9 & 1;
}

- (_TtC14dockaccessoryd20DebugServiceDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DebugServiceDelegate();
  return [(DebugServiceDelegate *)&v3 init];
}

@end