@interface ProvisioningCarPairingFlowItem
- (_TtC9PassKitUI30ProvisioningCarPairingFlowItem)init;
- (void)subcredentialProvisioningFlowController:(id)a3 didFinishWithPass:(id)a4 error:(id)a5;
- (void)userCanceledPairingWithSubcredentialProvisioningFlowController:(id)a3;
@end

@implementation ProvisioningCarPairingFlowItem

- (_TtC9PassKitUI30ProvisioningCarPairingFlowItem)init
{
  result = (_TtC9PassKitUI30ProvisioningCarPairingFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI30ProvisioningCarPairingFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)subcredentialProvisioningFlowController:(id)a3 didFinishWithPass:(id)a4 error:(id)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  v9 = self;
  id v10 = a5;
  sub_19FC8CB68(a4, a5);
  swift_unknownObjectRelease();
}

- (void)userCanceledPairingWithSubcredentialProvisioningFlowController:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC9PassKitUI30ProvisioningCarPairingFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI30ProvisioningCarPairingFlowItem_delegate, a2))
  {
    uint64_t v5 = *((void *)v4 + 1);
    uint64_t ObjectType = swift_getObjectType();
    swift_unknownObjectRetain();
    v7 = self;
    sub_19FBE1190((uint64_t)v7, (uint64_t)&off_1EF1A8A88, ObjectType, v5);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
}

@end