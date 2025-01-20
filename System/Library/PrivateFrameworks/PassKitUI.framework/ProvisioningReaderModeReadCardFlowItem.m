@interface ProvisioningReaderModeReadCardFlowItem
- (_TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem)init;
- (id)provisionedPass;
- (void)provisionWithFieldModel:(id)a3 paymentCredential:(id)a4;
- (void)viewControllerDidCancel:(id)a3;
- (void)viewControllerDidComplete:(id)a3;
- (void)viewControllerDidFailIngestion:(id)a3;
@end

@implementation ProvisioningReaderModeReadCardFlowItem

- (_TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem)init
{
  result = (_TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem_product));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem_fieldsModel));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem_coordinator));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem_provisioningResult);
  char v4 = self->context[OBJC_IVAR____TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem_provisioningResult];

  sub_19F4E1E38(v3, v4);
}

- (void)provisionWithFieldModel:(id)a3 paymentCredential:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_19FBFE948(v6, v7);
}

- (void)viewControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19FBFEE9C();
}

- (void)viewControllerDidComplete:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19FBFEF2C();
}

- (void)viewControllerDidFailIngestion:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19FBFF118();
}

- (id)provisionedPass
{
  v2 = self;
  v3 = sub_19FBFECFC();

  return v3;
}

@end