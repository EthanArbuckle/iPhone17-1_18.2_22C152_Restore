@interface SERServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC10seserviced9SERServer)init;
- (_TtC10seserviced9SERServer)initWithMachServiceName:(id)a3;
@end

@implementation SERServer

- (_TtC10seserviced9SERServer)init
{
  return (_TtC10seserviced9SERServer *)SERServer.init()();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10013D6E8(v7);
  char v10 = v9;

  return v10 & 1;
}

- (_TtC10seserviced9SERServer)initWithMachServiceName:(id)a3
{
  result = (_TtC10seserviced9SERServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end