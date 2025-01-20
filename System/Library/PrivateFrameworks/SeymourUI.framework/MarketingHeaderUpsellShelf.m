@interface MarketingHeaderUpsellShelf
- (_TtC9SeymourUI26MarketingHeaderUpsellShelf)init;
@end

@implementation MarketingHeaderUpsellShelf

- (_TtC9SeymourUI26MarketingHeaderUpsellShelf)init
{
  result = (_TtC9SeymourUI26MarketingHeaderUpsellShelf *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26MarketingHeaderUpsellShelf_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI26MarketingHeaderUpsellShelf_identifier;
  uint64_t v4 = sub_23A7F6818();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_239C7CB4C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26MarketingHeaderUpsellShelf_row, (uint64_t)v5);
  sub_239C7CBB4(v5, sub_239C6BA94);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26MarketingHeaderUpsellShelf_marketingItemProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26MarketingHeaderUpsellShelf_subscriptionCache);
  swift_release();
  sub_23A2AAE08((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26MarketingHeaderUpsellShelf_offer);
}

@end