@interface BluetoothConnectionObserver
- (_TtC12searchpartyd27BluetoothConnectionObserver)init;
- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4;
@end

@implementation BluetoothConnectionObserver

- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  sub_101040DF8(v6, v4);
}

- (_TtC12searchpartyd27BluetoothConnectionObserver)init
{
  return (_TtC12searchpartyd27BluetoothConnectionObserver *)sub_1010419F8();
}

- (void).cxx_destruct
{
  sub_1004270C8((uint64_t)self + OBJC_IVAR____TtC12searchpartyd27BluetoothConnectionObserver_delegate);
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12searchpartyd27BluetoothConnectionObserver_bluetoothObserverQueue);
}

@end