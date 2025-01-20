@interface PKProvisioningExternalDeviceFlowItem
- (PKProvisioningExternalDeviceFlowItem)init;
- (PKProvisioningExternalDeviceFlowItem)initWithContext:(id)a3 pass:(id)a4 externalOptions:(id)a5 cardIdentifier:(id)a6;
- (id)extract;
@end

@implementation PKProvisioningExternalDeviceFlowItem

- (PKProvisioningExternalDeviceFlowItem)initWithContext:(id)a3 pass:(id)a4 externalOptions:(id)a5 cardIdentifier:(id)a6
{
  return (PKProvisioningExternalDeviceFlowItem *)ProvisioningExternalDeviceFlowItem.init(context:pass:externalOptions:cardIdentifier:)(a3, a4, a5);
}

- (id)extract
{
  v3 = (char *)objc_allocWithZone((Class)type metadata accessor for ExtractedUIFlowItem());
  v4 = sub_19F9A52B0(self, v3);

  return v4;
}

- (PKProvisioningExternalDeviceFlowItem)init
{
  result = (PKProvisioningExternalDeviceFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  sub_19F482DB0((uint64_t)self + OBJC_IVAR___PKProvisioningExternalDeviceFlowItem_delegate);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKProvisioningExternalDeviceFlowItem_reporter);
}

@end