@interface PaymentSetupProductDevicePickerFlowItem
- (_TtC9PassKitUI39PaymentSetupProductDevicePickerFlowItem)init;
- (void)devicePickerViewController:(id)a3 didSelectProvisioningController:(id)a4 product:(id)a5;
@end

@implementation PaymentSetupProductDevicePickerFlowItem

- (_TtC9PassKitUI39PaymentSetupProductDevicePickerFlowItem)init
{
  result = (_TtC9PassKitUI39PaymentSetupProductDevicePickerFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI39PaymentSetupProductDevicePickerFlowItem_product));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI39PaymentSetupProductDevicePickerFlowItem_viewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI39PaymentSetupProductDevicePickerFlowItem_selectedProduct));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI39PaymentSetupProductDevicePickerFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)devicePickerViewController:(id)a3 didSelectProvisioningController:(id)a4 product:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_19F9B5550(v9, v10);
}

@end