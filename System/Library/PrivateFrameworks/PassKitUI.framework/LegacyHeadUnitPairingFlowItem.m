@interface LegacyHeadUnitPairingFlowItem
- (_TtC9PassKitUI29LegacyHeadUnitPairingFlowItem)init;
- (void)headUnitPairingPrompt:(id)a3 didFinishWithResult:(BOOL)a4;
@end

@implementation LegacyHeadUnitPairingFlowItem

- (_TtC9PassKitUI29LegacyHeadUnitPairingFlowItem)init
{
  result = (_TtC9PassKitUI29LegacyHeadUnitPairingFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI29LegacyHeadUnitPairingFlowItem_delegate);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI29LegacyHeadUnitPairingFlowItem_hupPrompt);
}

- (void)headUnitPairingPrompt:(id)a3 didFinishWithResult:(BOOL)a4
{
  v6 = (char *)self + OBJC_IVAR____TtC9PassKitUI29LegacyHeadUnitPairingFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI29LegacyHeadUnitPairingFlowItem_delegate, a2, a3, a4))
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v9 = a3;
    v10 = self;
    sub_19FBE1190((uint64_t)v10, (uint64_t)&off_1EF1AB068, ObjectType, v7);

    swift_unknownObjectRelease();
  }
}

@end