@interface ProvisioningInAppHeroFlowItem
- (_TtC9PassKitUI29ProvisioningInAppHeroFlowItem)init;
- (uint64_t)heroViewControllerDidSelectContinue:(void *)a3;
@end

@implementation ProvisioningInAppHeroFlowItem

- (_TtC9PassKitUI29ProvisioningInAppHeroFlowItem)init
{
  result = (_TtC9PassKitUI29ProvisioningInAppHeroFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI29ProvisioningInAppHeroFlowItem_delegate);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI29ProvisioningInAppHeroFlowItem_reporter);
}

- (uint64_t)heroViewControllerDidSelectContinue:(void *)a3
{
  v5 = &a1[OBJC_IVAR____TtC9PassKitUI29ProvisioningInAppHeroFlowItem_delegate];
  uint64_t result = MEMORY[0x1A6224F80](&a1[OBJC_IVAR____TtC9PassKitUI29ProvisioningInAppHeroFlowItem_delegate]);
  if (result)
  {
    uint64_t v7 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v9 = a3;
    v10 = a1;
    sub_19FBE1190((uint64_t)v10, (uint64_t)&off_1EF18A968, ObjectType, v7);

    return swift_unknownObjectRelease();
  }
  return result;
}

@end