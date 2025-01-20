@interface ProvisioningDevicePickerFlowItem
- (_TtC9PassKitUI32ProvisioningDevicePickerFlowItem)init;
- (void)pickerViewController:(id)a3 didPickWebService:(id)a4;
@end

@implementation ProvisioningDevicePickerFlowItem

- (_TtC9PassKitUI32ProvisioningDevicePickerFlowItem)init
{
  result = (_TtC9PassKitUI32ProvisioningDevicePickerFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI32ProvisioningDevicePickerFlowItem_delegate);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI32ProvisioningDevicePickerFlowItem_reporter);
}

- (void)pickerViewController:(id)a3 didPickWebService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_19FADEB3C(a4);
}

@end