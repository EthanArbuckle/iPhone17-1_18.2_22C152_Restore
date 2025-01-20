@interface BluetoothUserXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14bluetoothuserd22BluetoothUserXPCServer)init;
@end

@implementation BluetoothUserXPCServer

- (_TtC14bluetoothuserd22BluetoothUserXPCServer)init
{
  result = (_TtC14bluetoothuserd22BluetoothUserXPCServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14bluetoothuserd22BluetoothUserXPCServer____lazy_storage___xpcListener);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10005BED0((uint64_t)v6, v7);

  return v9 & 1;
}

@end