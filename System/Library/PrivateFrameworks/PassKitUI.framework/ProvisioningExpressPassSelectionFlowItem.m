@interface ProvisioningExpressPassSelectionFlowItem
- (_TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem)init;
- (void)viewController:(id)a3 didFinishWithPasses:(id)a4 error:(id)a5;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
@end

@implementation ProvisioningExpressPassSelectionFlowItem

- (_TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem)init
{
  result = (_TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem_provisionedPasses));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem_groupsController));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI40ProvisioningExpressPassSelectionFlowItem_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    v9 = self;
    sub_19FBE1190((uint64_t)v9, (uint64_t)&off_1EF1A89C8, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)viewController:(id)a3 didFinishWithPasses:(id)a4 error:(id)a5
{
  uint64_t v6 = (uint64_t)a4;
  if (a4)
  {
    sub_19F48BAC4(0, (unint64_t *)&qword_1E94B6590);
    uint64_t v6 = sub_1A03B4C58();
  }
  id v9 = a3;
  id v10 = a5;
  v11 = self;
  sub_19FC8B8D8(v6);

  swift_bridgeObjectRelease();
}

@end