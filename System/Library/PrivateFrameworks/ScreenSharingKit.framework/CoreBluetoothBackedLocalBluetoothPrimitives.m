@interface CoreBluetoothBackedLocalBluetoothPrimitives
- (_TtC16ScreenSharingKit43CoreBluetoothBackedLocalBluetoothPrimitives)init;
- (void)centralManagerDidUpdateState:(id)a3;
@end

@implementation CoreBluetoothBackedLocalBluetoothPrimitives

- (_TtC16ScreenSharingKit43CoreBluetoothBackedLocalBluetoothPrimitives)init
{
  return (_TtC16ScreenSharingKit43CoreBluetoothBackedLocalBluetoothPrimitives *)CoreBluetoothBackedLocalBluetoothPrimitives.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit43CoreBluetoothBackedLocalBluetoothPrimitives__bluetoothState;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A537918);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16ScreenSharingKit43CoreBluetoothBackedLocalBluetoothPrimitives_centralManager);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = self;
  CoreBluetoothBackedLocalBluetoothPrimitives.centralManagerDidUpdateState(_:)((CBCentralManager)v4);
}

@end