@interface ProvisioningCredentialFlowItem
- (_TtC9PassKitUI30ProvisioningCredentialFlowItem)init;
- (void)provisioningViewController:(id)a3 didFinishWithSuccess:(BOOL)a4;
- (void)provisioningViewControllerDidSelectManualEntry:(id)a3;
@end

@implementation ProvisioningCredentialFlowItem

- (_TtC9PassKitUI30ProvisioningCredentialFlowItem)init
{
  result = (_TtC9PassKitUI30ProvisioningCredentialFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI30ProvisioningCredentialFlowItem_viewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI30ProvisioningCredentialFlowItem_provisionedPasses));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI30ProvisioningCredentialFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)provisioningViewController:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  v6 = (char *)self + OBJC_IVAR____TtC9PassKitUI30ProvisioningCredentialFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI30ProvisioningCredentialFlowItem_delegate, a2, a3, a4))
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v9 = a3;
    v10 = self;
    sub_19FBE1190((uint64_t)v10, (uint64_t)&off_1EF1A8D28, ObjectType, v7);

    swift_unknownObjectRelease();
  }
}

- (void)provisioningViewControllerDidSelectManualEntry:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19FC92998();
}

@end