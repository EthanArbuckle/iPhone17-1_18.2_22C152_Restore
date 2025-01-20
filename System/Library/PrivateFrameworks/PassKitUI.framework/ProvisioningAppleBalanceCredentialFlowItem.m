@interface ProvisioningAppleBalanceCredentialFlowItem
- (_TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem)init;
- (void)provisioningViewController:(id)a3 didFinishWithSuccess:(BOOL)a4;
@end

@implementation ProvisioningAppleBalanceCredentialFlowItem

- (_TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem)init
{
  result = (_TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem_setupController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem_viewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem_provisionedPasses));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)provisioningViewController:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  v6 = (char *)self + OBJC_IVAR____TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI42ProvisioningAppleBalanceCredentialFlowItem_delegate, a2, a3, a4))
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v9 = a3;
    v10 = self;
    sub_19FBE1190((uint64_t)v10, (uint64_t)&off_1EF192FC0, ObjectType, v7);

    swift_unknownObjectRelease();
  }
}

@end