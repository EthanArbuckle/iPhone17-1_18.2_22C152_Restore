@interface ProvisioningOptionalExpressSetupFlowItem
- (_TtC9PassKitUI40ProvisioningOptionalExpressSetupFlowItem)init;
- (void)optionalExpressModeViewControllerDidFinish:(id)a3;
@end

@implementation ProvisioningOptionalExpressSetupFlowItem

- (_TtC9PassKitUI40ProvisioningOptionalExpressSetupFlowItem)init
{
  result = (_TtC9PassKitUI40ProvisioningOptionalExpressSetupFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI40ProvisioningOptionalExpressSetupFlowItem_provisionedPasses));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI40ProvisioningOptionalExpressSetupFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)optionalExpressModeViewControllerDidFinish:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI40ProvisioningOptionalExpressSetupFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI40ProvisioningOptionalExpressSetupFlowItem_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    v9 = self;
    sub_19FBE1190((uint64_t)v9, (uint64_t)&off_1EF1A3FF8, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end