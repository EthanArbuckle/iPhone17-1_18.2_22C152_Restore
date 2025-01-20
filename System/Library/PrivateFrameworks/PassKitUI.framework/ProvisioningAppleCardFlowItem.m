@interface ProvisioningAppleCardFlowItem
- (_TtC9PassKitUI29ProvisioningAppleCardFlowItem)init;
- (void)nextViewControllerWithCompletion:(id)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
@end

@implementation ProvisioningAppleCardFlowItem

- (_TtC9PassKitUI29ProvisioningAppleCardFlowItem)init
{
  result = (_TtC9PassKitUI29ProvisioningAppleCardFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI29ProvisioningAppleCardFlowItem_accountFlowController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI29ProvisioningAppleCardFlowItem_provisionedPasses));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI29ProvisioningAppleCardFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v5 = sub_19F5F8C3C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_19F5F8810(v5);
  sub_19F48BB68((uint64_t)v5);
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI29ProvisioningAppleCardFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI29ProvisioningAppleCardFlowItem_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    v9 = self;
    sub_19FBE1190((uint64_t)v9, (uint64_t)&off_1EF1870E8, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end