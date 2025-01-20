@interface BluetoothStateProvider
- (_TtC10SiriFindMy22BluetoothStateProvider)init;
- (void)centralManagerDidUpdateState:(id)a3;
@end

@implementation BluetoothStateProvider

- (_TtC10SiriFindMy22BluetoothStateProvider)init
{
  sub_1D4531CAC();
  return result;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D4533284(v4);
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();

  swift_release();
}

@end